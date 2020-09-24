CREATE TABLE food_tbl(
	food_id number(3) PRIMARY KEY,
	food_cate varchar2(20) NOT NULL,
	food_name varchar2(100) NOT NULL UNIQUE,
	food_detail varchar2(2000) NOT NULL,
	food_img varchar2(300) NOT NULL,
	url varchar2(500)
);

drop table food_tbl;

CREATE SEQUENCE food_seq
INCREMENT BY 1
START WITH 1
MAXVALUE 9999
NOCACHE
NOCYCLE;
