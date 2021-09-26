create database student_manager;

use student_manager;

create table students( 
id int auto_increment primary key,
name varchar(50) not null,
address varchar(50) not null,
sex int default 1,
age int not null, check (age > 18 and age < 25),
email varchar(50) not null unique,
phone varchar(10) not null
);

create table class (
	id int auto_increment primary key,
	name varchar(50) not null unique
);

alter table students add classId int;
ALTER TABLE students ADD FOREIGN KEY(classId) REFERENCES class(id);

INSERT INTO students (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('hoang', 'hanoi', '23', 'hoang', '0987654321', '1');
INSERT INTO students (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('quan', 'hanoi', '24', 'quan', '0897654331', '2');
INSERT INTO students (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('chinh', 'hanoi', '20', 'chinh', '0211654789', '1');
INSERT INTO students (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('bong', 'hanoi', '20', 'bong', '0213634789', '3');
INSERT INTO students (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('dat', 'hanoi', '20', 'dat', '0293654789', '3');
INSERT INTO students (`name`, `address`, `age`, `email`, `phone`, `classId`) VALUES ('thanh', 'hanoi', '20', 'thanh', '0213650789', '1');

-- 1.	Hiển thị học viên có tuổi lớn nhất của mỗi lớp
select c.name, max(age)
from students join class c on students.classId = c.id
group by c.name;

-- 2.	Hiển thị thông tin gồm tên lớp và tuổi trung bình của mỗi lớp
select c.name, format(avg(age), 1)
from students join class c on c.id = students.classId
group by c.name;


-- 3.	Hiển thị học viên nam có tuổi nhỏ nhất
select *
from students
where age = (select min(age)
from students
where sex='1');



-- 4.	Hiển thị học viên nữ có quê ở Hà Nội
select * from students
where address = 'hanoi' and sex ='1';

-- tìm thông học viên có tuổi lớn nhất (sử dụng view)
create view findStudentHasMaxAge as
select *
from students
where age = (select max(age) from students);

-- tìm tuổi lớn thứ 2(view)
create view findSecondaryMaxAge as
select max(age) as 'age'
from students
where age < (select age from findStudentHasMaxAge);

-- 5.	Hiển thị tuổi cao thứ 2 và đếm xem có bao nhiêu sinh viên có số điểm như vậy
select age, count(age) as 'count'
from students
where age = (select max(age) from students where age < (select max(age) from students))
group by age;

select age, count(age) as 'count'
from students
where age = (select * from findSecondaryMaxAge)
group by age;

