set @book_name = '송사무장의 실전경매3';
set @author_name = '송희창3';
set @publisher_name = '지혜로3';
set @insert_book_status = 0;

call p_insert_book(@book_name, @author_name, @publisher_name, @insert_book_status);

select
	*
from
	book_tb
order by
	book_id desc;
    
select @insert_book_status;