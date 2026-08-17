SQL> Create Table Student(StudentID int PRIMARY KEY, Name varchar(30), Age int);

Table created.


SQL> Insert into Student values(1,'Alice', 20);

1 row created.

SQL> Insert into Student values(2,'Bob', 22);

1 row created.

SQL> Insert into Student values(3,'Charlie', 21);

1 row created.

SQL> Insert into Student values(4,'David', 19);

1 row created.


SQL> Create Table Courses (CourseID int PRIMARY KEY, CourseName varchar(20));

Table created.


SQL> Insert into Courses values (101, 'Database Management');

1 row created.

SQL> Insert into Courses values (102, 'Algorithms');

1 row created.

SQL> Insert into Courses values (103, 'Web Development');

1 row created.


SQL> Create Table Enrollments (StudentID int REFERENCES Student(StudentID), CourseID int REFERENCES Courses(CourseID));

Table created.


SQL> Insert into Enrollments values(1,101);

1 row created.

SQL> Insert into Enrollments values(1,102);

1 row created.

SQL> Insert into Enrollments values(2,102);

1 row created.

SQL> Insert into Enrollments values(3,101);

1 row created.

SQL> Insert into Enrollments values(3,103);

1 row created.


SQL> SELECT * FROM Student;

 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
         1 Alice                                  20
         2 Bob                                    22
         3 Charlie                                21
         4 David                                  19


SQL> SELECT Name, Age FROM Student WHERE Age > 20;

NAME                                  AGE
------------------------------ ----------
Bob                                    22
Charlie                                21


SQL> SELECT Name FROM Student WHERE StudentID IN (SELECT StudentID FROM Enrollments WHERE CourseID = (SELECT CourseID FROM Courses WHERE CourseName = 'Database Management'));

NAME
------------------------------
Alice
Charlie


SQL> SELECT CourseID, CourseName FROM Courses WHERE CourseID IN (SELECT CourseID FROM Enrollments GROUP BY CourseID HAVING COUNT(*)>1);

  COURSEID COURSENAME
---------- --------------------
       101 Database Management
       102 Algorithms


SQL> SELECT AVG(Age) AS AverageAge FROM Student;

AVERAGEAGE
----------
      20.5


SQL> SELECT Name, Age FROM Student WHERE Age>(SELECT AVG(Age) FROM Student);

NAME                                  AGE
------------------------------ ----------
Bob                                    22
Charlie                                21
