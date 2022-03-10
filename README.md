<h2 align="center">IS480 Final Project</h4>

<h4 align="center">California State University, Long Beach</h4>

<h4 align="center">Fall 2018</h4>

<h4 align="center">IS 480 - Advanced Database Systems</h4>

<h4 align="center">Semester Project</h4>

<h3 align="center">Enrollment System</h4>


The project requires you to
  1) analyze the folowing requirements
  2) program the following business logic in a PL/SQL package

**General Requirements**
  1) Your table/column names should be **exactly the same** as the BeachBoard. **CreateIS480tables.sql** script. You **may add** new tables/columns if needed, but you cannot change existing table and column names. You may add new test records.
  2) You need to create a **package** called **ENROLL**. the following 2 procedures should be stored in this package.
  3) The procedure name and parameters should be **exactly** as specified below.

<h3 align="left">The AddMe procedure</h3>

<h4 align="left">Enroll.AddMe(p_snum, p_callnum, p_ErrorMsg)</h4>

This procedure is to enroll a student (SNum) to a class (CallNum). The procedure has 2 IN parameters, p_snum and p_callnum and 1 OUT parameter p_ErrorMsg.

1. **Valid student number and valid call number**: If the student number or call number is invalid, the system would print an error message and does not proceed with the following checks.
2. **Repeat Enrollment**: A student cannot enroll in the same CallNum again. The system prints an error message if there is repeat enrollment.
3. **Double Enrollment**: A studnet cannot enroll in other section of the same course. That is, if a student is already enrolled in IS 380 Section 1, he cannot be enrolled in IS 380 Section 2. The system prints an error message if there is a double enrollment.
4. **15-Hour Rule**: A student can enroll in at most 15 credit hours per semester. The system prints an error message if the 15-hour rule is violated.
5. **Standing Requirement**: A student's standing must be equal or higher than the stnading requirement required by the course.
6. **Disqualified Student**: When a non-freshman (standing other than 1) student's GPA is lower than 2.0, the student is now in Disqualified status. A Disqualified student cannot enroll in any course.
7. **Capacity**: Each class has a capacity limit. This student can enroll only when after his/her enrollment, the class size is kept within the capacity limit.
8. **Wait List**: If tihs student has fulfilled all requirements but the class is full, then add his/her record to the waiting list. The system then prints "Student number xxxx is now on the waiting list for class number xxxx."
9. **Repeat waitlist**: If the student is already on the waiting list for this CallNum, you should not place the student on the waiting list again. Print a message to let the student know.
10. A confirmation message is printed if the student is (finally) successfully enrolled in the course.
11. Your program should check all requirements and store the error messages in p_ErrorMsg. If there is no error, p_ErrorMsg is NULL. The system should also print the error message.

<h3 align="left">The DropMe procedure</h3>

<h4 align="left">Enroll.DropMe(p_snum, p_callnum)</h4>

This procedure is to DROP a student from a class.

1. **Valid student number and valid call number**: If the student number or call number is invalid, the system would pritn an error message and does not proceed with the following checks.
2. **Not Enrolled**: If the student is not enrolled in this class, we cannot drop him. The system prints an error msg.
3. **Already Graded**: If a grade is already assigned in this class, we cannot drop him. The system prints an error msg.
4. **Drop the Student**: To drop a student from a course, system updates the GRADE of the enrollment to 'W'. A confirmation message is printed.
5. Once a student drops from a course, your program should proceed to check if there are any students on the waiting list. If there is, you should move the student who requested the enrollment the earliest to the enrollment list.
<br /> 5a. Note that a check on all enrollment requirements should be performed on this new enrollment.
<br /> 5b. If this new student is enrolled, he/she should be removed from the waiting list.
<br /> 5c. If this student cannot enroll for any reason (for instance, he/she now has too many units, etc), his/her record should remain on the waiting list and you should attempt to enroll the next student on the waiting list. Your program continues until either one student is enrolled or there is no (qualified) student on the waiting list.
