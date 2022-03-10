set echo on

set serveroutput on

spool d:setup.txt

/* ---------------
   A. Name and Email Address 
   --------------- */

-- IS 480 Semester Project - Due Final 
-- Nicholas Pickens 
-- 016248425 
-- Email: Nicholas.Pickens@student.csulb.edu

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
   Print all table structure and test data for IS 480 class
   --------------- */

/* ---------------
   B. Print all table structure 
   --------------- */

describe majors;
describe students;
describe courses;
describe schclasses;
describe prereq;
describe enrollments;
describe waitlist;

/* ---------------
   C. Print all test data 
   --------------- */

select * from majors;
select * from students;
select * from courses;
select * from schclasses;
select * from prereq;
-- enrollments and waitlist will display no records because test data has been commented out for testing addme and dropme procedures. 
select * from enrollments;
select * from waitlist;

-----
-----


/* ------------------------------------
   Beginning of IS 380 Semester Project 
   ------------------------------------ */

   /* ---------------
   D.  All Programs
   --------------- */

create or replace package ENROLL is

-- *** PART 1. ENROLL A STUDENT TO A CLASS ***

-- 1. Check student number.
 procedure CheckS#
	(p_snum IN students.snum%type,
		p_ErrorText OUT varchar2);  

-- Check student call number.
procedure CheckCall#
	(p_callnum IN schclasses.callnum%type,
		p_ErrorText OUT varchar2); 

-- 2. Check repeat enrollment.
 procedure Check_repeat_enrollment
    (p_snum IN students.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2); 

-- 3. Check double enrollment.
function Check_double_enrollment
    (p_snum students.snum%type,
    p_callnum schclasses.callnum%type)
    return varchar2;

-- 4. Check credit.
procedure CheckCr
	(p_snum IN students.snum%type,
	p_callnum IN schclasses.callnum%type,
	p_ErrorText OUT varchar2); 	

-- 5. Check standing requirement. 
procedure Check_standing
    (p_snum IN students.snum%type,
    p_callnum IN schclasses.callnum%type,
    p_ErrorText OUT varchar2);

-- 6. Check if student disqualified. 
function Check_qualification
    (p_snum students.snum%type,
    p_callnum schclasses.callnum%type)
    return varchar2;

-- 7. Check capacity. 
procedure CheckCap
	(p_callnum IN schclasses.callnum%type,
		p_ErrorText OUT varchar2); 

-- 9. Check repeat waitlist. 
procedure Check_repeat_waitlist
    (p_snum IN students.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2);

-- Main procedure AddMe. 	
procedure AddMe
	(p_snum IN students.snum%type,
	p_callnum IN enrollments.callnum%type,
		p_ErrorMsg OUT varchar2); 


-- *** PART 2. DROP A STUDENT FROM A CLASS ***

-- 2. Check if enrolled in the class. 
procedure Check_not_enrolled
    (p_snum IN enrollments.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2);

-- 3. Check if graded already. 
procedure Check_if_graded
    (p_snum IN enrollments.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2);


-- Main procedure DropMe
 procedure DropMe
    (p_snum IN students.snum%type,
    p_callnum IN schclasses.callnum%type); 
	 
End ENROLL;
/	 

create or replace package Body ENROLL is 

-- *** PART 1. ADD A STUDENT TO A CLASS ***

-- 1. Valid student number and valid call number: If thet student number or call number is invalid,
-- the system would print an error message and does not proceed with the following checks. 

-- The student must be a valid student.
procedure CheckS#
		(p_snum IN students.snum%type,
		p_ErrorText OUT varchar2) as
	  
		v_count number(3); 
	
begin 

	select count(*) into v_count
	from students
	where snum = p_snum;

	-- if no student with input snum, raise error.
	if v_count = 0 then
		p_ErrorText := 'Student number ' || p_snum || ' not found. ';
	end if;

end;

-- The Call number must be a valid call number.

procedure CheckCall#
	(p_callnum IN schclasses.callnum%type,
	p_ErrorText OUT varchar2) as 
	
	v_count number(3);
	
begin 
	
	select count(*) into v_count
	from schclasses
	where callnum = p_callnum;
	
    -- if no course with input callnum, raise error. 
	if v_count = 0 then
		p_ErrorText := 'Call number ' || p_callnum || ' not found. ';
	end if;

end;

