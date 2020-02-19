create table departments(
dept_no	varchar primary key NOT NULL,
dept_name varchar,
);
create table employees
(
emp_no	varchar primary key NOT NULL,
birth_date	date,
first_name varchar,
last_name	varchar,
gender	varchar,
hire_date date
);
create table salaries(
emp_no varchar,
salary varchar,
from_date date,
to_date date,
FOREIGN KEY (emp_no) references employees (emp_no)
);
create table titles(
emp_no varchar,
title varchar,
from_date date,
to_date date,
FOREIGN KEY (emp_no) references employees (emp_no)
);
create table dept_manager(
dept_no	varchar,
emp_no varchar,
from_date date,
to_date date,
FOREIGN KEY (emp_no) references employees (emp_no),
FOREIGN KEY (dept_no) references departments (dept_no)
);
create table dept_emp(
emp_no varchar,
dept_no	varchar,
from_date date,
to_date date,
FOREIGN KEY (emp_no) references employees (emp_no),
FOREIGN KEY (dept_no) references departments (dept_no)
);
select * from dept_emp
