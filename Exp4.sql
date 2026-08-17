SQL> Create Table customer(StudentID int,Name varchar(30),Age int,Address varchar(30),Salary int);

Table created.


SQL> Insert into customer values(1,'Ramesh',32,'Ahmadabad',2000);

1 row created.

SQL> Insert into customer values(2,'Khilan',25,'Delhi',1500);

1 row created.

SQL> Insert into customer values(3,'Kaushik',23,'Kolkata',2000);

1 row created.

SQL> Insert into customer values(4,'Chaitali',25,'Mumbai',6500);

1 row created.

SQL> Insert into customer values(5,'Hardik',27,'Bhopal',8500);

1 row created.

SQL> Insert into customer values(6,'Komal',22,'MP',4500);

1 row created.



SQL> select * from customer;

 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         1 Ramesh                                 32
Ahmadabad                            2000

         2 Khilan                                 25
Delhi                                1500

         3 Kaushik                                23
Kolkata                              2000


 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         4 Chaitali                               25
Mumbai                               6500

         5 Hardik                                 27
Bhopal                               8500

         6 Komal                                  22
MP                                   4500


6 rows selected.



SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  total_rows number(2);
  3  BEGIN
  4  UPDATE customer SET Salary=Salary+500;
  5  IF sql%notfound THEN
  6  dbms_output.put_line('No Customers Selected');
  7  ELSIF sql%found THEN
  8  total_rows:=sql%rowcount;
  9  dbms_output.put_line(total_rows||'Customers Selected');
 10  END IF;
 11  END;
 12  /

6 customers selected

PL/SQL procedure successfully completed.



SQL> Select * from customer;

 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         1 Ramesh                                 32
Ahmadabad                            2500

         2 Khilan                                 25
Delhi                                2000

         3 Kaushik                                23
Kolkata                              2500


 STUDENTID NAME                                  AGE
---------- ------------------------------ ----------
ADDRESS                            SALARY
------------------------------ ----------
         4 Chaitali                               25
Mumbai                               7000

         5 Hardik                                 27
Bhopal                               9000

         6 Komal                                  22
MP                                   5000


6 rows selected.



SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  c_id customer.StudentID%type;
  3  c_name customer.Name%type;
  4  c_addr customer55.Address%type;
  5  CURSOR c_customers IS
  6  SELECT StudentID,Name,Address
  7  FROM customer;
  8  BEGIN OPEN c_customers;
  9  LOOP
 10  FETCH c_customers INTO c_id,c_name,c_addr;
 11  EXIT WHEN c_customers%notfound;
 12  dbms_output.put_line(c_id||''||c_name||''||c_addr);
 13  END LOOP;
 14  CLOSE c_customers;
 15  END;
 16  /


1  Ramesh    Ahmadabad
2  Khilan    Delhi
3  Kaushik   Kota
4  Chaitali  Mumbai
5  Hardik    Bhopal
6  Komal     MP

PL/SQL procedure successfully completed.
