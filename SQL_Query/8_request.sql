/* 8. In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the total_sold_quantity,
Quarter 
total_sold_quantity
*/

with cte1 as (SELECT get_fiscal_quater(dd.calender_date) as Quater, (fsm.sold_quantity) as total_sold_quantity
 FROM gdb0041.dim_date dd 
 join fact_sales_monthly fsm on fsm.date=dd.calender_date and fsm.fiscal_year=dd.fiscal_year
where dd.fiscal_year=2020
)select Quater,sum(total_sold_quantity) as total_sold_quantity from cte1 group by Quater


