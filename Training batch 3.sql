create database test;
use test;
CREATE TABLE dresses (
    id INT PRIMARY KEY,
    name varchar(100),
    description varchar(255),
    price REAL);
    
INSERT INTO dresses (id,name, description, price) VALUES (1,"Patio Print-cess", "A blue and white dress covered in paisley and other patterns", 69.99);
INSERT INTO dresses (id,name, description, price) VALUES (2,"Watercolors of the Wind Dress", "A dress with pastel floral patterns against a blue background", 89.99);
INSERT INTO dresses (id,name, description, price) VALUES (3,"Tropical Rain Florist Dress", "A dress with a bright floral pattern and blue piping", 64.99);
INSERT INTO dresses (id,name, description, price) VALUES (4,"I Field Good Dress", "A dress with an impressionist floral pattern and V-neck bodice", 99.99);
INSERT INTO dresses (id,name, description, price) VALUES (5,"What Does the Fox Wear Dress", "A dress with pastel-colored sketches of foxes, birds, and bunnies.", 99.99);

Select * from dresses;
/* Which ones have floral patterns? */
SELECT  * FROM dresses WHERE description LIKE "%floral%";

/* Which ones are blue? */
SELECT  * FROM dresses WHERE description LIKE "%blue%";

CREATE TABLE top_programs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    creator VARCHAR(255),
    votes INT);

INSERT INTO top_programs (name, creator, votes) 
VALUES ("The Ultimate TD", "The #1 Base 12 Proponent", 7659);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Doodle Jump", "Nordituck", 5249);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Cut The Rope", "KHAN ACE", 4935);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Interactive iPhone 5c", "Mustafa Mian", 4167);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Mini Putt", "Matt", 3986);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Duck Life", "Kevin23", 3691);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Book of Jokes 2", "PROTO", 3656);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Flappy Bird", "Kazza++", 3464);
INSERT INTO top_programs (name, creator, votes) 
VALUES ("Mario V.2", "Radioactive", 3228);

/* But let's just show the top 3! */
SELECT * FROM top_programs ORDER BY votes DESC LIMIT 3;


CREATE  table organs (id INTEGER PRIMARY KEY auto_increment,
    name VARCHAR(255),
    weight INT,
    important_functions VARCHAR(255));
    
    
INSERT into organs (name, weight, important_functions) VALUES("Skin", 24.0, "Protects internal organs.");
INSERT into organs (name, weight, important_functions) VALUES("Liver", 3.4 , "Delivers blood to cells.");
INSERT into organs (name, weight, important_functions) VALUES("Brain", 2.8 , "Governs the body's actions.");
INSERT into organs (name, weight, important_functions) VALUES("Heart", 0.6, "Pumps blood, which carries nutrients, to the rest of the body.");
INSERT into organs (name, weight, important_functions) VALUES("Kidneys", 0.6, "Removes the waste products from blood.");
INSERT into organs (name, weight, important_functions) VALUES("Spleen", 0.4, "Produces the pulp of red and white blood cells.");
INSERT into organs (name, weight, important_functions) VALUES("Pancreas", 0.2, "Produces insulin, glucagon, and somatostatin hormones.");
INSERT into organs (name, weight, important_functions) VALUES("Thyroid", 0.1, "Produces thyroxine and triiodothyronine hormones.");


--Round FUNCTION
SELECT LOWER(name) AS name,
    ROUND(weight) AS rounded_weight
    FROM organs WHERE weight > 1;
	
---AGGReGATE functions
	
select min(price) from dresses;

select count(*) from dresses;

select avg(price) from dresses;

select sum(price) from dresses;

Select min(price), name from dresses group by name;

SELECT COUNT(*) FROM dresses;

SELECT COUNT(name) FROM dresses WHERE Price > 20;

SELECT COUNT(DISTINCT Price) FROM dresses;


SELECT * FROM dresses WHERE name LIKE 'M___i';


--SQL ALTER TABLE Statement
 syntax : ALTER TABLE table_name ADD column_name datatype;

Example : ALTER TABLE Customers ADD Email varchar(255);


ALTER TABLE Customers DROP COLUMN Email;

ALTER TABLE table_name RENAME COLUMN old_name to new_name;


--Constraints

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

ALTER TABLE Persons ALTER COLUMN Age int NOT NULL;


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

--UNIQUE constraint on multiple columns
CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT UC_Person UNIQUE (ID,LastName)
);

ALTER TABLE Persons ADD UNIQUE (ID);

ALTER TABLE Persons ADD CONSTRAINT UC_Person UNIQUE (ID,LastName);


ALTER TABLE Persons DROP INDEX UC_Person;


--PRIMARY KEY Constraint

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);


CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);

ALTER TABLE Persons ADD PRIMARY KEY (ID);

ALTER TABLE Persons ADD CONSTRAINT PK_Person PRIMARY KEY (ID,LastName);

-- Note :If you use ALTER TABLE to add a primary key, the primary key column(s) must have been declared to not contain NULL values

ALTER TABLE Persons DROP PRIMARY KEY;


 --FOREIGN KEY Constraint
 
-- A FOREIGN KEY is a field (or collection of fields) in one table, that refers to the PRIMARY KEY in another table.

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

CREATE TABLE Orders (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    PersonID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
    REFERENCES Persons(PersonID)
);

ALTER TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID); 

ALTER TABLE Orders ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);

ALTER TABLE Orders DROP FOREIGN KEY FK_PersonOrder;

--CHECK Constraint

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

ALTER TABLE Persons ADD CHECK (Age>=18);

ALTER TABLE Persons ADD CONSTRAINT CHK_PersonAge CHECK (Age>=18 AND City='Sandnes');


--DEFAULT Constraint

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

CREATE TABLE Orders (
    ID int NOT NULL,
    OrderNumber int NOT NULL,
    OrderDate date DEFAULT GETDATE()
);

ALTER TABLE Persons ALTER City SET DEFAULT 'Sandnes';

ALTER TABLE Persons ALTER City DROP DEFAULT;

--CREATE INDEX Statement

--Indexes are used to retrieve data from the database more quickly than otherwise. The users cannot see the indexes, 
--they are just used to speed up searches/queries. 
--Note: Updating a table with indexes takes more time than updating a table without (because the indexes also need an update). 
--So, only create indexes on columns that will be frequently searched against.

CREATE INDEX idx_lastname ON Persons (LastName);

CREATE INDEX idx_pname ON Persons (LastName, FirstName);

ALTER TABLE table_name DROP INDEX index_name;


--AUTO INCREMENT Field

CREATE TABLE Persons (
    Personid int NOT NULL AUTO_INCREMENT,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (Personid)
);


ALTER TABLE Persons AUTO_INCREMENT=100;

--SQL CREATE VIEW Statement
-- In SQL, a view is a virtual table based on the result-set of an SQL statement.
--A view contains rows and columns, just like a real table. The fields in a view are fields from one or more real tables in the database.

CREATE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName
FROM Customers
WHERE Country = 'Brazil';

-- Query the view

SELECT * FROM [Brazil Customers];

CREATE VIEW [Products Above Average Price] AS
SELECT ProductName, Price
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products);

CREATE OR REPLACE VIEW [Brazil Customers] AS
SELECT CustomerName, ContactName, City
FROM Customers
WHERE Country = 'Brazil';


DROP VIEW [Brazil Customers];