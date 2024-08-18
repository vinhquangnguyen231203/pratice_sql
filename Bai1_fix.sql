create database qlbh;

use qlbh;

create table khachhang(
	makh char(4),
    hoten varchar(40),
    dchi varchar(50),
    sodt varchar(20),
    ngsinh date,
    doanhso decimal(15,2),
    ngdk date,
    primary key(makh)
);

create table nhanvien(
	manv char(4),
    hoten varchar(40),
    dthoai varchar(20),
    ngvl date,
    primary key (manv)
);

create table sanpham(
	masp char(4),
    tensp varchar(40),
    dvt varchar(20),
    nuocsx varchar(40),
    gia decimal(10,2),
    primary key (masp)
);
create table hoadon(
	sohd int,
    nghd date,
    makh char(4),
    manv char(4),
    trigia decimal(15,2),
	primary key (sohd)
);
create table cthd(
	sohd int,
    masp char(4),
    sl int,
    primary key (sohd, masp)
);

-- Khóa ngoại cho hóa đơn 
alter table hoadon
add constraint fk_makh
foreign key (makh)
references khachhang(makh);

alter table hoadon
add constraint fk_manv
foreign key (manv)
references nhanvien(manv);

-- Khóa ngoại cho chi tiết hóa đơn
alter table cthd
add constraint fk_sohd
foreign key (sohd)
references hoadon(sohd); 

alter table cthd
add constraint fk_masp
foreign key (masp)
references sanpham(masp);

-- Insert table khachhang
INSERT INTO khachhang VALUES ('KH01','NGUYEN VAN  A','731 TRAN HUNG DAO ,Q5,TPHCM','08823451','1960-10-22',13060000,'2006-06-22');
INSERT INTO KHACHHANG VALUES ('KH02','TRAN NGOC HAN','23/5 NGUYEN TRAI ,Q5,TPHCM','0908256478','1974/04/03',280000,'2006/07/30');
INSERT INTO KHACHHANG VALUES ('KH03','TRAN NGOC LINH','45 NGUYEN CANH CHAN ,Q1,TPHCM','0938776266','1980/06/12',3860000,'2006/08/05');
INSERT INTO KHACHHANG VALUES ('KH04','TRAN MINH LONG','50/34 LE DAI HANH,Q10,TPHCM','0917325476','1965/03/09',250000,'2006/10/02');
INSERT INTO KHACHHANG VALUES ('KH05','LE NHAT MINH','34 TRUONG DINH,Q3,TPHCM','08246108','1950/03/10',21000,'2006/10/28');
INSERT INTO KHACHHANG VALUES ('KH06','LE HOAI THUONG','227 NGUYEN VAN CU,Q5,TPHCM','08631738','1981/12/31',915000,'2006/11/24');
INSERT INTO KHACHHANG VALUES ('KH07','NGUYEN VAN  TAM','32/3 TRAN BINH TRONG,Q5,TPHCM','0916783565','1971/04/06',12500,'2006/12/01');
INSERT INTO KHACHHANG VALUES ('KH08','PHAN THI THANH','45/2 AN DUONG VUONG,Q5,TPHCM','093843756','1971/01/10',365000,'2006/12/13');
INSERT INTO KHACHHANG VALUES ('KH09','LE HA VINH','873 LE HONG PHONG,Q5,TPHCM','08654763','1979/09/03',70000,'2007/01/14');
INSERT INTO KHACHHANG VALUES ('KH10','HA DUY LAP','34/34B NGUYEN TRAI,Q1,TPHCM','08768904','1983/05/02',67500,'2007/01/16');

-- Insert table nhan vien
insert into  NhanVien values ('NV01','Nguyen Nhu Nhut','0927345678','2006/4/13');
insert into  NhanVien values ('NV02','Le Thi Phi Yen','0987567390','2006/4/21');
insert into  NhanVien values ('NV03','Nguyen Van B','0997047382','2006/4/27');
insert into  NhanVien values ('NV04','Ngo Thanh Tuan','0913758498','2006/6/24');
insert into  NhanVien values ('NV05','Nguyen Thi Truc Thanh','0918590387','2006/7/20');

-- Insert table san pham

