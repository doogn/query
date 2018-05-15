

--(P.23)
-- KOPO_CUSTOMERDATA�� ���ڵ��10�ڸ��̴�
--���� 10�ڸ��� �ƴϸ� ���ʿ� 0���� ä���
--���� ���ڵ��� �� 4�ڸ��� ��ȣȭ�� ���� * ó����
--�ؾ��մϴ�.


SELECT
    REPLACE(LPAD(CUSTOMERCODE, 10, '0')
    ,SUBSTR(CUSTOMERCODE, -4), '****')
    AS CUSTOMERCODE_SECRET
    FROM KOPO_CUSTOMERDATA;


SELECT
    CONCAT(
    SUBSTR(
    LPAD(CUSTOMERCODE, 10, '0'), 0, 6
    ),'****'
    ) AS CUSTOMERCODE_SECRET 
    FROM KOPO_CUSTOMERDATA;
    


-- (P.26)
-- NUMBER_EXAMPLE��
-- FIRST/NUMBER�� Ȱ���Ͽ� �Ʒ��� ����
-- ����� ����ϼ���


SELECT
    FIRST_NUMBER
    ,SECOND_NUMBER
    ,(FIRST_NUMBER / SECOND_NUMBER) AS AVG
    ,ROUND(FIRST_NUMBER / SECOND_NUMBER, 0) AS ROUND_EX
    ,CEIL(FIRST_NUMBER / SECOND_NUMBER) AS CEIL_EX
    ,FLOOR(FIRST_NUMBER / SECOND_NUMBER) AS FLLOR_EX
    ,MOD(FIRST_NUMBER, SECOND_NUMBER) AS MOD_EX
    ,POWER(FIRST_NUMBER, SECOND_NUMBER) AS POW_EX
    FROM NUMBER_EXAMPLE;
    
    

-- (P.27)
-- RMSE_MAE_EXAMPLE2 ���̺���
-- ACCURACY = 1 ? ABS(������-������) / ������ ������ Ȱ���Ͽ�
-- ��Ȯ���� �����ϼ��� (�Ҽ��� 2°�ڸ� �ݿø�)


SELECT
    YEARWEEK
    ,ACTUAL
    ,FCST
    ,ROUND((1-ABS(FCST-ACTUAL)/FCST)*100, 2) AS ACCURACY
    FROM RMSE_MAE_EXAMPLE2;


SELECT *
    FROM(
        SELECT
            YEARWEEK
            ,ACTUAL
            ,FCST
            ,ROUND((1-ABS(FCST-ACTUAL)/FCST)*100, 2) AS ACCURACY
            FROM RMSE_MAE_EXAMPLE2
        )   
    WHERE 1=1
    AND ACCURACY < 50;  -- ��Ȯ���� 50% �̸��� �����͸� ���� ����
    

-- ��¥ �Լ�

SELECT
    SYSDATE,  -- ���� ��¥
    SYSDATE+2,  -- 2�� ��
    NEXT_DAY(SYSDATE,2),  -- ������ 2��°(��) ���� (1~7 => ��~��)
    LAST_DAY(SYSDATE)  -- �̹� �� ��������
FROM DUAL;


-- CASE .. WHEN ��

SELECT
    YEARWEEK,
    CASE WHEN QTY<1000 THEN 1000
        WHEN QTY>1000 AND QTY < 10000 THEN 10000
        ELSE 30000 END AS QTY
    FROM KOPO_CHANNEL_SEASONALITY_NEW;
