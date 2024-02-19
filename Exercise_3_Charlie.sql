create database exercise_3_charlie;
use exercise_3_charlie;

create table customer(
id integer primary key auto_increment,
customer_name varchar(255),
city_id integer,
customer_address varchar(255),
contact_person varchar(255) not null,
email varchar(128),
phone varchar(128)
);

create table product(
id integer primary key auto_increment,
sku varchar(32),
product_name varchar(128),
product_description text,
current_price decimal(8,2),
quantity_in_stock integer
);

drop table invoice;
create table invoice(
id integer primary key auto_increment,
invoice_number varchar(255),
customer_id integer,
user_account_id integer,
total_price decimal(8,2),
time_issued timestamp ,
time_due timestamp ,
time_paid timestamp ,
time_canceled timestamp ,
time_refunded timestamp ,
foreign key (customer_id) references customer(id)
);

-- drop table invoice_item;
create table invoice_item(
id integer primary key auto_increment,
invoice_id integer,
product_id integer,
quantity integer,
price decimal(8,2),
line_total_price decimal(8,2),
foreign key (invoice_id) references invoice(id),
foreign key (product_id) references product(id)
);

-- Question 1b

delete from customer;
insert into customer(customer_name, city_id, customer_address, contact_person, email, phone) 
values ('Charlie' , 1, 'Deckergasse 15A', 'qwe', 'qwe@gmail.com', 123456789);
insert into customer(customer_name, city_id, customer_address, contact_person, email, phone) 
values ('John' , 4, 'Deckergasse 1A', 'asd', 'asd@gmail.com', 456123789);
insert into customer(customer_name, city_id, customer_address, contact_person, email, phone) 
values ('Mary' , 8, 'Deckergasse 18A', 'zxc', 'zxc@gmail.com', 789654123);

delete from product;
insert into product(sku, product_name, product_description, current_price, quantity_in_stock)
values ('987', 'ABC black tea', 'XXXXXXXX tea', 20, 900);
insert into product(sku, product_name, product_description, current_price, quantity_in_stock)
values ('923', 'ABC green tea', 'XXXXXX tea', 25, 800);
insert into product(sku, product_name, product_description, current_price, quantity_in_stock)
values ('885', 'ABC milk tea', 'XXXXXX tea', 30, 700);
insert into product(sku, product_name, product_description, current_price, quantity_in_stock)
values ('825', 'ABC fruit tea', 'XXXXXX tea', 50, 400);

delete from invoice;
insert into invoice(invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded) 
values ('4654813', 2, 41, 1423, null, null, null, null, null);
insert into invoice(invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded) 
values ('46524513', 3, 42, 1400, null, null, null, null, null);
insert into invoice(invoice_number, customer_id, user_account_id, total_price, time_issued, time_due, time_paid, time_canceled, time_refunded) 
values ('8924813', 2, 43, 17000, null, null, null, null, null);

delete from invoice_item;
insert into invoice_item(invoice_id, product_id, quantity, price, line_total_price)
values(1,1, 40, 20, 800);
insert into invoice_item(invoice_id, product_id, quantity, price, line_total_price)
values(1,2, 20, 25, 500);
insert into invoice_item(invoice_id, product_id, quantity, price, line_total_price)
values(1,3, 30, 30, 900);
insert into invoice_item(invoice_id, product_id, quantity, price, line_total_price)
values(1,2, 70, 50, 3500);

select * from customer;
select * from product;
select * from invoice;
select * from invoice_item;
-- Question 1c

select customer as type , customer_id, customer_name
from customer
where id not in (select 

-- Question 2

create table employee(
id integer not null auto_increment primary key,
employee_name varchar(30) not null,
salary numeric(8,2),
phone numeric(15),
email varchar(50),
dept_id integer not null
);

create table department(
id integer not null auto_increment primary key,
dept_code varchar(3) not null,
dept_name varchar(200) not null
);

-- 2a

-- DELETE FROM EMPLOYEE;
 INSERT INTO EMPLOYEE(EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('JOHN', 20000, 90234567, 'JOHN@GMAIL.COM', 1);
 INSERT INTO EMPLOYEE (EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('MARY', 10000, 90234561, 'MARY@GMAIL.COM', 1);
 INSERT INTO EMPLOYEE (EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('STEVE', 30000, 90234562, 'STEVE@GMAIL.COM', 3);
 INSERT INTO EMPLOYEE (EMPLOYEE_NAME, SALARY, PHONE, EMAIL, DEPT_ID) VALUES ('SUNNY', 40000, 9234563, 'SUNNY@GMAIL.COM', 4);

-- DELETE FROM DEPARTMENT;
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('HR', 'HUMAN RESOURCES');
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('9UP', '9UP DEPARTMENT');
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('SA', 'SALES DEPARTMENT');
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('IT', 'INFORMATION TECHANOLOGY DEPARTMENT');
 
 select d.DEPT_CODE, count(e.DEPT_ID) as num_of_employees
 from DEPARTMENT d
 left join EMPLOYEE e
 on e.DEPT_ID = d.id
 group by d.DEPT_CODE
 order by num_of_employees desc , d.DEPT_CODE asc;
 
 -- 2b
 INSERT INTO DEPARTMENT(DEPT_CODE, DEPT_NAME) VALUES ('IT', 'INFORMATION TECHANOLOGY DEPARTMENT');
 -- ???
 
 