-- 2. Repeat Enrollment: A student cannot enroll in the same Callnum again. The system
-- prints an error message if there is repeat enrollment. 
  procedure Check_repeat_enrollment
    (p_snum IN students.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2) as 

    v_currently_enrolled number(3);
    v_grade varchar2(2);

begin 
    -- check if the student is currently enrolled in course.
    select count(*) into v_currently_enrolled
    from enrollments
    where snum = p_snum
    and callnum = p_callnum;

    -- need separate begin/end for checking grade of student (or it will not check it). 
    begin 
    select grade into v_grade
    from enrollments
    where snum = p_snum
    and callnum = p_callnum; 

    -- exception if no grade found.
    -- if no grade is found it will raise errors. 
    exception
    when NO_DATA_FOUND then
        null;

    end;

    -- if student found enrolled in entered course number, raise error. 
    if v_currently_enrolled != 0 then 
        -- if withdrawn from class, give error. 
        if v_grade = 'W' then 
            p_ErrorText := 'You cannot enroll in this course again. You''ve recently dropped this course and received a grade of W. ';
        else
            -- if already enrolled in course then give error.
            p_ErrorText := 'Sorry. You are already enrolled in the course ' || p_callnum || '. ';
        end if;
    end if;  


end;

-- 3. Double Enrollment: A student cannot enroll in other section of the same course.
-- That is, if a student is already enrolled in IS 380 Section 1, he cannot be enrolled in
-- IS 380 Section 2. The system prints an error message if there is a repeat enrollment.

 function Check_double_enrollment
    (p_snum students.snum%type,
    p_callnum schclasses.callnum%type)
    return varchar2 is 

    rSchclasses schclasses%rowtype;
    v_count number(3);
    p_ErrorText varchar2(200);

begin 
    
    -- %rowtype page 56 in notes.
    -- select the entire schedule row for callnum.
    -- do not need exception for this as it always returns one row (if course found)
    select * into rSchclasses 
    from schclasses
    where callnum = p_callnum; 

    -- check if student is trying to enroll in other section of same course  
    -- by checking if schclasses matches the entire schedule row. 

    -- checks all but section. if all is equal except section, the student is trying to enroll in another section of the same course.
    select count(*) into v_count
    from schclasses sc, enrollments e 
    where e.snum = p_snum
    and sc.callnum = e.callnum
    and sc.year = rSchclasses.year
    and sc.semester = rSchclasses.semester
    and sc.dept = rSchclasses.dept
    and sc.cnum = rSchclasses.cnum;
    
    -- and e.grade is null;

    -- check if there's a match for another section
    -- if match then give error, else error is null. 
    if v_count != 0 then
        p_ErrorText := 'Sorry. You cannot enroll in another section of the same course in which you are already enrolled in. ';
    else 
        p_ErrorText := null;
    end if;
    return p_ErrorText;

end;

-- 4. 15-Hour Rule: A student can enroll in at most 15 credit hours per semester. 
-- The system prints an error message if the 15-hour rule is violated.

procedure CheckCr
	(p_snum IN students.snum%type,
	p_callnum IN schclasses.callnum%type,
	p_ErrorText OUT varchar2) as 
	
	v_Existing_CrHr number;
	v_ToAdd_CrHr number;
	
begin 
	-- find existing CrHr.
	select nvl(sum(CrHr), 0) into v_Existing_CrHr
	from enrollments e, schclasses sc, courses c
	where e.snum = p_snum
	and e.callnum = sc.callnum
	and sc.dept = c.dept 
	and sc.cnum = c.cnum
	and grade is null;
	
	-- find CrHr to add.
	select CrHr into v_ToAdd_CrHr
	from schclasses sc, courses c
	where sc.dept = c.dept
	and sc.cnum = c.cnum
	and sc.callnum = p_callnum; 

    -- if existing credits + new credits to add are greater than 15 limit, raise error.
	if v_Existing_CrHr + v_ToAdd_CrHr > 15 then
		p_ErrorText := 'Sorry. Limit of 15 credit hours exceeded. ';
	end if; 

end;

-- 5. Standing requirement: A student's standing must be equal or higher than the standing requirement
-- required by the course. 
procedure Check_standing
    (p_snum IN students.snum%type,
    p_callnum IN schclasses.callnum%type,
    p_ErrorText OUT varchar2) as

    v_stu_standing number(1);
    v_c_standing number(1);
    v_dept varchar2(3);
    v_cnum varchar2(3);

