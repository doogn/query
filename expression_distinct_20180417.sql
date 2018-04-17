-- Expression

select
    'KOPO_D510' as measuredID, 
    regionid,
    productgroup,
    yearweek,
    volume,
    cast(yearweek as number) + volume as test
from kopo_product_volume;   -- yearweek 자료 타입을 number로 변환(cast) => 연산 가능하도록 



-- Distinct
select
    distinct productgroup as product
    from kopo_channel_seasonality;

select
    count(distinct productgroup)
    from kopo_channel_seasonality;


select * from tabs where table_name like 'KOPO%';

select * from tabs;



-- 데이터베이스 링크
create database link server1111
connect to kopo
identified by kopo
Using 'POLY_SERVER';
  
select * from kopo_product_volume@server1111;   -- 해당 서버에서 방화벽 차단을 해체했기에 접속 가능 / 차단시 접속 불가

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



-- 검색 결과로 새로운 테이블 만들기
select * from new_result;

create table new_result as
(select * from kopo_test_result where regionid = 'A01');

