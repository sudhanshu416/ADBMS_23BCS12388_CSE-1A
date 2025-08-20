-- Q.1. organizational hierarchy explorer
-- create
CREATE TABLE TBL_EMPLOYEE (
  empId int primary key,
  name varchar(15) not null,
  dept varchar(10) not null,
  managerId int null,
  foreign key(managerId) references TBL_EMPLOYEE(empId)
);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (1, 'Clark', 'Sales', null);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (2, 'Dave', 'Accounting', 1);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (3, 'Ava', 'Accounting',1);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (4, 'Eve', 'Sales',2);
INSERT INTO TBL_EMPLOYEE(empId,name,dept,managerId) VALUES (5, 'Borris', 'Marketing',3);

select e.empId, e.name, ep.name, ep.dept from
TBL_EMPLOYEE as e
left outer join 
TBL_EMPLOYEE as ep
on e.managerid=ep.empId;


-- Q.2. 

CREATE TABLE tbl_year(
 ID INT,
 YEAR INT,
 NPV INT
)
INSERT INTO tbl_year(ID, YEAR, NPV) 
VALUES
(1,2018,100),
(7,2020,30),
(13,2019,40),
(1,2019,113),
(2,2008,121),
(3,2002,12),
(11,2020,99),
(7,2019,0);

CREATE TABLE tbl_query(
ID INT,
YEAR INT
);
INSERT INTO tbl_query(ID, YEAR) 
VALUES
(1,2019),
(2,2008),
(3,2009),
(7,2018),
(7,2019),
(7,2020),
(13,2019);


select tbl_query.id, tbl_query.year, isnull(tbl_year.npv,0) as NPV from
tbl_query 
left outer join
tbl_year
on tbl_year.id=tbl_query.id and tbl_year.year=tbl_query.year
order by tbl_query.id, tbl_query.year;
