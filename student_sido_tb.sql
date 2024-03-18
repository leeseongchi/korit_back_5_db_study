SELECT * FROM db_study.student_sido_tb;

insert into student_sido_tb
values
	(0, '부산시'),
    (0, '양산시');
    
insert into student_sigungu_tb
values
	(0, '부산진구'),
    (0, '서구'),
    (0, '금정구'),
    (0, '남구'),
    (0, '동래구'),
    (0, '물금읍');
    
insert into student_address_tb
values
	(0, 1, 3),
	(0, 1, 1),
	(0, 1, 3),
	(0, 1, 4),
	(0, 1, 2),
	(0, 1, 1),
	(0, 1, 5),
	(0, 2, 6),
	(0, 1, 1),
	(0, 1, 4);
    
select
	*
from student_tb st
	left outer join student_sido_tb sdt on(sdt.student_sido_id = st.student_id)
	left outer join student_sigungu_tb sgt on(sgt.student_sigungu_id = st.student_id);