
--Project 1 (Part A, B, C, D)
--Date 03/11/15
--Meena Chandok
--Used Oracle SQL Developer 11g to perform different parts of the project.

--Part A Please find below a written script that implements the design provided in Figure 1 of the Assignment:

--CONNECT ex/ex;

SET DEFINE OFF;

-- Begin an anonymous PL/SQL script that 
-- drops all tables in the EX schema and
-- suppresses the error messages that are displayed if the tables don't exist
BEGIN
EXECUTE IMMEDIATE 'DROP sequence user_id_seq';
  EXECUTE IMMEDIATE 'DROP sequence product_id_seq';
  EXECUTE IMMEDIATE 'DROP sequence download_id_seq';
  
  EXECUTE IMMEDIATE 'DROP TABLE downloads';
  EXECUTE IMMEDIATE 'DROP TABLE products';
  EXECUTE IMMEDIATE 'DROP TABLE users';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE users
(
  user_id       NUMBER         PRIMARY KEY, 
  email_address VARCHAR2(50)   UNIQUE, 
  first_name    VARCHAR2(50)   NOT NULL, 
  last_name     VARCHAR2(50)   NOT NULL
);

CREATE TABLE products
(
  product_id        NUMBER                 PRIMARY KEY, 
  product_name      VARCHAR2(50 BYTE)      NOT NULL
);

CREATE TABLE downloads
(
  download_id  NUMBER              PRIMARY KEY,
  user_id      NUMBER              NOT NULL, 
  download_date DATE               DEFAULT SYSDATE,
  file_name    VARCHAR2(50 BYTE)   NOT NULL, 
  product_id   NUMBER              NOT NULL,
  CONSTRAINT downloads_fk_users FOREIGN KEY (user_id)
  REFERENCES users (user_id),
  CONSTRAINT downloads_fk_products FOREIGN KEY (product_id)
  REFERENCES products (product_id)
);
CREATE SEQUENCE user_id_seq;
CREATE SEQUENCE download_id_seq;
CREATE SEQUENCE product_id_seq;

COMMIT;

-----------
OUTPUT Part A

anonymous block completed
table USERS created.
table PRODUCTS created.
table DOWNLOADS created.
sequence USER_ID_SEQ created.
sequence DOWNLOAD_ID_SEQ created.
sequence PRODUCT_ID_SEQ created.
committed.

-------------------------------------------
PART B:  Script to add values to different rows to users, products and downloads tables.

OPTION1:   Below is script adding the to values to different rows to users, products and downloads tables created in Part A.

-- connect to the ex schema
--CONNECT ex/ex;

--INSERT INTO USERS
INSERT INTO users
(user_id, email_address, first_name, last_name) 
VALUES
(user_id_seq.NEXTVAL, 'johnsmith@gmail.com', 'John', 'Smith');
INSERT INTO users
(user_id, email_address, first_name, last_name) 
VALUES
(user_id_seq.NEXTVAL, 'janedoe@yahoo.com', 'Jane', 'Doe');

-- INSERT INTO products
INSERT INTO products
(product_id,product_name)
VALUES
(product_id_seq.NEXTVAL, 'Local Music VOL 1');
INSERT INTO products
(product_id,product_name)
VALUES
(product_id_seq.NEXTVAL, 'Local Music VOL 2');

-- INSERT INTO downloads
INSERT INTO downloads
(download_id, user_id, download_date, file_name, product_id)
VALUES
(download_id_seq.NEXTVAL, 1, SYSDATE, 'pedals_are_falling.mp3', 2);
INSERT INTO downloads
(download_id, user_id, download_date, file_name, product_id)
VALUES
(download_id_seq.NEXTVAL, 2, SYSDATE, 'turn_signal.mp3', 1);
INSERT INTO downloads
(download_id, user_id, download_date, file_name, product_id)
VALUES
(download_id_seq.NEXTVAL, 2, SYSDATE, 'one_horse_town.mp3', 2);

-------
OUTPUT

1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.

-----------------------

PART B: Script to add values to different rows to users, products and downloads tables.

OPTION 2: Below is the Full script of Part A with adding the values to different rows in users, products and download tables.
--CONNECT ex/ex;

