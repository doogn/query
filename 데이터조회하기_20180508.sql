-- ����� ���� �Է¹ޱ�

SELECT *
    FROM KOPO_PROMOTION
    WHERE 1=1
    AND TARGETWEEK 
        BETWEEN &STARTWEEK AND &ENDWEEK
    ORDER BY TARGETWEEK; 


-- ������ �����ϱ�
-- CASE WHEN ����Ͽ� N/A => Male = > Female �� ����

SELECT DISTINCT GENDER
FROM KOPO_CUSTOMERDATA;

SELECT A.*,
        -- LOWER (�ҹ��ں�ȯ), UPPER (�빮�ں�ȯ)
        -- ��,�ҹ��ڰ� �������� ���� �Ѱ����� �����ϴ� �͵� ���
        -- WHEN LOWER(A.GENDER) = 'not available'
        -- WHEN UPPER(A.GENDER) = 'MALE'  
        CASE WHEN A.GENDER = 'Not Available'
             THEN 0
             WHEN A.GENDER = 'Male'  -- ����ǥ ���� ���ڿ��� ��ҹ��� ������
             THEN 1
             ELSE 2 END AS SORT_ORDER
FROM KOPO_CUSTOMERDATA A
ORDER BY SORT_ORDER;


-- �� �� �÷� �̻� �������� �����ϱ�

SELECT *
    FROM KOPO_PRODUCT_VOLUME
    ORDER BY REGIONID, PRODUCTGROUP, YEARWEEK;


-- ���տ�����: Union

SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
    UNION
SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST00002';


-- ���տ�����: Intersect

SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
    INTERSECT
SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST00002';


-- ���տ�����: Minus

SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST0001'
    MINUS
SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE PRODUCTGROUP = 'ST00002';


-- MINUS + NOT IN Ȱ��

SELECT *
FROM KOPO_PRODUCT_VOLUME
WHERE 1=1
AND PRODUCTGROUP = 'ST0001'
AND YEARWEEK NOT IN (
                     SELECT DISTINCT YEARWEEK
                     FROM KOPO_CHANNEL_RESULT_NEW
                    );

-- ��/�ҹ��� ����

SELECT
    UPPER(PRODUCT) AS CASE1,
    LOWER(PRODUCT) AS CASE2
    FROM KOPO_CHANNEL_SEASONALITY_NEW;
    
SELECT UPPER('askjdnkjqWDLKFJGNWgerwij') FROM DUAL;
    

-- ��/�ҹ��� ��� ���� �Է��ϵ� �Է¹���/�񱳵����� ��θ�
-- ���� ���·� �����Ͽ� ��/�ҹ��� ���� �ʿ䰡 ������ ��
SELECT *
    FROM KOPO_CHANNEL_SEASONALITY_NEW
    WHERE 1=1
    AND LOWER(REGIONID) = LOWER(&UI_INPUT1)  -- ��� �ҹ��ڷ� ����
    AND LOWER(PRODUCT) = LOWER(&UI_INPUT2);
    -- AND UPPER(REGIONID) = UPPER(&UI_INPUT1)  -- ��� �빮�ڷ� ����
    -- AND UPPER(PRODUCT) = UPPER(&UI_INPUT2);
    

-- �÷� �� ��ġ��
SELECT 
    CONCAT(REGIONID,CONCAT('_',PRODUCT)) AS KEYCOL1,
    REGIONID||'_'||PRODUCT AS KEYCOL2
FROM KOPO_CHANNEL_SEASONALITY_NEW;


-- �÷� �� �����ϱ�: SUBSTR

SELECT SUBSTR ('201642', 1, 4) FROM DUAL;
-- SELECT SUBSTR ('201642', 0, 4) FROM DUAL; -- 0���� �����ص� ����(���� ���)

SELECT SUBSTR ('201642', 5, 6) FROM DUAL;
-- FROM DUAL: ������ ���̺� �������� (������ �Լ� �׽�Ʈ/����� ������ ����)
-- ��: ����ũ SUBSTRING���� ���� (�����ε��� / �����ε��� ����,������ ����)
-- ����Ŭ SUBSTR�� �ε����� 1���� ����(�ǿ���) / �����ε���, �����ε��� ������



-- �÷� �� ä���: LPAD / RPAD

SELECT LPAD('UNQW23K', 13, 0) FROM DUAL;

SELECT LPAD('UNQW23K', 13, '*') FROM DUAL;

SELECT RPAD('UNQW23K', 13, 0) FROM DUAL;

SELECT RPAD('UNQW23K', 13, '*') FROM DUAL;



SELECT RPAD(CUSTOMERCODE, 12, '*')
    FROM KOPO_CUSTOMERDATA;

