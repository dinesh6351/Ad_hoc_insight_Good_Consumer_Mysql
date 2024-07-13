/* 6. Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage
*/

with cte1 as (SELECT dc.customer_code,dc.customer,
Round(fpd.pre_invoice_discount_pct*100,2) as average_discount_percentage 
FROM gdb0041.dim_customer dc join fact_pre_invoice_deductions fpd on dc.customer_code=fpd.customer_code
where fpd.fiscal_year=2021 and dc.market="India")
select * from cte1 order by average_discount_percentage desc limit 5



