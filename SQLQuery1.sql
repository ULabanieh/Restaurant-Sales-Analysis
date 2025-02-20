USE [Balaji Fast Food Sales Project];

--- create table command
CREATE TABLE fastfood_sales(
	order_id INT,
	date DATE,
	item_name VARCHAR(100),
	item_type VARCHAR(100),
	item_price INT,
	quantity INT,
	transaction_amount INT,
	transaction_type VARCHAR(50),
	received_by VARCHAR(50),
	time_of_sale VARCHAR(50)
);

--- check data
SELECT * FROM balaji_fast_food_sales;

--- identify rows with null values in transaction_type column
SELECT * 
FROM balaji_fast_food_sales 
WHERE transaction_type IS NULL;

--- replace null values with "other", which refers to payment methods such as credit cards or gift cards
SELECT *, ISNULL(transaction_type, 'Other')
FROM balaji_fast_food_sales;

--- save change to the table
UPDATE balaji_fast_food_sales
SET transaction_type = 'Other'
WHERE transaction_type IS NULL;

--- find out top selling menu items
SELECT item_name, SUM(transaction_amount) AS total_amount
FROM balaji_fast_food_sales
GROUP BY item_name
ORDER BY total_amount DESC;

---  Identify low-performing menu items by calculating the total quantity sold for each item
SELECT item_name, SUM(quantity) AS total_quantity_sold
FROM balaji_fast_food_sales
GROUP BY item_name
ORDER BY total_quantity_sold DESC;

