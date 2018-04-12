select * from member
	where length(pass) = (select max(length(pass)) from member);
	
select * from member
	where authcode = (select authcode from auth where authority = '회원');

select * from member
	where id in (select id from board where content is not null);

