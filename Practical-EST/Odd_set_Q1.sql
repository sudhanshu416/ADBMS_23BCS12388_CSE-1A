CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    dept_id INT,
    salary DECIMAL(10,2),
    manager_id INT NULL,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
CREATE TABLE projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
CREATE TABLE timesheet (
    emp_id INT,
    project_id INT,
    hours_logged INT,
    FOREIGN KEY (emp_id) REFERENCES employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'Finance'),
(30, 'IT'),
(40, 'Marketing');
INSERT INTO employees (emp_id, emp_name, dept_id, salary, manager_id) VALUES
(1, 'Alice', 30, 85000, NULL),  
(2, 'Bob', 30, 60000, 1),
(3, 'Charlie', 20, 55000, NULL), 
(4, 'David', 20, 40000, 3),
(5, 'Eva', 40, 45000, NULL),    
(6, 'Frank', 40, 35000, 5),
(7, 'Grace', 10, 30000, NULL);  
INSERT INTO projects (project_id, project_name, dept_id) VALUES
(100, 'Payroll System', 20),
(101, 'Website Revamp', 30),
(102, 'Recruitment Portal', 20),
(103, 'Brand Campaign', 40);
INSERT INTO timesheet (emp_id, project_id, hours_logged) VALUES
(1, 101, 20), 
(2, 101, 5), 
(3, 100, 6),    
(4, 100, 4),    
(4, 102, 3),
(5, 103, 5),
(6, 103, 4);

select e.emp_id, e.emp_name
from employees as e
where 
(Select sum(t.hours_logged) from timesheet as t where t.emp_id=e.emp_id)
>
(select avg(total) from (select 
(select sum(t2.hours_logged)
from timesheet as t2 where t2.project_id=p2.project_id) as total
from projects as p2 where p2.dept_id=e.dept_id) as tbl);