SET DEFINE OFF;

-- Begin an anonymous PL/SQL script that 
-- drops all tables in the EX schema and
-- suppresses the error messages that are displayed if the tables don't exist
BEGIN
  EXECUTE IMMEDIATE 'DROP TABLE downloads';
  EXECUTE IMMEDIATE 'DROP TABLE products';
  EXECUTE IMMEDIATE 'DROP TABLE users';
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('');
END;
/

CREATE TABLE users
(
  user_id       NUMBER         PRIMARY KEY, 
  email_address VARCHAR2(50)   UNIQUE, 
  first_name    VARCHAR2(50)   NOT NULL, 
  last_name     VARCHAR2(50)   NOT NULL
);

CREATE TABLE products
(
  product_id        NUMBER                 PRIMARY KEY, 
  product_name      VARCHAR2(50 BYTE)      NOT NULL
);

CREATE TABLE downloads
(
  download_id  NUMBER              PRIMARY KEY,
  user_id      NUMBER              NOT NULL, 
  download_date DATE                          DEFAULT SYSDATE,
  file_name    VARCHAR2(50 BYTE)   NOT NULL, 
  product_id   NUMBER              NOT NULL,
  CONSTRAINT downloads_fk_users FOREIGN KEY (user_id)
  REFERENCES users (user_id),
  CONSTRAINT downloads_fk_products FOREIGN KEY (product_id)
  REFERENCES products (product_id)
);
--INSERT INTO USERS
INSERT INTO users
(user_id, email_address, first_name, last_name) 
VALUES
(user_id_seq.NEXTVAL, 'johnsmith@gmail.com', 'John', 'Smith');
INSERT INTO users
(user_id, email_address, first_name, last_name) 
VALUES
(user_id_seq.NEXTVAL, 'janedoe@yahoo.com', 'Jane', 'Doe');

-- INSERT INTO products

INSERT INTO products
(product_id,product_name)
VALUES
(product_id_seq.NEXTVAL, 'Local Music VOL 1');
INSERT INTO products
(product_id,product_name)
VALUES
(product_id_seq.NEXTVAL, 'Local Music VOL 2');

-- INSERT INTO downloads

INSERT INTO downloads
(download_id, user_id, download_date, file_name, product_id)
VALUES
(download_id_seq.NEXTVAL, 1, SYSDATE, 'pedals_are_falling.mp3', 2);
INSERT INTO downloads
(download_id, user_id, download_date, file_name, product_id)
VALUES
(download_id_seq.NEXTVAL, 2, SYSDATE, 'turn_signal.mp3', 1);
INSERT INTO downloads
(download_id, user_id, download_date, file_name, product_id)
VALUES
(download_id_seq.NEXTVAL, 2, SYSDATE, 'one_horse_town.mp3', 2);

COMMIT;

------
OUTPUT
anonymous block completed
table USERS created.
table PRODUCTS created.
table DOWNLOADS created.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
1 rows inserted.
committed.

---------------------


Part B: (1) SELECT statement that joins the three tables and retrieves the data from users, products and download tables shown
in question. (2) And sorting  the results by the email address in descending sequence and the product name in ascending sequence.

SELECT u.email_address, u.first_name, u.last_name, d.download_date, d.file_name, p.product_name
FROM users u
  JOIN downloads d
    ON u.user_id = d.user_id
  JOIN products p
    ON d.product_id = p.product_id
ORDER BY u.email_address DESC,
         p.product_name;

		 

EMAIL_ADDRESS               FIRST_NAME               LAST_NAME        DOWNLOAD_DATE          FILE_NAME                   PRODUCT_NAME                                     
-------------------------------------------------- -------------------------------------------------- -------------------------------------------------- ------------- -------------------------------------------------- --------------------------------------------------
johnsmith@gmail.com          John                     Smith             11-MAR-15        pedals_are_falling.mp3         Local Music Vol 1                                  
janedoe@yahoo.com            Jane                     Doe               11-MAR-15        turn_signal.mp3                Local Music Vol 1                                  
janedoe@yahoo.com            Jane                     Doe               11-MAR-15        one_horse_town.mp3             Local Music Vol 2                                  


