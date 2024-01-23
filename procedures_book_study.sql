set @book_name = '혼자 공부하는 SQL';
set @writer = '우재남';
set @publisher = '한빛미디어';
set @new_writer_id = 0;
set @new_publisher_id = 0;

insert into writer_tb
values (0, @writer);

select
	MAX(writer_id) into @new_writer_id
from 
	writer_tb;

insert into publisher_tb
values (0, @publisher);

select
	MAX(publisher_id) into @new_publisher_id
from 
	publisher_tb;

insert into book_tb
values (0, @book_name, @new_writer_id, @new_publisher_id);




