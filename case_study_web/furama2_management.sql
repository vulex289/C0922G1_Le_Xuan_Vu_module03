create database furama2_management;

use furama2_management;

create table customer_type(
id int primary key not null,
`name` varchar(45)
);

create table customer(
id int primary key not null,
`name` varchar(45),
date_of_birth date,
gender bit(1),
id_card varchar(45),
phone_number varchar(45),
email varchar(45),
address varchar(45),
customer_type_id int,
foreign key(customer_type_id) references customer_type(id) on delete set null
);

create table facility_type(
id int primary key,
`name` varchar(45)
);

create table rent_type(
id int primary key,
`name` varchar(45)
);

create table facility(
id int primary key,
`name` varchar(45),
area int,
cost double,
max_people int,
rent_type_id int,
facility_type_id int,
standard_room varchar(45),
description_other_convenience varchar(45),
pool_area double,
number_of_floors int,
facility_free text,
foreign key(rent_type_id) references rent_type(id) on delete set null,
foreign key(facility_type_id) references facility_type(id) on delete set null
);

create table positon(
id int primary key,
`name` varchar(45)
);

create table education_degree(
id int primary key,
`name` varchar(45)
);

create table division(
id int primary key,
`name` varchar(45)
);

create table employee(
id int primary key,
`name` varchar(45),
date_of_birth date,
id_card varchar(45),
salary double,
phone_number varchar(45),
email varchar(45),
address varchar(45),
position_id int,
education_degree_id int,
division_id int,
foreign key(position_id) references positon(id) on delete set null,
foreign key(education_degree_id) references education_degree(id) on delete set null,
foreign key(division_id) references division(id) on delete set null
);

create table attach_facility(
id int primary key,
`name` varchar(45),
cost double,
unit varchar(10),
`status` varchar(45)
);

create table contract(
id int primary key,
start_date datetime,
end_date datetime,
deposit double,
employee_id int,
customer_id int,
facility_id int,
foreign key(employee_id) references employee(id) on delete set null,
foreign key(customer_id) references customer(id) on delete set null,
foreign key(facility_id) references facility(id) on delete set null
);

create table contract_detail(
id int primary key,
contract_id int,
attach_facility_id int,
quantily int,
foreign key(contract_id) references contract(id) on delete set null,
foreign key(attach_facility) references attach_facility(id) on delete set null
);


 
