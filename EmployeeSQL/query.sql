select * from departments;

select * from employee;
select * from salaries;

--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
LEFT JOIN salaries
ON salaries.emp_no = employee.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employee.first_name, employee.last_name, employee.hire_date
FROM employee
where SPLIT_PART(employee.hire_date, '/', 3) = '86'

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, last name, first name.
select departments.dept_no,departments.dept_name,dept_manager.emp_no,
employee.last_name,employee.first_name
from departments
LEFT JOIN dept_manager
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employee
ON employee.emp_no = dept_manager.emp_no;

--4. List the department of each employee with the following information: employee number, 
--last name, first name, and department name.
select employee.emp_no, employee.last_name, employee.first_name,departments.dept_name
from employee
LEFT JOIN dept_emp
ON dept_emp.emp_no = employee.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
select employee.first_name, employee.last_name, employee.sex
from employee
where employee.first_name = 'Hercules'
and employee.last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
select dept_emp.emp_no , employee.last_name, employee.first_name,departments.dept_name
from dept_emp
LEFT JOIN employee
ON employee.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.
select dept_emp.emp_no , employee.last_name, employee.first_name,departments.dept_name
from dept_emp
LEFT JOIN employee
ON employee.emp_no = dept_emp.emp_no
LEFT JOIN departments
ON departments.dept_no = dept_emp.dept_no
where departments.dept_name = 'Sales' 
or departments.dept_name = 'Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many 
--employees share each last name.
select employee.last_name,
count (employee.last_name)  as frequency
from employee
group by employee.last_name
order by initcap(employee.last_name) DESC;


