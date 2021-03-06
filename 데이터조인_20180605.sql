-- 실습 예제 (P. 57)
-- 다음 2개의 테이블을 활용하여 INNER, LEFT, RIGHT 조인을 실습해보세요

SELECT * FROM CUSTOMERDATA;

SELECT * FROM CUSTOMER_NAME;

-- 1) INNER JOIN

SELECT A.CUSTID, B.CUSTNAME, A.AVERAGEPRICE, A.EMI, A.DEVICECOUNT, A.PRODUCTAGE, A.CUSTTYPE
    FROM CUSTOMERDATA A
    INNER JOIN CUSTOMER_NAME B
    ON A.CUSTID = B.CUSTID;
    
SELECT COUNT(*)
FROM(
    SELECT A.CUSTID, B.CUSTNAME, A.AVERAGEPRICE, A.EMI, A.DEVICECOUNT, A.PRODUCTAGE, A.CUSTTYPE
    FROM CUSTOMERDATA A
    INNER JOIN CUSTOMER_NAME B
    ON A.CUSTID = B.CUSTID
    );

-- 2) LEFT JOIN
SELECT A.CUSTID, B.CUSTNAME, A.AVERAGEPRICE, A.EMI, A.DEVICECOUNT, A.PRODUCTAGE, A.CUSTTYPE
    FROM CUSTOMERDATA A
    LEFT JOIN CUSTOMER_NAME B
    ON A.CUSTID = B.CUSTID;
    
SELECT COUNT(*)
FROM(
    SELECT A.CUSTID, B.CUSTNAME, A.AVERAGEPRICE, A.EMI, A.DEVICECOUNT, A.PRODUCTAGE, A.CUSTTYPE
    FROM CUSTOMERDATA A
    LEFT JOIN CUSTOMER_NAME B
    ON A.CUSTID = B.CUSTID
    );   
    
-- CUSTNAME이 NULL인 행만 조회
SELECT *
    FROM (
    SELECT A.CUSTID, B.CUSTNAME, A.AVERAGEPRICE, A.EMI, A.DEVICECOUNT, A.PRODUCTAGE, A.CUSTTYPE
        FROM CUSTOMERDATA A
        LEFT JOIN CUSTOMER_NAME B
        ON A.CUSTID = B.CUSTID
    )
    WHERE CUSTNAME IS NULL;

-- 3) RIGHT JOIN

SELECT A.CUSTID, B.CUSTNAME, A.AVERAGEPRICE, A.EMI, A.DEVICECOUNT, A.PRODUCTAGE, A.CUSTTYPE
    FROM CUSTOMERDATA A
    RIGHT JOIN CUSTOMER_NAME B
    ON A.CUSTID = B.CUSTID;

-- 참고: COUNT(*) 함수

SELECT
    REGIONID
    ,PRODUCT
    ,COUNT(*)
FROM KOPO_CHANNEL_SEASONALITY
GROUP BY REGIONID, PRODUCT
HAVING COUNT(*) != 314;

