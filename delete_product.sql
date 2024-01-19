SELECT * FROM db_study.product_register_tb;
# !!!딜리트 조심!!! (가능한 키 값으로 삭제)
delete
from
	product_register_tb
where
	product_color_id = (select
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');
                            # 서브쿼리 형식


delete
from
	product_register_tb
where				# = 대신 in 사용 시 결과값으로 출력되는 데이터 모두 삭제 가능
	product_color_id in	(select
							product_color_id
						from
							product_color_tb
						where
							product_color_name = 'Black');
                            # 서브쿼리 형식

select
	*
from
	product_register_view;