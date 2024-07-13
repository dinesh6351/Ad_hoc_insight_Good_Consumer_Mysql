/*
10. Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
division
product_code
product
total_sold_quantity
rank_order 
*/

with cte1 as(SELECT dp.division,dp.product_code,dp.product,
sum(fsm.sold_quantity) as total_sold_quantity, dense_rank() 
over (partition by dp.division order by sum(fsm.sold_quantity) desc) as rank_order 
FROM gdb0041.dim_product dp join fact_sales_monthly fsm 
on dp.product_code=fsm.product_code where fsm.fiscal_year=2021
group by dp.division,dp.product_code)
select * from cte1 where rank_order <=3 

