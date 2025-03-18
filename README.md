# 🍟 Project Overview
---
A restaurant wants to **understand order patterns** to optimize menu pricing. The restaurant's name is Balaji and it specializes in Indian fast food. This project mostly focuses on Exploratory Data Analysis and Data Cleaning using Excel and SQL. 

# Dataset Exploration
---
I started the project by taking a first look into the dataset and the data it contains. There are 1000 rows of data and the columns of this dataset are as follows: 

1. **order_id**: a unique identifier for each order.
2. **date**: date of the transaction.
3. **item_name**: name of the food.
4. **item_type**: category of item (Fastfood or Beverages).
5. **item_price**: price of the item for 1 quantity.
6. **Quantity**: how much quantity the customer orders.
7. **transaction_amount**: the total amount paid by customers.
8. **transaction_type**: payment method (cash, online, others).
9. **received_by**: gender of the person handling the transaction.
10. **time_of_sale**: different times of the day (Morning, Evening, Afternoon, Night, Midnight).

After cleaning up the dataset, I carried out a couple of exploration steps in SQL:

- Find **top-selling dishes** by grouping and sorting the data by item sales. 
```SQL
SELECT item_name, SUM(transaction_amount) AS total_amount
FROM balaji_fast_food_sales
GROUP BY item_name
ORDER BY total_amount DESC;
```

Output:

![1](https://github.com/user-attachments/assets/4c1a3ca4-b4cb-48bd-bef1-4ef62767354b)

-  Identify **low-performing menu items** by calculating the total quantity sold for each item.  
```SQL
SELECT item_name, SUM(quantity) AS total_quantity_sold
FROM balaji_fast_food_sales
GROUP BY item_name
ORDER BY total_quantity_sold DESC;
```

Output:

![2](https://github.com/user-attachments/assets/4f73832f-3917-49d3-9f9b-43791b1d7183)

# Data Cleaning and Transformation
---
After quickly exploring the dataset in Excel, I applied some quick formatting steps such as converting the text in the .csv file to columns and transformed the data rows into an Excel Table. I also centered the cells and resized the columns to fit the contents.

After that, I identified some further cleaning and transformation steps and carried them out as follows:
- Standardize date format to be as follows: dd-mm-yyyy:
	- After failing several times to standardize the date format using the “Format cells” options, I searched through the internet and found the solution to the date format, which is through the “Text to Columns” function outlined in this video and the steps below:
	- Select the “date” column
	- Click on “Text to Columns” in the “Data” ribbon
	- Click “Next” for the first 2 steps
	- On the third steps, select “Date” and, from the dropdown, select “MDY” format. Then click “Finish”.
	- The dates will now be displayed in a correct and unified format. We can verify that by checking the filtering options
- 107 null values in the transaction_type column. I replaced the null values with "Other", which refers to any payment method that is not "Cash" or "Online", such as a gift card or a credit card.
- Check for duplicate values – no duplicate values found.
- Add a "month" and a "year" column using the MONTH and YEAR formulas on the "date" column.

# Visualization and Findings
---
After completing the exploration and cleaning, I started deep diving further into the dataset by creating visualizations to represent important metrics and drive conclusions from them in order to define the decision recommendations for the restaurant owner.

## Menu Items by Sales and Quantity Sold
---
I created 2 pivot tables and a bar chart to represent the total sales and quantity sold by each menu item. The top sales item was "Sandwich" and the lowest were "Vadapav" and "Aalopuri". In regards to quantity sold, the top items were "Cold coffee" and "Sugarcane juice", which are both drinks and the lowest were also "Vadapav" and "Aalopuri". From this information, it really seems that Vadapav and Aalopuri are not garnerring success. Since they are relatively simple to make, it might be a good idea to perhaps reduce the item price from the current 20 to 15 and evaluate how that change affects sales. The goal of this price decrease is to attract customers to purchase more of these items. 

![pivot 1](https://github.com/user-attachments/assets/b5c042bc-4d9c-4e05-84f8-25ed18367f2c)

![chart](https://github.com/user-attachments/assets/2bd029d9-571b-419b-8e96-0bfca181af55)

![pivot 2](https://github.com/user-attachments/assets/e6eb974e-e22a-4c38-88d6-3dd93e5b59f7)

## Total Sales Over-Time (Monthly)
---
The dataset includes data from April 2022 to March 2023 which is approximately a year. Using a line chart, I displayed the total sales of the restaurant throughout this period. Here are my observations:

- 3 peaks around May 2022, October 2022 and January 2023
- Sales in Q1 2023 are higher than the majority of the 2022 period
- Lowest records of sales are in April, June and September 2022
- There is no apparent seasonality as the increases of sales are on specific months and do not necessarily extend into longer periods or seasons such as winter or spring. 
- Sales did not drop below 20.000 since October 2022 (6 months)

![chart 2](https://github.com/user-attachments/assets/e30f93f9-338c-4fb2-9c49-bacbd74d777d)

![pivot 3](https://github.com/user-attachments/assets/e49ebc47-cc3b-4b96-b39a-309acb78ec52)

## Impact of payment methods on revenue
---
I looked at the impact of payment methods on revenue. The results are overall expected, but what's intersting here is to look at the "Other" category, as the amount of customers choosing this type of payment methods (gift cards, credit cards, etc...) can be easily underestimated and not taken into account. Here we can see that although "Cash" and "Online" represent about 89% of orders and sales, 11% is a significant percentage of customers and therefore having this type of payment options available is important to not miss out on potential revenue.

![pivot 4](https://github.com/user-attachments/assets/09db5e46-0e84-4fe5-9033-3f13ecd6bc45)

## Sales by Time of Day
---
As for the time of day in which sales happen, there is not much diffrence between the categories since they are all within 4 percentage points from each other and we can say that sales are evenly distributed throughout the day.

![pivot 6](https://github.com/user-attachments/assets/8bd8c772-e0fe-4792-a46d-f4d724959884)

![chart 3](https://github.com/user-attachments/assets/190581b5-9aaf-421e-8626-088fdb6f54d4)

# Conclusion
---
I hope you found my insights useful. In addition to the ones I described above, I also included a pivot chart that displays the percentage of orders handled by male vs female employees. There are not much interesting findings to extract from this as the percentages are very close to each other marking about a 50/50 split. In addition, there are no measures of customer satisfaction in this dataset, so I cannot tell which gender performed better.

![pivot 5](https://github.com/user-attachments/assets/f2f4b3ec-8142-4773-9eb0-d6468c2173a7)

This project was interesting to test my exploratory data analysis and data cleaning skills as well as it being the first project I do that is not guided, meaning I did not follow a tutorial or a course to carry it out. I feel satisfied with the result and hope that you find it interesting as well. In addition to that, I learned a thing or two about Indian cuisine that I did not know before. I found myself watching Vadapav recipes after completing the project and I honestly could not understand why it was the lowest sales item... 😅
