SELECT * FROM db_study.temp_book_tb;

# select한 값을 insert 하겠다.
insert into author_tb
select
	0,
	author
from
	temp_book_tb
group by
	author
order by
	author;
    
select
	*
from
	author_tb;
    
insert into publisher_tb(publisher_name)
select
	publisher
from
	temp_book_tb
group by
	publisher
order by
	publisher;
    
select
	*
from
	publisher_tb;
    
insert into book_tb
select
	0,
    tbt.book_name,
    at.author_id,
    pt.publisher_id
from
	temp_book_tb tbt
    left outer join author_tb at on(at.author_name = tbt.author)
    left outer join publisher_tb pt on(pt.publisher_name = tbt.publisher)
group by
	tbt.book_name,
    at.author_id,
    pt.publisher_id
order by
	book_name;

    
insert into book_register_tb
select
	0,
	tbt.book_code,
	bt2.book_id,
    tbt.loans_count
from
	temp_book_tb tbt
    left outer join (select
						bt.book_id,
						bt.book_name,
                        at.author_name,
                        pt.publisher_name
					 from
						book_tb bt
						left outer join author_tb at on(at.author_id = bt.author_id)
						left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)) bt2
	on(bt2.book_name = tbt.book_name and bt2.author_name = tbt.author and bt2.publisher_name = tbt.publisher);
    
select
	*
from
	(select # partition by - select를 할 때 그룹을 묶는 것이다.
		rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num, 
		row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num, 
		brt.book_id,
		bt.book_name,
		bt.author_id,
		at.author_name,
		bt.publisher_id,
		pt.publisher_name,
		sum(brt.loans_count) as total_loans_count
	from
		book_register_tb brt
		left outer join book_tb bt on(bt.book_id = brt.book_id)
		left outer join author_tb at on(at.author_id = bt.author_id)
		left outer join publisher_tb pt on(pt.publisher_id = bt.publisher_id)
	group by
		brt.book_id,
		bt.author_id,
		bt.publisher_id) temp_book_register_tb
where
	temp_book_register_tb.row_num = 1;
## select, where, on, having 에 쓰이는 서브쿼리는 하나의 컬럼이다.
	