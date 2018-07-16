---- QUIZ (2018.6.12) ----

-- 2번 문제
-- CUSTOMERDATA와 CUSTOMER_NAME테이블을 키를 설정하지 않고 조인해보세요. (카티션곱)
-- 해당 조인에 참여하는 모든 대상행을 다 출력

SELECT *
    FROM CUSTOMERDATA
    CROSS JOIN CUSTOMER_NAME;

SELECT A.*, B.*
    FROM CUSTOMERDATA A,
    CUSTOMER_NAME B;

-- 6번 문제
-- CUST_MGT 테이블에서 custid 와 mgrid를 키로 조인을 수행해보세요

SELECT A.*, B.*
    FROM CUST_MGT A, CUST_MGT B
    WHERE 1=1
    AND A.CUSTID = B.MGRID;
