create database qlda;

use qlda;

-- CREATE TABLES
CREATE TABLE DEAN
(
	TENDA NVARCHAR(15),
	MADA INT NOT NULL,
	DDIEM_DA NVARCHAR(15) NOT NULL,
	PHONG INT NOT NULL,
	
	PRIMARY KEY (MADA)
);

CREATE TABLE PHONGBAN
(
	TENPHG NVARCHAR(15),
	MAPHG INT NOT NULL,
	TRPHG NVARCHAR(9),
	NG_NHANCHUC DATE,
	
	PRIMARY KEY (MAPHG)
);

CREATE TABLE DIADIEM_PHG
(
	MAPHG INT NOT NULL,
	DIADIEM NVARCHAR(15),
	
	PRIMARY KEY (MAPHG, DIADIEM)
);

CREATE TABLE NHANVIEN
(
	HONV NVARCHAR(15),
	TENLOT NVARCHAR(15),
	TENNV NVARCHAR(15),
	MANV NVARCHAR(9) NOT NULL,
	NGSINH DATE,
	DCHI NVARCHAR(30),
	PHAI NVARCHAR(3),
	LUONG FLOAT,
	MA_NQL NVARCHAR(9),
	PHG INT NOT NULL,
	
	PRIMARY KEY (MANV)
);

CREATE TABLE THANNHAN
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	TENTN NVARCHAR(15),
	PHAI NVARCHAR(3),
	NGSINH DATE,
	QUANHE NVARCHAR(15),
	
	PRIMARY KEY (MA_NVIEN, TENTN)
);

CREATE TABLE CONGVIEC
(
	MADA INT NOT NULL,
	STT INT NOT NULL,
	TEN_CONG_VIEC NVARCHAR(50),
	
	PRIMARY KEY (MADA, STT)
)
;
CREATE TABLE PHANCONG
(
	MA_NVIEN NVARCHAR(9) NOT NULL,
	MADA INT NOT NULL,
	STT INT NOT NULL,
	THOIGIAN FLOAT,
	
	PRIMARY KEY (MA_NVIEN, MADA, STT)
);

-- Cài đặt ràng buộc khóa ngoại cho các bảng 
ALTER TABLE DEAN
ADD CONSTRAINT FK_DEAN_PHONG
FOREIGN KEY (PHONG)
REFERENCES PHONGBAN (MAPHG);

ALTER TABLE PHONGBAN
ADD CONSTRAINT FK_PHONGBAN_NHANVIEN
FOREIGN KEY (TRPHG)
REFERENCES NHANVIEN (MANV);

ALTER TABLE DIADIEM_PHG
ADD CONSTRAINT FK_DIADIEM_PHG_PHONGBAN
FOREIGN KEY (MAPHG)
REFERENCES PHONGBAN (MAPHG);

ALTER TABLE CONGVIEC
ADD CONSTRAINT FK_CONGVIEC_DEAN
FOREIGN KEY (MADA)
REFERENCES DEAN (MADA);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_PHONGBAN
FOREIGN KEY (PHG)
REFERENCES PHONGBAN (MAPHG);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NHANVIEN_NHANVIEN
FOREIGN KEY (MA_NQL)
REFERENCES NHANVIEN (MANV);

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_DEAN
FOREIGN KEY (MADA)
REFERENCES DEAN (MADA);

ALTER TABLE PHANCONG
ADD CONSTRAINT FK_PHANCONG_NHANVIEN
FOREIGN KEY (MA_NVIEN)
REFERENCES NHANVIEN (MANV);

ALTER TABLE THANNHAN
ADD CONSTRAINT FK_THANNHAN_NHANVIEN
FOREIGN KEY (MA_NVIEN)
REFERENCES NHANVIEN (MANV);

INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Đinh', N'Bá', N'Tiến', '009', '1960-11-02', N'119, Cống Quỳnh, TP.HCM', N'Nam', 30000, '005', 5);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Nguyễn', N'Thanh', N'Tùng', '005', '1962-08-20', N'222, Nguyễn Văn Cừ, TP.HCM', N'Nam', 40000, '006', 5);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Bùi', N'Ngọc', N'Hằng', '007', '1954-03-11', N'332, Nguyễn Thái Học, TP.HCM', N'Nam', 25000, '001', 4);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Lê', N'Quỳnh', N'Như', '001', '1967-02-01', N'291, Hồ Văn Huê, TP.HCM', N'Nữ', 43000, '006', 4);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Nguyễn', N'Mạnh', N'Hùng', '004', '1967-03-04', N'95, Bà Rịa - Vũng Tàu', N'Nam', 38000, '005', 5);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Trần', N'Thanh', N'Tâm', '003', '1957-05-04', N'34, Mai Thị Lự, TP.HCM', N'Nam', 25000, '005', 5);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, MA_NQL, PHG)
VALUES (N'Trần', N'Hồng', N'Quang', '008', '1967-09-01', N'45, Lê Hồng Phong, TP.HCM', N'Nam', 25000, '001', 4);
INSERT INTO NHANVIEN (HONV, TENLOT, TENNV, MANV, NGSINH, DCHI, PHAI, LUONG, PHG)
VALUES (N'Phạm', N'Văn', N'Vinh', '006', '1965-01-01', N'45, Trưng Vương', N'Nữ', 55000, 1);

INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES (N'Nghiên cứu', 5, '005', '1978-05-22');
INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES (N'Điều hành', 4, '008', '1985-01-01');
INSERT INTO PHONGBAN (TENPHG, MAPHG, TRPHG, NG_NHANCHUC)
VALUES (N'Quản lý', 1, '006', '1971-06-19');

INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
VALUES (N'Sản phẩm X', 1, N'Vũng Tàu', 5);
INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
VALUES (N'Sản phẩm Y', 2, N'Nha Trang', 5);
INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
VALUES (N'Sản phẩm Z', 3, N'TP.HCM', 5);
INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
VALUES (N'Tin học hóa', 10, N'Hà Nội', 4);
INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
VALUES (N'Cáp quang', 20, N'TP.HCM', 1);
INSERT INTO DEAN (TENDA, MADA, DDIEM_DA, PHONG)
VALUES (N'Đào tạo', 30, N'Hà Nội', 4);

INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('005', N'Trinh', N'Nữ', '1976-04-05', N'Con gái');
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('005', N'Khang', N'Nam', '1973-10-25', N'Con trai');
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('005', N'Phương', N'Nữ', '1948-05-03', N'Vợ chồng');
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('001', N'Minh', N'Nam', '1932-02-29', N'Vợ chồng');
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('009', N'Tiến', N'Nam', '1978-01-01', N'Con trai');
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('009', N'Châu', N'Nữ', '1978-12-30', N'Con gái');
INSERT INTO THANNHAN (MA_NVIEN, TENTN, PHAI, NGSINH, QUANHE)
VALUES ('009', N'Phương', N'Nữ', '1957-05-05', N'Vợ chồng');


	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (1, N'TP.HCM');
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (4, N'Hà Nội');
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Vũng Tàu');
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'Nha Trang');
	INSERT INTO DIADIEM_PHG (MAPHG, DIADIEM)
	VALUES (5, N'TP.HCM');



	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 1, 1, 32);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('009', 2, 2, 8);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('004', 3, 1, 40);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 1, 2, 20.0);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('003', 2, 1, 20.0);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 10, 1, 35);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('008', 30, 2, 5);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 30, 1, 20);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('001', 20, 1, 15);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('006', 20, 1, 30);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 3, 1, 10);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 10, 2, 10);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('005', 20, 1, 10);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 30, 2, 30);
	INSERT INTO PHANCONG (MA_NVIEN, MADA, STT, THOIGIAN)
	VALUES ('007', 10, 2, 10);



	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 1, N'Thiết kế sản phẩm X');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (1, 2, N'Thử nghiệm sản phẩm X');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 1, N'Sản xuất sản phẩm Y');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (2, 2, N'Quảng cáo sản phẩm Y');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (3, 1, N'Khuyến mãi sản phẩm Z');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 1, N'Tin học hóa phòng nhân sự');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (10, 2, N'Tin học hóa phòng kinh doanh');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (20, 1, N'Lắp đặt cáp quang');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 1, N'Đào tạo nhân viên Marketing');
	INSERT INTO CONGVIEC (MADA, STT, TEN_CONG_VIEC)
	VALUES (30, 2, N'Đào tạo chuyên viên thiết kế');
    
    
    
    
    
    
