-- List the following details of each employee: employee number, last name, first name, gender
-- and salary.
SELECT  e.emp_no, e.last_name, e.first_name, e.gender, s.salary
  FROM "Employees" e
  LEFT JOIN "Salaries" s ON e.emp_no = s.emp_no
;

---------------------------
-- List employees who were hired in 1986.
SELECT *
  FROM "Employees" e
-- WHERE e.hire_date BETWEEN '1986-01-01' AND '1986-12-31';
 WHERE EXTRACT(YEAR FROM e.hire_date) = 1986
;

---------------------------
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
-- This query list the managers of each department at any point in time
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
  FROM "Departments" d
  LEFT JOIN "Dept_Mgrs" dm ON d.dept_no = dm.dept_no
  LEFT JOIN "Employees" e ON dm.emp_no = e.emp_no
;

-- This query list the managers of each department CURRENTLY
SELECT d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name, dm.from_date, dm.to_date
  FROM "Departments" d
  LEFT JOIN "Dept_Mgrs" dm ON d.dept_no = dm.dept_no
  LEFT JOIN "Employees" e ON dm.emp_no = e.emp_no
 WHERE dm.to_date = '1/1/9999'
;

---------------------------
-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
-- This query list employees and their departments at any point in time
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
  FROM "Employees" e
  LEFT JOIN "Dept_Emp" de ON e.emp_no = de.emp_no
  LEFT JOIN "Departments" d ON de.dept_no = d.dept_no
;

-- This query list employees and their departments CURRENTLY
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
  FROM "Employees" e
  LEFT JOIN "Dept_Emp" de ON e.emp_no = de.emp_no
  LEFT JOIN "Departments" d ON de.dept_no = d.dept_no
 WHERE de.to_date = '1/1/9999'
;

---------------------------
-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT  *
  FROM "Employees" e
 WHERE first_name = 'Hercules'
   AND last_name LIKE 'B%'
;

---------------------------
-- List all employees in the Sales department, including their employee number, last name, 
-- first name, and department name.
-- This query list all employes that are or have been in Sales at any point in time
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
  FROM "Employees" e
  LEFT JOIN "Dept_Emp" de ON e.emp_no = de.emp_no
  LEFT JOIN "Departments" d ON de.dept_no = d.dept_no
 WHERE d.dept_name = 'Sales'
;

-- This query list all employes that CURRENTLY are in Sales
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
  FROM "Employees" e
  LEFT JOIN "Dept_Emp" de ON e.emp_no = de.emp_no
  LEFT JOIN "Departments" d ON de.dept_no = d.dept_no
 WHERE d.dept_name = 'Sales'
   AND de.to_date = '1/1/9999'
;

---------------------------
-- List all employees in the Sales and Development departments, including their employee number, 
-- last name, first name, and department name.
-- This query list all employes that are or have been in those Departments at any point in time
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
  FROM "Employees" e
  LEFT JOIN "Dept_Emp" de ON e.emp_no = de.emp_no
  LEFT JOIN "Departments" d ON de.dept_no = d.dept_no
 WHERE d.dept_name = 'Sales'
    OR d.dept_name = 'Development'
;

-- This query list all employes that CURRENTLY are in those Departments
SELECT  e.emp_no, e.last_name, e.first_name, d.dept_name
  FROM "Employees" e
  LEFT JOIN "Dept_Emp" de ON e.emp_no = de.emp_no
  LEFT JOIN "Departments" d ON de.dept_no = d.dept_no
 WHERE d.dept_name = 'Sales'
    OR d.dept_name = 'Development'
   AND de.to_date = '1/1/9999'
;

---------------------------
-- In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
SELECT e.last_name, count(*)
FROM "Employees" e
GROUP BY e.last_name
ORDER BY count(*) desc
;
