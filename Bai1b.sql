create database qlgv;

use qlgv;

create table khoa(
	makhoa varchar(4),
    tenkhoa varchar(40),
    ngtlap date,
    trgkhoa char(4),
    primary key (makhoa)
);

create table monhoc(
	mamh varchar(10),
    tenmh varchar(40),
    tclt tinyint,
    tcth tinyint,
    makhoa varchar(4),
    primary key (mamh)
);

create table dieukien(
	mamh varchar(10),
    mamh_truoc varchar(10),
    primary key (mamh, mamh_truoc)
);

create table giaovien(
	magv char(4),
    hoten varchar(40),
    hocvi varchar(10),
    hocham varchar(10),
    gioitinh varchar(3),
    ngsinh date,
    ngvl date,
    heso numeric(4,2),
    mucluong decimal(15,2),
    makhoa varchar(4),
    primary key (magv)
);

create table lop(
	malop char(3),
    tenlop varchar(40),
    trglop char(5),
    siso tinyint,
    magvcn char(4),
    primary key(malop)
);

create table hocvien(
	mahv char(5),
    ho varchar(40),
    ten varchar(40),
    ngsinh date,
    gioitinh varchar(3),
    noisinh varchar(40),
    malop char(3),
    primary key (mahv)
);

create table giangday(
	malop char(3),
    mamh varchar(10),
    magv char(4),
    hocky tinyint,
    nam smallint,
    tungay date,
    denngay date,
    primary key (malop, mamh)
);

create table ketquathi(
	mahv char(5),
    mamh varchar(10),
    lanthi tinyint,
    ngthi date,
    diem numeric(4,2),
    kqua varchar(10),
    primary key (mahv, mamh, lanthi)
);


-- Insert dữ liệu khoa
INSERT INTO khoa (makhoa, tenkhoa, ngtlap, trgkhoa) VALUES
('KHMT', 'Khoa hoc may tinh', '2005-06-07', 'GV01'),
('HTTT', 'He thong thong tin', '2005-06-07', 'GV02'),
('CNPM', 'Cong nghe phan mem', '2005-06-07', 'GV04'),
('MTT', 'Mang va truyen thong', '2005-10-20', 'GV03'),
('KTMT', 'Ky thuat may tinh', '2005-12-20', NULL);


-- Insert dữ liệu lop
INSERT INTO lop (malop, tenlop, trglop, siso, magvcn) VALUES
('K11', 'Lop 1 khoa 1', 'K1108', 11, 'GV07'),
('K12', 'Lop 2 khoa 1', 'K1205', 12, 'GV09'),
('K13', 'Lop 3 khoa 1', 'K1305', 12, 'GV14');

-- Insert dữ liệu monhoc
INSERT INTO monhoc (mamh, tenmh, tclt, tcth, makhoa) VALUES
('THDC', 'Tin hoc dai cuong', 4, 1, 'KHMT'),
('CTRR', 'Cau truc roi rac', 5, 0, 'KHMT'),
('CSDL', 'Co so du lieu', 3, 1, 'HTTT'),
('CTDLGT', 'Cau truc du lieu va giai thuat', 3, 1, 'KHMT'),
('PTTKTT', 'Phan tich thiet ke thuat toan', 3, 0, 'KHMT'),
('DHMT', 'Do hoa may tinh', 3, 1, 'KHMT'),
('KTMT', 'Kien truc may tinh', 3, 0, 'KTMT'),
('TKCSDL', 'Thiet ke co so du lieu', 3, 1, 'HTTT'),
('PTTKHTTT', 'Phan tich thiet ke he thong thong tin', 4, 1, 'HTTT'),
('HDH', 'He dieu hanh', 4, 0, 'KTMT'),
('NMCNPM', 'Nhap mon cong nghe phan mem', 3, 0, 'CNPM'),
('LTCFW', 'Lap trinh C for win', 3, 1, 'CNPM'),
('LTHDT', 'Lap trinh huong doi tuong', 3, 1, 'CNPM');

