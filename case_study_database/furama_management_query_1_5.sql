use furama_management;

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select * from nhan_vien 
where char_length(nhan_vien.ho_ten) <= 15
and nhan_vien.ho_ten regexp "^T|^H|^K{2,}";

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. 
select * from khach_hang kh having timestampdiff(year,kh.ngay_sinh,current_date()) between 18 and 50
 and kh.dia_chi like ("%Đà Nẵng") or kh.dia_chi like ("%Quảng Trị"); 

-- 4. Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
--    Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang,kh.ho_ten, count(hd.ma_khach_hang) as so_lan_thue from
 (khach_hang kh inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang)
 inner join loai_khach on kh.ma_loai_khach = loai_khach.ma_loai_khach where loai_khach.ten_loai_khach="Diamond"
 group by hd.ma_khach_hang order by so_lan_thue;
 
 -- 5. Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
 select kh.ma_khach_hang,
 kh.ho_ten,
 lk.ten_loai_khach,
 hd.ma_hop_dong,
 dv.ten_dich_vu,
 hd.ngay_lam_hop_dong,
 hd.ngay_ket_thuc,
 sum(ifnull(dv.chi_phi_thue,0)+ifnull(dvdk.gia,0) * ifnull(hdct.so_luong,0)) as tong_tien
 from khach_hang as kh
	left join hop_dong as hd on hd.ma_khach_hang = kh.ma_khach_hang
	left join dich_vu as dv on hd.ma_dich_vu=dv.ma_dich_vu
    left join hop_dong_chi_tiet as hdct on hdct.ma_hop_dong = hd.ma_hop_dong
    left join dich_vu_di_kem as dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    left join loai_khach as lk on lk.ma_loai_khach = kh.ma_loai_khach
    group by 
			kh.ma_khach_hang,
            hd.ma_hop_dong
    order by kh.ma_khach_hang;

					