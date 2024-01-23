select
	bt.book_id,
	bt.book_name,
    bt.writer_id,
    wt.writer_name,
    bt.publisher_id,
    pt.publisher_name
from
	book_tb bt
    left outer join writer_tb wt on (wt.writer_id = bt.writer_id)
    left outer join publisher_tb pt on (pt.publisher_id = bt.publisher_id)
where
	book_name like '%%'