CREATE TABLE IF NOT EXISTS customer (
    custid INTEGER PRIMARY KEY AUTOINCREMENT,
    cname  TEXT NOT NULL,
    phone  TEXT
);

CREATE TABLE IF NOT EXISTS account (
    accno   INTEGER PRIMARY KEY,
    custid  INTEGER NOT NULL REFERENCES customer(custid),
    balance REAL    NOT NULL DEFAULT 0 CHECK (balance >= 0)
);

CREATE TABLE IF NOT EXISTS transactions (
    txnid         INTEGER PRIMARY KEY AUTOINCREMENT,
    accno         INTEGER NOT NULL REFERENCES account(accno),
    txntype       TEXT    NOT NULL CHECK (txntype IN ('OPEN', 'DEPOSIT', 'WITHDRAW')),
    amount        REAL    NOT NULL CHECK (amount >= 0),
    balance_after REAL    NOT NULL,
    txntime       TEXT    NOT NULL DEFAULT (datetime('now', 'localtime'))
);
