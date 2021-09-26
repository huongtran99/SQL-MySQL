create database student_management;
use student_management;

create table students (
	id int auto_increment primary key,
    name varchar(50) not null,
    address varchar(50) not null,
    sex int default 1,
    age int not null, check (age > 18 and age < 25),
    email varchar(50)  not null unique,
    phone varchar(10) not null
);

create table classes (
	id int auto_increment primary key,
	name varchar(50) not null unique
);

alter table students add classId int;
ALTER TABLE students ADD FOREIGN KEY(classId) REFERENCES classes(id);

INSERT INTO `student_management`.`students` (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('hoang', 'hanoi', '23', 'hoang', '0987654321', '1');
INSERT INTO `student_management`.`students` (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('quan', 'hanoi', '24', 'quan', '0897654331', '1');
INSERT INTO `student_management`.`students` (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('chinh', 'hanoi', '20', 'chinh', '0211654789', '1');
INSERT INTO `student_management`.`students` (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('bong', 'hanoi', '20', 'bong', '0213634789', '1');
INSERT INTO `student_management`.`students` (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('dat', 'hanoi', '20', 'dat', '0293654789', '1');
INSERT INTO `student_management`.`students` (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('thanh', 'hanoi', '20', 'thanh', '0213650789', '1');

select * from students where sex = 1;

select * from students where age < 10;

select * from students where address in ('namdinh', 'HCM', 'Đà Nẵng');

select * from students where address <> 'hanoi';

select * from students where name like 'h%';

select * from students where name like 'huong';

select * from students;

-- 7.	Hiển thị danh sách học viên theo tên giảm dần
select * from students order by name desc;

-- 8.	Hiển thị danh sách học viên theo tuổi tăng dần
select * from students order by age asc;

-- 9.	Hiển thị tổng số lượng học viên của mỗi lớp
select c.name as "Tên lớp", count(classId) as "Số lượng học viên"
from students join classes c on c.id = students.classId
group by c.name;

-- 10.	Hiển thị lớp có số lượng học viên là đông nhất
select c.name as "Tên lớp", count(classId) as "Số lượng học viên"
from students join classes c on c.id = students.classId
group by c.name
having count(classId) = (select count(classId)
                        from students
                        where classId is not null
                        group by classId
                        order by count(classId) desc
                        limit 1);
                        
-- 11.	Hiển thị lớp có số lượng học viên là ít nhất
select c.name as "Tên lớp", count(classId) as "Số lượng học viên"
from students join classes c on c.id = students.classId
group by c.name
having count(classId) = (select count(classId)
                        from students
                        where classId is not null
                        group by classId
                        order by count(classId) asc
                        limit 1);

-- 12.	Thống kê số lượng học viên theo địa chỉ
select address , count(id) from students group by address;

-- 13.	Hiển thị những lớp có số lượng học viên lớn hơn 5
select c.name, count(classId)
from students join classes c on c.id = students.classId
group by c.name
having count(classId) >= 5;

-- 14.	Hiển thị những thành phố có số lượng học viên lớn hơn 5
select address, count(classId)
from students
group by address
having count(classId) >= 5;

-- 15.	Hiển thị học viên có tuổi lớn nhất
select *
from students
where age = (select max(age) from students);

-- 16.	Hiển thị học viên có tuổi nhỏ nhất
select *
from students
where age = (select min(age) from students);

-- 17.	Xóa tất cả học viên có quê ở Hà Nội
delete from students where address = 'HN';

-- 18.	Cập nhật thông tin của học viên có quê ở Hà Nội thành giới tính nữ
update students set sex = 'Nữ' where address = 'hanoi';

-- 19.	Hiển thị học viên có số tuổi lớn thứ hai
select *
from students
where age = (select max(age)
            from students
            where age < (select max(age) from students));

-- 20.	Hiển thị học viện có số tuổi nhỏ thứ hai
select *
from students
where age = (select min(age)
            from students
            where age > (select min(age) from students));


