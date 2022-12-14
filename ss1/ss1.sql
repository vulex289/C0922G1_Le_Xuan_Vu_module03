SELECT * FROM student_management.teacher;

create table teacher(
teacher_id int primary key ,
teacher_name varchar(50) null,
teacher_age int,
teacher_country varchar(50));

insert into teacher(teacher_id,teacher_name,teacher_age,teacher_country)
 values(1,"Lê Xuân Vũ",26,"Việt Nam");
 
 insert into teacher(teacher_id,teacher_name,teacher_age,teacher_country)
 values (1,"Nguyễn Phương Hòa",57,"Việt Nam");

select * from student_management.teacher;

 truncate table teacher;
 alter table teacher
 modify column teacher_age 
