insert into writer_tb
select
	0,
	writer
from
	books_tb
group by
	writer
order by
	writer;

select
	*
from
	writer_tb;

insert into publisher_tb(publisher_name)
select
	publisher
from
	books_tb
group by
	publisher
order by
	publisher;
    
select
	*
from
	publisher_tb;


# insert into book_tb
select
	0,
    bst.sign,
    wt.writer_id,
    pt.publisher_id
from
	books_tb bst
    left outer join writer_tb wt on (wt.writer_name = bst.writer)
    left outer join publisher_tb pt on (pt.publisher_name = bst.publisher)
group by
    bst.sign,
    wt.writer_id,
    pt.publisher_id
    # 위 세개 조건이 모두 일치하면 그룹화 (각각마다 그룹하는 것이 X)
order by
	sign,
    writer_id,
    publisher_id;
    # (1) sign 순으로 정렬
    # (2) sign이 같을 경우, writer id 정렬
    # (3) writher id까지 같을 경우, publisher_id 정렬
    
select
	*
from
	book_tb;

insert into book_register_tb
select
	0,
    bst.booknumber,
    bt2.book_id,
    bst.numberloans
from
	books_tb bst
    left outer join (select
						bt.book_id,
                        bt.book_name,
                        wt.writer_name,
                        pt.publisher_name
					from
						book_tb bt
						left outer join writer_tb wt on(wt.writer_id = bt.writer_id)
                        left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)) bt2
	on (bt2.book_name = bst.sign and bt2.writer_name = bst.writer and bt2.publisher_name = bst.publisher);
    
    select
		*
	from
    book_register_tb;
    
	select
		*
	from
		(select
			rank() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as rank_num,
			row_number() over(partition by bt.publisher_id order by bt.publisher_id, sum(brt.loans_count) desc) as row_num,
			# brt.book_register_id,
			# brt.book_code,
			brt.book_id,
			bt.book_name,
			bt.writer_id,
			wt.writer_name,
			bt.publisher_id,
			pt.publisher_name,
			sum(brt.loans_count) as total_loans_count
		from
			book_register_tb brt
			left outer join book_tb bt on (bt.book_id = brt.book_id)
			left outer join writer_tb wt on (wt.writer_id = bt.writer_id)
			left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
		group by
		brt.book_id,
		bt.book_id,
		bt.publisher_id) as temp_book_register_tb
where
	temp_book_register_tb.row_num = 1;