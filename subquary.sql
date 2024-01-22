select
	*
from
	(select
		row_number() over(order by writer_id desc) as num,
		writer_id,
        writer_name
	from
		writer_tb
	where
		writer_name like '글%') at
	where
		num > 10;

# publisher 갯수 합계를 칼럼으로 출력하기 
# 1
select
	*,
    (select
		count(*)
	from
		publisher_tb) as count_pb
from
    publisher_tb;

# 2
select
	*
from
	publisher_tb pt
    left outer join (select count(*) as total_count from publisher_tb) pt2 on (1=1);

select
	*,
    count(*)
from
	publisher_tb
group by
	publisher_name;

select @@profiling;
show profiles;
set profiling = 1;