insert into SanPham values ('BC01','But chi','cay','Singapore',3000);
insert into SanPham values ('BC02','But chi','cay','Singapore',5000);
insert into SanPham values ('BC03','But chi','cay','Viet Nam',3500);
insert into SanPham values ('BC04','But chi','hop','Viet Nam',30000);
insert into SanPham values ('BB01','But bi','cay','Viet Nam',5000);
insert into SanPham values ('BB02','But bi','cay','Trung Quoc',7000);
insert into SanPham values ('BB03','But bi','hop','Thai Lan',100000);
insert into SanPham values ('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500);
insert into SanPham values ('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500);
insert into SanPham values ('TV03','Tap 100 giay tot','quyen','Viet Nam',3000);
insert into SanPham values ('TV04','Tap 200 giay tot','quyen','Viet Nam',5500);
insert into SanPham values ('TV05','Tap 100 trang','chuc','Viet Nam',23000);
insert into SanPham values ('TV06','Tap 200 trang','chuc','Viet Nam',53000);
insert into SanPham values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000);
insert into SanPham values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000);
insert into SanPham values ('ST02','So tay loai 1','quyen','Viet Nam',55000);
insert into SanPham values ('ST03','So tay loai 2','quyen','Viet Nam',51000);
insert into SanPham values ('ST04','So tay','quyen','Thai Lan',55000);
insert into SanPham values ('ST05','So tay mong','quyen','Thai Lan',20000);
insert into SanPham values ('ST06','Phan viet bang','hop','Viet Nam',5000);
insert into SanPham values ('ST07','Phan khong bui','hop','Viet Nam',7000);
insert into SanPham values ('ST08','Bong bang','cai','Viet Nam',1000);
insert into SanPham values ('ST09','But long','cay','Viet Nam',5000);
insert into SanPham values ('ST10','But long','cay','Trung Quoc',7000);

-- insert table hoa don
insert into HoaDon values (1001,'2006/07/23','KH01','NV01',320000);
insert into HoaDon values (1002,'2006/08/12','KH01','NV02',840000);
insert into HoaDon values (1003,'2006/08/23','KH02','NV01',100000);
insert into HoaDon values (1004,'2006/09/01','KH02','NV01',180000);
insert into HoaDon values (1005,'2006/10/20','KH01','NV02',3800000);
insert into HoaDon values (1006,'2006/10/16','KH01','NV03',2430000);
insert into HoaDon values (1007,'2006/10/28','KH03','NV03',510000);
insert into HoaDon values (1008,'2006/10/28','KH01','NV03',440000); 
insert into HoaDon values (1009,'2006/10/28','KH03','NV04',200000);
insert into HoaDon values (1010,'2006/11/01','KH01','NV01',5200000);
insert into HoaDon values (1011,'2006/11/04','KH04','NV03',250000);
insert into HoaDon values (1012,'2006/11/30','KH05','NV03',21000);
insert into HoaDon values (1013,'2006/12/12','KH06','NV01',5000);
insert into HoaDon values (1014,'2006/12/31','KH03','NV02',3150000);
insert into HoaDon values (1015,'2007/01/01','KH06','NV01',910000);
insert into HoaDon values (1016,'2007/01/01','KH07','NV02',12500);
insert into HoaDon values (1017,'2007/01/02','KH08','NV03',35000);
insert into HoaDon values (1018,'2007/01/13','KH08','NV03',330000);
insert into HoaDon values (1019,'2007/01/13','KH01','NV03',30000);
insert into HoaDon values (1020,'2007/01/14','KH09','NV04',70000);
insert into HoaDon values (1021,'2007/01/16','KH10','NV03',67500);
insert into HoaDon values (1022,'2007/01/16',Null,'NV03',7000);
insert into HoaDon values (1023,'2007/01/17',Null,'NV01',330000);

