
#SQL statement to retrieve each info about the salespeople

SELECT *
FROM salesman;

#SQL statement that displays a string "This is SQL Exercise, Practice and Solution"

SELECT "This is SQL Exercise, Practice and Solution";


#SQL query to display three numbers in three columns
SELECT 2,4,6;


#display the sum of two numbers 10 and 15 from the RDBMS server
SELECT 10+15;

#display the result of an arithmetic expression
SELECT 20*5-90

#display specific columns such as names and commissions for all salespeople

SELECT names, commissions
FROM salesman;

#7query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.  

SELECT ord_date, salesman_id, ord_no, purch_amt
FROM orders;

#8 SQL query to identify the unique salespeople ID. Return salesman_id.  

SELECT distinct salesman_id
FROM orders;

#9 SQL query to locate salespeople who live in the city of 'Paris'. Return salesperson's name, city.

SELECT names, city
FROM salesman
WHERE city='Paris';

#10 SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id.

SELECT *
FROM customer
WHERE grade='200';

#11 SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt.

SELECT ord_no, ord_date, purch_amt
FROM orders
WHERE salesman_id=5000,


#12 SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner.

SELECT YEAR, SUBJECT, WINNER
FROM nobel_win
WHERE YEAR=1970;



#13 SQL query to find the Nobel Prize winner in ‘Literature’ for 1970

SELECT WINNER
FROM nobel_win
WHERE SUBJECT='Literature' 
AND YEAR=1971;



#14 SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner.

SELECT WINNER
FROM nobel_win
WHERE SUBJECT='Physics' 
AND YEAR>=1950;

#15 write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. 
#Begin and end values are included. Return year, subject, winner, and country.  

SELECT YEAR, SUBJECT, WINNER, COUNTRY
FROM nobel_win
WHERE SUBJECT='Chemistry' 
AND YEAR>=1965 AND YEAR<=1975;


# IN
#16 SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.

SELECT *
FROM nobel_win
WHERE WINNER IN ('Menachem Begin','Yitzhak Rabin') 
AND CATEGORY='Prime Minister'
AND YEAR>1972;

# LIKE
#17 SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category

SELECT YEAR, SUBJECT, WINNER, COUNTRY, CATEGORY
FROM nobel_win
WHERE WINNER LIKE('Louis%');


#18 UNION SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category.

(SELECT *
FROM nobel_win
WHERE SUBJECT='Physics' AND YEAR=1970)
Union
(SELECT *
FROM nobel_win
WHERE SUBJECT='Economics' AND YEAR=1971);


# NOT IN 
#SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. 
#Return year, subject, winner, country, and category.  

SELECT *
FROM nobel_win
WHERE YEAR='1970'
AND SUBJECT NOT IN ('Physiology','Economics');


# UNION
#SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. 
#Return year, subject, winner, country, and category.

(SELECT *
FROM nobel_win
WHERE SUBJECT='Physiology' AND YEAR<1971)
UNION
(SELECT *
FROM nobel_win
WHERE SUBJECT='Peace' AND YEAR=>1974);


#SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category. 

SELECT *
FROM nobel_win
WHERE WINNER='Johannes Georg Bednorz';


# ORDER BY
#write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. 
#Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending

SELECT *
FROM nobel_win
WHERE SUBJECT NOT LIKE 'P%'
ORDER BY YEAR DESC, WINNER;

# CASE
#SQL query to find the details of 1970 Nobel Prize winners. 
#Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.  

SELECT *
FROM nobel_win
WHERE year=1970 
ORDER BY
 CASE
    WHEN subject IN ('Economics','Chemistry') THEN 1
    ELSE 0
 END ASC,
 subject,
 winner;
 
 #BETWEEN
 #SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. 
 #Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.


SELECT *
FROM item_mast
WHERE PRO_PRICE BETWEEN 200 AND 600;


# AVERAGE
#write a SQL query to calculate the average price for a manufacturer code of 16. Return avg


SELECT AVG(PRO_PRICE)
FROM item_mast
WHERE PRO_COM=16;

#SQL query to display the pro_name as 'Item Name' and pro_price as 'Price in Rs.'

SELECT PRO_NAME AS 'ITEM NAME', PRO_PRICE AS 'Price in Rs.'
FROM item_mast

##SQL query to find the items whose prices are higher than or equal to $250. 
#Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.


SELECT PRO_NAME, PRO_PRICE
FROM item_mast
WHERE PRO_PRICE>=250
ORDER BY PRO_PRICE DESC, PRO_NAME;

##GROUP BY
#SQL query to calculate average price of the items for each company. Return average price and company code

SELECT AVG(PRO_PRICE), PRO_COM
FROM item_mast
GROUP BY PRO_COM

# SQL query to find the cheapest item(s). Return pro_name and, pro_price.  

SELECT PRO_NAME, PRO_PRICE
FROM item_mast
WHERE PRO_PRICE=(SELECT MIN(PTO_PRICE) FROM  item_mast);

#Unique/Distincts
#SQL query to find the unique last name of all employees. Return emp_lname. 

SELECT DISTINCT(EMP_LNAME)
FROM emp_details


#SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.

SELECT * 
 FROM emp_details 
  WHERE emp_lname= 'Snares';

#SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT * 
 FROM emp_details 
  WHERE emp_dept= 57;



