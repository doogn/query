-- Expression

select
    'KOPO_D510' as measuredID, 
    regionid,
    productgroup,
    yearweek,
    volume,
    cast(yearweek as number) + volume as test
from kopo_product_volume;   -- yearweek �ڷ� Ÿ���� number�� ��ȯ(cast) => ���� �����ϵ��� 



-- Distinct
select
    distinct productgroup as product
    from kopo_channel_seasonality;

select
    count(distinct productgroup)
    from kopo_channel_seasonality;


select * from tabs where table_name like 'KOPO%';

select * from tabs;



-- �����ͺ��̽� ��ũ
create database link server1111
connect to kopo
identified by kopo
Using 'POLY_SERVER';
  
select * from kopo_product_volume@server1111;   -- �ش� �������� ��ȭ�� ������ ��ü�߱⿡ ���� ���� / ���ܽ� ���� �Ұ�

select * from tabs@server1111;

select * from all_db_links;


create database link server2222
connect to kopo
identified by kopo
Using '  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.110.111)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = orcl)
    )
  )';



-- �˻� ����� ���ο� ���̺� �����
select * from new_result;

create table new_result as
(select * from kopo_test_result where regionid = 'A01');