-- insert chi tiet hoa don
insert into CTHD values (1001,'TV02',10);
insert into CTHD values (1001,'ST01',5);
insert into CTHD values (1001,'BC01',5);
insert into CTHD values (1001,'BC02',10);
insert into CTHD values (1001,'ST08',10);
insert into CTHD values (1002,'BC04',20);
insert into CTHD values (1002,'BB01',20);
insert into CTHD values (1002,'BB02',20);
insert into CTHD values (1003,'BB03',10);
insert into CTHD values (1004,'TV01',20);
insert into CTHD values (1004,'TV02',10);
insert into CTHD values (1004,'TV03',10);
insert into CTHD values (1004,'TV04',10);
insert into CTHD values (1005,'TV05',50);
insert into CTHD values (1005,'TV06',50);
insert into CTHD values (1006,'TV07',20);
insert into CTHD values (1006,'ST01',30);
insert into CTHD values (1006,'ST02',10);
insert into CTHD values (1007,'ST03',10);
insert into CTHD values (1008,'ST04',8);
insert into CTHD values (1009,'ST05',10);
insert into CTHD values (1010,'TV07',50);
insert into CTHD values (1010,'ST07',50);
insert into CTHD values (1010,'ST08',100);
insert into CTHD values (1010,'ST04',50);
insert into CTHD values (1010,'TV03',100);
insert into CTHD values (1011,'ST06',50);
insert into CTHD values (1012,'ST07',3);
insert into CTHD values (1013,'ST08',5);
insert into CTHD values (1014,'BC02',80);
insert into CTHD values (1014,'BB02',100);
insert into CTHD values (1014,'BC04',60);
insert into CTHD values (1014,'BB01',50);
insert into CTHD values (1015,'BB02',30);
insert into CTHD values (1015,'BB03',7);
insert into CTHD values (1016,'TV01',5);
insert into CTHD values (1017,'TV02',1);
insert into CTHD values (1017,'TV03',1);
insert into CTHD values (1017,'TV04',5);
insert into CTHD values (1018,'ST04',6);
insert into CTHD values (1019,'ST05',1);
insert into CTHD values (1019,'ST06',2);
insert into CTHD values (1020,'ST07',10);
insert into CTHD values (1021,'ST08',5);
insert into CTHD values (1021,'TV01',7);
insert into CTHD values (1021,'TV02',10);
insert into CTHD values (1022,'ST07',1);
insert into CTHD values (1023,'ST04',6);



-- 1- In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
select masp, tensp, nuocsx
from sanpham
where nuocsx = "Trung Quoc";

-- 2- In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”. 
select masp, tensp
from sanpham
where dvt in ("cay", "quyen");

-- 3- In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là
--  “B” và kết thúc là “01”. 
select masp, tensp
from sanpham
where masp like 'B%01';

-- 4 - In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có 
-- giá từ 30.000 đến 40.000. 
select masp, tensp
from sanpham
where nuocsx = "Trung Quoc"
and gia between 30000 and 40000;

-- 5 - In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan”
-- sản xuất có giá từ 30.000 đến 40.000
select masp, tensp
from sanpham
where nuocsx in ("Trung Quoc", "Thai Lan")
and gia between 30000 and 40000;

-- 6 - In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 
-- 1/1/2007 và ngày 2/1/2007. 
select sohd, trigia, nghd
from hoadon
where nghd in ("2007/1/1", "2007/1/2");

-- 7 - In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo
-- ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
select sohd as 'Số hóa đơn', trigia as 'Trị giá'
from hoadon
where month(nghd) = 1 and year(nghd) = 2007
order by nghd asc, trigia desc;

-- 8 - In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
select *
from khachhang
where makh in (
	select makh
    from hoadon
    where nghd = "2007-1-1"
);

-- 9 - In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” 
-- lập trong ngày 28/10/2006. 
select sohd, trigia
from hoadon
where nghd = "2006-10-28"
and makh in (
	select makh
    from khachhang
    where hoten = "Nguyen Van B"
);

-- 10 - In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên 
-- “Nguyen Van A” mua trong tháng 10/2006. 
select s.masp, s.tensp
from sanpham s
join cthd c on s.masp = c.masp
join hoadon h on h.sohd = c.sohd
join khachhang k on k.makh = h.makh
where k.hoten = "NGUYEN VAN  A"
and month(h.nghd) = 10 
and year(h.nghd) = 2006;

-- 11 - Tìm các số hóa đơn đã mua sản phẩm có mã số "BB01" hoặc "BB02"
select distinct c.sohd
from cthd c
where c.masp in ("BB01", "BB02");

