

CREATE TABLE RAWDATA AS(
    SELECT 
        CONCAT(CONCAT(REGIONID,'_'),PRODUCT) AS KEYCOL
        ,REGIONID AS ACCOUNTID
        ,PRODUCT
        ,YEARWEEK
        ,QTY
        ,'TEST' AS PRODUCTNAME
        FROM kopo_channel_seasonality_final
    );
    

CREATE TABLE FILTERRDD AS(
SELECT *
    FROM RAWDATA
    WHERE 1=1
    AND SUBSTR(YEARWEEK,5,2) <= 52
    AND SUBSTR(YEARWEEK,1,4) >= 2015
    AND PRODUCT IN ('PRODUCT1', 'PRODUCT2')   
    );
   

CREATE TABLE MAPRDD AS(
SELECT
    KEYCOL
    ,ACCOUNTID
    ,PRODUCT
    ,YEARWEEK
    ,CASE WHEN (QTY>9999999) THEN 9999999
    ELSE QTY END AS NEW_QTY
    ,PRODUCTNAME
    FROM FILTERRDD
    );
    

CREATE TABLE GROUPRDD1 AS(
SELECT
    ACCOUNTID
    ,PRODUCT
    ,COUNT(NEW_QTY) AS COUNT
    ,SUM(NEW_QTY) AS SUMMATION
    ,ROUND(AVG(NEW_QTY),0) AS AVG_QTY
    FROM MAPRDD
    GROUP BY ACCOUNTID, PRODUCT
    );


CREATE TABLE GROUPRDD2 AS(
SELECT
    A.ACCOUNTID AS REGIONID
    ,A.PRODUCT
    ,A.YEARWEEK
    ,A.NEW_QTY
    ,B.AVG_QTY
    ,ROUND(A.NEW_QTY / B.AVG_QTY,2) AS RATIO
    FROM MAPRDD A
    LEFT JOIN
    GROUPRDD1 B
    ON A.ACCOUNTID = B.ACCOUNTID
    AND A.PRODUCT = B.PRODUCT
    );
    

CREATE TABLE FINALRESULT AS(
SELECT
    REGIONID
    ,PRODUCT
    ,SUBSTR(YEARWEEK,5,2) AS WEEK
    ,ROUND(AVG(RATIO),2) AS RATIO
    FROM GROUPRDD2
    GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,2)
    );


SELECT * FROM FINALRESULT;

SELECT * FROM KOPO_ST_��ȿ��_FINAL5
ORDER BY REGIONID, PRODUCT, WEEK;