SELECT
    REGIONID, ITEM, TARGETWEEK, PLANWEEK, IR, PRODUCT,
    PMAP,
    MAP_PRICE,
    (PMAP/NULLIF((MAP_PRICE),0)) AS PERCENT
    FROM KOPO_PROMOTION;
-- The NULLIF function returns NULL if expr1 and expr2 are equal.
-- The NULLIF function returns expr1 if expr1 and expr2 are not equal.


SELECT
    REGIONID, ITEM, TARGETWEEK, PLANWEEK, IR, PRODUCT,
    PMAP,
    MAP_PRICE,
    CASE WHEN MAP_PRICE = 0 -- (pmap / map_price ratio의 제수(map_price)가 0일 때의 예외처리를 위함
        THEN 1
        ELSE PMAP/NVL(MAP_PRICE,1) END AS PROMOTION_RATIO  -- NVL(a,b) => a값이 null이면 b로 대체하라
    FROM KOPO_PROMOTION;

select * from KOPO_PROMOTION;

select * from kopo_promotion
    where 1=1
    and map_price is not null;
    
SELECT * FROM KOPO_PROMOTION

select * from KOPO_PROMOTION
    where 1=1
    and targetweek between '201516' and '201517';