-- 12 - Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”,
-- mỗi sản phẩm mua với số lượng từ 10 đến 20. 
select distinct c.sohd
from cthd c
where c.masp in ("BB01", "BB02")
and c.sl between 10 and 20;

-- 13 - Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”,
-- mỗi sản phẩm mua với số lượng từ 10 đến 20. 

-- Cách 1 dùng intersect
(
	select sohd
    from cthd
    where masp = "BB01"
    and sl between 10 and 20
)
intersect
(
	select sohd
    from cthd
    where masp = "BB02"
    and sl between 10 and 20
);

-- Cách 2
select c1.sohd
from cthd c1
inner join cthd c2 on c1.sohd = c2.sohd
where c1.masp = "BB01" and c1.sl between 10 and 20
and c2.masp = "BB02" and c2.sl between 10 and 20;
-- Cách 3
select sohd
from cthd
where masp = "BB01"
and sl between 10 and 20
and sohd in (
	select sohd
    from cthd
    where masp = "BB02"
    and sl between 10 and 20
);

-- 14 - In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” 
-- sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007. 
select distinct s.masp, s.tensp
from sanpham s
left join cthd c on c.masp = s.masp
left join hoadon h on h.sohd = c.sohd
where s.nuocsx = "Trung Quoc"
or h.nghd = "2007-1-1";

-- 15 - In ra danh sách các sản phẩm (MASP,TENSP) không bán được. 
-- Cách 1
select masp, tensp
from sanpham s
where not exists (
	select 1
    from cthd c
    where s.masp = c.masp
);

-- Cách 2
select masp, tensp
from sanpham
where masp not in (
	select masp
    from cthd
);

-- 16 - In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006. 
select s.masp, s.tensp
from sanpham s
where not exists (
	select 1
    from cthd c
    inner join hoadon h on c.sohd = h.sohd
    where c.masp = s.masp
    and year(nghd) = 2006
);
 -- 17 - In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” 
 -- sản xuất không bán được trong năm 2006. 
select s.masp, s.tensp
from sanpham s
where nuocsx = "Trung Quoc"
and not exists(
	select 1
    from cthd c
    inner join hoadon h on h.sohd = c.sohd
    where c.masp = s.masp
    and year(h.nghd) = 2006
);
-- cho biết khách hàng nào có số lượt mua hàng > =3
select makh, count(*) as 'Số lượt mua'
from hoadon
group by makh
having count(*) >= 3;

-- In ra khach hang có so luot mua hang nhieu nhat
-- Cách 1
select makh, count(makh)
from hoadon
group by makh
having count(makh) >= all (
	select count(makh)
    from hoadon
    group by makh
);
-- Cách 2
select makh, count(*) as 'Số lượt mua'
from hoadon
group by makh
having count(*) = (
	select max(so_luot_mua)
    from (
		select count(*) as so_luot_mua
        from hoadon
        group by makh
    ) as subquery
);
-- top 3 khach hang xịn xò nhất năm 2024
select makh, sum(trigia)
from hoadon
where year(nghd) = 2024
group by makh
order by sum(trigia) desc
limit 3;

-- 18 - Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất. 
-- Tìm số hóa đơn mà không có sản phẩm nào do Singapore sản xuất
-- mà thiếu ( không tồn tại) trong hóa đơn đó
select h.sohd
from hoadon h
where not exists(
	select s.masp
    from sanpham s
    where s.nuocsx = "Singapore"
    and not exists (
		select c.sohd, c.masp
        from cthd c
        where c.masp = s.masp
        and c.sohd = h.sohd
    )
);

-- 19 - Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất. 
select h.sohd
from hoadon h
where year(h.nghd) = 2006
and not exists (
	select s.masp
    from sanpham s
    where s.nuocsx = "Singapore" and
    not exists(
		select 1
        from cthd c
        where c.sohd = h.sohd
        and c.masp = s.masp
    )
);

-- 20 - Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
select *
from hoadon
where makh is null;

--  21 - Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
select count(distinct c.masp)
from cthd c
inner join hoadon h on h.sohd = c.sohd
where year(h.nghd) = 2006;

