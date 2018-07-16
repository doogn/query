---- 1번 문제
-- [기본조회] kopo_channel_seasonality_final 테이블에서
-- 다음 조건을 만족하는 테이블을 생성하세요
-- (주차 != 53 AND 연도 >= 2015 AND 상품(PRODUCT1 및 PRODUCT2)
-- KOPO_ST_{이름}_FINAL1 테이블로 생성하세요 (예: KOPO_ST_김효관_FINAL1)

SELECT * FROM KOPO_CHANNEL_SEASONALITY_FINAL;

SELECT *
    FROM KOPO_CHANNEL_SEASONALITY_FINAL
    WHERE 1=1
    AND SUBSTR(YEARWEEK,5,2) != '53'
    AND SUBSTR(YEARWEEK,1,4) >= '2015'
    AND PRODUCT IN ('PRODUCT1', 'PRODUCT2');

CREATE TABLE
    KOPO_ST_김의진_FINAL1
    AS (
        SELECT *
        FROM KOPO_CHANNEL_SEASONALITY_FINAL
        WHERE 1=1
        AND SUBSTR(YEARWEEK,5,2) != '53'
        AND SUBSTR(YEARWEEK,1,4) >= '2015'
        AND PRODUCT IN ('PRODUCT1', 'PRODUCT2')
    );


---- 2번 문제
-- [GROUP-BY] 1번 결과 테이블에서 지역/상품별 평균판매량을
-- 소수점 없이 반올림하여 AVG_QTY 값을 산출한 후
-- KOPO_ST_{이름}_FINAL2 테이블로 생성하세요

SELECT * FROM KOPO_ST_김효관_FINAL1;

SELECT * FROM KOPO_ST_김의진_FINAL1;

SELECT
    REGIONID
    ,PRODUCT
    ,ROUND(AVG(QTY),0) AS AVG_QTY
    FROM KOPO_ST_김효관_FINAL1
    GROUP BY REGIONID, PRODUCT
    ORDER BY REGIONID, PRODUCT;

CREATE TABLE
    KOPO_ST_김의진_FINAL2
    AS (
        SELECT
            REGIONID
            ,PRODUCT
            ,ROUND(AVG(QTY),0) AS AVG_QTY
            FROM KOPO_ST_김의진_FINAL1
            GROUP BY REGIONID, PRODUCT
    );


---- 3번 문제
-- [JOIN] 1번결과 테이블을 기준으로 2번결과 테이블을 LEFT 조인하여
-- [REGIONID, PRODUCT, YEARWEEK, QTY, AVG_QTY] 컬럼을 조회하여
-- KOPO_ST_{이름}_FINAL3 테이블로 생성하세요 (조인키는 REGIONID, PRODUCT)

SELECT * FROM KOPO_ST_김효관_FINAL2;

SELECT
    A.REGIONID
    ,A.PRODUCT
    ,A.YEARWEEK
    ,A.QTY
    ,B.AVG_QTY
    FROM KOPO_ST_김효관_FINAL1 A
    LEFT JOIN
    KOPO_ST_김효관_FINAL2 B
    ON A.REGIONID = B.REGIONID
    AND A.PRODUCT = B.PRODUCT;
    
    
CREATE TABLE
    KOPO_ST_김의진_FINAL3
    AS (
        SELECT
            A.REGIONID
            ,A.PRODUCT
            ,A.YEARWEEK
            ,A.QTY
            ,B.AVG_QTY
            FROM KOPO_ST_김의진_FINAL1 A
            LEFT JOIN
            KOPO_ST_김의진_FINAL2 B
            ON A.REGIONID = B.REGIONID
            AND A.PRODUCT = B.PRODUCT);
    
    
---- 4번 문제
-- [단일행 함수] 3번결과 테이블에서 QTY/AVG_QTY 를 계산하여
-- RATIO 컬럼을 추가한 후 KOPO_ST_{이름}_FINAL4테이블로 생성하세요
-- [REGIONID, PRODUCT, YEARWEEK, QTY, AVG_QTY,RATIO] 
-- (단, RATIO는 소수점 2자리에서 반올림해야하며 분모0 처리는 신경쓰지 마세요)

SELECT * FROM KOPO_ST_김효관_FINAL3;

SELECT
    REGIONID
    ,PRODUCT
    ,YEARWEEK
    ,QTY
    ,AVG_QTY
    ,ROUND(QTY/AVG_QTY,2) AS RATIO
    FROM KOPO_ST_김효관_FINAL3;

CREATE TABLE
    KOPO_ST_김의진_FINAL4
    AS (
        SELECT
            REGIONID
            ,PRODUCT
            ,YEARWEEK
            ,QTY
            ,AVG_QTY
            ,ROUND(QTY/AVG_QTY,2) AS RATIO
            FROM KOPO_ST_김의진_FINAL3
    );


---- 5번 문제
-- [GROUP BY] 4번결과 테이블에서 지역/상품/주차별 RATIO의
-- 평균(소수점 2자리 반올림) 을 조회하여
-- KOPO_ST_{이름}_FINAL5테이블로 생성하세요 [REGIONID, PRODUCT, WEEK, RATIO]

SELECT * FROM KOPO_ST_김효관_FINAL4;

SELECT
    REGIONID
    ,PRODUCT
    ,SUBSTR(YEARWEEK,5,2) AS WEEK
    ,ROUND(AVG(RATIO),2) AS RATIO
    FROM KOPO_ST_김효관_FINAL4
    GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6);
    