-- 1-  Tìm các nhân viên làm việc ở phòng số 4 
select *
from nhanvien
where phg = 4;
    
-- 2. Tìm các nhân viên có mức lương trên 30000
select *
from nhanvien
where luong > 30000;

-- 3. Tìm các nhân viên có mức lương trên 25,000 ở phòng 4 hoặc các nhân
-- viên có mức lương trên 30,000 ở phòng 5
select *
from nhanvien
where luong > 25000 and phg = 4
or luong > 30000 and phg = 5;


-- 4. Cho biết họ tên đầy đủ của các nhân viên ở TP HCM
select concat(honv, ' ', tenlot, ' ', tennv) as hoTen
from nhanvien
where dchi like '%TP.HCM%';

-- 5. Cho biết họ tên đầy đủ của các nhân viên có họ bắt đầu bằng ký tự 'N'
select concat(honv, ' ', tenlot, ' ', tennv) as hoTen
from nhanvien
where honv like 'N%';

-- 6. Cho biết ngày sinh và địa chỉ của nhân viên Dinh Ba Tien
SELECT ngsinh, dchi
FROM nhanvien
WHERE CONCAT(honv, ' ', tenlot, ' ', tennv) = 'Đinh Bá Tiến';

-- 7. Cho biết các nhân viên có năm sinh trong khoảng 1960 đến 1965
select *
from nhanvien
where year(ngsinh) between 1960 and 1965;

-- 8. Cho biết các nhân viên và năm sinh của nhân viên
select *, year(ngsinh) as namSinh
from nhanvien;


-- 9. Cho biết các nhân viên và tuổi của nhân viên
SELECT 
    *,
    TIMESTAMPDIFF(YEAR, ngsinh, CURDATE()) AS tuoi
FROM nhanvien;

-- 10. Với mỗi phòng ban, cho biết tên phòng ban và địa điểm phòng
select pb.tenphg as ten_phong, diadiem as dia_diem_phong
from phongban pb
inner join diadiem_phg dd on dd.maphg = pb.maphg;

-- 11. Tìm tên những người trưởng phòng của từng phòng ban
select  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv)
from nhanvien nv
inner join phongban pb on pb.trphg = nv.manv;

-- 12. Tìm tên và địa chỉ của tất cả các nhân viên của phòng "Nghiên cứu".
select  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten, dchi as dia_chi
from nhanvien nv
inner join phongban pb on pb.maphg = nv.phg
where pb.tenphg = "Nghiên cứu";

-- 13. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và
-- ngày nhận chức của trưởng phòng của phòng ban chủ trì đề án đó.
select da.tenda as ten_de_an, CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten, pb.ng_nhanchuc as ngay_nhan_chuc
from dean da
inner join phongban pb on pb.maphg = da.phong
inner join nhanvien nv on nv.manv = pb.trphg;
-- 14. Tìm tên những nữ nhân viên và tên người thân của họ
select  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten, tn.tentn as ten_than_nhan
from nhanvien nv
inner join thannhan tn on tn.ma_nvien = nv.manv
where nv.phai = "Nữ";

-- 15. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý
-- trực tiếp của nhân viên đó
select CONCAT(nv1.honv, ' ', nv1.tenlot, ' ', nv1.tennv) as ho_ten_nhan_vien,
		CONCAT(nv2.honv, ' ', nv2.tenlot, ' ', nv2.tennv) as ho_ten_nhan_vien
from nhanvien nv1
left join nhanvien nv2 on nv1.ma_nql = nv2.manv;


-- 16. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người
-- trưởng phòng và họ tên người quản lý trực tiếp của nhân viên đó.
select CONCAT(nv1.honv, ' ', nv1.tenlot, ' ', nv1.tennv) as ho_ten_nhan_vien,
		CONCAT(nv2.honv, ' ', nv2.tenlot, ' ', nv2.tennv) as ho_ten_quan_ly,
        CONCAT(nv3.honv, ' ', nv3.tenlot, ' ', nv3.tennv) as ho_ten_truong_phong