-- 22 - Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
select min(trigia) as 'Trị giá thấp nhất',
		max(trigia) as 'Trị giá cao nhất'
from hoadon;

-- 23 - Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu? 
select avg(trigia) as 'Trị giá trung bình'
from hoadon
where year(nghd) = 2006;

-- 24 - Tính doanh thu bán hàng trong năm 2006.
select sum(trigia) as 'Doanh thu ban hang'
from hoadon
where year(nghd) = 2006;

-- 25 - Tìm số hóa đơn có trị giá cao nhất trong năm 2006. 
select sohd
from hoadon
where trigia in (
	select max(trigia)
    from hoadon
    where year(nghd) = 2006
);

-- 26 - Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
-- cách 1
select *
from khachhang
where makh in (
	select makh
    from hoadon
	where year(nghd) = 2006
    group by makh
    having sum(trigia) >= all (
		select sum(trigia)
        from hoadon
        where year(nghd) = 2006
        group by makh
    )
);

-- cách 2
select k.hoten
from khachhang k, hoadon h
where h.makh = k.makh
and year(h.nghd) = 2006
and trigia in (
	select max(trigia)
    from hoadon
	where year(nghd) = 2006
);

-- Cách 3
select k.hoten
from khachhang k
inner join hoadon h on h.makh = k.makh
where year(nghd) = 2006
group by k.makh
having sum(trigia) >= all(
	select sum(trigia)
    from hoadon
    where year(nghd) = 2006
    group by makh
);

-- 27 - In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất. 
select k.makh, k.hoten
from khachhang k
inner join hoadon h on h.makh = k.makh
group by k.makh, k.hoten
order by sum(trigia) desc
limit 3;

-- 28 - In ra danh sách các sản phẩm (MASP, TENSP) có giá bán 
-- bằng 1 trong 3 mức giá cao nhất. 
select masp, tensp
from sanpham sp
inner join (
	select distinct gia
    from sanpham 
    order by gia desc
    limit 3
) as tmp on sp.gia = tmp.gia;

-- 29 - . In ra danh sách các sản phẩm (MASP, TENSP) do 
-- “Thai Lan” sản xuất có giá bằng 1 trong 3 mức
--  giá cao nhất (của tất cả các sản phẩm).
select masp, tensp
from sanpham sp
inner join (
	select distinct gia
    from sanpham
    order by gia desc
    limit 3
) as tmp on sp.gia = tmp.gia
where sp.nuocsx = "Thai Lan";

-- 30 - In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc”
-- sản xuất có giá bằng 1 trong 3 mức
-- giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
select masp, tensp
from sanpham sp
inner join (
	select distinct gia
    from sanpham
    order by gia desc
    limit 3
) as tmp on sp.gia = tmp.gia
where sp.nuocsx = "Trung Quoc";

-- 31 - * In ra danh sách 3 khách hàng có doanh số cao nhất
-- (sắp xếp theo kiểu xếp hạng).
select *,
rank() over(order by doanhso desc) as ranking
from khachhang
limit 3;

-- 32 - Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
select count(*)
from sanpham
where nuocsx = "Trung Quoc";

-- 33 - Tính tổng số sản phẩm của từng nước sản xuất.
select nuocsx, count(*)
from sanpham
group by nuocsx;

-- 34 - Với từng nước sản xuất, tìm giá bán cao nhất,
-- thấp nhất, trung bình của các sản phẩm.
select nuocsx, min(gia), max(gia), avg(gia)
from sanpham
group by nuocsx;

-- 35 - Tính doanh thu bán hàng mỗi ngày
select nghd, sum(trigia) as 'doanh thu'
from hoadon
group by nghd;

-- 37 - Tính doanh thu bán hàng của từng tháng trong năm 2006.
select month(nghd) as 'tháng', year(nghd) as nam, sum(trigia) as 'doanh thu'
from hoadon
where year(nghd) = 2006
group by month(nghd), year(nghd);



-- 38 - Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau
select sohd, count(distinct masp)
from cthd
group by sohd
having count(distinct masp) >= 4;


