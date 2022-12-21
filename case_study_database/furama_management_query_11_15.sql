use furama_management;
-- 11.  Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng
--      bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select 
  kh.ho_ten, 
  kh.dia_chi, 
  ten_dich_vu_di_kem, 
  lk.ten_loai_khach, 
  dvdk.ma_dich_vu_di_kem 
from 
  khach_hang kh 
  join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach 
  join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang 
  join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
where 
  kh.dia_chi like "%Vinh" 
  or kh.dia_chi like "%Quảng Ngãi" 
  and lk.ten_loai_khach = "Diamond";
-- 12.  Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu,
--  so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ 
-- đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
  hd.ma_hop_dong, 
  nv.ho_ten as ho_ten_nhan_viên, 
  kh.ho_ten as ho_ten_khach_hang, 
  kh.so_dien_thoai, 
  dv.ten_dich_vu, 
  hd.ten_dat_coc, 
  hd.ngay_lam_hop_dong, 
  ifnull((hdct.so_luong),0) as tong_so_luong_dvdk 
from 
  hop_dong hd 
  left join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien 
  left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
  left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
where 
  hd.ten_dat_coc not in(
    select 
      hd.ten_dat_coc 
    from 
      hop_dong hd 
    where 
      year(hd.ngay_lam_hop_dong) = 2021 
      and quarter(hd.ngay_lam_hop_dong)= 1 
      and quarter(hd.ngay_lam_hop_dong)= 2
  ) 
  and year(hd.ngay_lam_hop_dong) = 2020 
  and quarter(hd.ngay_lam_hop_dong)= 4 
group by 
  hdct.ma_hop_dong;
-- 13.  Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
--      (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
-- Tắt chế độ của mySQL
SET 
  sql_mode =(
    SELECT 
      REPLACE(
        @@sql_mode,'ONLY_FULL_GROUP_BY', 
        ''));
-- Mở chế độ của mySQL như cũ
SET 
  sql_mode =(
    SELECT 
      CONCAT(
        @@sql_mode, ',ONLY_FULL_GROUP_BY'
      )
  );
select 
  dvdk.ma_dich_vu_di_kem, 
  dvdk.ten_dich_vu_di_kem, 
  dvdk.gia, 
  dvdk.don_vi, 
  dvdk.trang_thai, 
  sum(hdct.so_luong) as so_luong_dv 
from 
  hop_dong hd 
  join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
  join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
group by 
  dvdk.ma_dich_vu_di_kem, 
  dvdk.ten_dich_vu_di_kem, 
  dvdk.gia, 
  dvdk.don_vi, 
  dvdk.trang_thai 
having 
  so_luong_dv = (
    select 
      sum(hdct.so_luong) 
    from 
      hop_dong_chi_tiet hdct 
    group by 
      hdct.ma_dich_vu_di_kem 
    order by 
      sum(hdct.so_luong) desc 
    limit 
      1
  );
select 
  dvdk.ma_dich_vu_di_kem, 
  sum(hdct.so_luong) as so_luong_dich_vu_nhieu_nhat, 
  hdct.so_luong 
from 
  dich_vu_di_kem dvdk 
  join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by 
  hdct.ma_dich_vu_di_kem 
having 
  so_luong_dich_vu_nhieu_nhat = (
    select 
      sum(hdct.so_luong) 
    from 
      hop_dong_chi_tiet hdct 
    group by 
      hdct.ma_dich_vu_di_kem 
    order by 
      hdct.ma_dich_vu_di_kem desc 
    limit 
      1
  );
-- 14. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
--     Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung
--     (được tính dựa trên việc count các ma_dich_vu_di_kem).
select 
  hd.ma_hop_dong, 
  ldv.ten_loai_dich_vu, 
  dvdk.ten_dich_vu_di_kem, 
  count(hdct.ma_dich_vu_di_kem) dich_vu_su_dung_1_lan 
from 
  hop_dong_chi_tiet hdct 
  join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong 
  join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
  join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu 
  join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu 
group by 
  hdct.ma_dich_vu_di_kem 
having 
  dich_vu_su_dung_1_lan = 1 
order by 
  hd.ma_hop_dong asc;
-- 15.  Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
--      mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
  nv.ma_nhan_vien, 
  nv.ho_ten, 
  td.ten_trinh_do, 
  bp.ten_bo_phan, 
  nv.dia_chi 
from 
  nhan_vien nv 
  join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien 
  join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do 
  join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan 
group by 
  nv.ma_nhan_vien 
having 
  count(nv.ma_nhan_vien) <= 3;
