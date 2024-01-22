SELECT * FROM db_study.book_tb;

select
	서명,
    count(서명) over(partition by 서명),
	저자,
    count(저자) over(partition by 저자),
	발행자,
    count(발행자) over(partition by 발행자)
from
	db_study.book_tb;