from nhanvien nv1
left join nhanvien nv2 on nv1.ma_nql = nv2.manv
left join phongban pb on pb.maphg = nv1.phg
left join nhanvien nv3 on pb.trphg = nv3.manv;


-- 17. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X"
-- và nhân viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
select CONCAT(nv1.honv, ' ', nv1.tenlot, ' ', nv1.tennv) as ho_ten_nhan_vien
from nhanvien nv1
join phancong pc on pc.ma_nvien = nv1.manv
join dean da on da.mada = pc.mada
join phongban pb on nv1.phg = pb.maphg
join nhanvien nv2 on nv2.manv = pb.trphg
where da.tenda = "Sản phẩm X"
and nv1.phg = 5
and CONCAT(nv2.honv, ' ', nv2.tenlot, ' ', nv2.tennv) = 'Nguyễn Thanh Tùng';

-- 18. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến đã tham gia.
select da.tenda
from dean da
join phancong pc on pc.mada = da.mada
join nhanvien nv on nv.manv = pc.ma_nvien
where  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) = "Đinh Bá Tiến";

-- 19. Cho biết số lượng đề án của công ty
select count(*) as so_luong_de_an
from dean;


-- 20. Cho biết số lượng đề án do phòng 'Nghiên Cứu' chủ trì
select count(distinct da.mada) as so_luong_de_an_nghien_cuu
from phancong pc
join nhanvien nv on pc.ma_nvien = nv.manv
join phongban pb on nv.phg = pb.maphg
join dean da on da.mada = pc.mada
where pb.tenphg = "Nghiên cứu";



-- 21. Cho biết lương trung bình của các nữ nhân viên
select avg(luong) as luong_trung_binh
from nhanvien
where phai = 'Nữ';

-- 22. Cho biết số thân nhân của nhân viên 'Đinh Bá Tiến'
select  count(*) as so_than_nhan
from thannhan tn
join nhanvien nv on tn.ma_nvien = nv.manv
where  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) = "Đinh Bá Tiến";

-- 23. Với mỗi đề án, liệt kê tên đề án và tổng số giờ làm việc một tuần của
-- tất cả các nhân viên tham dự đề án đó.
select da.tenda as ten_de_an,
		sum(pc.thoigian) as tong_thoi_gian
from dean da
join phancong pc on pc.mada = da.mada
group by da.tenda;

-- 24. Với mỗi đề án, cho biết có bao nhiêu nhân viên tham gia đề án đó
select da.tenda as ten_de_an,
		count(distinct ma_nvien) as so_nhan_vien_tham_gia
from dean da
join phancong pc on pc.mada = da.mada
group by da.mada;

-- 25. Với mỗi nhân viên, cho biết họ và tên nhân viên và số lượng thân nhân
-- của nhân viên đó.
SELECT  
    CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) AS ho_ten_nv,
    COUNT(tn.ma_nvien) AS so_luong_than_nhan
FROM 
    nhanvien nv
LEFT JOIN 
    thannhan tn ON tn.ma_nvien = nv.manv
GROUP BY  
    nv.honv, nv.tenlot, nv.tennv;

-- 26. Với mỗi nhân viên, cho biết họ tên của nhân viên và số lượng đề án mà
-- nhân viên đó đã tham gia.
select  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) AS ho_ten_nv,
		count(distinct pc.mada) as so_luong_de_an
from nhanvien nv
left join phancong pc on nv.manv = pc.ma_nvien
GROUP BY  
    nv.honv, nv.tenlot, nv.tennv;

-- 27. Với mỗi nhân viên, cho biết số lượng nhân viên mà nhân viên đó quản
-- lý trực tiếp.
select  CONCAT(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) AS ho_ten_nv_quan_ly,
		count(nv1.manv) as so_nv_dang_quan_ly
from nhanvien nv
left join nhanvien nv1 on nv.manv = nv1.ma_nql
group by nv.manv, nv.honv, nv.tenlot, nv.tennv;

-- 28. Với mỗi phòng ban, liệt kê tên phòng ban và lương trung bình của
-- những nhân viên làm việc cho phòng ban đó.
-- 29. Với các phòng ban có mức lương trung bình trên 30,000, liệt kê tên
-- phòng ban và số lượng nhân viên của phòng ban đó.
-- 30. Với mỗi phòng ban, cho biết tên phòng ban và số lượng đề án mà
-- phòng ban đó chủ trì

