-- 전체 점포 상품 현황 조회 --
select s.store_name,s.latitude,s.longitude,
	s.store_address1,s.store_address2,
	p.product_id,p.product_name,p.product_origin,
	p.product_price,p.product_quantity,p.product_quantity_unit
from store_tbl s, product_tbl p
where s.store_name = p.store_name
order by s.store_name;

-- 전체 점포 현황 조회 --
select * from store_tbl;

-- 전체 상품 조회 --
select * from product_tbl;

-- 특정 점포 상품 현황 조회 --
select s.store_name,s.latitude,s.longitude,
	s.store_address1,s.store_address2,
	p.product_id,p.product_name,p.product_origin,
	p.product_price,p.product_quantity,p.product_quantity_unit
from store_tbl s, product_tbl p
where s.store_name = p.store_name
and s.store_name = '늘푸른마트'
order by s.store_name;

select * from product_tbl
where store_name = '늘푸른마트';
