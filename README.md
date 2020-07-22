# SQL-Homework

## Looking for suspicious transactions

In this homework assignment, SQL skills were used to analyze historical credit card transactions and consumption patterns in order to identify possible fraudulent transactions.

  ### Data Modeling: 
  
  An entity relationship diagram [ERD](erd.png) 
  was created by inspecting the provided CSV files and using Quick Database Diagrams. 

  ### Data Engineering 

  A database schema was developed for each of the tables defining specific data types and relationships i.e primary keys and foreign keys.
   
  [Card data schema](card_data_schema.sql)


  After creating the database schema, data was imported in the repective tables using the corresponding CSV files.

  ### Data Analysis

  For analysis a credit_card_data view was created using INNER JOIN to consolidate data from various card_db tables. 

  The attached sql query file answers the following questions:

  [Card data query](card_data_query.sql) 

* How can you isolate (or group) the transactions of each cardholder?

  [Card data query](card_data_query.sql) 

* Consider the time period 7:00 a.m. to 9:00 a.m.

  * What are the top 100 highest transactions during this time period?
     
     [Card Data query](card_data_query.sql) 

  * Do you see any fraudulent or anomalous transactions?
 
    In the list of top 100 transactions during this time, 7 transactions were greater than $1,000 and 2 were $748 and $100 the rest were below the $20 mark. These large transactions can be deemed as anomalous.

  * If you answered yes to the previous question, explain why you think there might be fraudulent transactions during this time frame.

    One can infer that the extremely large transactions are anomalous in a data set that largely contains smaller transactions less than $20.

* Some fraudsters hack a credit card by making several small payments (generally less than $2.00), which are typically ignored by cardholders. Count the transactions that are less than $2.00 per cardholder. Is there any evidence to suggest that a credit card has been hacked? Explain your rationale.

  The number of transactions per cardholder below $2 sorted in descending order show that there are 5 card holders that have transaction counts more than 20 the highest number being 26. The other card holders have small transactions ranging between 3-20. There is not enough evidence to conclude if these credit cards were hacked.


* What are the top 5 merchants prone to being hacked usin
g small transactions?

  ![Top Merchants](./Images/top_5_merchants.png)
  
* Views for each of the previous queries.

  [views](views.sql)

### Analysis of transactions for Top customers: 

[Top customers](visual_data_analysis.ipynb)

### Challenge

[Challenge](challenge.ipynb)