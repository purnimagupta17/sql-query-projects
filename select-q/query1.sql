
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



