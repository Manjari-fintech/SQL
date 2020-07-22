-- Views created from data to run queries
CREATE VIEW credit_card_data AS
SELECT 
ch.cardholder_id,
ch.name AS cardholder_name,
c.creditcard_num,
m.merchant_id,
m.name AS merchant_name,
mc.category_name AS merchant_cat_name,
t.date AS transaction_date,
t.amount AS transaction_amt
FROM card_holder as ch
INNER JOIN credit_card as c
ON ch.cardholder_id = c.cardholder_id
INNER JOIN transaction as t
ON c.creditcard_num = t.creditcard_num
INNER JOIN merchant as m
ON t.merchant_id = m.merchant_id
INNER JOIN merchant_category as mc
ON m.merchant_cat_id = mc.merchant_cat_id;

--Isolate (or group) the transactions of each cardholder
CREATE VIEW transactions_per_cardholder AS
SELECT cardholder_id,
cardholder_name,
SUM(ROUND(CAST(transaction_amt AS numeric),2)) AS total_transaction_amt
FROM credit_card_data
GROUP BY cardholder_id, cardholder_name
ORDER BY total_transaction_amt DESC;

--Top 100 highest transactions during this time period
CREATE VIEW highest_morning_trasactions AS
SELECT transaction_date, ROUND(CAST(transaction_amt AS numeric),2), creditcard_num
FROM credit_card_data
WHERE EXTRACT('HOUR' from transaction_date) >= 07
AND EXTRACT('HOUR' from transaction_date) < 09
ORDER BY transaction_amt DESC
LIMIT 100;

-- Count of Transactions less than $2.00 per cardholder
CREATE VIEW small_transactions AS
SELECT
cardholder_id, cardholder_name, 
COUNT(transaction_amt) AS small_transactions
FROM credit_card_data
WHERE transaction_amt <= 2
GROUP BY cardholder_id, cardholder_name
ORDER BY small_transactions DESC;

--Top 5 merchants prone to being hacked using small transactions
CREATE VIEW top5_merchants AS
SELECT
merchant_name, 
merchant_cat_name,
COUNT(transaction_amt) AS small_transactions
FROM credit_card_data
WHERE transaction_amt <= 2
GROUP BY merchant_name, merchant_cat_name
ORDER BY small_transactions DESC
LIMIT 5;

