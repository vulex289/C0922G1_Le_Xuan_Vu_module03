use quanlysinhvien;

select * from student;
select * from class;
select * from mark;
select * from subject;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select * from subject su 
where su.credit = (select max(su.credit) from subject su) 
group by su.sub_id;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select * from subject su
  join mark m on su.sub_id = m.sub_id
  where mark = (select max(m.mark) from mark m);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
select st.*, avg(m.mark) as avg_st 
from student st
 join mark m on st.student_id = m.student_id 
 group by student_id 
 order by avg_st desc;