-- Insert dữ liệu giảng dạy
INSERT INTO giangday (malop, mamh, magv, hocky, nam, tungay, denngay) VALUES
('K11', 'THDC', 'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
('K12', 'THDC', 'GV06', 1, 2006, '2006-01-02', '2006-05-12'),
('K13', 'THDC', 'GV15', 1, 2006, '2006-01-02', '2006-05-12'),
('K11', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K12', 'CTRR', 'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
('K13', 'CTRR', 'GV08', 1, 2006, '2006-01-09', '2006-05-17'),
('K11', 'CSDL', 'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
('K12', 'CSDL', 'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CTDLGT', 'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
('K13', 'CSDL', 'GV05', 3, 2006, '2006-08-01', '2006-12-15'),
('K13', 'DHMT', 'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K12', 'CTDLGT', 'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
('K11', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-02-18'),
('K12', 'HDH', 'GV04', 1, 2007, '2007-01-02', '2007-03-20'),
('K11', 'DHMT', 'GV07', 1, 2007, '2007-02-18', '2007-03-20');


-- Insert dữ liệu giáo viên
INSERT INTO giaovien (magv, hoten, hocvi, hocham, gioitinh, ngsinh, ngvl, heso, mucluong, makhoa) VALUES
('GV01', 'Ho Thanh Son', 'PTS', 'GS', 'Nam', '1950-05-02', '2004-01-11', 5.00, 2250000, 'KHMT'),
('GV02', 'Tran Tam Thanh', 'TS', 'PGS', 'Nam', '1965-12-17', '2004-04-20', 4.50, 2025000, 'HTTT'),
('GV03', 'Do Nghiem Phung', 'TS', 'GS', 'Nu', '1950-08-01', '2004-09-23', 4.00, 1800000, 'CNPM'),
('GV04', 'Tran Nam Son', 'TS', 'PGS', 'Nam', '1961-02-22', '2005-01-12', 4.50, 2025000, 'KTMT'),
('GV05', 'Mai Thanh Danh', 'ThS', 'GV', 'Nam', '1958-03-12', '2005-01-12', 3.00, 1350000, 'HTTT'),
('GV06', 'Tran Doan Hung', 'TS', 'GV', 'Nam', '1953-03-11', '2005-01-12', 4.50, 2025000, 'KHMT'),
('GV07', 'Nguyen Minh Tien', 'ThS', 'GV', 'Nam', '1971-11-23', '2005-03-01', 4.00, 1800000, 'KHMT'),
('GV08', 'Le Thi Tran', 'KS', NULL, 'Nu', '1974-03-26', '2005-03-01', 1.69, 760500, 'KHMT'),
('GV09', 'Nguyen To Lan', 'ThS', 'GV', 'Nu', '1966-12-31', '2005-03-01', 4.00, 1800000, 'HTTT'),
('GV10', 'Le Tran Anh Loan', 'KS', NULL, 'Nu', '1972-07-17', '2005-03-01', 1.86, 837000, 'CNPM'),
('GV11', 'Ho Thanh Tung', 'CN', 'GV', 'Nam', '1980-01-12', '2005-05-15', 2.67, 1201500, 'MTT'),
('GV12', 'Tran Van Anh', 'CN', NULL, 'Nu', '1981-03-29', '2005-05-15', 1.69, 760500, 'CNPM'),
('GV13', 'Nguyen Linh Dan', 'CN', NULL, 'Nu', '1980-05-23', '2005-05-15', 1.69, 760500, 'KTMT'),
('GV14', 'Truong Minh Chau', 'ThS', 'GV', 'Nu', '1976-11-30', '2005-05-15', 3.00, 1350000, 'MTT'),
('GV15', 'Le Ha Thanh', 'ThS', 'GV', 'Nam', '1978-05-04', '2005-05-15', 3.00, 1350000, 'KHMT');

-- Insert dữ liệu điều kiện
INSERT INTO dieukien (mamh, mamh_truoc) VALUES
('CSDL', 'CTRR'),
('CSDL', 'CTDLGT'),
('CTDLGT', 'THDC'),
('PTTKTT', 'THDC'),
('PTTKTT', 'CTDLGT'),
('DHMT', 'THDC'),
('LTHDT', 'THDC'),
('PTTKHTTT', 'CSDL');

-- Inser dữ liệu kết quả thi
INSERT INTO ketquathi (mahv, mamh, lanthi, ngthi, diem, kqua) VALUES
('K1101', 'CSDL', 1, '2006-07-20', 10.00, 'Dat'),
('K1101', 'CTDLGT', 1, '2006-12-28', 9.00, 'Dat'),
('K1101', 'THDC', 1, '2006-05-20', 9.00, 'Dat'),
('K1101', 'CTRR', 1, '2006-05-13', 9.50, 'Dat'),
('K1102', 'CSDL', 1, '2006-07-20', 4.00, 'Khong Dat'),
('K1102', 'CSDL', 2, '2006-07-27', 4.25, 'Khong Dat'),
('K1102', 'CSDL', 3, '2006-08-10', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 1, '2006-12-28', 4.50, 'Khong Dat'),
('K1102', 'CTDLGT', 2, '2007-01-05', 4.00, 'Khong Dat'),
('K1102', 'CTDLGT', 3, '2007-01-15', 6.00, 'Dat'),
('K1102', 'THDC', 1, '2006-05-20', 5.00, 'Dat'),
('K1102', 'CTRR', 1, '2006-05-13', 7.00, 'Dat'),
('K1103', 'CSDL', 1, '2006-07-20', 3.50, 'Khong Dat'),
('K1103', 'CSDL', 2, '2006-07-27', 8.25, 'Dat'),
('K1103', 'CTDLGT', 1, '2006-12-28', 7.00, 'Dat'),
('K1103', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1103', 'CTRR', 1, '2006-05-13', 6.50, 'Dat'),
('K1104', 'CSDL', 1, '2006-07-20', 3.75, 'Khong Dat'),
('K1104', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1104', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 1, '2006-05-13', 4.00, 'Khong Dat'),
('K1104', 'CTRR', 2, '2006-05-20', 3.50, 'Khong Dat'),
('K1104', 'CTRR', 3, '2006-06-30', 4.00, 'Khong Dat'),
('K1201', 'CSDL', 1, '2006-07-20', 6.00, 'Dat'),
('K1201', 'CTDLGT', 1, '2006-12-28', 5.00, 'Dat'),
('K1201', 'THDC', 1, '2006-05-20', 8.50, 'Dat'),
('K1201', 'CTRR', 1, '2006-05-13', 9.00, 'Dat'),
('K1202', 'CSDL', 1, '2006-07-20', 8.00, 'Dat'),
('K1202', 'CTDLGT', 1, '2006-12-28', 4.00, 'Khong Dat'),
('K1202', 'CTDLGT', 2, '2007-01-05', 5.00, 'Dat'),
('K1202', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'THDC', 2, '2006-05-27', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 1, '2006-05-13', 3.00, 'Khong Dat');



INSERT INTO ketquathi (mahv, mamh, lanthi, ngthi, diem, kqua) VALUES
('K1202', 'CTRR', 2, '2006-05-20', 4.00, 'Khong Dat'),
('K1202', 'CTRR', 3, '2006-06-30', 6.25, 'Dat'),
('K1203', 'CSDL', 1, '2006-07-20', 9.25, 'Dat'),
('K1203', 'CTDLGT', 1, '2006-12-28', 9.50, 'Dat'),
('K1203', 'THDC', 1, '2006-05-20', 10.00, 'Dat'),
('K1203', 'CTRR', 1, '2006-05-13', 10.00, 'Dat'),
('K1204', 'CSDL', 1, '2006-07-20', 8.50, 'Dat'),
('K1204', 'CTDLGT', 1, '2006-12-28', 6.75, 'Dat'),
('K1204', 'THDC', 1, '2006-05-20', 4.00, 'Khong Dat'),
('K1204', 'CTRR', 1, '2006-05-13', 6.00, 'Dat'),
('K1301', 'CSDL', 1, '2006-12-20', 4.25, 'Khong Dat'),
('K1301', 'CTDLGT', 1, '2006-07-25', 8.00, 'Dat'),
('K1301', 'THDC', 1, '2006-05-20', 7.75, 'Dat'),
('K1301', 'CTRR', 1, '2006-05-13', 8.00, 'Dat'),
('K1302', 'CSDL', 1, '2006-12-20', 6.75, 'Dat'),
('K1302', 'CTDLGT', 1, '2006-07-25', 5.00, 'Dat'),
('K1302', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1302', 'CTRR', 1, '2006-05-13', 8.50, 'Dat'),
('K1303', 'CSDL', 1, '2006-12-20', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 1, '2006-07-25', 4.50, 'Khong Dat'),
('K1303', 'CTDLGT', 2, '2006-08-07', 4.00, 'Khong Dat'),
('K1303', 'CTDLGT', 3, '2006-08-15', 4.25, 'Khong Dat'),
('K1303', 'THDC', 1, '2006-05-20', 4.50, 'Khong Dat'),
('K1303', 'CTRR', 1, '2006-05-13', 3.25, 'Khong Dat'),
('K1303', 'CTRR', 2, '2006-05-20', 5.00, 'Dat'),
('K1304', 'CSDL', 1, '2006-12-20', 7.75, 'Dat'),
('K1304', 'CTDLGT', 1, '2006-07-25', 9.75, 'Dat'),
('K1304', 'THDC', 1, '2006-05-20', 5.50, 'Dat'),
('K1304', 'CTRR', 1, '2006-05-13', 5.00, 'Dat'),
('K1305', 'CSDL', 1, '2006-12-20', 9.25, 'Dat'),
('K1305', 'CTDLGT', 1, '2006-07-25', 10.00, 'Dat'),
('K1305', 'THDC', 1, '2006-05-20', 8.00, 'Dat'),
('K1305', 'CTRR', 1, '2006-05-13', 10.00, 'Dat');

-- Insert dữ liệu hocvien
INSERT INTO hocvien (mahv, ho, ten, ngsinh, gioitinh, noisinh, malop) VALUES
('K1101', 'Nguyen', 'Van A', '1986-01-27', 'Nam', 'TpHCM', 'K11'),
('K1102', 'Tran', 'Ngoc Han', '1986-03-14', 'Nu', 'Kien Giang', 'K11'),
('K1103', 'Ha', 'Duy Lap', '1986-04-18', 'Nam', 'Nghe An', 'K11'),
('K1104', 'Tran', 'Ngoc Linh', '1986-03-30', 'Nu', 'Tay Ninh', 'K11'),
('K1105', 'Tran', 'Minh Long', '1986-02-27', 'Nam', 'TpHCM', 'K11'),
('K1106', 'Le', 'Nhat Minh', '1986-01-24', 'Nam', 'TpHCM', 'K11'),
('K1107', 'Nguyen', 'Nhu Nhut', '1986-01-27', 'Nam', 'Ha Noi', 'K11'),
('K1108', 'Nguyen', 'Manh Tam', '1986-02-27', 'Nam', 'Kien Giang', 'K11'),
('K1109', 'Phan Thi', 'Thanh Tam', '1986-01-27', 'Nu', 'Vinh Long', 'K11'),
('K1110', 'Le', 'Hoai Thuong', '1986-02-05', 'Nu', 'Can Tho', 'K11'),
('K1111', 'Le', 'Ha Vinh', '1986-12-25', 'Nam', 'Vinh Long', 'K11'),
('K1201', 'Nguyen', 'Van B', '1986-02-11', 'Nam', 'TpHCM', 'K12'),
('K1202', 'Nguyen Thi', 'Kim Duyen', '1986-01-18', 'Nu', 'TpHCM', 'K12'),
('K1203', 'Tran Thi', 'Kim Duyen', '1986-09-17', 'Nu', 'TpHCM', 'K12'),
('K1204', 'Truong', 'My Hanh', '1986-05-19', 'Nu', 'Dong Nai', 'K12'),
('K1205', 'Nguyen', 'Thanh Nam', '1986-04-17', 'Nam', 'TpHCM', 'K12'),
('K1206', 'Nguyen Thi', 'Truc Thanh', '1986-03-04', 'Nu', 'Kien Giang', 'K12'),
('K1207', 'Tran Thi', 'Bich Thuy', '1986-02-08', 'Nu', 'Nghe An', 'K12'),
('K1208', 'Huynh Thi', 'Kim Trieu', '1986-04-08', 'Nu', 'Tay Ninh', 'K12'),
('K1209', 'Pham Thanh', 'Trieu', '1986-02-23', 'Nam', 'TpHCM', 'K12'),
('K1210', 'Ngo', 'Thanh Tuan', '1986-02-14', 'Nam', 'TpHCM', 'K12'),
('K1211', 'Do Thi', 'Xuan', '1986-03-09', 'Nu', 'Ha Noi', 'K12'),
('K1212', 'Le Thi', 'Phi Yen', '1986-03-12', 'Nu', 'TpHCM', 'K12'),
('K1301', 'Nguyen Thi', 'Kim Cuc', '1986-06-09', 'Nu', 'Kien Giang', 'K13'),
('K1302', 'Truong Thi', 'My Hien', '1986-03-18', 'Nu', 'Nghe An', 'K13'),
('K1303', 'Le', 'Duc Hien', '1986-03-21', 'Nam', 'Tay Ninh', 'K13'),
('K1304', 'Le Quang', 'Hien', '1986-04-18', 'Nam', 'TpHCM', 'K13'),
('K1305', 'Le Thi', 'Huong', '1986-03-27', 'Nu', 'TpHCM', 'K13'),
('K1306', 'Nguyen Thai', 'Huu', '1986-03-30', 'Nam', 'Ha Noi', 'K13'),
('K1307', 'Tran Minh', 'Man', '1986-05-28', 'Nam', 'TpHCM', 'K13'),
('K1308', 'Nguyen Hieu', 'Nghia', '1986-04-08', 'Nam', 'Kien Giang', 'K13'),
('K1309', 'Nguyen Trung', 'Nghia', '1987-01-18', 'Nam', 'Nghe An', 'K13'),
('K1310', 'Tran Thi', 'Hong Tham', '1986-04-22', 'Nu', 'Tay Ninh', 'K13'),
('K1311', 'Tran Minh', 'Thuc', '1986-04-04', 'Nam', 'TpHCM', 'K13'),
('K1312', 'Nguyen Thi', 'Kim Yen', '1986-09-07', 'Nu', 'TpHCM', 'K13');


-- Khóa ngoại
alter table khoa
add constraint fk_khoa_trgkhoa
foreign key (trgkhoa)
references giaovien(magv);

alter table lop
add constraint fk_lop_trglop
foreign key (trglop)
references hocvien(mahv);

alter table lop 
add constraint fk_lop_magvcn
foreign key (magvcn)
references giaovien(magv);


alter table monhoc
add constraint fk_monhoc_makhoa
foreign key (makhoa)
references khoa(makhoa);

alter table giangday
add constraint fk_giangday_malop
foreign key (malop)
references lop(malop);

alter table giangday
add constraint fk_giangday_mamh
foreign key (mamh)
references monhoc(mamh);

alter table giangday
add constraint fk_giangday_magv
foreign key (magv)
references giaovien(magv);

alter table giaovien
add constraint fk_giaovien_makhoa
foreign key (makhoa)
references khoa(makhoa);

alter table dieukien
add constraint fk_dieukien_mamh
foreign key (mamh)
references monhoc(mamh);

alter table dieukien
add constraint fk_dieukien_mamh_truoc
foreign key (mamh_truoc)
references monhoc(mamh);

alter table ketquathi
add constraint fk_ketquathi_mahv
foreign key (mahv)
references hocvien(mahv);

alter table ketquathi
add constraint fk_ketquathi_mamh
foreign key (mamh)
references monhoc(mamh);

alter table hocvien
add constraint fk_hocvien_malop
foreign key (malop)
references lop(malop);

-- 1. In ra danh sách (mã học viên, họ tên, ngày sinh, mã lớp) lớp trưởng của các lớp.
select mahv, concat(ho,' ', ten) as 'Họ và tên', ngsinh, malop
from hocvien
where mahv in (
	select trglop
    from lop
);

-- 2. In ra bảng điểm khi thi (mã học viên, họ tên , lần thi, điểm số) môn CTRR của lớp “K12”,
-- sắp xếp theo tên, họ học viên.
select h.mahv, concat(h.ho, ' ',h.ten) as 'ho va ten', k.lanthi, k.diem
from hocvien h
inner join ketquathi k on h.mahv = k.mahv
where k.mamh = "CTRR"
and h.malop = "K12"
order by h.ho asc, h.ten asc
;

-- 3. In ra danh sách những học viên (mã học viên, họ tên) và những môn học mà học viên đó thi
-- lần thứ nhất đã đạt.
SELECT h.mahv, CONCAT(h.ho, ' ', h.ten) AS hoten, m.tenmh AS monhoc
FROM hocvien h
INNER JOIN ketquathi k ON k.mahv = h.mahv
INNER JOIN monhoc m ON m.mamh = k.mamh
WHERE k.lanthi = 1 
AND k.kqua = 'Dat';


-- 4. In ra danh sách học viên (mã học viên, họ tên) của lớp “K11” thi môn CTRR không đạt (ở
-- lần thi 1).
select h.mahv , concat(h.ho, ' ', h.ten) as hoTen
from hocvien h 
inner join ketquathi k on k.mahv = h.mahv
where h.malop = "K11"
and k.mamh = "CTRR" 
and k.kqua = "Khong Dat"
and k.lanthi = 1;

-- 5. * Danh sách học viên (mã học viên, họ tên) của lớp “K” thi môn CTRR không đạt (ở tất cả
-- các lần thi).

SELECT h.mahv, CONCAT(h.ho, ' ', h.ten) AS hoTen
FROM hocvien h
WHERE h.malop LIKE 'K%'
AND NOT EXISTS (
    SELECT *
    FROM ketquathi k1
    WHERE k1.mahv = h.mahv
    AND k1.mamh = 'CTRR'
    AND k1.kqua <> 'Khong Dat'
)
AND EXISTS (
    SELECT *
    FROM ketquathi k2
    WHERE k2.mahv = h.mahv
    AND k2.mamh = 'CTRR'
);

-- Cách 2
select h.mahv, concat(h.ho, ' ', h.ten) as hoTen
from hocvien h
inner join ketquathi k on k.mahv = h.mahv
where h.malop like 'K%'
and k.mamh = "CTRR"
group by h.mahv, h.ho, h.ten
having count(case when k.kqua = 'Dat' then 1 end) = 0;

-- Cách 3
select h.mahv, concat(h.ho, ' ', h.ten) as hoTen
from hocvien h
inner join ketquathi k on k.mahv = h.mahv
where h.malop like 'K%'
and k.mamh = "CTRR"
group by h.mahv, h.ho, h.ten
having sum(k.kqua = "Dat") = 0;

-- 6. Tìm tên những môn học mà giáo viên có tên “Tran Tam Thanh” dạy trong học kỳ 1 năm
-- 2006.
select distinct m.tenmh
from giangday gd
inner join monhoc m on gd.mamh = m.mamh
inner join giaovien gv on gd.magv = gv.magv
where gv.hoten = "Tran Tam Thanh"
and gd.hocky = 1;

-- 7. Tìm những môn học (mã môn học, tên môn học) mà giáo viên chủ nhiệm lớp “K11” dạy
-- trong học kỳ 1 năm 2006.
select m.mamh, m.tenmh
from giangday gd
inner join monhoc m on gd.mamh = m.mamh
inner join lop l on gd.malop = l.malop
where gd.nam = 2006
and gd.hocky = 1
and gd.malop = "K11"
and gd.magv = l.magvcn;


-- 8. Tìm họ tên lớp trưởng của các lớp mà giáo viên có tên “Nguyen To Lan” dạy môn “Co So
-- Du Lieu”.
select concat(h.ho, ' ', h.ten)
from hocvien h 
inner join lop l on h.malop = l.malop
where h.mahv = l.trglop
and l.malop in (
	select gd.malop
    from giangday gd
    inner join giaovien gv on gd.magv = gv.magv
    inner join monhoc mh on gd.mamh = mh.mamh
    where gv.hoten = 'Nguyen To Lan'
    and mh.tenmh = "Co So Du Lieu"
);

-- 9. In ra danh sách những môn học (mã môn học, tên môn học) phải học liền trước môn “Co So
-- Du Lieu”.
select m.mamh, m.tenmh
from monhoc m 
inner join dieukien dk on m.mamh = dk.mamh_truoc
where dk.mamh = (
	select mamh
    from monhoc
    where tenmh = "Co So Du Lieu"
);


-- 10. Môn “Cau Truc Roi Rac” là môn bắt buộc phải học liền trước những môn học (mã môn học,
-- tên môn học) nào.
select m.mamh, m.tenmh
from monhoc m
inner join dieukien dk on m.mamh = dk.mamh
where dk.mamh_truoc = (
	select mamh
    from monhoc
    where tenmh = "Cau Truc Roi Rac"
);


-- 11. Tìm họ tên giáo viên dạy môn CTRR cho cả hai lớp “K11” và “K12” trong cùng học kỳ 1
-- năm 2006.
select gv.hoten
from giaovien gv
where gv.magv in (
	select gd1.magv
	from giangday gd1
	inner join giangday gd2 on gd1.magv = gd2.magv
	where gd1.malop = "K11" and gd1.hocky = 1 and gd1.nam = 2006 and gd1.mamh = "CTRR"
	and gd2.malop = "K12" and gd2.hocky = 1 and gd2.nam = 2006 and gd2.mamh = "CTRR"
);
-- 12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng
-- chưa thi lại môn này.
select h.mahv, concat(h.ho, ' ', h.ten) as hoTen
from hocvien h
inner join ketquathi kq on h.mahv = kq.mahv
where kq.mamh = "CSDL"
and kq.lanthi = 1
and kq.kqua = "Khong Dat"
and not exists (
	select 1
    from ketquathi k2
    where k2.mahv = h.mahv
    and k2.mamh = "CSDL"
    and k2.lanthi > 1
);

--
select h.mahv, concat(h.ho, ' ', h.ten) as hoTen
from hocvien h
inner join ketquathi k on h.mahv = k.mahv
where k.mamh = "CSDL"
and k.lanthi = 1
and k.kqua = "Khong Dat"
and not exists (
	select 1
    from ketquathi k2
    where k2.mahv = h.mahv
    and k2.mamh = "CSDL"
    and k2.lanthi >1
);

-- 13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
select gv.magv, gv.hoten
from giaovien gv
where not exists (
	select 1
    from giangday gd
    where gv.magv = gd.magv
);

-- 14. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào
-- thuộc khoa giáo viên đó phụ trách.
select gv.magv, gv.hoten
from giaovien gv
inner join khoa k on gv.makhoa = k.makhoa
where not exists (
	select 1
    from giangday gd
    inner join monhoc m on m.mamh = gd.mamh
	where m.makhoa = k.makhoa
    and gd.magv = gv.magv
);



-- 15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat”
-- hoặc thi lần thứ 2 môn CTRR được 5 điểm.
select distinct concat(h.ho, ' ', h.ten) as hoTen
from  hocvien h
inner join ketquathi kq on kq.mahv = h.mahv
where h.malop = "K11" and (
(kq.lanthi = 2 and kq.mamh = "CTRR" and kq.diem = 5)
or exists (
	select 1
    from ketquathi kq1
    where kq1.mahv = h.mahv
    and kq1.mamh = "CTRR"
    and kq1.kqua = "Khong Dat"
    group by kq1.mamh
    having count(kq1.lanthi) > 3
) );


-- 16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm
-- học.
select gv.hoten
from giaovien gv
inner join giangday gd on gd.magv = gv.magv
inner join monhoc m on m.mamh = gd.mamh
where m.tenmh = "CTRR"
group by gv.magv, gv.hoten, gd.hocky, gd.nam
having count(distinct gd.malop) >=2



-- 17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).


-- 18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần
-- thi).
-- 19. Khoa nào (mã khoa, tên khoa) được thành lập sớm nhất.
-- 20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”


























