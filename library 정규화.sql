insert into category_tb
select
	0,
	카테고리,
    now(),
    now()
from
	book_sample_tb
group by
	카테고리;
    
insert into book_type_tb(book_type_name, create_date, update_date)
select
	형식,
    now(),
    now()
from
	book_sample_tb
group by
	형식;