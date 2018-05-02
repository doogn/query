
-- 697,996°Ç
select * from kopo_channel_result_new;


-- 124,658°Ç
select * from kopo_channel_seasonality_new;

select
    regionid,
    cast(avg(QTY) as float)
    from kopo_channel_seasonality
    group by regionid
    order by regionid;
    
desc kopo_channel_seasonality;
