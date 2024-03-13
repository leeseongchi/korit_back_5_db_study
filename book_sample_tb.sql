SELECT * FROM library_db.book_sample_tb;

select
	도서명,
	저자명,
    출판사,
    형식,
    count(*) as count
from
	book_sample_tb
group by
	도서명,
    저자명,
    출판사,
    형식
having
	count > 1;