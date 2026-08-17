SQL> Create Table customer(Sid int PRIMARY KEY, SName varchar(30), Salary int);

Table created.


SQL> Insert into customer values(1,'Aarthi', 300);

1 row created.

SQL> Insert into customer values(2,'Ramya', 500);

1 row created.

SQL> Insert into customer values(3,'Sakthi', 670);

1 row created.



SQL> select * from customer;

       SID SNAME                              SALARY
---------- ------------------------------ ----------
         1 Aarthi                                300
         2 Ramya                                 500
         3 Sakthi                                670



SQL> CREATE OR REPLACE TRIGGER up_classh
  2  BEFORE UPDATE ON customer
  3  FOR EACH ROW
  4  BEGIN
  5  if updating then
  6  DBMS_OUTPUT.PUT_LINE('new value is'|| :new.salary);
  7  DBMS_OUTPUT.PUT_LINE('old value is'|| :old.salary);
  8  END IF;
  9  END;
 10  /

Trigger created.



SQL> Update customer set salary=500 where Sid=1;

1 row updated.



SQL> select * from customer;

       SID SNAME                              SALARY
---------- ------------------------------ ----------
         1 Aarthi                                500
         2 Ramya                                 500
         3 Sakthi                                670



SQL> CREATE OR REPLACE TRIGGER del_classd
  2  BEFORE DELETE ON customer
  3  FOR EACH ROW
  4  BEGIN
  5  DBMS_OUTPUT.PUT_LINE('row deleted');
  6  END;
  7  /

Trigger created.



SQL> Delete from customer where Sid=2;

1 row deleted.



SQL> select * from customer;

       SID SNAME                              SALARY
---------- ------------------------------ ----------
         1 Aarthi                                500
         3 Sakthi                                670



SQL> Create Table customer(Sid int PRIMARY KEY, SName varchar(30), Sdept varchar(4),Stotal int,Grade varchar(3));

Table created.



SQL> CREATE OR REPLACE TRIGGER ins_classn
  2  BEFORE INSERT ON customer
  3  FOR EACH ROW
  4  DECLARE
  5  InvTot EXCEPTION;
  6  BEGIN
  7  IF:new.stotal>1000
  8  THEN
  9  RAISE InvTot;
 10  end if;
 11  EXCEPTION
 12  when InvTot then
 13  RAISE_APPLICATION_ERROR(-20000,'Total not valid');
 14  END;
 15  /

Trigger created.



SQL> Insert into customer values(3,’vino’,’it’,500,’a’);

1 row created.


SQL> Insert into customer values(4,’bala’,’it’,20000,’a’);
insert into customer values(4,'bala','it',20000,'a')
            *
ERROR at line 1:
ORA-20000: Total not valid
ORA-06512: at "SYSTEM.INS_CLASSN", line 10
ORA-04088: error during execution of trigger 'SYSTEM.INS_CLASSN'
