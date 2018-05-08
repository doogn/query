-- Left Join (flight를 기준으로 aircraft를 left (outer) join)

select *
	from flight a
left join aircraft b
	on a.aircraftCode = b.aircraftcode;
	

-- 실습 예제

-- 1) Left Join
select a.name, b.authority
	from member a
left join auth b
	on a.authcode = b.authcode;

-- 1') 이렇게 하면 NULL값은 안 나옴 (Inner Join)
select a.name, b.authority
	from member a, auth b
where a.authcode = b.authcode;


-- 2) Left Join
select a.title, b.name
	from board a
left join member b
	on a.id = b.id;
	
-- 2') 이렇게 하면 NULL값은 안 나옴 (Inner Join)
select a.title, b.name
	from board a, member b
where a.id = b.id;

select a.title, b.name
	from board a
inner join member b
	on a.id = b.id;
