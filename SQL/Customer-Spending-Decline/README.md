Customer Spending Decline Analysis

📌 Business Problem

An e-commerce company noticed that some customers who were previously high-value customers have reduced their spending in recent months.

The business wants to identify customers whose purchasing behaviour has declined significantly so the retention team can investigate them further.

The goal of this analysis is not to label customers as churned, but to identify customers showing a potential decline in purchasing activity.

🎯 Business Question

Identify customers who:

Spent more than ₹1,000 during January–February 2026
Spent less than ₹500 during June–July 2026

Return:

Customer ID
Customer name
Spending during January–February
Spending during June–July

Sort the results by early-period spending in descending order.

🗂️ Dataset

The analysis uses two tables. --  SQL/Customer-Spending-Decline/sample Data.xlsx

🔍 My Approach

I approached the problem as a customer-level spending comparison between two different time periods.

1. Join the customer and order data
I joined the Customers and Orders tables using customer_id so that the final analysis could include both customer information and transaction data.

2. Aggregate spending at customer level
The analysis was performed at the customer grain.

Each customer's spending was calculated separately for the two periods.

3. Use conditional aggregation
I used:
SUM(CASE WHEN ... THEN amount ELSE 0 END)
to calculate spending for each period within the same query.

4. Filter customers using HAVING
Since the conditions were based on aggregated spending, I used HAVING rather than WHERE.

The two conditions were:
January–February spending > ₹1,000
June–July spending < ₹500

5. Sort the final results
The customers were sorted by their January–February spending in descending order.

📊 Result
The analysis identified three customers whose spending declined based on the defined criteria.

Customer	Jan–Feb Spend	Jun–Jul Spend
Priya	₹1,700	₹0
Neha	₹1,300	₹0
Rahul	₹1,200	₹100


💡 Business Interpretation

These customers show a significant reduction in spending between the two periods.
However, this analysis alone does not prove that these customers have churned.


📈 Key Learning
This exercise reinforced that SQL is not just about writing queries.
The important part is translating a business question into measurable logic.
In this case, the business problem of declining customer activity was translated into:
customer → time periods → spending → comparison → identification of potential risk
