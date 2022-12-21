use furama_management;
-- 16.  Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
delete from 
  nhan_vien nv 
where 
  nv.ma_nhan_vien not in(
    select 
      hd.ma_nhan_vien 
    from 
      hop_dong hd 
    where 
      year(hd.ngay_lam_hop_dong) between 2019 
      and 2021 
    group by 
      ma_nhan_vien
  );
-- 17. Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--    chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- Tổng Tiền = Chi Phí Thuê + Số Lượng * Giá
-- ((ifnull(chi_phi_thue,0) + ifnull(hdct.so_luong,0) * ifnull(dvdk.gia,0))-ifnull(hd.ten_dat_coc,0)) tong_tien_thanh_toan     
update 
  khach_hang kh 
set 
  kh.ma_loai_khach = 1 
where 
  kh.ma_khach_hang =(
    select 
      xyz.ma_khach_hang 
    from 
      (
        select 
          abc.ho_ten, 
          abc.ma_hop_dong, 
          abc.ma_khach_hang, 
          sum(
            abc.chi_phi_thue + abc.tong_tien_dich_vu
          ) tong_tien 
        from 
          (
            select 
              kh.ho_ten, 
              hd.ma_hop_dong, 
              dv.chi_phi_thue, 
              kh.ma_khach_hang, 
              sum(
                ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0)
              ) tong_tien_dich_vu 
            from 
              hop_dong hd 
              left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu 
              left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong 
              left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
              left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang 
              left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach 
            where 
              year(hd.ngay_lam_hop_dong) = 2021 
              and lk.ten_loai_khach = 'Platinum' 
            group by 
              hd.ma_hop_dong
          ) abc 
        group by 
          abc.ma_khach_hang
      ) xyz
  );
-- having tong_tien_thanh_toan >=1000000);
SET 
  SQL_SAFE_UPDATES = 0;
-- 18.  Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
delete from 
  khach_hang kh 
where 
  kh.ma_khach_hang in (
    select 
      hd.ma_khach_hang 
    from 
      hop_dong hd 
    where 
      year(hd.ngay_lam_hop_dong)< 2021
  );
-- 19.  Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
update 
  dich_vu_di_kem dvdk 
set 
  dvdk.gia = dvdk.gia * 2 
where 
  dvdk.ma_dich_vu_di_kem in(
    select 
      abc.ma_dich_vu_di_kem 
    from 
      (
        select 
          dvdk.ma_dich_vu_di_kem, 
          sum(hdct.so_luong) so_lan_su_dung 
        from 
          dich_vu_di_kem dvdk 
          join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem 
          join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong 
        where 
          year(hd.ngay_lam_hop_dong) = 2020 
        group by 
          hdct.ma_dich_vu_di_kem 
        having 
          so_lan_su_dung > 10
      ) abc
  );
-- Tắt chế độ của mySQL
SET 
  sql_mode =(
    SELECT 
      REPLACE(
        @@sql_mode, 'ONLY_FULL_GROUP_BY', 
        ''
      )
  );
-- Mở chế độ của mySQL như cũ
SET 
  sql_mode =(
    SELECT 
      CONCAT(
        @@sql_mode, ',ONLY_FULL_GROUP_BY'
      )
  );
-- 20.Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.
select 
  nv.ma_nhan_vien, 
  nv.ho_ten, 
  nv.email, 
  nv.so_dien_thoai, 
  nv.ngay_sinh, 
  nv.dia_chi 
from 
  nhan_vien nv 
union all 
select 
  kh.ma_khach_hang, 
  kh.ho_ten, 
  kh.email, 
  kh.so_dien_thoai, 
  kh.ngay_sinh, 
  kh.dia_chi 
from 
  khach_hang kh;
