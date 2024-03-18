<<<<<<< HEAD
use `db_study`;

insert into student_tb
values
	(0, '김도균', 27, '부산 금정구'), 
	(0, '김도훈', 25, '부산 진구'), 
	(0, '김범수', 33, '부산 금정구'), 
	(0, '김상현', 26, '부산 남구'), 
	(0, '이재영', 26, '부산 서구'), 
	(0, '이정찬', 29, '부산 진구'), 
	(0, '이지언', 26, '부산 동래구'),
	(0, '이평원', 30, '경상남도 양산시'),
	(0, '전주환', 30, '부산 진구'),
	(0, '심재원', 29, '부산 남구'); 
=======
use `db_study`; #데이터 베이스 선택

insert into student_tb(student_id, name, age, address) values (0, '김준일', 31, '부산 동래구');
insert into student_tb(address, name, age, student_id) values ('부산 동래구', '김준이', 31, 3);
insert into student_tb(name, address) values ('김준이', null);
insert into student_tb values (0, '김준삼', null, null);

insert into student_tb 
    (student_id, name, age, address)
values 
	(0, '김준삼', null, null), 
	(0, '김준사', null, null);

>>>>>>> e49e5324b24ba4d75c38d2ad901551992bb7aee9
