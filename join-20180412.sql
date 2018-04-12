-- ������ ���̺�
select * from kopo_stock_mst;

-- �α� ����
select * from kopo_stock_log;

-- left join: ������ ���̺� + �α� ����
select a.screen_code, a.screed_div, a.content, b.DATE_CODE, b.OPEN, b.high, b.low, b.adj_close, b.volume
    from kopo_stock_mst a
    left join kopo_stock_log b
    on a.screen_code = b.st_code;

-- ���̺� ���� �� left join
create table kopo_st_kej_join as
    select a.screen_code, a.screed_div, a.content, b.DATE_CODE, b.OPEN, b.high, b.low, b.adj_close, b.volume
    from kopo_stock_mst a
    left join kopo_stock_log b
    on a.screen_code = b.st_code
    where screed_div = 'KOSPI';
    
select * from kopo_st_kej_join;

