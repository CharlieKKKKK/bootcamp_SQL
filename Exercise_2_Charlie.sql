create database ORG;

show databases;

use ORG;

create table worker(
worker_id integer not null primary key auto_increment,
first_name char(25),
last_name char(25),
salary numeric(15),
joining_date datetime,
department char(25)
);

create table bonus (
worker_ref_id integer,
bonus_amount numeric(10),
bonus_date datetime,
foreign key (worker_ref_id) references worker(worker_id)
);

insert into worker
(first_name, last_name, SALARY, JOINING_DATE, DEPARTMENT) values
('Monika', 'Arora', 100000, '21-02-20 09:00:00', 'HR'),
('Niharika', 'Verma', 80000, '21-06-11 09:00:00', 'Admin'),
('Vishal', 'Singhal', 300000, '21-02-20 09:00:00', 'HR'),
('Mohan', 'Sarah', 300000, '12-03-19 09:00:00', 'Admin'),
('Amitabh', 'Singh', 500000, '21-02-20 09:00:00', 'Admin'),
('Vivek', 'Bhati', 490000, '21-06-11 09:00:00', 'Admin'),
('Vipul', 'Diwan', 200000, '21-06-11 09:00:00', 'Account'),
('Satish', 'Kumar', 75000, '21-01-20 09:00:00', 'Account'),
('Geetika', 'Chauhan', 90000, '21-04-11 09:00:00', 'Admin');
-- select * from worker;

insert into bonus
(worker_ref_id , bonus_amount, bonus_date) values
(6, 32000, '21-11-02 09:00:00'),
(6, 20000, '22-11-02 09:00:00'),
(5, 21000, '21-11-02 09:00:00'),
(9, 30000, '21-11-02 09:00:00'),
(8, 4500, '22-11-02 09:00:00');
-- select * from bonus;

-- Task 2:
select salary as second_highest_salary
from worker
where salary < (select max(salary) from worker) order by salary desc limit 1;

-- Task 3:
select concat(first_name , ' ' , last_name) as name_of_employees, department, salary
from worker
where  (department, salary) 
in(select department, max(salary)
from worker
group by department
);

-- Task 4:
select concat(first_name , ' ' , last_name) as name_of_employees, salary
from worker
where salary in (select salary from worker group by salary having count(*) > 1 );

-- Task 5:
select concat(w.first_name , ' ' , w.last_name) as name_of_employees, w.salary + b.bonus_amount AS total_income
from worker w 
inner join bonus b
on b.worker_ref_id = w.worker_id
where year(b.bonus_date) = 2021
;

-- Task 6:
delete from worker;

-- Task 7:
drop table worker;