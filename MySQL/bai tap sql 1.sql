create database thuexe;
use thuexe;

drop database thuexe;

create table NHACUNGCAP(
MaNhaCC varchar(60) primary key,
TenNhaCC nvarchar(60), 
DiaChi varchar(60), 
SoDT varchar(60), 
MaSoThue varchar(60)
);

Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC001', N'Cty TNHH Toàn Phát', 'Hai Chau', '051133999888', '568941');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC002', N'Cty Cổ Phần Đông Du', 'Lien Chieu', '051133999889', '456789');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC003', N'Ông Nguyễn Văn A', 'Hoa Thuan', '051133999890', '321456');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC004', N'Cty Cổ Phần Toàn Cầu Xanh', 'Hai Chau', '05113658945', '513364');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC005', N'Cty TNHH AMA', 'Thanh Khe', '051103875466', '546546');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC006', N'Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469', '524545');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC007', N'Cty TNHH Phan Thành', 'Thanh Khe', '05113987456', '113021');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC008', N'Ông Phan Đình Nam', 'Hoa Thuan', '05113532456', '121230');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC009', N'Tập đoàn Đông Nam Á', 'Lien Chieu', '05113987121', '533654');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue)
Values ('NCC010', N'Cty Cổ Phần Rạng đông', 'Lien Chieu', '05113569654', '187864');

create table LOAIDICHVU (
MaLoaiDV varchar(60) primary key, 
TenLoaiDV varchar(60)
);

Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV)
Values ('DV01', N'Dịch vụ xe taxi');
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV)
Values ('DV02', N'Dịch vụ xe buýt công cộng theo tuyến cố định');
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV)
Values ('DV03', N'Dịch vụ cho thuê xe theo hợp đồng');

create table MUCPHI (
MaMP varchar(60) primary key, 
DonGia varchar(60),
MoTa varchar(60)
);

Insert Into MUCPHI (MaMP, DonGia, MoTa)
Values ('MP01', '10000', N'Áp dụng từ ngày 1/2015');
Insert Into MUCPHI (MaMP, DonGia, MoTa)
Values ('MP02', '15000', N'Áp dụng từ ngày 2/2015');
Insert Into MUCPHI (MaMP, DonGia, MoTa)
Values ('MP03', '20000', N'Áp dụng từ ngày 1/2010');
Insert Into MUCPHI (MaMP, DonGia, MoTa)
Values ('MP04', '25000', N'Áp dụng từ ngày 2/2011');

create table DONGXE (
DongXe varchar(60) primary key, 
HangXe varchar(60), 
SoChoNgoi varchar(60)
);

Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Hiace', 'Toyota', 16);
Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Vios', 'Toyota', 5);
Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Escape', 'Ford', 5);
Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Cerato', 'KIA', 7);
Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Forte', 'KIA', 5);
Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Starex', 'Huyndai', 7);
Insert Into DONGXE (DongXe, HangXe, SoChoNgoi)
Values ('Grand-i10', 'Huyndai', 7);

create table DANGKYCUNGCAP (
MaDKCC varchar(60) primary key,
MaNhaCC varchar(60), 
MaLoaiDV varchar(60), 
DongXe varchar(60), 
MaMP varchar(60), 
NgayBatDauCungCap varchar(60), 
NgayKetThucCungCap varchar(60),
FOREIGN KEY (MaNhaCC) REFERENCES NHACUNGCAP(MaNhaCC),
FOREIGN KEY (MaLoaiDV) REFERENCES LOAIDICHVU(MaLoaiDV),
FOREIGN KEY (DongXe) REFERENCES DONGXE(DongXe),
FOREIGN KEY (MaMP) REFERENCES MUCPHI(MaMP)
);

Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015/11/20', '2016/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015/11/20', '2017/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017/11/20', '2018/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015/11/20', '2019/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019/11/20', '2020/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016/11/10', '2021/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015/11/30', '2016/01/25');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016/02/28', '2016/08/15');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016/04/27', '2017/04/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2016/11/21', '2016/02/22');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016/12/25', '2017/02/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016/04/14', '2017/12/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015/12/21', '2016/12/21');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016/05/20', '2016/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018/04/24', '2019/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016/06/22', '2016/12/21');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016/09/30', '2019/09/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '2017/12/13', '2018/09/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '2016/01/24', '2016/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016/05/03', '2017/10/21');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015/01/30', '2016/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016/07/25', '2017/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017/11/30', '2018/05/20');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017/12/23', '2019/11/30');
Insert Into DANGKYCUNGCAP (MaDKCC, MaNhaCC, MaLoaiDV, DongXe, MaMP, NgayBatDauCungCap, NgayKetThucCungCap)
Values ('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016/08/24', '2017/10/25');

SELECT DongXe FROM DONGXE WHERE SoChoNgoi > 5;

SELECT NHACUNGCAP.MaNhaCC, NHACUNGCAP.TenNhaCC
FROM NHACUNGCAP JOIN DANGKYCUNGCAP
ON NHACUNGCAP.MaNhaCC = DANGKYCUNGCAP.MaNhaCC
JOIN MUCPHI
ON MUCPHI.MaMp = DANGKYCUNGCAP.MaMp
JOIN DONGXE
ON DONGXE.DongXe = DANGKYCUNGCAP.DongXe
WHERE (DONGXE.HangXe = 'Toyota' and MUCPHI.DonGia = 15000) or (DONGXE.HangXe = 'KIA' and MUCPHI.DonGia = 20000);

SELECT *
FROM NHACUNGCAP NCC
ORDER BY NCC.TenNhaCC ASC, NCC.MaSoThue DESC;

alter table dangkycungcap drop column SoLuongXeDangKy;

ALTER TABLE DANGKYCUNGCAP ADD SoLuongXeDangKy int;

SELECT NCC.MaNhaCC, NCC.TenNhaCC, count(NCC.MaNhaCC) as SoLuongXeDangKy
FROM NHACUNGCAP NCC JOIN DANGKYCUNGCAP DK
ON NCC.MaNhaCC = DK.MaNhaCC
WHERE DK.NgayBatDauCungCap = '2015/11/20'
GROUP BY NCC.MaNhaCC, NCC.TenNhaCC;

select * from dongxe group by dongxe.hangxe;

SELECT MaDKCC, NCC.MaNhaCC, TenNhaCC, DiaChi, MaSoThue, TenLoaiDV, DonGia, HangXe, NgayBatDauCungCap, NgayKetThucCungCap 
FROM NHACUNGCAP NCC JOIN DANGKYCUNGCAP DK 
ON NCC.MaNhaCC = DK.MaNhaCC 
JOIN MUCPHI MP 
ON MP.MaMp = DK.MaMp 
JOIN LOAIDICHVU DV
ON DV.MaLoaiDV = DK.MaLoaiDV
JOIN DONGXE DX
On DX.DONGXE = DK.DONGXE;


SELECT NCC.MaNhaCC, NCC.TenNhaCC
FROM NHACUNGCAP NCC 
WHERE NCC.MaNhaCC in (
SELECT DK.MaNhaCC
FROM DANGKYCUNGCAP DK
WHERE DK.DongXe = 'Hiace' or DK.DongXe = 'Cerato');

SELECT NCC.MaNhaCC, NCC.TenNhaCC
FROM NHACUNGCAP NCC 
WHERE not exists(
SELECT *
FROM DANGKYCUNGCAP DK
WHERE NCC.MaNhaCC = DK.MaNhaCC)

