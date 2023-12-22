USE QL_PhongKhamNhaKhoa
GO

-- CREATE TABLE AND SET PRIMARY KEY

CREATE TABLE NGUOI_DUNG
(   
    ND_ID char(10) NOT NULL,
	ND_Email varchar(50) NOT NULL,
	ND_SoDienThoai char(10) NOT NULL,
	ND_MatKhau varchar(20) NOT NULL,

    CONSTRAINT PK_NGUOIDUNG
    PRIMARY KEY (ND_ID)
)

CREATE TABLE QUAN_TRI_VIEN
(   
    QTV_ID char(10) NOT NULL,
	QTV_VaiTro varchar(20),

    CONSTRAINT PK_QUANTRIVIEN
    PRIMARY KEY (QTV_ID)
)

CREATE TABLE NHAN_VIEN
(   
    NV_ID char(10) NOT NULL,
	NV_HoTen varchar(50) NOT NULL,
	NV_GioiTinh char(5) NOT NULL,

    CONSTRAINT PK_NHANVIEN
    PRIMARY KEY (NV_ID)
)

CREATE TABLE BENH_NHAN
(   
    BN_ID char(10),
	BN_HoSoBenhNhan char(10),

    CONSTRAINT PK_BENHNHAN
    PRIMARY KEY (BN_ID)
)

CREATE TABLE NHA_SI
(   
    NS_ID char(10),
	NS_HoTen varchar(30),
	NS_GioiTinh varchar(5),

    CONSTRAINT PK_NHASI
    PRIMARY KEY (NS_ID)
)

CREATE TABLE LICH_TRINH_LAM_VIEC
(
	LTLV_ID char(10) NOT NULL,
	LTLV_NgayTrongTuan datetime NOT NULL,
	LTLV_KhungGio datetime NOT NULL,
	NS_ID char(10) NOT NULL,

	CONSTRAINT PK_LICHTRINHLAMVIEC
    PRIMARY KEY (LTLV_ID)
)

CREATE TABLE LICH_HEN
(
	LH_ID char(10) NOT NULL,
	LH_ThoiGian date NOT NULL,
	LH_TinhTrang varchar(20) NOT NULL,
	LH_Phong char(7) NOT NULL,
	LH_NhanVienDatHen char(10) NOT NULL,
	LH_KhamChinh char(10) NOT NULL,
	LH_TroKham char(10),

	CONSTRAINT PK_LICHHEN
    PRIMARY KEY (LH_ID)
)

CREATE TABLE HO_SO_BENH_NHAN
(
	HSBN_ID char(10) NOT NULL,
	HSBN_HoTen varchar(50) NOT NULL,
	HSBN_NgaySinh date NOT NULL,
	HSBN_GioiTinh char(5) NOT NULL,
	HSBN_DiaChi varchar(50) NOT NULL,
	HSBN_SoDienThoai char(10) NOT NULL,
	HSBN_TongTienDieuTri float NOT NULL,
	HSBN_ThongTinTongQuat varchar(50),
	HSBN_TongTienDaThanhToan float NOT NULL,
	HSBN_TinhTrangDiUNg varchar(50),
	HSBN_ChongChiDinhThuoc varchar(50),

	CONSTRAINT PK_HOSOBENHNHAN
	PRIMARY KEY (HSBN_ID)
)

CREATE TABLE KE_HOACH_DIEU_TRI
(
	KHDT_ID char(10) NOT NULL,
	KHDT_TrangThai varchar(20),
	KHDT_KhamChinh char(10) NOT NULL,
	KHDT_TroKham char(10),
	HSBN_ID char(10) NOT NULL,
	LT_ID char(10),

	CONSTRAINT PK_KEHOACHDIEUTRI
	PRIMARY KEY (KHDT_ID)
)

CREATE TABLE DIEU_TRI
(
	DIEUTRI_ID char(10) NOT NULL,
	DIEUTRI_MoTa varchar(100) NOT NULL,
	DIEUTRI_ChiPhiDieuTri float NOT NULL,
	DIEUTRI_NgayDieuTri date NOT NULL,
	NS_ID char(10) NOT NULL,
	KHDT_ID char(10) NOT NULL,

	CONSTRAINT PK_DIEUTRI
	PRIMARY KEY (DIEUTRI_ID)
)

CREATE TABLE LIEU_TRINH
(
	LT_ID char(10) NOT NULL,
	LT_NgayDieuTri date NOT NULL,
	LT_DanhMucDieuTri varchar(20) NOT NULL,

	CONSTRAINT PK_LIEUTRINH
	PRIMARY KEY (LT_ID)
)

CREATE TABLE RANG_DIEU_TRI
(
	LT_ID char(10) NOT NULL,
	RANG_ID char(10) NOT NULL,
	RANGDT_BeMatRang char(6) NOT NULL,

	CONSTRAINT PK_RANGDIEUTRI
	PRIMARY KEY (LT_ID, RANG_ID)
)

CREATE TABLE RANG
(
	RANG_ID char(10) NOT NULL,
	RANG_Ten varchar(15) NOT NULL,

	CONSTRAINT PK_RANG
	PRIMARY KEY (RANG_ID)
)

CREATE TABLE THUOC
(
	THUOC_ID char(10) NOT NULL,
	THUOC_Ten varchar(50) NOT NULL,
	THUOC_Gia float NOT NULL,

	CONSTRAINT PK_THUOC
	PRIMARY KEY (THUOC_ID)
)

