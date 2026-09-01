
SQL>   CREATE TABLE Authors(authorID INT PRIMARY KEY,FirstName VARCHAR(50), LastName VARCHAR(50)
  2  );

Table created.

SQL> CREATE TABLE Books(BookID INT PRIMARY KEY, Title VARCHAR(100),Genre VARCHAR(50),PublicationYear INT);

Table created.

SQL> CREATE TABLE BookAuthors (
  2  BookID INT,
  3  AuthorID INT,
  4  PRIMARY KEY (BookID, AuthorID),
  5  FOREIGN KEY (BookID) REFERENCES Books(BookID),
  6  FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
  7  );

Table created.

SQL> CREATE TABLE Borrowers (
  2  BorrowerID INT PRIMARY KEY,
  3  FirstName VARCHAR(50),
  4  LastName VARCHAR(50),
  5  MembershipDate DATE
  6  );

Table created.

SQL> CREATE TABLE BorrowedBooks (
  2  BorrowerID INT,
  3  BookID INT,
  4  BorrowedDate DATE,
  5  ReturnDate DATE,
  6  PRIMARY KEY (BorrowerID, BookID),
  7  FOREIGN KEY (BorrowerID) REFERENCES Borrowers(BorrowerID),
  8  FOREIGN KEY (BookID) REFERENCES Books(BookID)
  9  );

Table created.

SQL> INSERT INTO Authors (AuthorID, FirstName, LastName) VALUES (1,
  2  'George', 'Orwell');

1 row created.

SQL> INSERT INTO Authors (AuthorID, FirstName, LastName) VALUES (2,
  2  'Aldous', 'Huxley');

1 row created.

SQL> INSERT INTO Authors (AuthorID, FirstName, LastName) VALUES (3, 'J.K.',
  2  'Rowling');

1 row created.

SQL> INSERT INTO Books (BookID, Title, Genre, PublicationYear) VALUES (1, '1984', 'Dystopian', 1949);

1 row created.

SQL> INSERT INTO Books (BookID, Title, Genre, PublicationYear) VALUES (2, 'Brave New
  2  World', 'Dystopian', 1932);

1 row created.

SQL> INSERT INTO Books (BookID, Title, Genre, PublicationYear) VALUES (3, 'Harry Potter
  2  and the Sorcerers Stone', 'Fantasy', 1997);

1 row created.

SQL> INSERT INTO BookAuthors (BookID, AuthorID) VALUES (1, 1);

1 row created.

SQL> INSERT INTO BookAuthors (BookID, AuthorID) VALUES (2, 2);

1 row created.

SQL> INSERT INTO BookAuthors (BookID, AuthorID) VALUES (3, 3);

1 row created.

SQL> INSERT INTO Borrowers (BorrowerID, FirstName, LastName, MembershipDate) VALUES
  2  (1, 'John', 'Doe', DATE '2023-01-01');

1 row created.

SQL> INSERT INTO Borrowers (BorrowerID, FirstName, LastName, MembershipDate) VALUES
  2  (2, 'Jane', 'Smith', DATE '2023-02-15');

1 row created.

SQL> INSERT INTO BorrowedBooks (BorrowerID, BookID, BorrowedDate, ReturnDate) VALUES
  2  (1, 1, DATE '2023-03-01', DATE '2023-03-15');

1 row created.

SQL> INSERT INTO BorrowedBooks (BorrowerID, BookID, BorrowedDate, ReturnDate) VALUES
  2  (2, 3, DATE '2023-03-05', DATE '2023-03-20');

1 row created.

SQL> SELECT*FROM Authors;

  AUTHORID FIRSTNAME
---------- --------------------------------------------------
LASTNAME
--------------------------------------------------
         1 George
Orwell

         2 Aldous
Huxley

         3 J.K.
Rowling


SQL> SELECT*FROM Books;

    BOOKID
----------
TITLE
--------------------------------------------------------------------------------
GENRE                                              PUBLICATIONYEAR
-------------------------------------------------- ---------------
         1
1984
Dystopian                                                     1949

         2
Brave New
World

    BOOKID
----------
TITLE
--------------------------------------------------------------------------------
GENRE                                              PUBLICATIONYEAR
-------------------------------------------------- ---------------
Dystopian                                                     1932

         3
Harry Potter
and the Sorcerers Stone
Fantasy                                                       1997


SQL> SELECT*FROM BookAuthors;

    BOOKID   AUTHORID
---------- ----------
         1          1
         2          2
         3          3

SQL> SELECT*FROM Borrowers;

BORROWERID FIRSTNAME
---------- --------------------------------------------------
LASTNAME                                           MEMBERSHI
-------------------------------------------------- ---------
         1 John
Doe                                                01-JAN-23

         2 Jane
Smith                                              15-FEB-23


SQL> SELECT*FROM BorrowedBooks;

BORROWERID     BOOKID BORROWEDD RETURNDAT
---------- ---------- --------- ---------
         1          1 01-MAR-23 15-MAR-23
         2          3 05-MAR-23 20-MAR-23
