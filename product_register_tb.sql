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
    
