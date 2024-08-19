create database quanlyphanhoi;

use quanlyphanhoi;

create table nhapt(
	manpt char(4),
    tennpt varchar(20),
    ngdk date,
    soud int,
    primary key (manpt)
);

create table nguoidung(
	mand char(5),
    tennd varchar(30),
    ngdktv date,
    gioitinh char(3),
    ngsinh date,
    primary key (mand)
);

create table ungdung(
	maud char(5),
    tenud varchar(30),
    manpt char(4),
    ngph date,
    dluong float,
    loaiud varchar(20),
    primary key (maud)
);

create table ghinhan(
	maud char(5),
    mand char(5),
    danhgia int,
    dangsd int,
    primary key(maud, mand)
);

--- Insert
insert into nhapt (manpt, tennpt, ngdk, soud)
values ('N001', 'Gameloft', '2006-06-20', 100),
		('N002', 'Ketchapp', '2010-07-18', 20),
        ('N003', 'Facebook','2006-02-27',20);
        
insert into nguoidung(mand, tennd, ngdktv, gioitinh, ngsinh)
values ('ND001', 'Huynh Cong Khanh', '2009-06-17', 'Nam', '1994-05-25'),
('ND002', 'Nguyen Minh Dat', '2010-06-19', 'Nam', '1993-03-22'),
('ND003', 'Ho Quy Han', '2012-10-15', 'Nu', '1994-02-14');

insert into nguoidung(mand, tennd, ngdktv, gioitinh, ngsinh)
values ('ND004', 'Nguyen Vinh Quang', '2012-10-15', 'Nam', '1994-02-14');

insert into ungdung(maud, tenud, manpt, ngph, dluong, loaiud)
values ('UD001', 'Messenger', 'N003', '2007-02-01', 6.5, 'Chat'),
 ('UD002', 'Stack', 'N002', '2017-06-02', 42, 'Game'),
  ('UD003', 'Asphalt 8', 'N001', '2018-08-12', 1700, 'Game');

insert into ghinhan(maud, mand, danhgia, dangsd)
values('UD001', 'ND001', 5, 1),
('UD002', 'ND002', 4, 1),
('UD003', 'ND003', 4, 1),
('UD002', 'ND001', 5, 1)
;

insert into ghinhan(maud, mand, danhgia, dangsd)
values ('UD002', 'ND001', 5, 1);

-- Khóa ngoại
alter table ungdung
add constraint fk_ungdung_manpt
foreign key (manpt)
references nhapt(manpt);

alter table ghinhan
add constraint fk_ghinhan_maud
foreign key (maud)
references ungdung(maud);

alter table ghinhan
add constraint fk_ghinhan_mand
foreign key (mand)
references nguoidung(mand);

-- Hiện thực ràng buộc toàn vẹn sau: đánh giá của người dùng là một số
-- nguyên từ 1->5
alter table ghinhan
add constraint ck_ghinhan_danhgia
check (danhgia between 1 and 5);

-- Tìm tất cả các ứng dụng (maud, tenud) của nhà phát triển Gameloft
-- phát hành trong năm 2018 sắp xếp theo dung lượng giảm dần
select ud.maud, ud.tenud
from ungdung ud
join nhapt npt on npt.manpt = ud.manpt
and npt.tennpt = "Gameloft"
and year(ud.ngph) = 2018
order by ud.dluong desc;

-- Tìm người dùng (mand, tennd) đang không sử dụng bất kì ứng dụng game nào 
-- (các ứng dụng loại khác vẫn đang sử dụng)
select nd.mand, nd.tennd
from nguoidung nd
where nd.mand not in (
	select gn.mand
    from ghinhan gn
    join ungdung ud on ud.maud = gn.maud
    where ud.loaiud = "Game"
);

-- Tìm ứng dụng (maud, tenud) phát hành năm 2017 có lược đánh giá là 1 nhiều nhất
select ud.maud, ud.tenud, count(*) as so_lan_danh_gia_1_sao
from ungdung ud
join ghinhan gn on gn.maud = ud.maud
where year(ud.ngph) = 2017
and gn.danhgia = 1
group by ud.maud, ud.tenud
having count(*) >= all (
	select count(*)
    from ghinhan gn2
    where gn2.danhgia = 1
    group by gn2.maud
);


-- Tìm người dùng (mand, tennd) đã đánh giá 5 sao cho tất cả ứng dụng của Facebook
select nd.mand, nd.tennd,count(*) as so_ung_dung_da_danh_gia_fb
from nguoidung nd
join ghinhan gn on gn.mand = nd.mand
where gn.danhgia = 5
group by nd.mand
having count(*) = (
	select count(*)
	from ungdung ud
	inner join nhapt npt on npt.manpt = ud.manpt
	where npt.tennpt = "Facebook"
	group by ud.maud
);


select nd.mand, nd.tennd
from nguoidung nd
where not exists(
	select ud.maud
    from ungdung ud
    join nhapt npt on npt.manpt = ud.manpt
    where npt.tennpt = "Facebook"
    and not exists(
		select gn.maud, gn.mand
        from ghinhan gn
        where gn.maud = ud.maud
        and gn.mand = nd.mand
        and gn.danhgia = 5
    )
);

select * from ghinhan










