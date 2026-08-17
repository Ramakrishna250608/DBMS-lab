SQL> Create Table Student(StudentID int,Name varchar(30),Age int);

Table created.


SQL> Insert into Student values(1,'Alice',20);

1 row created.

SQL> Insert into Student values(2,'Bob',22);

1 row created.

SQL> Insert into Student values(3,'Charlie',21);

1 row created.


SQL> Create Table Courses(CourseID int,CourseName varchar(20));

Table created.


SQL> Insert into Courses values(101,'Math');

1 row created.

SQL> Insert into Courses values(102,'English');

1 row created.

SQL> Insert into Courses values(103,'History');

1 row created.


SQL> Create Table Enrollments(EnrollmentID int,StudentID int,CourseID int,Grade varchar(5));

Table created.


SQL> Insert into Enrollments values(1,1,101,'A');

1 row created.

SQL> Insert into Enrollments values(1,1,102,'B');

1 row created.

SQL> Insert into Enrollments values(2,1,102,'B');

1 row created.

SQL> Insert into Enrollments values(3,2,102,'A-');

1 row created.

SQL> Insert into Enrollments values(4,3,103,'B+');

1 row created.

SQL> Insert into Enrollments99 values(5,3,102,'A');

1 row created.



SQL> SELECT Student.StudentID,Student.Name,Student.Age,Courses.CourseID,Courses.CourseName,Enrollments.Grade FROM Student INNER JOIN Enrollments ON Student.StudentID=Enrollments.StudentID INNER JOIN Courses ON Enrollments.CourseID=Courses.CourseID;

 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        101
Math                 A

         3 Charlie                                21        102
English              A

         2 Bob                                    22        102
English              A-


 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        102
English              B

         3 Charlie                                21        103
History              B+



SQL> SELECT Student.StudentID,Student.Name,Student.Age,Courses.CourseID,Courses.CourseName,Enrollments.Grade FROM Student LEFT JOIN Enrollments ON Student.StudentID=Enrollments.StudentID LEFT JOIN Courses ON Enrollments.CourseID=Courses.CourseID;

 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        101
Math                 A

         3 Charlie                                21        102
English              A

         2 Bob                                    22        102
English              A-


 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        102
English              B

         3 Charlie                                21        103
History              B+



SQL> SELECT Student.StudentID,Student.Name,Student.Age,Courses.CourseID,Courses.CourseName,Enrollments.Grade FROM Courses RIGHT JOIN Enrollments ON Courses.CourseID=Enrollments.CourseID RIGHT JOIN Student ON Enrollments.StudentID=Student.StudentID;

 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        101
Math                 A

         3 Charlie                                21        102
English              A

         2 Bob                                    22        102
English              A-


 STUDENTID NAME                                  AGE   COURSEID
---------- ------------------------------ ---------- ----------
COURSENAME           GRADE
-------------------- -----
         1 Alice                                  20        102
English              B

         3 Charlie                                21        103
History              B+
