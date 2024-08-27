-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees e --Alternatively could have written 'employees AS e' to same effect.
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name,last_name, hire_date FROM employees WHERE hire_date >= DATE '1986-1-1' AND hire_date <= DATE '1986-12-31';
-- Information on date format in SQL found at https://support.teradata.com/community?id=community_question&sys_id=9c990b6b1b97fb00682ca8233a4bcbd3

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
FROM departments d
LEFT JOIN dept_manager dm
ON d.dept_no = dm.dept_no
LEFT JOIN employees e
ON dm.emp_no = e.emp_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no,e.emp_no,e.last_name,e.first_name,d.dept_name
FROM departments d
LEFT JOIN dept_emp de
ON d.dept_no = de.dept_no
LEFT JOIN employees e
ON de.emp_no = e.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex FROM employees WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--Information on WHERE LIKE found at https://www.w3schools.com/sql/sql_like.asp

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
SELECT emp_no,last_name,first_name FROM employees WHERE emp_no IN
 (SELECT emp_no FROM dept_emp WHERE dept_no IN
  (SELECT dept_no FROM departments WHERE dept_name = 'Sales'));
-- Alternatively, we could optimize the code by changing the second line to
-- "WHERE dept_no = 'd007'" and get the same results as this is the same thing the third line is doing already

-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no,e.last_name,e.first_name,d.dept_name 
FROM employees e 
LEFT JOIN dept_emp de
ON e.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005';

-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS Total FROM employees GROUP BY last_name ORDER BY Total DESC;
-- Included an alias for the count as total to make calling it in the ORDER BY clearer.