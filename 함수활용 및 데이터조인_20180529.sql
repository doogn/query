---- 2018/5/29(화) Quiz -----


---- 1번 문제
CREATE TABLE RMSE_MAE_ST_EJKIM
AS (SELECT
        YEARWEEK
        ,ACTUAL
        ,FCST
        ,ROUND((1-ABS(FCST-ACTUAL)/FCST)*100, 2) AS ACCURACY
    FROM RMSE_MAE_EXAMPLE2);

---- 2~3번 문제
    
SELECT TO_CHAR(SYSDATE, 'YYYYIW') FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY MM DD') FROM DUAL;

---- 4번 문제
SELECT A.*,
        CASE WHEN SUBSTR(CUSTID,1,1) = 'B'
             THEN 0
             WHEN SUBSTR(CUSTID,1,1) = 'A'
             THEN 1
             WHEN SUBSTR(CUSTID,1,1) = 'C'
             THEN 2
             ELSE 3 END AS SORT_ORDER
FROM CUSTOMERDATA A
ORDER BY SORT_ORDER;



-------- 2018/5/29(화):  함수 활용 및 데이터 조인 -----------

----- DECODE 함수


----- 실습예제: DT_RESULT_FINAL3 테이블에서 정확도를 산출하세요  (P. 38)
----- 단, 예측값이 0인경우 정확도는 0, 정확도 = 1- ABS(예측값-실측값)/예측값

SELECT
        A.*,
        DECODE(PREDICTION_QTY, 0, 0
        ,0.5, 'UNDEFINED' -- 예) 0.5인 경우 특별한 주의를 기울이고 싶을 때 
        ,ROUND((1-ABS(PREDICTION_QTY - REAL_QTY)/ PREDICTION_QTY)*100, 2)) AS ACCURACY
        FROM DT_RESULT_FINAL3 A;
        
SELECT * FROM DT_RESULT_FINAL3;


----- 집계 함수

SELECT AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW;

SELECT REGIONID, AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW
    GROUP BY REGIONID
    ORDER BY REGIONID;

SELECT REGIONID, PRODUCT, AVG(QTY) FROM KOPO_CHANNEL_SEASONALITY_NEW
    GROUP BY REGIONID, PRODUCT
    ORDER BY REGIONID, PRODUCT;
    
SELECT REGIONID, PRODUCT, SUM(QTY), COUNT(QTY), ROUND(AVG(QTY),1) 
    FROM KOPO_CHANNEL_SEASONALITY_NEW
    GROUP BY REGIONID, PRODUCT
    HAVING AVG(QTY) > 10000  --- GROUP BY일 때는 HAVING 사용 (WHERE 대신)
    ORDER BY AVG(QTY) DESC;

SELECT 
    REGIONID,
    PRODUCT,
    AVG(QTY)
FROM KOPO_CHANNEL_SEASONALITY_NEW
WHERE REGIONID = 'A01'  -- 모수 자체를 WHERE 조건으로 필터링 (그룹핑 전에 줄이면 효율적)
GROUP BY REGIONID, PRODUCT
HAVING AVG(QTY) > 10000  --- 조건절
ORDER BY REGIONID, PRODUCT;


---- 실습예제: RMSE_MAE_EXAMPLE 테이블을 활용하여 ITEM별 RMSE를 구하세요 (P. 46)

SELECT * FROM RMSE_MAE_EXAMPLE;

SELECT
    ITEM
    ,SUM(POWER(PREDICTION - QTY, 2)) AS ERROR_SUM
    ,COUNT(ITEM) AS ITEM_COUNT
    ,AVG(POWER(PREDICTION - QTY, 2)) AS MAE
    ,SQRT(AVG(POWER(PREDICTION - QTY, 2))) AS RMSE   
FROM RMSE_MAE_EXAMPLE
GROUP BY ITEM
ORDER BY ITEM;
-- 결과값: AA의 RMSE는 50, BB의 RMSE는 132.3 (ERROR값의 증폭(POWER) 효과)


SELECT
    ITEM
    ,AVG(ERROR)
    ,AVG(ERROR_POW)
    ,SQRT(AVG(ERROR_POW))
    FROM
    (
    --  ERROR를 구한다
        SELECT
            ITEM
            ,YEARWEEK
            ,QTY
            ,PREDICTION
            ,ABS(QTY-PREDICTION) AS ERROR
            ,POWER(ABS(QTY-PREDICTION), 2) AS ERROR_POW
        FROM RMSE_MAE_EXAMPLE
    )
    GROUP BY ITEM;
    
    