CREATE TABLE
    KOPO_ST_김의진_FINAL5
    AS (
        SELECT
        REGIONID
        ,PRODUCT
        ,SUBSTR(YEARWEEK,5,2) AS WEEK
        ,ROUND(AVG(RATIO),2) AS RATIO
        FROM KOPO_ST_김의진_FINAL4
        GROUP BY REGIONID, PRODUCT, SUBSTR(YEARWEEK,5,6)
    );
 

---- 6번 문제
-- [PIVOT] 5번결과 테이블에 대해서 아래 이미지와 같이 피벗되도록 구성한 후
-- KOPO_ST_{이름}_FINAL6 테이블로 생성하세요
 
SELECT * FROM KOPO_ST_김효관_FINAL5;

SELECT *
    FROM (
        SELECT
            REGIONID
            ,PRODUCT
            ,WEEK
            ,AVG(RATIO) AS AVG_RATIO
        FROM KOPO_ST_김효관_FINAL5
    GROUP BY REGIONID, PRODUCT, WEEK
    )
PIVOT (
    SUM(AVG_RATIO)
    FOR WEEK
    IN ('01' W01,'02' W02,'03' W03,'04' W04,'05' W05,'06' W06,'07' W07,'08' W08,'09' W09,'10' W10)
)
ORDER BY REGIONID, PRODUCT;

CREATE TABLE
    KOPO_ST_김의진_FINAL6
    AS (
    SELECT *
    FROM (
        SELECT
            REGIONID
            ,PRODUCT
            ,WEEK
            ,AVG(RATIO) AS AVG_RATIO
            FROM KOPO_ST_김의진_FINAL5
            GROUP BY REGIONID, PRODUCT, WEEK
            )
        PIVOT (
            SUM(AVG_RATIO)
            FOR WEEK
            IN ('01' W01,'02' W02,'03' W03,'04' W04,'05' W05,'06' W06,'07' W07,'08' W08,'09' W09,'10' W10)
        )
    );



SELECT * FROM KOPO_ST_김의진_FINAL1;

SELECT * FROM KOPO_ST_김효관_FINAL1;

SELECT * FROM KOPO_ST_김의진_FINAL2;

SELECT * FROM KOPO_ST_김효관_FINAL2;

SELECT * FROM KOPO_ST_김의진_FINAL3;

SELECT * FROM KOPO_ST_김효관_FINAL3;

SELECT * FROM KOPO_ST_김의진_FINAL4;

SELECT * FROM KOPO_ST_김효관_FINAL4;

SELECT * FROM KOPO_ST_김의진_FINAL5;

SELECT * FROM KOPO_ST_김효관_FINAL5;

SELECT * FROM KOPO_ST_김의진_FINAL6;

SELECT * FROM KOPO_ST_김효관_FINAL6;

SELECT * FROM TABS;