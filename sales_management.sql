/*--- create database, add foreign key constraints between tables ---*/
create database sales_management;

use sales_management;

create table if not exists employee (
	id char(4) not null primary key,
    full_name varchar(40),
    mobile varchar(20)
);

insert into employee (id, full_name, mobile) values
('NV01','Nguyen Nhu Nhut','927345678'),
('NV02','Le Thi Phi Yen','987567390'), 
('NV03','Nguyen Van B','997047382'), 
('NV04','Ngo Thanh Tuan','913758498'), 
('NV05','Nguyen Thi Truc Thanh','918590387');

select * from employee;

create table if not exists customer (
	id char(4) not null primary key,
    full_name varchar(40),
    address varchar(50),
    mobile varchar(20),
    sales float
);

insert into customer (id, full_name, address, mobile, sales) values
('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451',13060000),
('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478',280000), 
('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266',3860000), 
('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476',250000), 
('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108',21000),
('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738',915000),
('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565',12500),
('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756',365000),
('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763',70000),
('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904',67500);

select * from customer;

create table if not exists product (
	id char(4) not null primary key,
    name varchar(40),
    unit varchar(20),
    origin varchar(40),
    price float
);

insert into product (id, name, unit, origin, price) values
('BC01','But chi','cay','Singapore',3000),
('BC02','But chi','cay','Singapore',5000), 
('BC03','But chi','cay','Viet Nam',3500), 
('BC04','But chi','hop','Viet Nam',30000), 
('BB01','But bi','cay','Viet Nam',5000),
('BB02','But bi','cay','Trung Quoc',7000),
('BB03','But bi','hop','Thai Lan',100000), 
('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500), 
('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500), 
('TV03','Tap 100 giay tot','quyen','Viet Nam',3000),
('TV04','Tap 200 giay tot','quyen','Viet Nam',5500),
('TV05','Tap 100 trang','chuc','Viet Nam',23000), 
('TV06','Tap 200 trang','chuc','Viet Nam',53000), 
('TV07','Tap 100 trang','chuc','Trung Quoc',34000), 
('ST01','So tay 500 trang','quyen','Trung Quoc',40000),
('ST02','So tay loai 1','quyen','Viet Nam',55000),
('ST03','So tay loai 2','quyen','Viet Nam',51000), 
('ST04','So tay','quyen','Thai Lan',55000), 
('ST05','So tay mong','quyen','Thai Lan',20000), 
('ST06','Phan viet bang','hop','Viet Nam',5000),
('ST07','Phan khong bui','hop','Viet Nam',7000), 
('ST08','Bong bang','cai','Viet Nam',1000), 
('ST09','But long','cay','Viet Nam',5000), 
('ST10','But long','cay','Trung Quoc',7000);

select * from product;

create table if not exists invoice (
	id int not null primary key,
    invoice_date date,
    customer_id char(4),
    employee_id char(4),
    invoice_total float
);

insert into invoice (id, invoice_date, customer_id, employee_id, invoice_total) values
(1001,'2006-03-27','KH01','NV01',320000),
(1002,'2006-08-12','KH01','NV02',840000), 
(1003,'2006-08-23','KH02','NV01',100000), 
(1004,'2006-01-09','KH02','NV01',180000), 
(1005,'2006-10-20','KH01','NV02',3800000),
(1006,'2006-10-16','KH01','NV03',2430000),
(1007,'2006-10-28','KH03','NV03',510000), 
(1008,'2006-10-28','KH01','NV03',440000), 
(1009,'2006-10-28','KH03','NV04',200000), 
(1010,'2006-11-01','KH01','NV01',5200000),
(1011,'2006-11-04','KH04','NV03',250000),
(1012,'2006-11-30','KH05','NV03',21000), 
(1013,'2006-12-12','KH06','NV01',5000), 
(1014,'2006-12-13','KH03','NV02',3150000), 
(1015,'2007-01-01','KH06','NV01',910000),
(1016,'2007-01-01','KH07','NV02',12500),
(1017,'2007-01-02','KH08','NV03',35000), 
(1018,'2007-01-13','KH08','NV03',330000), 
(1019,'2007-01-13','KH01','NV03',30000), 
(1020,'2007-01-14','KH09','NV04',70000),
(1021,'2007-01-16','KH10','NV03',67500), 
(1022,'2007-01-16',null,'NV03',7000), 
(1023,'2007-01-17',null,'NV01',330000);

select * from invoice;

create table if not exists invoice_detail (
	id int not null auto_increment primary key,
    invoice_id int,
    product_id char(4),
    amount int
);

insert into invoice_detail (invoice_id, product_id, amount) values
(1001,'TV02',10), (1001,'ST01',5),  (1001,'BC01',5), (1001,'BC02',10), 
(1001,'ST08',10), (1002,'BC04',20), (1002,'BB01',20), (1002,'BB02',20), 
(1003,'BB03',10), (1004,'TV01',20), (1004,'TV02',10), (1004,'TV03',10), 
(1004,'TV04',10), (1005,'TV05',50), (1005,'TV06',50), (1006,'TV07',20),
(1006,'ST01',30), (1006,'ST02',10), (1007,'ST03',10), (1008,'ST04',8), 
(1009,'ST05',10), (1010,'TV07',50), (1010,'ST07',50), (1010,'ST08',100), 
(1010,'ST04',50), (1010,'TV03',100), (1011,'ST06',50), (1012,'ST07',3), 
(1013,'ST08',5), (1014,'BC02',80), (1014,'BB02',100), (1014,'BC04',60), 
(1014,'BB01',50), (1015,'BB02',30), (1015,'BB03',7), (1016,'TV01',5),
(1017,'TV02',1), (1017,'TV03',1), (1017,'TV04',5), (1018,'ST04',6),
(1019,'ST05',1), (1019,'ST06',2), (1020,'ST07',10), (1021,'ST08',5),
(1021,'TV01',7), (1021,'TV02',10), (1022,'ST07',1), (1023,'ST04',6);

select * from invoice_detail;

alter table invoice_detail add constraint fk_invoice_invoice_detail foreign key (invoice_id) references invoice(id);
alter table invoice_detail add constraint fk_product_invoice_detail foreign key (product_id) references product(id);

alter table invoice add constraint fk_invoice_employee foreign key (employee_id) references employee(id);
alter table invoice add constraint fk_invoice_customer foreign key (customer_id) references customer(id);

/* --- query database to get data ---*/
-- 1. get list of product with id, name made in 'Trung Quoc'
select id, name from product where origin = 'Trung Quoc';

-- 2. get list of product with id, name and have unit is 'cay', 'quyen'
select id, name from product where unit in ('cay', 'quyen');

-- 3. get list of product with id, name and have id start with character 'B' and finish with '01'
select id, name from product where id like 'B%01';

-- 4. get list of product with id, name, made in 'Trung Quoc' and have price from 30000->40000
select id, name from product where origin = 'Trung Quoc' and price between 30000 and 40000;

-- 5. get list of product with id, name, made in 'Trung Quoc' or 'Thai Lan' and have price from 30000->40000
select id, name from product where origin in ('Trung Quoc', 'Thai Lan') and price between 30000 and 40000;

-- 6. get list of invoice with id, invoice total from '1/1/2007' to '2/1/2007'
select id, invoice_total 
from invoice 
where date_format(invoice_date, '%d %M %Y') 
	between date_format('2007-01-01', '%d %M %Y') and date_format('2007-01-02', '%d %M %Y');
    
-- 7. get list of invoice with id, invoice total in '1/2007' sort by date (asc) and invoice total (desc)
select id, invoice_date, invoice_total 
from invoice 
where month(invoice_date) = month('2007-01-01') 
	order by invoice_date asc, invoice_total desc;

-- 8. get list of customer with id, full name who purchased product in '1/1/2007'
select c.id, c.full_name
from customer c 
	inner join invoice i on c.id = i.customer_id
where date_format(i.invoice_date, '%d %M %Y') = date_format('2007-01-01', '%d %M %Y');

-- 9. get list of invoice with id, invoice total made by employee who have name is 'Nguyen Van B' in '28/10/2006'
select i.id, i.invoice_total
from invoice i inner join employee e on i.employee_id = e.id
where e.full_name = 'Nguyen Van B'
	and date_format(i.invoice_date, '%d %M %Y') = date_format('2006-10-28', '%d %M %Y');
    
-- 10. get list of invoice id which is purchased product have id is 'BB01' or 'BB02'
select i.id
from invoice i
	inner join invoice_detail id on i.id = id.invoice_id
    inner join product p on id.product_id = p.id
where p.id in ('BB01', 'BB02');

-- 11. get list of invoice id which is purchased product have id is 'BB01' or 'BB02'
-- and each product have amount from 10->20
select i.id
from invoice i
	inner join invoice_detail id on i.id = id.invoice_id
    inner join product p on id.product_id = p.id
where p.id in ('BB01', 'BB02') and (id.amount between 10 and 20);

-- 12. get invoice total max, min
select max(invoice_total) as max_invoice_total, min(invoice_total) as min_invoice_total from invoice;

-- 13. get average of all invoice total in 2006
select round(avg(invoice_total), 2) as invoice_total_average from invoice where year(invoice_date) = year('2006-01-01');

-- 14. get total revenue in 2006
-- * formula: revenue = price * amount
select sum(p.price * id.amount) as total_revenue_in_2006
from product p 
	inner join invoice_detail id on p.id = id.product_id
    inner join invoice i on id.invoice_id = i.id
where year(i.invoice_date) = year('2006-01-01');

-- 15. get 3 customer with id, full name who has sales max
select id, full_name from customer order by sales desc limit 0, 3;

-- 16. calculate amount of product made by 'Trung Quoc'
select count(*) as product_amount_made_by_china from product where origin = 'Trung Quoc';

-- 17. calculate amount of product each country made
select count(*) as product_amount_made_by_vietnam from product where origin = 'Viet Nam';
select count(*) as product_amount_made_by_china from product where origin = 'Trung Quoc';
select count(*) as product_amount_made_by_thailan from product where origin = 'Thai Lan';
select count(*) as product_amount_made_by_singapore from product where origin = 'Singapore';

-- 18. with each country, find max price, mix price, average price of products
select max(price) as max_price_vietnam, min(price) as min_price_vietnam from product where origin = 'Viet Nam';
select max(price) as max_price_china, min(price) as min_price_china from product where origin = 'Trung Quoc';
select max(price) as max_price_thailan, min(price) as min_price_thailan from product where origin = 'Thai Lan';
select max(price) as max_price_singapore, min(price) as min_price_singapore from product where origin = 'Singapore';

-- 19. calculate revenue every day
select i.invoice_date, sum(id.amount * p.price) as revenue
from invoice i 
	inner join invoice_detail id on i.id = id.invoice_id
    inner join product p on id.product_id = p.id
group by i.invoice_date;

    