begin
    -- find the standing of student. 
    select standing into v_stu_standing
    from students
    where snum = p_snum;

    -- find the standing requirement of the course.
    select standing, c.dept, c.cnum into v_c_standing, v_dept, v_cnum
    from courses c, schclasses sc 
    where sc.callnum = p_callnum
    and sc.dept = c.dept
    and sc.cnum = c.cnum;

    -- if students standing is less than the standing required for course, raise error. 
    if v_stu_standing < v_c_standing then 
        p_ErrorText := 'Sorry. Your standing of ' || v_stu_standing || ' does not meet the requirements of the course ' || v_dept || ' ' || v_cnum || '. '; 
    end if;
end;

-- 6. Disqualified Student: When a non-freshman (standing other than 1) student's GPA is lower
-- than 2.0, the student is now in Disqualified status. A disqualified student cannot enroll
-- in any course.
function Check_qualification
    (p_snum students.snum%type,
    p_callnum schclasses.callnum%type)
    return varchar2 is 

    v_stu_standing number(1);
    v_stu_gpa number(2,1);
    p_ErrorText varchar2(200);

begin
    -- find the standing of student. 
    -- find the gpa of student.
    select standing, gpa into v_stu_standing, v_stu_gpa
    from students
    where snum = p_snum;

    -- if standing is greater than freshman and gpa is less than 2.0 give error.
    if v_stu_standing > 1 and v_stu_gpa < 2.0 then
        p_ErrorText := 'Sorry. You are disqualified from enrolling in any course at this time because your current GPA of ' || v_stu_gpa || ' is lower than the minimum requirement of 2.0. ';
    else 
        p_ErrorText := null;
    end if;
    return p_ErrorText;
end;

-- 7. Capacity: Each class has a capacity limit. This student can enroll only when after
-- his/her enrollment, the class size is kept within the capacity limit.  

 procedure CheckCap
	(p_callnum IN schclasses.callnum%type,
	p_ErrorText OUT varchar2) as
	
	v_max_capacity number(3);
	v_currently_enrolled number(3);

begin

-- check class capacity limit
	select capacity into v_max_capacity
	from schclasses
	where callnum = p_callnum;

-- check number of students currently enrolled 
	select count(*) into v_currently_enrolled
	from enrollments 
	where callnum = p_callnum
	and grade is null;  

    -- if the max capacity of the class is <= the amount currenty enrolled, raise error. 
	if v_max_capacity <= v_currently_enrolled then 
		p_ErrorText := 'Unable to add course number ' || p_callnum || '. Capacity limit reached. '; 
	end if;

end;

-- 9. Repeat waitlist: If the student is already on the waiting list for this CallNum, you should not 
-- place the student on the waiting list again. Print a message to let the student know.

procedure Check_repeat_waitlist
    (p_snum IN students.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2) as 

    v_count number(3);

begin
    select count(*) into v_count
    from waitlist
    where snum = p_snum
    and callnum = p_callnum;

    -- if student is already on waitlist, raise error. 
    if v_count != 0 then
        p_ErrorText := ('Student number ' || p_snum || ' is already on the waitlist for class number ' || p_callnum || '. ');
    end if;
end;
    
-- Main AddMe procedure.

procedure AddMe
	(p_snum IN students.snum%type,
	p_callnum IN enrollments.callnum%type,
	p_ErrorMsg OUT varchar2) as
	
	-- v_ErrorMsg varchar2(200);
	v_ErrorText varchar2(200); 

