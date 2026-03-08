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
('S2','P3','J6',400);




