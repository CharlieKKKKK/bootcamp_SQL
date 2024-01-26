
DROP DATABASE IF EXISTS Exercise_1_Charlie;
CREATE DATABASE IF NOT EXISTS `Exercise_1_Charlie`;

use Exercise_1_Charlie;

CREATE USER 'charlie'@'127.0.0.1' IDENTIFIED BY '12345678';

GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'charlie'@'127.0.0.1' WITH GRANT OPTION;

create table jobs (
job_id varchar(10) primary key,
job_title varchar(35),
min_salary integer,
max_salary integer
);

create table job_grades (
grade_level varchar(2) primary key,
lowest_sal integer,
highest_sal integer
);

create table regions (
region_id integer primary key,
region_name varchar(25)
);

create table countries (
country_id char(2) primary key,
country_name varchar(40),
region_id integer ,
foreign key (region_id) references regions(region_id)
);

create table locations (
location_id integer primary key,
street_address varchar(25),
postal_code varchar(12),
city varchar(30),
state_province varchar(12),
country_id char(2) ,
foreign key (country_id) references countries(country_id)
);

create table departments(
department_id integer primary key,
department_name varchar(20) not null,
manager_id integer ,
location_id integer ,
foreign key (location_id) references locations(location_id)
);


create table employees(
employee_id integer primary key,
first_name varchar(20),
last_name varchar(25),
email varchar(25),
phone_number varchar(20),
hire_date date,
job_id varchar(10) ,
salary integer,
commission_pct integer,
manager_id integer ,
department_id integer ,
foreign key (department_id) references departments(department_id),
foreign key (job_id) references jobs(job_id)
);

create table job_history (
employee_id integer,
start_date date,
end_date date,
job_id varchar(10),
department_id integer ,
primary key (employee_id, start_date),
foreign key (employee_id) references employees(employee_id),
foreign key (job_id) references jobs(job_id),
foreign key (department_id) references departments(department_id)
);

-- create table manger (
-- manager_id integer primary key,
-- manager_name varchar(50)
-- );
 
insert into jobs (job_id, job_title, min_salary ,max_salary) values ('st_clerk', 'clerk', 15000, 30000);
insert into jobs (job_id, job_title, min_salary ,max_salary) values ('mk_rep', 'rep', 9000, 21000);
insert into jobs (job_id, job_title, min_salary ,max_salary) values ('it_prog', 'prog', 15000, 45000);

insert into job_grades (grade_level, lowest_sal, highest_sal) values ('E', 5000, 10000);
insert into job_grades (grade_level, lowest_sal, highest_sal) values ('D', 11000, 16000);
insert into job_grades (grade_level, lowest_sal, highest_sal) values ('C', 17000, 22000);
insert into job_grades (grade_level, lowest_sal, highest_sal) values ('B', 23000, 28000);
insert into job_grades (grade_level, lowest_sal, highest_sal) values ('a', 29000, 50000);

insert into regions (region_id, region_name) values (1, 'region_A');
insert into regions (region_id, region_name) values (2, 'region_B');
insert into regions (region_id, region_name) values (3, 'region_C');

insert into countries (country_id, country_name, region_id) values ('DE', 'Germany', 1);
insert into countries (country_id, country_name, region_id) values ('IT', 'Italy', 1);
insert into countries (country_id, country_name, region_id) values ('JP', 'Japan', 3);
insert into countries (country_id, country_name, region_id) values ('US', 'United State', 2);
select * from countries;

insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
 values (1000, '1297 Via Cola di Rie', 989, 'Roma', '', 'IT');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
 values (1100, '93091 Calle della Te', 10934, 'Venice', '', 'IT');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
 values (1200, '2017 Shinjuku-ku', 1689, 'Tokyo', 'Tokyo JP', 'JP');
insert into locations (location_id, street_address, postal_code, city, state_province, country_id)
 values (1400, '2014 Jabberwocky Rd', 26192, 'Southlake', 'texas', 'US');
-- select *from locations;
-- update locations set country_id = 'JP' where location_id = 1200 ;

insert into departments (department_id, department_name, manager_id, location_id) values (10, 'Administration', 200, 1100);
insert into departments (department_id, department_name, manager_id, location_id) values (20, 'Marketing', 201, 1200);
insert into departments (department_id, department_name, manager_id, location_id) values (30, 'Purchasing', 202, 1400);

insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
 values (100, 'Steven', 'King', 'sking@gmail.com', '515-1234567', '1987-06-17', 'st_clerk', 24000.00, 0.00, 200, 10);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
 values (101, 'Neena', 'Kochhar', 'nkochhar@gmail.com', '515-1234568', '1987-06-18', 'mk_rep', 17000.00, 0.00, 201, 20);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
 values (102, 'Lex', 'De Haan', 'ldehaan@gmail.com', '515-1234569', '1987-06-19', 'it_prog', 17000.00, 0.00, 202, 30);
insert into employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
 values (103, 'Alexander', 'Hunold', 'ahunold@gmail.com', '515-4234567', '1987-06-20', 'mk_rep', 9000.00, 0.00, 105, 20);
-- select * from employees;
-- update employees set manager_id = 200 where employee_id = 100;

insert into job_history (employee_id, start_date, end_date, job_id, department_id) value (102, '1993-01-13', '1998-07-24', 'it_prog', 20);
insert into job_history (employee_id, start_date, end_date, job_id, department_id) value (101, '1989-09-21', '1993-10-27', 'mk_rep', 10);
insert into job_history (employee_id, start_date, end_date, job_id, department_id) value (101, '1993-10-28', '1997-03-15', 'mk_rep', 30);
insert into job_history (employee_id, start_date, end_date, job_id, department_id) value (100, '1996-02-17', '1999-12-19', 'st_clerk', 30);
insert into job_history (employee_id, start_date, end_date, job_id, department_id) value (103, '1998-03-24', '1999-12-31', 'mk_rep', 20);

-- 3.
select * from locations;

-- 4.
select employee_id, first_name, last_name from employees;

-- 5. 
select first_name, last_name, job_id, department_id
from employees where department_id in(
select department_id 
from departments where location_id = (
select location_id
from locations where country_id = 'JP'
)
);

-- 6.
-- 7.
select first_name, last_name, hire_date
from employees
where hire_date > (
select hire_date
from employees
where first_name = 'Lex' and last_name = 'De Haan'
);

-- 8. 
select d.department_name , count(1) as  number_of_employee
from departments d , employees e
where d.department_id = e.department_id
group by d.department_name;

-- 9. 
select e.employee_id, e.job_id, datediff(jh.end_date, jh.start_date) as days_between
from employees e
inner join job_history jh
on e.department_id = jh.department_id
where jh.department_id = 30;

-- 10. 
select department_name, city, country_name, concat(first_name, last_name) as manager_name
from employees e
inner join 
