-- 회원 관리 테이블

create table mvc_user (
	
	user_id char(100) primary key, 
	user_pw char(100) not null, 
	user_name char(120) not null, 
	user_reg_date timestamp default now() 
	
);

alter table mvc_user add column session_id char(50) not null default 'none';
alter table mvc_user add column session_limit timestamp;