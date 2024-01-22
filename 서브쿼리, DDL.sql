select
	*
from
	(select
		row_number() over(order by author_id desc) as num,
		author_id,
        author_name
	 from
		author_tb
	 where
		author_name like '글%') at
where
	at.num > 10;
 
 
select # 서브쿼리는 컬럼에 쓰는순간 속도가 현저히 떨어진다.
   *,
   (select
		count(*)
	from
		publisher_tb) as total_count
from
	publisher_tb;
    
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count from publisher_tb) pt2 on (1 = 1);
    
select
	*
from
	book_tb
where
	publisher_id in (select
						publisher_id
					 from
						publisher_tb
					 where
						publisher_name like '아%');
                        
select
	*
from
	book_tb bt
    left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
where
	pt.publisher_name like '아%';

# 출력속도를 확인하기 위해 쓰는 명령어이다.    
select @@profiling;
show profiles;
set profiling = 1;

