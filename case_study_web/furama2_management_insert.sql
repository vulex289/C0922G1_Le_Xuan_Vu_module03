insert into customer_type(id,`name`) values
(1, "Diamond"),
(2, "Platinium"),
(3, "Gold"),
(4, "Silver"),
(5, "Member");

insert into customer(id,`name`,date_of_birth,gender,id_card,phone_number,email,address,customer_type_id)
  values(1, 'Nguyễn Thị Hào', '1970-11-07', 0, '643431213', '0945423362', 'thihao07@gmail.com', '23 Nguyễn Hoàng, Đà Nẵng', 5),
        (2, 'Phạm Xuân Diệu', '1992-08-08', 1, '865342123', '0954333333', 'xuandieu92@gmail.com', 'K77/22 Thái Phiên, Quảng Trị', 3),
        (3, 'Trương Đình Nghệ', '1990-02-27', 1, '488645199', '0373213122', 'nghenhan2702@gmail.com', 'K323/12 Ông Ích Khiêm, Vinh', 1)
        ;
select * from customer_type;
select c.name,ct.`name` from customer c join customer_type ct on c.id = ct.id
where ct.`name` like "%Gold";