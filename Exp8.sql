SQL> CREATE TABLE customerz(id INT PRIMARY KEY,name VARCHAR(50),age INT, address VARCHAR(50),salary INT);

Table created.


SQL> INSERT INTO customerz values (1,'EZHIL',23,'AAA',20000);

1 row created.

SQL> INSERT INTO customerz values (2,'AARTHI',24,'BBB',30000);

1 row created.

SQL> INSERT INTO customerz values (3,'SUMATHI',24,'CCC',35000);

1 row created.

SQL> INSERT INTO customerz values (4,'VIJI',21,'DDD',40000);

1 row created.

SQL> INSERT INTO customerz values (5,'PRIYA',21,'EEE',43000);

1 row created.

SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  c_id customerz.id%type:=5;
  3  c_name customerz.name%type;
  4  c_addr customerz.address%type;
  5  BEGIN
  6  SELECT name, address INTO c_name, c_addr
  7  FROM customerz where id=c_id;
  8  dbms_output.put_line('name:' || c_name);
  9  dbms_output.put_line('address:' || c_addr);
 10  EXCEPTION
 11  WHEN no_data_found THEN
 12  dbms_output.put_line('no such customer!');
 13  WHEN others THEN
 14  dbms_output.put_line('error!');
 15  END;
 16  /
name:PRIYA
address:EEE

PL/SQL procedure successfully completed.

SQL> SELECT * FROM customerz;

        ID NAME                                                      AGE
---------- -------------------------------------------------- ----------
ADDRESS                                                SALARY
-------------------------------------------------- ----------
         1 EZHIL                                                      23
AAA                                                     20000

         2 AARTHI                                                     24
BBB                                                     30000

         3 SUMATHI                                                    24
CCC                                                     35000


        ID NAME                                                      AGE
---------- -------------------------------------------------- ----------
ADDRESS                                                SALARY
-------------------------------------------------- ----------
         4 VIJI                                                       21
DDD                                                     40000

         5 PRIYA                                                      21
EEE                                                     43000




SQL> DECLARE
  2  c_id customerz.id%type :=&cc_id;
  3  c_name customerz.name%type; c_addr customerz.address%type;
  4  ex_invalid_id EXCEPTION;
  5  BEGIN
  6  IF c_id<= 0 THEN RAISE ex_invalid_id;
  7  ELSE
  8  SELECT name, address INTO c_name, c_addr FROM customerz WHERE id = c_id;
  9  DBMS_OUTPUT.PUT_LINE ('Name: '|| c_name);
 10  DBMS_OUTPUT.PUT_LINE ('Address: ' || c_addr);
 11  END IF;
 12  EXCEPTION
 13  WHEN ex_invalid_id THEN
 14  dbms_output.put_line('ID must be greater than zero!');
 15  WHEN no_data_found THEN dbms_output.put_line('No such customer!');
 16  WHEN others THEN dbms_output.put_line('Error!');
 17  END;
 18  /
Enter value for cc_id: -6
old   2: c_id customerz.id%type :=&cc_id;
new   2: c_id customerz.id%type :=-6;
ID must be greater than zero!

PL/SQL procedure successfully completed.
