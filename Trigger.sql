
# trigger 작동원리
# insert는 after
# delete는 before

insert into user_mst_tb
values (0, 'abc', '1234');

select
	*
from
	user_mst_tb;
    
select
	*
from
	user_dtl_tb;
    
delete
from
	user_mst_tb
where
	username = 'abc';