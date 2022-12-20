create database View_Index_Store_Procedure;

use View_Index_Store_Procedure;

create table Product(
id int auto_increment primary key,
productCode int,
productName varchar(50),
productPrice double,
productAmount int,
productDescription varchar(50),
productStatus bit);

insert into Product(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values(055,'iphone1',500,3,'used',0),
      (088,'iphone2',700,5,'used',1),
      (012,'iphone3',800,2,'used',1),
      (018,'iphone4',900,6,'used',1),
      (018,'iphone5',1000,7,'used',1),
      (018,'iphone6',1200,2,'used',0);
      
select * from Product;

insert into product(productCode,productName,productPrice,productAmount,productDescription,productStatus)
values(18,'iphone7',1300,4,'new',1);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create index i_Products on Product(productCode); 
 
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)    
create index i_Products_composite on Product(productName,productPrice);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from Product pr
 where pr.productCode = 018;

explain select * from Product pr
 where pr.productName = 'iphone6'
 and pr.productPrice = 1200;
 
-- tạo view
create view w_product as 
select pr.productCode,
       pr.productName,
       pr.productPrice,
       pr.productStatus
from product pr;

-- Hiển thị view vừa tạo
select * from w_product;

-- Sửa đổi view
SET SQL_SAFE_UPDATES = 0;
update w_product 
set productStatus = 1;

-- Sửa đổi product
update product 
set productStatus = 0
where productName = 'iphone6';

-- Xóa view
drop view w_product;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all_product()
begin
select pr.* from product pr;
end //
delimiter ;
call get_all_product;

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure insert_into_product
(p_id int,p_productCode int,p_productName varchar(50),p_productPrice double
,p_productAmount int,p_productDescription varchar(50),p_productStatus bit)
begin
insert into product
values(p_id,p_productCode,p_productName,p_productPrice,p_productAmount ,p_productDescription ,p_productStatus);
end //
delimiter ;
call insert_into_product(10,99,'iphone8',1300,4,'new',1);

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure update_product(p_id int)
begin
update product set productStatus = 0 where id=p_id;
end //
delimiter ;
call update_product(1);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(in p_delete_id int)
begin
delete from product  where product.id = p_delete_id;
end //
delimiter ;
call delete_product(8);
-- xóa 1 Store procedure
drop procedure insert_into_product;
