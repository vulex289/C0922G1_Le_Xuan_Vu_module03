create database class_managment;
create table class(
class_id int primary key,
class_name varchar(20));

create table student(
id int auto_increment primary key,
`name` varchar(20),
gender boolean,
birthday date,
email varchar(50),
point int,
username varchar(50),
class_id int,
foreign key(class_id) references class(class_id));

-- Hiển thị thông tin học viên
select * from student s
join class c on c.class_id=s.class_id;

select * from student s
left join class c on c.class_id=s.class_id;

insert into student(id,`name`,gender,birthday,email,point,username,class_id) values(13,'Nguyễn Hoàng',1,'1998-12-12','',5,'abc',1);

-- Tìm theo tên "Hai" và "Huynh"
select * from student where `name` like "%hai";
select * from student where `name` like "%huynh";
select * from student where `name` in ('nguyen minh hai','ta dinh huynh');
-- Tìm theo họ "Nguyen"
select * from student where `name` like "nguyen%" ;

-- Tìm học sinh có điểm lớn hơn 5
select * from student where point >5;

-- Hiển thị thông tin học viên lớp c1121g1 giảm dần
SELECT student.id, student.name, class.class_name
FROM student inner join class on student.class_id = class.class_id
WHERE class.class_name = 'c1121g1'
order by student.name desc;

-- thống kê số lượng học sinh có điểm lớn hơn 5
select student.point, count(point)
 from student
 where(point>5)
 group by student.point;
 
 -- thống kê số lượng học sinh và các điểm
select s.point, count(s.id)
 as count from student s
 where(point>0)
 group by s.point
 order by point desc;
 
 -- Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select s.point, count(point)
 as so_luong from student s
 where(point>5)
 group by s.point
 having so_luong>=2;
 