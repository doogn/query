---- QUIZ (2018.6.12) ----

-- 2�� ����
-- CUSTOMERDATA�� CUSTOMER_NAME���̺��� Ű�� �������� �ʰ� �����غ�����. (īƼ�ǰ�)
-- �ش� ���ο� �����ϴ� ��� ������� �� ���

SELECT *
    FROM CUSTOMERDATA
    CROSS JOIN CUSTOMER_NAME;

SELECT A.*, B.*
    FROM CUSTOMERDATA A,
    CUSTOMER_NAME B;

-- 6�� ����
-- CUST_MGT ���̺��� custid �� mgrid�� Ű�� ������ �����غ�����

SELECT A.*, B.*
    FROM CUST_MGT A, CUST_MGT B
    WHERE 1=1
    AND A.CUSTID = B.MGRID;