-- 45. Cho biết danh sách các công việc (tên công việc) trong đề án 'Sản 
-- phẩm X' mà nhân viên có mã là 009 chưa làm. 
select cv.ten_cong_viec
from congviec cv
join dean da on da.mada = cv.mada
where da.tenda= 'Sản phẩm X'
and cv.stt not in (
	select stt
    from phancong pc
    where pc.ma_nvien = "009"
    and pc.mada = cv.mada
);

-- 46. Tìm họ tên (HONV, TENLOT, TENNV) và địa chỉ (DCHI) của những 
-- nhân viên làm việc cho một đề án ở 'TP HCM' nhưng phòng ban mà họ 
-- trực thuộc lại không tọa lạc ở thành phố 'TP HCM' .  


-- 47. Tổng quát câu 16, tìm họ tên và địa chỉ của các nhân viên làm việc cho 
-- một đề án ở một thành phố nhưng phòng ban mà họ trực thuộc lại 
-- không toạ lạc ở thành phố đó.
-- 48. Danh sách những nhân viên (HONV, TENLOT, TENNV) làm việc trong 
-- mọi đề án của công ty 
	select concat(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten
    from nhanvien nv
    where not exists (
		select da.mada
        from dean da
        where not exists (
			select pc.mada, pc.ma_nvien
            from phancong pc
            where pc.mada = da.mada
            and pc.ma_nvien = nv.manv
        )
    );

-- 49. Danh sách những nhân viên (HONV, TENLOT, TENNV) được phân công 
-- tất cả đề án do phòng số 4 chủ trì. 
	select concat(nv.honv, ' ', nv.tenlot,' ', nv.tennv) as ho_ten
	from nhanvien nv
    where not exists (
		select da.mada
        from dean da
        where phong = 4
        and not exists (
			select pc.ma_nvien, pc.mada
            from phancong pc
            where pc.ma_nvien = nv.manv
            and pc.mada = da.mada
        )
    );
    
-- 50. Tìm những nhân viên (HONV, TENLOT, TENNV) được phân công tất cả 
-- đề án mà nhân viên 'Đinh Bá Tiến' làm việc 
	select concat(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as nhanvien
    from nhanvien nv
    where not exists(
		select 
    );


-- 51. Cho biết những nhân được phân công cho tất cả các công việc trong đề 
-- án 'Sản phẩm X' 
-- 52. Cho biết danh sách nhân viên tham gia vào tất cả các đề án ở TP HCM 
-- 53. Cho biết phòng ban chủ trì tất cả các đề án ở TP HCM 
-- câu 54: cho biết họ tên nhân viên làm việc vất vả nhất
	select concat(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten,
			sum(pc.thoigian) as tong_thoi_gian
	from nhanvien nv
    join phancong pc on pc.ma_nvien = nv.manv
    group by nv.honv, nv.tenlot, nv.tennv
    having sum(pc.thoigian) >= all(
		select sum(pc.thoigian)
        from phancong pc
		group by pc.ma_nvien
    );

-- câu 55: Cho biết họ tên nhân viên làm việc nhàn hạ nhất
select concat(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten,
			sum(pc.thoigian) as tong_thoi_gian
	from nhanvien nv
    join phancong pc on pc.ma_nvien = nv.manv
    group by nv.honv, nv.tenlot, nv.tennv
    having sum(pc.thoigian) <= all(
		select sum(pc.thoigian)
        from phancong pc
		group by pc.ma_nvien
    );
-- Câu 56: Cho biết họ tên nhân viên làm việc đa dạng  nhiều công việc nhất
	select concat(nv.honv, ' ', nv.tenlot, ' ', nv.tennv) as ho_ten,
		count(*)
    from nhanvien nv
    join phancong pc on pc.ma_nvien = nv.manv
    group by nv.honv, nv.tenlot, nv.tennv
    having count(*) >= all (
		select count(*)
        from phancong pc
        group by pc.ma_nvien
    );
    

-- câu 57: Cho biết 2 họ tên nhân viên việc nhẹ lương cao nhất
	




    
