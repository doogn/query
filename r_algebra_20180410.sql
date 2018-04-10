-- selection

select * from kopo_product_volume
    where 2=2
    and volume > 3000;
  
select * from kopo_product_volume
    where 2=2
    and yearweek >= 201601
    and productgroup = 'ST0001';
   
 
-- union

select * from kopo_product_volume_a01; -- a01 ���̺� �÷���: 4

select * from kopo_product_volume_a02; -- a02 ���̺� �÷���: 5 (�÷��� ����� ��)

select * from kopo_product_volume_a01
union  -- union all: �ߺ� ���� �� ���ı���
select
    regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;

select * from kopo_product_volume_a01
union all -- �ߺ����� �� �� (union���� �ӵ� ����)
select
    regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;



select regionid, productgroup, yearweek, volume, NULL AS volume_content -- NULL�� �̿��� empty column ���� ����
    from kopo_product_volume_a01
union
select regionid, productgroup, yearweek, volume, volume_content
    from kopo_product_volume_a02;



select * from kopo_channel_result_a02;

select * from kopo_channel_result_a01  -- �ٷ�� �����ͷ��� �������� union�� ��� �ð��� ���� �ɸ�
union
select * from kopo_channel_result_a02;

select * from kopo_channel_result_a01  -- union all�� �����ͷ��� Ŀ���� �ӵ��� ���� 
union all
select * from kopo_channel_result_a02;



select regionid, productgroup, yearweek, volume  -- 420�� ��ȸ
    from kopo_product_volume_a01
union
select regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;

select regionid, productgroup, yearweek, volume  -- 421�� ��ȸ
    from kopo_product_volume_a01
union all
select regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;
    
select regionid, productgroup, yearweek, volume  -- union all�� unoin �� ���� (a01�� a02�� intersection 1��)
    from kopo_product_volume_a01
intersect
select regionid, productgroup, yearweek, volume
    from kopo_product_volume_a02;
    


-- Expression

select
    'D516' as measuredID,  -- ��Ī�� �� ���� ����
    3*4 as tempvalue,
    regionid || productgroup || yearweek as key,  -- or �� �÷����� ���� Ư�� key ���� (��ȸ�� ����)
    regionid,
    productgroup,
    yearweek,
    volume
from kopo_product_volume;

select
    'D516' as measuredID,
    3*4 as tempvalue,
    regionid || '_' ||
    productgroup || '_' || yearweek as key,  -- ������('_')�� �÷����� �����Ͽ� ������ ����
    regionid,
    productgroup,
    yearweek,
    volume
from kopo_product_volume;

select
    concat(regionid, productgroup) as con, -- concat �Լ��� �̿��� ���ڿ� ����
    regionid,
    productgroup,
    yearweek,
    volume
from kopo_product_volume;


