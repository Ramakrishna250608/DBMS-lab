SQL> CREATE TABLE employeepersonaldetails (id INT PRIMARY KEY, name VARCHAR(30) NOT NULL,
age INT NOT NULL, mobilenumber NUMBER(10) NOT NULL UNIQUE);

Table created.

SQL> INSERT INTO employeepersonaldetails VALUES (1, 'Ajay',    20, 9876543210);

1 row created.

SQL> INSERT INTO employeepersonaldetails VALUES (2, 'Brindha', 20, 9874563210);

1 row created.

SQL> INSERT INTO employeepersonaldetails VALUES (3, 'Kumaran', 20, 9673443210);

1 row created.

SQL> SELECT * FROM employeepersonaldetails;

        ID NAME                                  AGE MOBILENUMBER
---------- ------------------------------ ---------- ------------
         1 Ajay                                   20   9876543210
         2 Brindha                                20   9874563210
         3 Kumaran                                20   9673443210

SQL> COMMIT;

Commit complete.

SQL> INSERT INTO employeepersonaldetails VALUES (4, 'Archana', 20, 9876543410);

1 row created.

SQL> SELECT * FROM employeepersonaldetails;

        ID NAME                                  AGE MOBILENUMBER
---------- ------------------------------ ---------- ------------
         1 Ajay                                   20   9876543210
         2 Brindha                                20   9874563210
         3 Kumaran                                20   9673443210
         4 Archana                                20   9876543410

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM employeepersonaldetails;

        ID NAME                                  AGE MOBILENUMBER
---------- ------------------------------ ---------- ------------
         1 Ajay                                   20   9876543210
         2 Brindha                                20   9874563210
         3 Kumaran                                20   9673443210

SQL> INSERT INTO employeepersonaldetails VALUES (5, 'Braham', 20, 9878953210);

1 row created.

SQL> SAVEPOINT a;

Savepoint created.

SQL> INSERT INTO employeepersonaldetails VALUES (6, 'Srimathi', 20, 9678953210);

1 row created.

SQL> SAVEPOINT b;

Savepoint created.

SQL> SELECT * FROM employeepersonaldetails;

        ID NAME                                  AGE MOBILENUMBER
---------- ------------------------------ ---------- ------------
         1 Ajay                                   20   9876543210
         2 Brindha                                20   9874563210
         3 Kumaran                                20   9673443210
         5 Braham                                 20   9878953210
         6 Srimathi                               20   9678953210

SQL> ROLLBACK TO a;

Rollback complete.

SQL> SELECT * FROM employeepersonaldetails;

        ID NAME                                  AGE MOBILENUMBER
---------- ------------------------------ ---------- ------------
         1 Ajay                                   20   9876543210
         2 Brindha                                20   9874563210
         3 Kumaran                                20   9673443210
         5 Braham                                 20   9878953210

SQL> COMMIT;

Commit complete.

SQL> CREATE TABLE account (accno INT PRIMARY KEY, cname VARCHAR(20), balance NUMBER(10,2));

Table created.

SQL> INSERT INTO account VALUES (101, 'Ajay', 5000);

1 row created.

SQL> INSERT INTO account VALUES (102, 'Brindha', 3000);

1 row created.

SQL> COMMIT;

Commit complete.

SQL> UPDATE account SET balance = balance - 1000 WHERE accno = 101;

1 row updated.

SQL> SAVEPOINT debited;

Savepoint created.

SQL> UPDATE account SET balance = balance + 1000 WHERE accno = 102;

1 row updated.

SQL> SELECT * FROM account;

     ACCNO CNAME                   BALANCE
---------- -------------------- ----------
       101 Ajay                       4000
       102 Brindha                    4000

SQL> ROLLBACK TO debited;

Rollback complete.

SQL> SELECT * FROM account;

     ACCNO CNAME                   BALANCE
---------- -------------------- ----------
       101 Ajay                       4000
       102 Brindha                    3000

SQL> ROLLBACK;

Rollback complete.

SQL> SELECT * FROM account;

     ACCNO CNAME                   BALANCE
---------- -------------------- ----------
       101 Ajay                       5000
       102 Brindha                    3000

SQL> CREATE USER student2 IDENTIFIED BY student2pwd;

User created.

SQL> GRANT CREATE SESSION TO student2;

Grant succeeded.

SQL> CONNECT student2/student2pwd
Connected.
SQL> SELECT * FROM system.employeepersonaldetails;
SELECT * FROM system.employeepersonaldetails
                     *
ERROR at line 1:
ORA-00942: table or view does not exist


SQL> CONNECT system/&&sys_pwd
Enter value for sys_pwd: ifet
Connected.

SQL> GRANT SELECT ON employeepersonaldetails TO student2;

Grant succeeded.

SQL> SELECT grantee, table_name, privilege FROM user_tab_privs_made WHERE grantee = 'STUDENT2';

GRANTEE                        TABLE_NAME
------------------------------ ------------------------------
PRIVILEGE
----------------------------------------
STUDENT2                       EMPLOYEEPERSONALDETAILS
SELECT


SQL> CONNECT student2/student2pwd
Connected.

SQL> SELECT * FROM system.employeepersonaldetails;

        ID NAME                                  AGE MOBILENUMBER
---------- ------------------------------ ---------- ------------
         1 Ajay                                   20   9876543210
         2 Brindha                                20   9874563210
         3 Kumaran                                20   9673443210
         5 Braham                                 20   9878953210

SQL> INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001);
INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001)
                   *
ERROR at line 1:
ORA-01031: insufficient privileges


SQL> CONNECT system/&&sys_pwd
Connected.

SQL> GRANT INSERT ON employeepersonaldetails TO student2;

Grant succeeded.

SQL> CONNECT student2/student2pwd
Connected.

SQL> INSERT INTO system.employeepersonaldetails VALUES (7, 'Test', 20, 9000000001);

1 row created.

SQL> ROLLBACK;

Rollback complete.

SQL> CONNECT system/&&sys_pwd
Connected.

SQL> REVOKE INSERT ON employeepersonaldetails FROM student2;

Revoke succeeded.

SQL> REVOKE SELECT ON employeepersonaldetails FROM student2;

Revoke succeeded.

SQL> CONNECT student2/student2pwd
Connected.

SQL> SELECT * FROM system.employeepersonaldetails;
SELECT * FROM system.employeepersonaldetails
                     *
ERROR at line 1:
ORA-00942: table or view does not exist
