set echo on

-----
-----

/* ---------------
   Create table structure for IS 480 class
   --------------- */

drop table waitlist;
drop table enrollments;
drop table prereq;
drop table schclasses;
drop table courses;
drop table students;
drop table majors;

-----
-----

create table MAJORS
	(major varchar2(3) Primary key,
	mdesc varchar2(30));
insert into majors values ('ACC','Accounting');
insert into majors values ('FIN','Finance');
insert into majors values ('IS','Information Systems');
insert into majors values ('MKT','Marketing');

create table STUDENTS 
	(snum varchar2(3) primary key,
	sname varchar2(10),
	standing number(1),
	major varchar2(3) constraint fk_students_major references majors(major),
	gpa number(2,1),
	major_gpa number(2,1));

insert into students values ('101','Andy',3,'IS',2.1,3.2);
insert into students values ('102','Betty',2,null,3.2,null);
insert into students values ('103','Cindy',3,'IS',2.5,3.5);
insert into students values ('104','David',1,'FIN',3.3,3.0);
insert into students values ('105','Ellen',2,null,2.8,null);
insert into students values ('106','Frank',3,'MKT',3.1,2.9);
insert into students values ('107','Nick',5,'IS',1.9,2.9);
insert into students values ('108','Bob',3,'IS',1.8,2.5);
insert into students values ('109','James',3,'IS',3.0,3.9);
insert into students values ('110','Emily',3,null,3.8,3.6);
insert into students values ('111','Corle',3,'IS',3.3,3.9);
insert into students values ('112','Taylor',4,'FIN',4.0,4.0);
insert into students values ('113','Gilbert',4,null,2.7,null);
insert into students values ('114','Kal',4,'MKT',3.1,2.9);
insert into students values ('115','Gisselle',4,'IS',2.8,2.9);
insert into students values ('116','Jason',3,'IS',3.0,3.0);
insert into students values ('117','Tao',3,null,2.8,null);
insert into students values ('118','Anna',4,'MKT',3.5,3.8);
insert into students values ('119','Nicholas',4,'IS',2.8,3.1);
insert into students values ('120','Coleton',4,'IS',3.1,3.0);
insert into students values ('121','Ashley',4,'IS',3.2,3.0);
insert into students values ('122','Alan',4,null,3.8,null);
insert into students values ('123','Kishen',4,'MKT',3.5,3.8);
insert into students values ('124','Anne',4,'IS',3.5,3.1);
insert into students values ('125','Jackson',4,'IS',3.1,3.0);

create table COURSES
	(dept varchar2(3) constraint fk_courses_dept references majors(major),
	cnum varchar2(3),
	ctitle varchar2(30),
	crhr number(3),
	standing number(1),
	primary key (dept,cnum));

insert into courses values ('IS','300','Intro to MIS',3,2);
insert into courses values ('IS','301','Business Communicatons',3,2);
insert into courses values ('IS','310','Statistics',3,2);
insert into courses values ('IS','320','Spreadsheet',3,3);
insert into courses values ('IS','340','Programming',3,3);
insert into courses values ('IS','345','Internet Applications',3,3);
insert into courses values ('IS','355','Telecommunications',3,3);
insert into courses values ('IS','456','Systems Security',3,3);
insert into courses values ('IS','380','Database',3,3);
insert into courses values ('IS','385','Systems Design',3,3);
insert into courses values ('IS','457','Wireless Systems',3,4);
insert into courses values ('IS','470','Bus Intelligence',3,4);
insert into courses values ('IS','480','Adv Database',3,4);
insert into courses values ('IS','482','Enterprise',3,4);
insert into courses values ('IS','485','Systems Project',3,4);

create table SCHCLASSES (
	callnum number(5) primary key,
	year number(4),
	semester varchar2(3),
	dept varchar2(3),
	cnum varchar2(3),
	section number(2),
	capacity number(3));

alter table schclasses 
	add constraint fk_schclasses_dept_cnum foreign key 
	(dept, cnum) references courses (dept,cnum);