-------------------------------------------


Part C: Below is an ALTER TABLE statement that adds two new columns to the Products table created in Part A.

Added one column for product price that provides for three digits to the left of the decimal point and two to the right 
and column default value of 9.99.

Added another column for the date and time for the product added to the database.

Confirmed the changes in the data of products table.


ALTER TABLE products
  ADD product_price   NUMBER(5,2)    DEFAULT 9.99;
ALTER TABLE products
  ADD product_date  DATE;
  
---------------
  OUTPUT:
  
  table PRODUCTS altered. 
  
  Verified the output by looking at the data of table as shown below:

     Column_name   		Data_type         Nullable   Data_default   Column_id    Comment
1.   PRODUCT_ID	    	NUMBER	             No		   null          1	           null
2.   PRODUCT_NAME		VARCHAR2(50 BYTE)	 No		   null          2	           null
3.   PRODUCT_PRICE		NUMBER(5,2)	         Yes	   9.99	         3	           null
4.   PRODUCT_DATE		DATE				 Yes		null		 4	           null

----------------------------------------------------------------------------------

Part D:  (1)Below is a an ALTER TABLE statement that modifies the Users table created in exercise 2 so the first_name column can store
NULL values and can store a maximum of 20 characters.

 ALTER TABLE users
  MODIFY first_name  VARCHAR2(20) NULL;
  
  OUTPUT
  ----------------
  table USERS altered.
  

  Verified the output by looking at the data of table as shown below:

     Column_name   		Data_type         Nullable   Data_default   Column_id    Comment

	1. USER_ID			NUMBER				No			null 			1	      null
	2. EMAIL_ADDRESS	VARCHAR2(50 BYTE)	Yes			null 			2	      null
	3. FIRST_NAME		VARCHAR2(20 BYTE)	Yes			null 			3	      null
	4. LAST_NAME		VARCHAR2(50 BYTE)	No		    null			4	      null
	 
--------------------

Part D: (2) Coded an UPDATE statement that inserts a NULL value into the altered column. 

UPDATE users
  SET first_name = Null,
      last_name = 'Smith'
  WHERE user_id = 1;

  OUTPUT
  -------
  1 rows updated.
  
 

  Verified the output by looking at the data of table as shown below:

        User_id   		Email_address         First_name    Last_name   
	1.	 1			johnsmith@gmail.com			Null		  Smith
	2.	 2			janedoe@yahoo.com			Jane	      Doe
  
  
 -------------------------------
  
Part D: (3) Coded another UPDATE statement that attempts to insert a first name that’s longer than 20 characters. 
This statement failed due to the  assigned length of the column only 20 characters.

   UPDATE users
  SET first_name = 'DaveRogerAlexJohnMuller',
      last_name = 'Smith'
  WHERE user_id = 1;
  
  OUTPUT
  ----------------------
  
  Error starting at line : 12 in command -
UPDATE users
  SET first_name = 'DaveRogerAlexJohnMuller',
      last_name = 'Smith'
  WHERE user_id = 1
Error report -
SQL Error: ORA-12899: value too large for column "CS270108EX"."USERS"."FIRST_NAME" (actual: 23, maximum: 20)
12899. 00000 -  "value too large for column %s (actual: %s, maximum: %s)"
*Cause:    An attempt was made to insert or update a column with a value
           which is too wide for the width of the destination column.
           The name of the column is given, along with the actual width
           of the value, and the maximum allowed width of the column.
           Note that widths are reported in characters if character length
           semantics are in effect for the column, otherwise widths are
           reported in bytes.
*Action:   Examine the SQL statement for correctness.  Check source
           and destination column data types.
           Either make the destination column wider, or use a subset
           of the source column (i.e. use substring).

		   
Verified the output by looking at the data of table again and data was same as in Part 2 and has been shown below again:

        User_id   		Email_address         First_name    Last_name   
	1.	 1			johnsmith@gmail.com			Null		  Smith
	2.	 2			janedoe@yahoo.com			Jane	      Doe
  
  
  -----------------------------------------------------------------------------------
  
  
  