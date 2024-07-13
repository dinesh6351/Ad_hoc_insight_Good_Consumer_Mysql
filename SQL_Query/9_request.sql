/* 9. Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/

with cte1 as (SELECT dc.channel,sum(fsm.sold_quantity*fgp.gross_price)/1000000 as gross_sales_mln , 
sum(sum(fsm.sold_quantity*fgp.gross_price)) over() /1000000 as gross_sales_total FROM gdb0041.dim_customer dc 
join fact_sales_monthly fsm on dc.customer_code=fsm.customer_code
join fact_gross_price fgp on fgp.product_code=fsm.product_code where fsm.fiscal_year=2021 group by dc.channel)
select channel,concat(round(gross_sales_mln,2),' M'),concat(round((gross_sales_mln/gross_sales_total)*100,1),' %') as percentage
 from cte1 order by percentage desc
 
 
 