insert into schclasses values (10110,2018,'Fa','IS','300',1,3);
insert into schclasses values (10115,2018,'Fa','IS','300',2,3);
insert into schclasses values (10120,2018,'Fa','IS','300',3,3);
insert into schclasses values (10125,2018,'Fa','IS','301',1,3);
insert into schclasses values (10130,2018,'Fa','IS','301',2,3);
insert into schclasses values (10135,2018,'Fa','IS','310',1,3);
insert into schclasses values (10140,2018,'Fa','IS','310',2,3);
insert into schclasses values (10145,2018,'Fa','IS','340',1,3);
insert into schclasses values (10150,2018,'Fa','IS','380',1,3);
insert into schclasses values (10155,2018,'Fa','IS','385',1,3);
insert into schclasses values (10160,2018,'Fa','IS','480',1,3);
insert into schclasses values (10170,2018,'Fa','IS','320',1,3);
insert into schclasses values (10180,2018,'Fa','IS','320',2,2);
insert into schclasses values (10190,2018,'Fa','IS','320',2,3);
insert into schclasses values (10200,2018,'Fa','IS','456',2,3);
insert into schclasses values (10225,2018,'Fa','IS','456',1,3);
insert into schclasses values (10250,2018,'Fa','IS','456',2,3);
insert into schclasses values (10275,2018,'Fa','IS','470',2,3);
insert into schclasses values (10300,2018,'Fa','IS','470',1,3);
insert into schclasses values (10325,2018,'Fa','IS','482',2,3);
insert into schclasses values (10340,2018,'Fa','IS','482',1,3);
insert into schclasses values (10360,2018,'Fa','IS','485',1,3);
insert into schclasses values (10365,2018,'Fa','IS','485',1,3);
insert into schclasses values (10375,2018,'Fa','IS','485',1,3);
insert into schclasses values (10385,2018,'Fa','IS','355',2,3);
insert into schclasses values (10395,2018,'Fa','IS','355',3,4);
insert into schclasses values (10400,2018,'Fa','IS','355',2,4);
insert into schclasses values (10425,2018,'Fa','IS','355',3,4);
insert into schclasses values (10475,2018,'Fa','IS','355',1,4);
insert into schclasses values (10550,2018,'Fa','IS','480',1,3);

create table PREREQ
	(dept varchar2(3),
	cnum varchar2(3),
	pdept varchar2(3),
	pcnum varchar2(3),
	primary key (dept, cnum, pdept, pcnum));
alter table Prereq 
	add constraint fk_prereq_dept_cnum foreign key 
	(dept, cnum) references courses (dept,cnum);
alter table Prereq 
	add constraint fk_prereq_pdept_pcnum foreign key 
	(pdept, pcnum) references courses (dept,cnum);

insert into prereq values ('IS','380','IS','300');
insert into prereq values ('IS','380','IS','301');
insert into prereq values ('IS','380','IS','310');
insert into prereq values ('IS','385','IS','310');
insert into prereq values ('IS','340','IS','300');
insert into prereq values ('IS','480','IS','380');

create table ENROLLMENTS (
	snum varchar2(3) constraint fk_enrollments_snum references students(snum),
	callnum number(5) constraint fk_enrollments_callnum references schclasses(callnum),
	grade varchar2(2),
	primary key (snum, callnum));

/* insert into enrollments values (101,10110,'A'); */
/* insert into enrollments values (101,10150,'B');	
insert into enrollments values (101,10125,'C');
insert into enrollments values (102,10110,'A');
insert into enrollments values (102,10125,'B');
insert into enrollments values (102,10130,'B');
insert into enrollments values (103,10120,null);
insert into enrollments values (103,10110,null);
insert into enrollments values (103,10125,null);
insert into enrollments values (103,10150,null);
insert into enrollments values (103,10155,null);	
insert into enrollments values (104,10150,'A');
insert into enrollments values (104,10125,'A');
insert into enrollments values (104,10155,'A');
insert into enrollments values (105,10150,'C');
insert into enrollments values (105,10125,'C');
insert into enrollments values (105,10155,'C');
insert into enrollments values (103,10550,null); */

/* insert into enrollments values (106,10150,'B');
   insert into enrollments values (106,10155,'B'); */


create table WAITLIST (
	-- ranking number(3),
	snum varchar2(3) constraint fk_waitlist_snum references students(snum),
	callnum number(5) constraint fk_waitlist_callnum references schclasses(callnum),
	requestedtime date,
	constraint fk_waitlist_pk primary key(snum, callnum));


/* insert into waitlist values (1, 107, 10110, 'George', '2010-01-01 10:20:44');
insert into waitlist values (2, 103, 10110, 'Cindy', '2010-01-01 11:40:44');
insert into waitlist values (3, 104, 10110, 'David', '2010-01-01 14:20:44');
insert into waitlist values (4, 106, 10110, 'Frank', '2010-01-01 16:20:44');

insert into waitlist values (1, 106, 10550, 'Frank', '2010-01-01 10:20:44');
insert into waitlist values (2, 102, 10550, 'Betty', '2010-01-01 17:20:44');
insert into waitlist values (1, 101, 10115, 'Andy', '2010-01-01 10:20:44');
insert into waitlist values (2, 103, 10115, 'Cindy', '2010-01-01 11:40:44');
insert into waitlist values (3, 104, 10115, 'David', '2010-01-01 14:20:44');
insert into waitlist values (4, 106, 10115, 'Frank', '2010-01-01 16:20:44'); */

commit;

-----
-----

/* ---------------
   Print table structure and test data for IS 480 class
   --------------- */

-- Print table structure 
describe majors;
describe students;
describe courses;
describe schclasses;
describe prereq;
describe enrollments;
describe waitlist;

-- Print test data
select * from majors;
select * from students;
select * from courses;
select * from schclasses;
select * from prereq;
select * from enrollments;
select * from waitlist;

-----
-----