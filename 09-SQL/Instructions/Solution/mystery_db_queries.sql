--1. List the following details of each employee: employee number, last name, first name, gender, and salary.


select e.emp_no as "employee number",e.last_name as "last name",
e.first_name as "first name", e.gender as gender , s.salary as salary from employees e  join salaries s 
on e.emp_no = s.emp_no ;

--2. List employees who were hired in 1986.


select * from employees e where extract(year from e.hire_date) = '1986';

--3. List the manager of each department with the following information :
-- department number, department name, the manager's employee number, 
--last name, first name, and start and end employment dates.


select dm.dept_no as "Department Number" , d.dept_name as "Department Name",
	dm.emp_no as "Manager's Employee Number", e.last_name as "last name",
	e.first_name as "first name", dm.from_date  as "Start Date", dm.to_date as "End Date"
from dept_manager dm 
	join departments d 
		on dm.dept_no =d.dept_no 
	join employees e 
		on dm.emp_no = e.emp_no;


--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.


select de.emp_no as "Employee Number", e.last_name  as "Last Name",
e.first_name  as "First Name",d.dept_name as "Department Name" 
from dept_emp de join employees e 
	on de.emp_no = e.emp_no
	join departments d
	on de.dept_no =d.dept_no;

	
--5. List all employees whose first name is "Hercules" and 
--last names begin with "B."

select e.first_name as "First Name", e.last_name as "Last Name" 
from employees e where e.first_name = 'Hercules' and e.last_name like 'B%';

--6. List all employees in the Sales department, including their 
--employee number, last name, first name, and department name.

select e.emp_no as "Employee Number", e.last_name as "Last Name", 
e.first_name as "First Name", d.dept_name as "Department Name"
from dept_emp de join employees e
on de.emp_no  = e.emp_no 
join departments d
on de.dept_no = d.dept_no 
where d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
select e.emp_no as "Employee Number", e.last_name as "Last Name", 
e.first_name as "First Name", d.dept_name as "Department Name"
from dept_emp de join employees e
on de.emp_no  = e.emp_no 
join departments d
on de.dept_no = d.dept_no 
where d.dept_name in ('Sales', 'Development');

--8. In descending order, list the frequency count of employee last names,
-- i.e., how many employees share each last name.
select e.last_name as "Last Name",count(e.last_name) as "Count" from employees as e group by e.last_name order by "Count" DESC;
