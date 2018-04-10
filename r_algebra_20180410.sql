-- selection

select * from kopo_product_volume
    where 2=2
    and volume > 3000;
  
select * from kopo_product_volume
    where 2=2
    and yearweek >= 201601
    and productgroup = 'ST0001';
   
 
-- union

select * from kopo_product_volume_a01; -- a01 테이블 컬럼수: 4

select * from kopo_product_volume_a02; -- a02 테이블 컬럼수: 5 (컬럼수 맞춰야 함)

select * from kopo_product_volume_a01
union  -- union all: 중복 제거 및 정렬까지
select
    regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;

select * from kopo_product_volume_a01
union all -- 중복제거 안 함 (union보다 속도 빠름)
select
    regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;



select regionid, productgroup, yearweek, volume, NULL AS volume_content -- NULL을 이용해 empty column 생성 가능
    from kopo_product_volume_a01
union
select regionid, productgroup, yearweek, volume, volume_content
    from kopo_product_volume_a02;



select * from kopo_channel_result_a02;

select * from kopo_channel_result_a01  -- 다루는 데이터량이 많아지면 union의 경우 시간이 많이 걸림
union
select * from kopo_channel_result_a02;

select * from kopo_channel_result_a01  -- union all은 데이터량이 커져도 속도가 빠름 
union all
select * from kopo_channel_result_a02;



select regionid, productgroup, yearweek, volume  -- 420건 조회
    from kopo_product_volume_a01
union
select regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;

select regionid, productgroup, yearweek, volume  -- 421건 조회
    from kopo_product_volume_a01
union all
select regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;
    
select regionid, productgroup, yearweek, volume  -- union all과 unoin 간 차이 (a01과 a02의 intersection 1건)
    from kopo_product_volume_a01
intersect
select regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;
    


-- Expression

select
    'D516' as measuredID,  -- 별칭을 줄 수도 있음
    3*4 as tempvalue,
    regionid || productgroup || yearweek as key,  -- or 로 컬럼명을 묶어 특정 key 생성 (조회시 편함)
    regionid,
    productgroup,
    yearweek,
    volume
from kopo_product_volume;

select
    'D516' as measuredID,
    3*4 as tempvalue,
    regionid || '_' ||
    productgroup || '_' || yearweek as key,  -- 구분자('_')로 컬럼명을 구분하여 가독성 개선
    regionid,
    productgroup,
    yearweek,
    volume
from kopo_product_volume;

select
    concat(regionid, productgroup) as con, -- concat 함수를 이용해 문자열 조합
    regionid,
    productgroup,
    yearweek,
    volume
from kopo_product_volume;


