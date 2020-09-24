create table store_tbl (
	store_name varchar2(100) primary key,
	latitude varchar2(30) not null,
	longitude varchar2(30) not null,
	store_address1 varchar2(300) not null,
	store_address2 varchar2(300) not null
);

drop table product_tbl;

create table product_tbl (
	product_id varchar2(10) primary key,
	store_name varchar2(100) not null,
	product_name varchar2(100) not null,
	product_origin varchar2(30),
	product_price number(10,2) default 0,
	product_quantity number(10) default 0,
	product_quantity_unit varchar2(10)
);	


create sequence product_seq
increment by 1
start with 1
maxvalue 9999;