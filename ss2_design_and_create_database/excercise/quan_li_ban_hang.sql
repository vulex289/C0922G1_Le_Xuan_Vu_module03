create database  if not exists quan_ly_ban_hang;

use quan_ly_ban_hang;
 create table customer(
 cID varchar(50) primary key,
 cName varchar(50),
 cAge int
);

create table `order`(
oID int primary key,
cID varchar(50),
oDate date,
oTotalPrice double,
foreign key(cID) references customer(cID)
);

create table product(
pID varchar(50) primary key,
pName varchar(50),
pPrice double);

create table oder_detail(
oID int,
pID varchar(50),
odQTY varchar(50),
primary key(oID,pID),
foreign key (pID) references product(pID),
foreign key (oID) references `order`(oID)
);
