select * from product_tb;

select
	product_color,
	count(*) as product_color_count
from
	product_tb
group by
	product_color
order by
	count(*) desc;
    

select
	product_size,
	count(*) product_size_count
from
	product_tb
group by
	product_size
order by
	count(*) desc;

    
truncate table product_tb