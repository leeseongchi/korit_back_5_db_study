select * from student_tb;

# *의 의미는 전체 칼럼
# from - 데이터를 조회할 테이블
# where - 조회할 데이터의 조건
# select - 조회할 데이터의 칼럼
# or, and, not
# in
# like


select 
	student_id,
    name
from 
	student_tb
where 
	not name = '김응애'
    and not name = '김응이';
    
select
	*
from
	student_tb
where
	name in ('김응애', '김응이');
    
select
	*
from
	student_tb
where
	student_id in (1, 2, 3);
    
    
truncate table student_tb;
    
select
	*
from
	student_tb;

 
select
	*
from
	student_tb
where
	age between 20 and 29;

select
	*
from
	student_tb
where
	age >= 30
    and age <= 39;

select
	*
from
	student_tb
where
	name like '%도%'
    or name like '%원';
    # 와일드카드 퍼센트(%) / 언더바(_)
    # 언더바는 자리수 체크

# 집계
select
	address,
	count(*) as address_count
    # as 별명 짓기
from
	student_tb
group by # group by 같은 것 끼리 묶기
	address
having # group by 이후 실행되는 조건문
	count(*) >= 2
order by # 정렬
	address_count desc,
    address desc;

# 구동 순서 from > where > group by > having > select > order by


select
	*
from
	student_tb
order by
	name