DROP TABLE IF EXISTS S;
DROP TABLE IF EXISTS P;
DROP TABLE IF EXISTS J;
DROP TABLE IF EXISTS sp;
CREATE TABLE S (`S#` CHAR(5) NOT NULL,Sname CHAR(20) , status SMALLINT , city CHAR(15));

INSERT INTO S (`S#` , Sname ,status , city) VALUES('S1','Smith',20,'London') , 
('S2','Jones',10,'Paris'),
('S3','Blake',30,'Paris'),
('S4','Clark',20,'London'),
('S5','Adams',30,'Athens') ;

CREATE TABLE P (`P#` CHAR(6) NOT NULL,Pname CHAR(20),color CHAR(6),weight SMALLINT,city CHAR(15));

INSERT INTO P (`P#`,Pname,color,weight,city) VALUES('P1','Nut','Red',12,'London'),
('P2','Bolt','Green',17,'Paris'),
('P3','Screw','Blue',17,'Rome'),
('P4','Screw','Red',14,'London'),
('P5','Cam','Blue',12,'Paris'),
('P6','Cog','Red',19,'London');

CREATE TABLE J (`J#` CHAR(4) NOT NULL,Jname CHAR(10),City CHAR(15));

INSERT INTO J(`J#`,Jname,City) VALUES('J1','Sorter','Paris'),
('J2','PUNCH','Rome'),
('J3','Reader','Athens'),
('J4','Console','Athens'),
('J5','Collator','London'),
('J6','Terminal','Oslo'),
('J7','Tape','London');

CREATE TABLE sp (`S#` CHAR(4) NOT NULL,`P#` CHAR(4),`J#` CHAR(4) NOT NULL,QTY INT);

INSERT INTO sp(`S#`,`P#`,`J#`,QTY) VALUES('S1','P1','J1',200),
('S1','P1','J4',700) ,
('S2','P3','J1',400) ,
('S2','P3','J2',200) ,
('S2','P3','J3',200) ,
('S2','P3','J4',500) ,
('S2','P3','J5',600),
('S2','P3','J6',400),
('S2', 'P3', 'J7', 800),
('S2','P5','J2',100),
('S3' ,'P3', 'J1', 200),
('S4', 'P6', 'J3', 300),
('S4', 'P6', 'J7', 300),
('S5','P2', 'J2', 200),
('S5', 'P2', 'J4', 100),
('S5', 'P5', 'J5', 500),
('S5', 'P5', 'J7', 100),
('S5', 'P6', 'J2', 200),
('S5', 'P1', 'J4', 100),
('S5', 'P3', 'J4', 200),
('S5', 'P4', 'J4', 800),
('S5' ,'P5', 'J4', 400),
('S5' ,'P6', 'J4' ,500);


select ename, hire, timestampdiff(year,hire,NOW()) expYears , timestampdiff(month,hire,NOW())%12 exyMonths,
timestampdiff(day ,
adddate(
    adddate(hire,interval timestampdiff(year,hire,NOW()) year ),interval timestampdiff(month,hire,NOW())%12 month),
    now()
) days
from emp;

-- emp is attending meeting. display ename and meeting no.
SELECT e.ename , em.meetno FROM emps e 
INNER JOIN emp_meeting em ON e.empno = em.empno ;

-- emp is attending meeting. display ename and meeting topic.

-- each emp is representing his dept. display ename and dname.
SELECT e.ename , d.dname FROM emps e INNER JOIN depts d ON e.deptno = d.deptno;

-- emp emp is working in some dept from his home. display ename, dname, and his tal.
select c.cname , s.sname , s.comm from customers c inner join salespeople s where comm>0.12 ; 

select s.sname , s.comm from customers c inner join salespeople s on s.snum = c.snum where c.rating>100;

-- Write a query that calculates the commission earned by each 
salesperson for orders placed by customers with a rating above 100.

select o.onum , o.amt*s.comm  from customers c inner join orders o on c.cnum = o.cnum  inner join salespeople s on s.snum = o.snum where c.rating>100;


select d.DEPARTMENT_NAME , e.FIRST_NAME , l.CITY from departments d  inner join employees e on d.DEPARTMENT_ID = e.DEPARTMENT_ID  inner join locations l on l.LOCATION_ID = d.LOCATION_ID where d.MANAGER_ID = e.EMPLOYEE_ID ;

select d.DEPARTMENT_NAME , e.FIRST_NAME , l.CITY ,c.COUNTRY_NAME from departments d  inner join employees e on d.DEPARTMENT_ID = e.DEPARTMENT_ID  inner join locations l on l.LOCATION_ID = d.LOCATION_ID inner join countries c on c.COUNTRY_ID = l.COUNTRY_ID  where d.MANAGER_ID = e.EMPLOYEE_ID ;

select rating from customers where snum = (select snum from salespeople where sname = 'Serres');

select amt , (select avg(amt) from orders) as avg_amt from orders;
select o.amt,c.cname,c.rating , (select avg(amt) from orders )as avg_amt  from orders o inner join customers c on o.cnum = c.cnum where amt>avg_amt;
