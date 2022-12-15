use student_management;

create table class(
 class_id int ,
 class_name varchar(50)
);

select * from class;

SELECT * FROM student_management.teacher;

create table teacher(
teacher_id int,
teacher_name varchar(50) null,
teacher_age int not null,
teacher_country varchar(50));

insert into teacher(teacher_id,teacher_name,teacher_age,teacher_country)
 values(1,"Lê Xuân Vũ",26,"Việt Nam");
 
 insert into teacher(teacher_id,teacher_name,teacher_age,teacher_country)
 values (2,"Lê Xuân Hòa",27,"Việt Nam");

select * from student_management.teacher;

drop table teacher;

 truncate table teacher;
 
 alter table teacher
 modify column teacher_name varchar(50) primary key; 
 
 alter table teacher
 drop primary key;
 
delete from  teacher where teacher_id=1;


 