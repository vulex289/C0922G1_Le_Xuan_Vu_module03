create database sell_management;
use sell_management;

 create table customer(
 cID int primary key,
 cName varchar(25),
 cAge tinyint
);

create table `order`(
oID int primary key,
cID int,
oDate date,
oTotalPrice int,
foreign key(cID) references customer(cID)
);

create table product(
pID int primary key,
pName varchar(25),
pPrice int
);

create table order_detail(
oID int,
pID int,
odQTY int,
primary key(oID,pID),
foreign key (pID) references product(pID),
foreign key (oID) references `order`(oID)
);

insert into customer
values( 1, "Minh Quan", 10),
	  ( 2, "Ngoc Oanh", 20),
	  ( 3, "Hong Ha", 50);

insert into `order`(oID, cID, oDate, oTotalPrice)
values( 1, 1, "2006-3-21", null),
	  ( 2, 2, "2006-3-23", null),
	  ( 3, 1, "2006-3-16", null);
      
insert into product(pID, pName, pPrice)
values(1, "May Giat", 3),
	  (2, "Tu Lanh", 5),	
	  (3, "Dieu Hoa", 7),	
	  (4, "Quat", 1),	
	  (5, "Bep Dien", 2);	
	  	
insert into order_detail
values(1, 1, 3),
      (1, 3, 7),
      (1, 4, 2),
      (2, 1, 1),
      (3, 1, 8),
      (2, 5, 4),
      (2, 3, 3);
      
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
 select `order`.oID, `order`.oDate, `order`.oTotalPrice from `order`;     
 
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
 select `order`.oID, customer.cID, customer.cName, product.pID, product.pName, product.pPrice
 from order_detail
 inner join `order` on order_detail.oID = `order`.oID
 inner join product on product.pID = order_detail.pID
 inner join customer on `order`.cID = customer.cID
 where customer.cID in (select `order`.cID from `order`)
 order by oID 
 ;     
 
 select * from customer;
 
-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select c.cName from customer c where cID  not in (select `order`.cID from `order`);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select `order`.oID, `order`.oDate, sum(order_detail.odQTY * product.pPrice) as order_total_price
from order_detail
join `order` on order_detail.oID = `order`.oID
join product on product.pID = order_detail.pID
join customer on customer.cID = `order`.cID
group by oID;







         