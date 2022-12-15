create database if not exists mo_hinh_quan_he;
use mo_hinh_quan_he;

create table phieu_xuat(
so_px varchar(50) primary key,
ngay_xuat date
);

create table vat_tu(
ma_vat_tu varchar(50) primary key,
ten_vat_tu varchar(50));

create table chi_tiet_phieu_xuat(
so_px varchar(20),
ma_vat_tu varchar(20),
don_gia_xuat double,
sl_xuat int,
primary key(so_px,ma_vat_tu),
foreign key(so_px) references phieu_xuat(so_px),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table phieu_nhap(
so_pn varchar(50) primary key,
ngay_nhap date
);

create table chi_tiet_phieu_nhap(
so_pn varchar(20),
ma_vat_tu varchar(20),
primary key(so_pn,ma_vat_tu),
don_gia_nhap double,
sl_xuat int,
foreign key(so_pn) references phieu_nhap(so_pn),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);

create table don_dh(
so_dh int primary key,
ngay_dh date);


create table nha_cc(
ma_ncc varchar(50)  primary key,
ten_ncc varchar(50),
dia_chi varchar(50),
so_dien_thoai int
);

create table so_dien_thoai(
ma_so_dien_thoai int auto_increment primary key,
so_dien_thoai varchar(12),
ma_ncc varchar(50),
foreign key(ma_ncc) references nha_cc(ma_ncc)
);

create table vat_tu_don_hang(
ma_vat_tu varchar(20),
so_dh int,
primary key(ma_vat_tu,so_dh),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_dh) references don_dh(so_dh)
);
