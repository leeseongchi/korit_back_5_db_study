SELECT * FROM db_study.product_color_tb;

select
	product_color_name,
	count(*) as count
from
	product_color_tb
group by
	product_color_name;