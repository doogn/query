--테이블 생성 (a, b)
create table lefttable
(
    regionid varchar2(20),
    productgroup varchar2(20),
    yearweek varchar2(20),
    qty number
    );
create table righttable
(
    productid varchar2(20),
    productname varchar2(20)
    );

-- 테이블 편집 => 자료 입력
edit lefttable;
edit righttable;  

-- 테이블 내용 확인
select * from lefttable;
select * from righttable;

-- Inner join (a + b)
select a.*, b.productname
    from lefttable a
    inner join righttable b
    on a.productgroup = b.productid;
    
-- Left join (a + b)
select a.*, b.productname
    from lefttable a
    left join righttable b
    on a.productgroup = b.productid;
    
-- 테이블 추가 생성 (c)
create table promotiontable
(
    productgroup varchar2(20),
    promotion_week varchar2(20),
    promotion_ratio number
    );

edit promotiontable;

select * from promotiontable;

-- Inner join (a + c)
select a.*, c.promotion_ratio
    from lefttable a
    inner join promotiontable c
    on a.productgroup = c.productgroup
    and a.YEARWEEK = promotion_week;

-- Left join (a + c)
select a.*, c.promotion_ratio
    from lefttable a
    left join promotiontable c
    on a.productgroup = c.productgroup
    and a.YEARWEEK = c.promotion_week;

-- Left join (a + b + c)
select a.*, b.productname, c.promotion_ratio
    from lefttable a
    left join righttable b 
    on a.productgroup = b.productid;
    left join promotiontable c
    on a.productgroup = c.productgroup
    and a.YEARWEEK = c.promotion_week;

-- Inner join (a + b + c)
select a.*, b.productname, c.promotion_ratio
    from lefttable a
    inner join righttable b 
    on a.productgroup = b.productid;
    inner join promotiontable c
    on a.productgroup = c.productgroup
    and a.YEARWEEK = c.promotion_week;
    
-- Left Join 2 (a + b + c )
create view joined
    as select a.*, b.productname
    from lefttable a
    left join righttable b
    on a.productgroup = b.productid;
    
select d.*, c.promotion_ratio
    from joined d
    left join promotiontable c
    on d.productgroup = c.productgroup
    and d.YEARWEEK = c.promotion_week;
    
-- Left join 3 (a + b + c)
select a.*, b.productname, c.promotion_ratio
    from lefttable a,
         righttable b,
         promotiontable c
    where 1=1
    and a.productgroup = b.productid (+)
    and a.productgroup = c.productgroup (+)
    and a.YEARWEEK = c.promotion_week (+);

-- Inner join 3 (a + b + c)
select a.*, b.productname, c.promotion_ratio
    from lefttable a,
         righttable b,
         promotiontable c
    where 1=1
    and a.productgroup = b.productid
    and a.productgroup = c.productgroup
    and a.YEARWEEK = c.promotion_week;
    
    