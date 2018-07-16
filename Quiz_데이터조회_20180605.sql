SELECT * FROM RMSE_MAE_EXAMPLE;

CREATE TABLE RMSE_MAE_EXAMPLE_STEP2_������1
AS (SELECT
        ITEM
        ,AVG(ABS(QTY-PREDICTION)) AS MAE
    FROM RMSE_MAE_EXAMPLE
    GROUP BY ITEM);  
    
CREATE TABLE RMSE_MAE_EXAMPLE_STEP2_������2
AS (SELECT
        YEARWEEK
        ,AVG(ABS(QTY-PREDICTION)) AS MAE
    FROM RMSE_MAE_EXAMPLE
    GROUP BY YEARWEEK);
    
    
SELECT
        YEARWEEK
        ,AVG(ABS(QTY-PREDICTION)) AS MAE
    FROM RMSE_MAE_EXAMPLE
    GROUP BY YEARWEEK;
    
    
SELECT
    ITEM
    ,YEARWEEK
    ,QTY
    ,PREDICTION
    ,POWER(PREDICTION - QTY, 2) AS POW_ERROR
    FROM RMSE_MAE_EXAMPLE;

SELECT
    ITEM
    ,AVG(POWER(PREDICTION - QTY, 2)) AS MAE
    ,SQRT(AVG(POWER(PREDICTION - QTY, 2))) AS RMSE
    FROM RMSE_MAE_EXAMPLE
GROUP BY ITEM;


SELECT T1.ITEM
        ,T1.YEARWEEK
        -- �����Լ�
        ,AVG(T1.ERROR_POW) AS MAE
FROM (SELECT
            ITEM
            ,YEARWEEK
            ,QTY
            ,PREDICTION
            ,ABS(QTY-PREDICTION) AS ERROR
            ,POWER(ABS(QTY-PREDICTION),2) AS ERROR_POW
            FROM RMSE_MAE_EXAMPLE
    ) T1
GROUP BY T1.ITEM, T1.YEARWEEK;

SELECT
            ITEM
            ,YEARWEEK
            ,QTY
            ,PREDICTION
            ,ABS(QTY-PREDICTION) AS ERROR
            ,POWER(ABS(QTY-PREDICTION),2) AS ERROR_POW
            FROM RMSE_MAE_EXAMPLE;


SELECT ITEM
        ,YEARWEEK
        ,AVG(POWER(ABS(QTY-PREDICTION),2)) AS MAE
        FROM RMSE_MAE_EXAMPLE
GROUP BY ITEM, YEARWEEK;


SELECT
        A.ITEM
        ,A.YEARWEEK
        ,A.QTY
        ,A.PREDICTION
        ,ABS(A.QTY-PREDICTION) AS ERROR
        ,POWER(ABS(A.QTY-PREDICTION),2) AS ERROR_POW
        ,B.MAE
        FROM RMSE_MAE_EXAMPLE A,
        (SELECT ITEM
            ,YEARWEEK
            ,AVG(POWER(ABS(QTY-PREDICTION),2)) AS MAE
            FROM RMSE_MAE_EXAMPLE
            GROUP BY ITEM, YEARWEEK) B;