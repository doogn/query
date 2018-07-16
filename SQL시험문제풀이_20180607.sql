
-- 41�� ���� (REPLACE)

CREATE TABLE REPLACE_TEST (
    R1 NUMBER,
    C1 VARCHAR2(10)
    );
    
EDIT REPLACE_TEST;


SELECT * FROM REPLACE_TEST;

SELECT
    REPLACE(C1,'D','') AS REPL
    ,LENGTH(REPLACE(C1,'D','')) AS LENGTH
    FROM REPLACE_TEST
    WHERE R1=2;


-- 87�� ���� (��� ����)

CREATE TABLE RECURSIVE_TEST (
    C1 NUMBER,
    C2 NUMBER,
    C3 VARCHAR(10)
    );
    
EDIT RECURSIVE_TEST;

SELECT * FROM RECURSIVE_TEST;

SELECT C3
    FROM RECURSIVE_TEST
    START WITH C2 IS NULL
    CONNECT BY PRIOR C1 = C2
    ORDER SIBLINGS BY C3 DESC;
    

-- 89�� ���� (������ ����)

CREATE TABLE EMPLOYEES (
    EMPNO VARCHAR2(10),
    NAME VARCHAR2(10),
    STARTDATE VARCHAR2(10),
    MNGRNO VARCHAR2(10)
    );
    
EDIT EMPLOYEES;

SELECT * FROM EMPLOYEES;

SELECT EMPNO, NAME, STARTDATE, MNGRNO
    FROM EMPLOYEES
    START WITH MNGRNO IS NULL
    CONNECT BY PRIOR EMPNO = MNGRNO
    AND STARTDATE BETWEEN '2013-01-01' AND '2013-12-31'
    ORDER SIBLINGS BY EMPNO;