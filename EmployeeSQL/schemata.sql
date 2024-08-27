-- Create departments table
CREATE TABLE departments (
  dept_no VARCHAR(255) PRIMARY KEY NOT NULL,
  dept_name VARCHAR(255)
);

-- Create titles table
CREATE TABLE titles (
  title_id VARCHAR(255) PRIMARY KEY NOT NULL,
  title VARCHAR(255)
);

-- Create employees table
CREATE TABLE employees (
  emp_no INT PRIMARY KEY NOT NULL,
  emp_title_id VARCHAR(255) NOT NULL,
  birth_date DATE,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  sex VARCHAR(255),
  hire_date DATE,
  FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- Create salaries table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);

-- Create dept-employees table
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR(255) NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Create dept-managers table
CREATE TABLE dept_manager (
  dept_no VARCHAR(255) NOT NULL,
  emp_no INT NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);