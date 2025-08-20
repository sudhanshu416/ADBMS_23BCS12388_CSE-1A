-- easy problem
-- create
CREATE TABLE TBL_AUTHORS (
  AUTH_ID int primary key,
  AUTH_NAME varchar(20)
);
CREATE TABLE TBL_BOOKS (
  BOOK_ID INT primary key,
  BOOK_NAME varchar(20),
  AUTH_ID int,
  foreign key (AUTH_ID) references TBL_AUTHORS(AUTH_ID)
)
-- insert
INSERT INTO TBL_AUTHORS VALUES (1, 'Fyodor Dostoevsky');
INSERT INTO TBL_AUTHORS VALUES (2, 'Franz Kafka');
INSERT INTO TBL_AUTHORS VALUES (3, 'J.K. Rowling');

INSERT INTO TBL_BOOKS VALUES (1, 'Metamorphosis',2);
INSERT INTO TBL_BOOKS VALUES (2, 'Harry Potter',3);
INSERT INTO TBL_BOOKS VALUES (3, 'Crime and Punishment',1);

-- fetch 

-- Select * from TBL_AUTHORS;
-- Select * from TBL_BOOKS;

-- Joins

-- INNER
-- outer (left and right and full)
-- exclusive (left and right)
-- self
-- 

Select TBL_BOOKS.BOOK_ID, TBL_BOOKS.BOOK_NAME ,TBL_AUTHORS.*
from TBL_AUTHORS
inner Join
TBL_BOOKS
on 
TBL_AUTHORS.AUTH_ID=TBL_BOOKS.AUTH_ID;



--medium problem

CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(100)
);

-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Department(DeptID)
);


-- Insert Departments
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Physics'),
(3, 'Mathematics'),
(4, 'Chemistry'),
(5, 'Biology');

-- Insert Courses
INSERT INTO Course VALUES
(101, 'Data Structures', 1),
(102, 'Operating Systems', 1),
(103, 'Quantum Mechanics', 2),
(104, 'Electromagnetism', 2),
(105, 'Linear Algebra', 3),
(106, 'Calculus', 3),
(107, 'Organic Chemistry', 3),
(108, 'Physical Chemistry', 4),
(109, 'Genetics', 5),
(110, 'Molecular Biology', 5);

Select DeptID, (select count(*) from course where course.DeptID=Department.DeptID) as Num_courses
from Department;

SELECT DEPTNAME
FROM DEPARTMENT
WHERE DEPTID IN (
    SELECT DEPTID
    FROM COURSE
    GROUP BY DEPTID
    HAVING COUNT(*) > 2
);
