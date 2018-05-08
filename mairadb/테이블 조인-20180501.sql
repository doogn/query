select * from flight, aircraft
	where flight.aircraftCode = aircraft.aircraftcode;
	
select * from flight a, aircraft b  -- 테이블 이름에 alias를 줌 (a, b)
	where a.aircraftCode = b.aircraftcode
	and b.aircraftCode = 'A1';


select a.id, a.name from member a, auth b
	where a.authcode = b.authcode
	and b.authority = '관리자';
	
select a.name, b.title from member a, board b
	where a.id = b.id;

select a.name, a.id, b.title, b.content, c.authority
	from member a, board b, auth c
	where a.id = b.id
	and a.authcode = c.authcode
	and c.authority = '회원';


