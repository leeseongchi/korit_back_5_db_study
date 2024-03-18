update product_color_tb
set product_color_name = 'Green'
where
	product_color_name = 'Navy';

# 수기 작성    
update product_color_tb
set product_color_name_kor = '블랙'
where
	product_color_name = 'Black';

update product_color_tb
set product_color_name_kor = '화이트'
where
	product_color_name = 'White';
    
update product_color_tb
set product_color_name_kor = '그린'
where
	product_color_name = 'Green';

# case when then else end 를 써서 작성    
update product_color_tb
set 
	product_color_name_kor = case 
		when product_color_name = 'Black' then '블랙' 
		when product_color_name = 'White' then '화이트' 
		when product_color_name = 'Green' then '그린' 
	end;  
    
    # case가 if문을 열고 end가 if문을 닫는 형식이다.
    # when then은 else if 형식이다.