begin 
	
    -- Check if student number is valid.
	CheckS#(p_snum, v_ErrorText);
	p_ErrorMsg := v_ErrorText;
	
    -- Check if call number is valid. 
	CheckCall#(p_callnum, v_ErrorText);
	p_ErrorMsg := p_ErrorMsg || v_ErrorText;

    -- if there's no errors, proceed with following check.
    if p_ErrorMsg is null then 
        -- check if student is disqualified 
        p_ErrorMsg := Check_qualification(p_snum, p_callnum); 
    end if;

    -- if not disqualified, proceed with following checks. 
    -- rest of the checks should not go through if student is disqualified.
    if p_ErrorMsg is null then 
        -- Check for repeat enrollment. 
        Check_repeat_enrollment(p_snum, p_callnum, v_ErrorText);
        p_ErrorMsg := p_ErrorMsg || v_ErrorText;
    
        if p_ErrorMsg is null then
            -- Check for double enrollment.
            p_ErrorMsg := Check_double_enrollment(p_snum, p_callnum);
         end if;

        if p_ErrorMsg is null then
             -- check for 15-hour rule. 
             CheckCr(p_snum, p_callnum, v_ErrorText); 
		    p_ErrorMsg := p_ErrorMsg || v_ErrorText;
        end if;

        if p_ErrorMsg is null then 
            -- Check standing requirement. 
            Check_standing(p_snum, p_callnum, v_ErrorText);
            p_ErrorMsg := p_ErrorMsg || v_ErrorText;
        end if;

        -- if there are no errors to add student, continue to check class capacity.
        -- if class is at capacity, check repeat waitlist and add student to waitlist if not a repeat
        -- if class is not at capacity, enroll student to the course. 
        if p_ErrorMsg is null then 
            -- Check class capacity limit. 
            CheckCap(p_callnum, v_ErrorText); 
            p_ErrorMsg := p_ErrorMsg || v_ErrorText;

            -- if error is found in capacity, then try adding student to waitlist, else continue to enroll student.
            if p_ErrorMsg is not null then 

                -- error message stating the capacity of class in which student is attempting to enroll in has been reached already.
                -- dbms_output.put_line (p_ErrorMsg);
                -- this message should never print.
                -- error stored to continue to waitlist. 
                -- capacity of class should already be displayed.
                -- should proceed to adding student to waitlist. 

            -- 8. Waitlist: If this student has fulfilled all requirements but the class is full, then add
            -- his/her record to the waiting list. The system then prints "Student number xxxx is now on the 
            -- waiting list for class number xxxx". 
                            
                -- check if repeat add. 
                -- does not grab error message from capacity. 
                Check_repeat_waitlist(p_snum, p_callnum, v_ErrorText);
                p_ErrorMsg := v_ErrorText;
                            
                -- If student is not a repeat add, add to waitlist. 
                if p_ErrorMsg is null then 
                    insert into waitlist values(p_snum, p_callnum, sysdate);
                    commit;
                    dbms_output.put_line('Student number ' || p_snum || ' is now on the waitlist for class number ' || p_callnum || '. ');
                else 
                    -- 9. if student is a repeat add, print error from check_repeat_waitlist.
                    dbms_output.put_line(p_ErrorMsg);
                end if;
            else 
                -- Else if no errors, add student to enrollments. 
                insert into enrollments values (p_snum, p_callnum, null); 
		        commit; 
                -- 10. Print confirmation message if student is (finally) successfully enrolled in the course.
		        dbms_output.put_line ('Student number ' || p_snum || ' has been successfully enrolled in the course ' || p_callnum || '. '); 
            end if;
        else 
            -- if errors above, do not continue to check waitlist or attempt enrolling student and print error message.
            dbms_output.put_line (p_ErrorMsg);
        end if;
    else
        -- print error if input student number and call number are incorrect.
        -- also skip to this error if the student is disqualified from enrolling.
        dbms_output.put_line (p_ErrorMsg);
    end if;

end; 

-- *** PART 2. DROP A STUDENT FROM A CLASS ***

-- 2. Not Enrolled: If the student is not enrolled in this class, we cannot drop him. The system prints an error msg. 

procedure Check_not_enrolled
    (p_snum IN enrollments.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2) as 

    v_count number(3);
    
    begin 
        -- get information if student is enrolled in the class or not.
        -- 0 = not enrolled.
        -- >0 = enrolled.
        select count(*) into v_count
        from enrollments
        where snum = p_snum
        and callnum = p_callnum;

        -- if student is not enrolled in the desired course to drop, raise error. 
        if v_count = 0 then
	    	p_ErrorText := 'Error encountered. Student number ' || p_snum || ' not found to be enrolled in the course number '|| p_callnum || '. ';
	    end if;
    end; 

-- 3. Already Graded: If a grade is already assigned in this class, the student cannot drop. The system prints an error msg. 
procedure Check_if_graded
    (p_snum IN enrollments.snum%type,
    p_callnum IN enrollments.callnum%type,
    p_ErrorText OUT varchar2) as 

    v_grade varchar2(2);

    begin
        -- get grade for student and call number submitted. 
        select grade into v_grade 
        from enrollments
        where snum = p_snum
        and callnum = p_callnum;

        -- if a grade has been assigned, give error.
        if v_grade is not null then 
            p_ErrorText := 'You cannot drop this course. You''ve already received a grade of ' || v_grade || ' in course number ' || p_callnum ||'. ';
        end if;
    end;

-- Main DropMe procedure.

