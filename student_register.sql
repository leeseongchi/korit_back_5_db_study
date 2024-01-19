create view student_register_view as
select
	srt.student_register_id as student_id,
    st.name,
    st.age,
    srt.student_state_id,
    at1.address1_state as state,
    srt.student_city_id,
    at2.address2_city as city

from
	student_register_tb srt
		left outer join student_tb st on (st.student_id = srt.student_register_id)
		left outer join address1_tb at1 on (at1.address1_id = srt.student_state_id)
        left outer join address2_tb at2 on (at2.address2_id = srt.student_city_id);
        
select
	*
from
	student_register_view
