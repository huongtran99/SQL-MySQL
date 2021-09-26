create database QuanLyBanHang;
 
use QuanLyBanHang;

create table Customer(
id int PRIMARY KEY,
name varchar(50),
age varchar(50)
);

create table Orders (
orderId int PRIMARY KEY,
orderDate date,
totalPrice float(50),
customerId INT,
FOREIGN KEY (customerId) REFERENCES Customer(id)
);

create table Product (
id int PRIMARY KEY,
name varchar(50),
price float(50)
);

create table OrderDetail (
Orderid int,
Productid int,
primary key(Orderid, ProductId),
FOREIGN KEY (Orderid) REFERENCES Product(id),
FOREIGN KEY (Productid) REFERENCES Orders(orderId),
quantity int default 1
);