-- 4. Drop the Student: To drop a student from a course, system updates the GRADE of the enrollment to 'W'. A confirmation message is printed
-- 5. Once a studnet drops from a course, your program should proceed to check if there are any students on the waiting list.
-- If there is, you should move the student who requested the enrollment the earliest to the enrollment list.
-- 5(a). Note that a check on all enrollment requirements should be performed on this new enrollment.
-- 5(b). If this new student is enrolled, he/she should be removed from the waiting ist.
-- 5(c). If this student cannot enroll for any reason (for instance, he/she noe has too many units, etc),
-- his/her record should remain on the waiting list and you should attempt to enroll the next student on the waiting list.
-- Your program continues until either one student is enrolled or there is no (qualified) student on the waiting list. 

procedure DropMe
    (p_snum IN students.snum%type,
    p_callnum IN schclasses.callnum%type) as 

    v_ErrorMsg varchar2(200);
	v_ErrorText varchar2(200);  
    v_waitlist number(10);

    -- cursor for waitlist 
    -- order by requestedtime, so student who requested the enrollment earliest is moved.
    cursor cur_waitlist is 
        select *
        from waitlist 
        where callnum = p_callnum
        order by requestedtime;

    begin 
        -- Check if student number is valid.
	    CheckS#(p_snum, v_ErrorText);
	    v_ErrorMsg := v_ErrorText;
	
        -- Check if call number is valid. 
	    CheckCall#(p_callnum, v_ErrorText);
	    v_ErrorMsg := v_ErrorMsg || v_ErrorText;

        -- if there's no errors, proceed with following checks.
        if v_ErrorMsg is null then 
            -- Check if student is enrolled in class.
            Check_not_enrolled(p_snum, p_callnum, v_ErrorText);                       
            v_ErrorMsg := v_ErrorMsg || v_ErrorText;                      
        end if;

        if v_ErrorMsg is null then 
            -- Check if student has already received a grade for class. 
            Check_if_graded(p_snum, p_callnum, v_ErrorText);
            v_ErrorMsg := v_ErrorMsg || v_ErrorText; 
        end if;

        -- if no errors, continue to drop student from class, else raise error. 
        if v_ErrorMsg is null then
            -- 4. Drop student from class by updating enrollments 
            -- System updates the GRADE of the enrollment to a 'W'.
            update enrollments
            set grade = 'W'
            where snum = p_snum
            and callnum = p_callnum;
            commit;

            -- Print confirmation message of dropping course. 
            dbms_output.put_line('Student number ' || p_snum || ' has been successfully dropped from the course number ' || p_callnum || '. ');
            
            -- Once a student drops from a course, program will check if there are any students on waiting list
            select count(*) into v_waitlist
            from waitlist
            where callnum = p_callnum;

            -- 5. Cursor checks waitlist, if there is students on waitlist, it will move student who requested enrollment earliest to enrollments list.
            if v_waitlist != 0 then 
                -- 5a. Note that a check on all enrollment requirements should be performed on new enrollment(s). 
                for stu in cur_waitlist loop 
                    -- check all enrollment requirements of student(s) on waiting list by calling addme procedure. 
                    addme(stu.snum, stu.callnum, v_ErrorText);
                    v_ErrorMsg := v_ErrorText; 

                    -- Confirmation message will be printed if a student is added when AddMe procedure
                    -- is called in the DropMe procedure to ensure the enrollment does not go silent.
                    -- In "real life" scenario, DropMe message will be sent to student dropping and 
                    -- AddMe message will be sent to student on waitlist looking to enroll course.

                    -- if enrollment requirements are met, then proceed.
                    if v_ErrorMsg is null then 
                    -- 5b. If this new student is enrolled (no errors found), he/she should be removed from the waiting list.
                        delete 
                        from waitlist
                        where snum = stu.snum
                        and callnum = stu.callnum;
                        commit;

                        exit;
                    end if;
                    -- EXIT IF CONDITION AND CONTINUE LOOPING THROUGH WAITLIST.
                    -- 5c. If this student cannot enroll for any reason (for instance, he/she now has too many units, etc), his/her record
                    -- should remain on the waiting list and shoulad attempt to enroll the next student on the waiting list. 
                    -- Program continues until either one student is enrolled or there is no (qualified) student on the waiting list. 
                end loop;
            end if;
        else 
            -- If checks fail to drop a student, print error message. 
            dbms_output.put_line (v_ErrorMsg);
        end if;
    end;

End ENROLL;
/

