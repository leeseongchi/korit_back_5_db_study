<<<<<<< HEAD
select
	*
from
	product_register_tb prt
		left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)
        left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id);
# 칼럼 항목에는 알리아스(as) 생략함 

create view product_register_view as
select
	prt.product_register_id,
    prt.product_id,
    pt.product_name,
    prt.product_size_id,
    pst.product_size_name,
    prt.product_color_id,
    pct.product_color_name,
    pt.product_price
from
	product_register_tb prt
		left outer join product_tb pt on(pt.product_id = prt.product_id)
		left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
        left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id);
# 칼럼 항목에는 알리아스(as) 생략함 


select
	prt.product_color_id,
    pct.product_color_name,
    count(*)
from
	product_register_tb prt
        left outer join product_color_tb pct on(pct.product_color_id = prt.product_color_id)
group by
	pct.product_color_id,
	pct.product_color_name;

    
select
    prt.product_size_id,
    pst.product_size_name,
    count(*)
from
	product_register_tb prt
		left outer join product_size_tb pst on(pst.product_size_id = prt.product_size_id)
group by
	pt.product_size_id,
    pst.product_size_name
order by
	prt.product_size_id;

select
	product_size_id,
    product_size_name,
    count(product_size_id) as product_size_count
from
	product_register_view
group by
	product_size_id,
    product_size_name
order by
	prt.product_size_id;
    
select
	*
from
	product_register_view
where
	product_size_id > 3;


select
	*
from
	product_register_view
where
	product_size_name like '%L%';
=======
SELECT * FROM db_study.product_register_tb;

delete
from
	product_register_tb
where
	product_color_id in (select					# 서브쿼리
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');
                            
select
	*
from
	product_register_view;
    
>>>>>>> e49e5324b24ba4d75c38d2ad901551992bb7aee9