CREATE TABLE DON_THUOC
(
	DIEUTRI_ID char(10) NOT NULL,
	THUOC_ID char(10) NOT NULL,
	DONTHUOC_SoLuongThuoc int,
	DONTHUOC_TongGia float,

	CONSTRAINT PK_DONTHUOC
	PRIMARY KEY (DIEUTRI_ID, THUOC_ID)
)

CREATE TABLE THANH_TOAN
(
	TT_ID char(10) NOT NULL,
	TT_NgayGiaoDich date NOT NULL,
	TT_TongTienCanThanhToan float NOT NULL,
	TT_TienDaTra float NOT NULL,
	TT_TienThoi float NOT NULL,
	TT_HinhThucThanhToan varchar(10) NOT NULL,
	DIEUTRI_ID char(10) NOT NULL,
	HSBN_ID char(10) NOT NULL,

	CONSTRAINT PK_THANHTOAN
	PRIMARY KEY (TT_ID)
)
GO

-- SET FOREIGN KEY
ALTER TABLE QUAN_TRI_VIEN
ADD
    CONSTRAINT FK_QUANTRIVIEN_NGUOIDUNG
    FOREIGN KEY (QTV_ID)
    REFERENCES NGUOI_DUNG(ND_ID)

ALTER TABLE NHAN_VIEN
ADD
    CONSTRAINT FK_NHANVIEN_NGUOIDUNG
    FOREIGN KEY (NV_ID)
    REFERENCES NGUOI_DUNG(ND_ID)

ALTER TABLE BENH_NHAN
ADD
    CONSTRAINT FK_BENHNHAN_NGUOIDUNG
    FOREIGN KEY (BN_ID)
    REFERENCES NGUOI_DUNG(ND_ID)

ALTER TABLE BENH_NHAN
ADD
    CONSTRAINT FK_BENHNHAN_HOSOBENHNHAN
    FOREIGN KEY (BN_HoSoBenhNhan)
    REFERENCES NGUOI_DUNG(HSBN_ID)

ALTER TABLE NHA_SI
ADD
    CONSTRAINT FK_NHASI_NGUOIDUNG
    FOREIGN KEY (NS_ID)
    REFERENCES NGUOI_DUNG(ND_ID)

ALTER TABLE LICH_TRINH_LAM_VIEC
ADD
	CONSTRAINT FK_LICHTRINHLAMVIEC_NHASI
	FOREIGN KEY (NS_ID)
	REFERENCES NHA_SI(NS_ID)

ALTER TABLE LICH_HEN
ADD
	CONSTRAINT FK_LICHHEN_NHANVIEN
	FOREIGN KEY (LH_NhanVienDatHen)
	REFERENCES NHAN_VIEN(NV_ID)

ALTER TABLE LICH_HEN
ADD
	CONSTRAINT FK_LICHHEN_KHAMCHINH
	FOREIGN KEY (LH_KhamChinh)
	REFERENCES NHA_SI(NS_ID)

ALTER TABLE LICH_HEN
ADD
	CONSTRAINT FK_LICHHEN_TROKHAM
	FOREIGN KEY (LH_TroKham)
	REFERENCES NHA_SI(NS_ID)

ALTER TABLE KE_HOACH_DIEU_TRI
ADD
	CONSTRAINT FK_KEHOACHDIEUTRI_HOSOBENHNHAN
	FOREIGN KEY (HSBN_ID)
	REFERENCES HO_SO_BENH_NHAN(HSBN_ID)

ALTER TABLE KE_HOACH_DIEU_TRI
ADD
	CONSTRAINT FK_KEHOACHDIEUTRI_LIEUTRINH
	FOREIGN KEY (LT_ID)
	REFERENCES LICH_TRINH(LT_ID)

ALTER TABLE DIEU_TRI
ADD
	CONSTRAINT FK_DIEUTRI_NHASI
	FOREIGN KEY (NS_ID)
	REFERENCES NHA_SI(NS_ID)

ALTER TABLE DIEU_TRI
ADD
	CONSTRAINT FK_DIEUTRI_KEHOACHDIEUTRI
	FOREIGN KEY (KHDT_ID)
	REFERENCES KE_HOACH_DIEU_TRI(KHDT_ID)

ALTER TABLE RANG_DIEU_TRI
ADD
	CONSTRAINT FK_RANGDIEUTRI_RANG
	FOREIGN KEY (RANG_ID)
	REFERENCES RANG(RANG_ID)

ALTER TABLE DON_THUOC
ADD
	CONSTRAINT FK_DONTHUOC_DIEUTRI
	FOREIGN KEY (DIEUTRI_ID)
	REFERENCES DIEU_TRI(DIEUTRI_ID)

ALTER TABLE DON_THUOC
ADD
	CONSTRAINT FK_DONTHUOC_THUOC
	FOREIGN KEY (THUOC_ID)
	REFERENCES THUOC(THUOC_ID)

ALTER TABLE THANH_TOAN
ADD
	CONSTRAINT FK_THANHTOAN_DIEUTRI
	FOREIGN KEY (DIEUTRI_ID)
	REFERENCES DIEU_TRI(DIEUTRI_ID)

ALTER TABLE THANH_TOAN
ADD
	CONSTRAINT FK_THANHTOAN_HOSOBENHNHAN
	FOREIGN KEY (HSBN_ID)
	REFERENCES HO_SO_BENH_NHAN(HSBN_ID)

GO