SQL> CREATE SEQUENCE student_seq START WITH 1 INCREMENT BY 1;

Sequence created.


SQL> CREATE TABLE student(student_id INT PRIMARY KEY,student_name VARCHAR(100),student_email VARCHAR(100));

Table created.


SQL> INSERT INTO student(student_id,student_name,student_email)VALUES(student_seq.NEXTVAL,'Alice Johnson','alice@example.com');

1 row created.


SQL> INSERT INTO student(student_id,student_name,student_email)VALUES(student_seq.NEXTVAL,'Bob Smith','bob@example.com');

1 row created.


SQL> INSERT INTO student(student_id,student_name,student_email)VALUES(student_seq.NEXTVAL,'Charlie Brown','charlie@example.com');

1 row created.


SQL> CREATE VIEW student_view AS SELECT student_id,student_name,student_email From student;

View created.


SQL> INSERT INTO student(student_id,student_name,student_email)VALUES(student_seq.NEXTVAL,'Diana Prince','diana@example.com');

1 row created.


SQL> UPDATE student SET student_email='new_bob@example.com' WHERE student_name='Bob Smith';

1 row updated.


SQL> DELETE FROM student WHERE student_name='Charlie Brown';

1 row deleted.


SQL> CREATE INDEX idx_student_email ON student(student_email);

Index created.


SQL> SELECT * FROM student_view;

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
         1
Bob Smith
new_bob@example,com

         3
Diana Prince
diana@example.com

STUDENT_ID
----------
STUDENT_NAME
--------------------------------------------------------------------------------
STUDENT_EMAIL
--------------------------------------------------------------------------------