-- 39 - Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam”
-- sản xuất (3 sản phẩm khác nhau).
select *
from hoadon
where sohd in (
	select c.sohd
    from cthd c, sanpham s
    where c.masp = s.masp
    and s.nuocsx = "Viet Nam"
    group by c.sohd
    having count(distinct c.masp) = 3
);

-- 40 - Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất. 
select k.makh, k.hoten
from khachhang k
where k.makh in (
	select makh
    from hoadon
    group by makh
    having count(*) >= all (
		select count(*)
        from hoadon
        group by makh
    )
);

-- 41 - Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
select month(nghd) as thang, sum(trigia) as 'doanh so ban hang'
from hoadon
where year(nghd) = 2006
group by month(nghd)
having sum(trigia) >= all (
	select sum(trigia)
    from hoadon
    where year(nghd) = 2006
    group by month(nghd)
);

-- 42 - Tìm sản phẩm (MASP, TENSP) có tổng số lượng
-- bán ra thấp nhất trong năm 2006.
select c.masp, sum(c.sl)
from cthd c
inner join hoadon h on c.sohd = h.sohd
where year(h.nghd) = 2006
group by c.masp
having sum(c.sl) <= all (
	select sum(sl)
    from cthd c
    inner join hoadon h on c.sohd = h.sohd
	where year(h.nghd) = 2006
	group by c.masp
);

-- 43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất
-- Cách 1
select nuocsx, masp, tensp
from sanpham
where (nuocsx, gia) in (
	select nuocsx, max(gia)
    from sanpham
    group by nuocsx
);

-- Cách 2
select nuocsx, masp, tensp
from sanpham s1
where gia = (
	select max(gia)
    from sanpham s2
    where s2.nuocsx = s1.nuocsx
);

-- Cách 3
select s.nuocsx, s.masp, s.tensp
from sanpham s
inner join (
	select nuocsx, max(gia) as maxGia
    from sanpham
    group by nuocsx
) tmp
on s.nuocsx = tmp.nuocsx
and s.gia = tmp.maxGia;

-- 44 - Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.
select nuocsx, count(distinct gia) as 'So luong san pham gia ban # nhau'
from sanpham
group by nuocsx
having count(distinct gia) >= 3;

-- 45 - . *Trong 10 khách hàng có doanh số cao nhất, 
-- tìm khách hàng có số lần mua hàng nhiều nhất.
-- Lấy danh sách 10 khách hàng có doanh số cao nhất

-- Ko sử dụng common table expressions
SELECT k1.makh, COUNT(h.sohd) AS 'So lan mua hang'
FROM khachhang k1
INNER JOIN hoadon h ON k1.makh = h.makh
WHERE k1.makh IN (
    SELECT makh
    FROM (
        SELECT k.makh
        FROM khachhang k
        INNER JOIN hoadon h2 ON k.makh = h2.makh
        GROUP BY k.makh
        ORDER BY SUM(h2.trigia) DESC
        LIMIT 10
    ) AS top_khachhang
)
GROUP BY k1.makh
HAVING COUNT(h.sohd) >= ALL (
    SELECT COUNT(h2.sohd)
    FROM khachhang k2
    INNER JOIN hoadon h2 ON k2.makh = h2.makh
    WHERE k2.makh IN (
        SELECT makh
        FROM (
            SELECT k.makh
            FROM khachhang k
            INNER JOIN hoadon h2 ON k.makh = h2.makh
            GROUP BY k.makh
            ORDER BY SUM(h2.trigia) DESC
            LIMIT 10
        ) AS top_khachhang
    )
    GROUP BY k2.makh
);

-- fix
select k.makh, count(h.sohd) as 'So lan mua hang'
from khachhang k
inner join hoadon h on k.makh = h.makh
where k.makh in (
	select makh
    from (
		select k.makh
        from khachhang k
        order by doanhso desc
        limit 10
    ) as top_khach_hang
)
group by k.makh
having count(h.sohd) >= all(
	select count(h2.sohd)
    from khachhang k2
    inner join hoadon h2 on h2.makh = k2.makh
    where k2.makh in (
		select makh
        from (
			select k.makh
            from khachhang k
            order by doanhso desc
            limit 10
        ) as top_khach_hang
        
    )
    group by k2.makh
);












