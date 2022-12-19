create database QuanLySinhVien;
use QuanLySinhVien;
create table class
(
    class_id int not null auto_increment primary key,
    class_name varchar(60) not null,
    start_date date not null,
    `status` bit
);

create table student
(
    student_id int not null auto_increment primary key,
    student_name varchar(30) not null,
    address varchar(50),
    phone varchar(20),
    `status` int default 1,
    class_id int not null,
    foreign key (class_id) references class(class_id)
);

create table `subject`
(
    sub_id int not null auto_increment primary key,
    sub_name varchar(30) not null,
    credit  int not null default 1 check ( credit >= 1 ),
    `status` int default 1
);

create table mark
(
    mark_id int not null auto_increment primary key,
    sub_id int not null,
    student_id int not null,
    mark float default 0 check ( mark between 0 and 100),
    examtimes tinyint default 1,
    unique (sub_id, student_id),
    foreign key (sub_id) references `subject` (sub_id),
    foreign key (student_id) references student (student_id)
);

insert into `class`
values (1, 'A1', '2008-12-20', 1);
insert into `class`
values (2, 'A2', '2008-12-22', 1);
insert into `class` 
values (3, 'B3', current_date, 0);

insert into student (student_name, address, phone, `status`, class_id)
values ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into student (student_name, address, phone, `status`, class_id)
values ('Hoa', 'Hai phong','0123456789', 2, 1);
insert into student (student_name, address, phone, `status`, class_id)
values ('Manh', 'HCM', '0123123123', 0, 2);

insert into `subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
       
insert into mark (sub_id, student_id, mark, examtimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
select * from student;     

select * from class;  

select * from `subject`;

select * from mark;
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from student where student_name like 'h%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class where start_date like '%-12-%';

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select `subject`.sub_name from `subject` where credit between 3 and 5;

-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates = 0;
update student
set class_id = 2
where student_name = 'hung'; 
 
 -- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select student.student_name, `subject`.sub_name, mark 
from (mark inner join student on student.student_id = mark.student_id)
 inner join `subject` on mark.sub_id = `subject`.sub_id
 order by mark desc
 ;