/* 7. Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions. The final report contains these columns:
Month
Year
Gross sales Amount 
*/

SELECT concat(monthname(fsm.date),'(',year(fsm.date),')') as month,
fsm.fiscal_year as year,round(sum(fsm.sold_quantity*fgp.gross_price),2) as Gross_sales_Amount
 FROM gdb0041.fact_sales_monthly fsm join fact_gross_price as fgp on fsm.product_code=fgp.product_code
 join dim_customer dc on dc.customer_code=fsm.customer_code where dc.customer="Atliq Exclusive"
 group by month,year;

