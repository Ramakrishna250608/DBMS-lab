SQL> SET SERVEROUTPUT ON;
SQL> CREATE OR REPLACE PROCEDURE Sum_Proc(a IN number,b IN number)IS c number;
  2  BEGIN
  3  c:=a+b;
  4  dbms_output.put_line('Sum of two nos='||c);
  5  End Sum_Proc;
  6  /

Procedure created.



SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  x number;y number;
  3  BEGIN
  4  x:=&x;
  5  y:=&y;Sum_Proc(x,y);
  6  END;
  7  /

Enter value for x: 6
old   4: x:=&x;
new   4: x:=6;
Enter value for y: 5
old   5: y:=&y;Sum_Proc(x,y);
new   5: y:=5;Sum_Proc(x,y);
Sum of two nos=11

PL/SQL procedure successfully completed.



SQL> SET SERVEROUTPUT ON;
SQL> CREATE OR REPLACE FUNCTION Sum_Func(a IN number,b IN number)RETURN number IS c number;
  2  BEGIN
  3  c:=a+b;RETURN c;
  4  END Sum_Func;
  5  /

Function created.



SQL> SET SERVEROUTPUT ON;
SQL> DECLARE
  2  no1 number;
  3  no2 number;
  4  result
  5  number;
  6  BEGIN
  7  no1:=&no1;
  8  no2:=&no2;
  9  result:=Sum_Func(no1,no2);
 10  dbms_output.put_line('Sum of two nos='||result);
 11  END;
 12  /

Enter value for no1: 56
old 7:no1:=&no1;
new 7:no1:=56;
Enter value for no2: 44
old 8:no2:=&no2;
new 8:no2:=45;
Sum of two nos=100

PL/SQL procedure successfully completed.
