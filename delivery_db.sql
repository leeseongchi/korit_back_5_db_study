

create database `delivery_db`;
use `delivery_db`;
CREATE TABLE `delivery_db`.`delivery_tb` (
  `delivery_id` INT NOT NULL,
  `delivery_company` VARCHAR(20) NULL,
  `delivery_man` VARCHAR(15) NULL,
  `delivery_address` VARCHAR(100) NULL,
  `delivery_name` VARCHAR(15) NULL,
  `consignee_phone` VARCHAR(14) NULL,
  `consignee_message` TEXT NULL,
  PRIMARY KEY (`delivery_id`));
  
  insert into delivery_tb
	(delivery_id, delivery_company, delivery_man, 
    delivery_address, delivery_name, consignee_phone, consignee_message)
  values(1, "대한통운", "김준일", "부산광역시 연제구 중앙대로 1001 부산광역시청" , "김춘식"
		, 010-8282-5353, "안전하게 배송해주세요");
        

select
	*
from
	delivery_db;

use `delivery_db`;
    
select
	*
from
	delivery_tb;
    
desc delivery_tb;


CREATE TABLE `delivery_db`.`student_tb` (
  `student_id` INT NOT NULL AUTO_INCREMENT,
  `student_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`student_id`));
  
  CREATE TABLE `delivery_db`.`subject_tb` (
  `subject_id` INT NOT NULL AUTO_INCREMENT,
  `subject_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`subject_id`));
  
  CREATE TABLE `delivery_db`.`record_tb` (
  `record_id` INT NOT NULL AUTO_INCREMENT,
  `student_id` INT NOT NULL,
  `subject_id` INT NOT NULL,
  `record_score` INT NOT NULL,
  PRIMARY KEY (`순번`));
  
insert into student_tb
	(student_id, student_name)
values (0, "김춘식"),
	(0, "손흥민");
    
insert into subject_tb
		(subject_id, subject_name)
values (0, "컴퓨터 구조"),
		(0, "데이터베이스"),
        (0, "인공지능");
        
insert into record_tb
		(record_id, student_id, subject_id, record_score)
values (0, 1, 1, 95),
		(0, 2, 1, 84),
        (0, 1, 2, 89),
        (0, 2, 2, 92),
        (0, 1, 3, 100),
        (0, 2, 3, 88);
        
select
	rt.record_id as 순번,
    rt.student_id as 학번,
    st.student_name as 이름,
    rt.subject_id as 과목번호,
    jt.subject_name as 과목이름,
    rt.record_score as 점수
from
	record_tb rt
    left outer join student_tb st on(st.student_id = rt.student_id)
    left outer join subject_tb jt on(jt.subject_id = rt.subject_id);
    
CREATE TABLE `delivery_db`.`candy_tb` (
  `candy_id` INT NOT NULL AUTO_INCREMENT,
  `candy_name` VARCHAR(45) NOT NULL,
  `candy_count` INT NOT NULL,
  PRIMARY KEY (`candy_id`));
  
insert into candy_tb
		(candy_id, candy_name, candy_count)
values (0, "딸기사탕", 50),
		(0, "누룽지사탕", 100);

start transaction;
insert into candy_tb
values(0, "오렌지사탕", 20);
savepoint aa;
update candy_tb set candy_count = 200
where
	candy_count = 100;
rollback to aa;
update candy_tb set candy_count = 200
where
	candy_count = 20;
commit;


CREATE TABLE `delivery_db`.`user_tb` (
  `user_id` INT NOT NULL,
  `username` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  `name` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`));

create view user_view as
select
	user_id,
    user_name,
    password,
    name,
    email
from
	user_tb
where
	user_id between 1 and 200;

select
	username
from
	user_view
where
	username like 'a%';

create index idx_student_number
	on student (student_number);
create unique index idx_student_name
	on student (student_name); 
analyze table student;
show index from student;

show full tables in student_db
where student_type like 'view';



CREATE TABLE sales_tb ( 
    customer VARCHAR(255), 
    amount INT
);

INSERT INTO sales_tb (customer, amount)
VALUES 
    ('John', 100), 
    ('Jane', 200), 
    ('John', 150), 
    ('Jane', 50), 
    ('Jim', 300);

ALTER TABLE sales_tb CHANGE amount total_sales INT;
update sales_tb set total_sales = 250
where
	total_sales = 200; 
update sales_tb set total_sales = 250
where
	total_sales = 100; 
delete from sales_tb
where total_sales = 150;
delete from sales_tb
where total_sales = 50;

