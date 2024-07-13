
/* 4. Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,.
segment
product_count_2020
product_count_2021
difference 
*/

with cte1 as (SELECT dm.product_code, dm.segment, fs.fiscal_year 
FROM dim_product dm join fact_sales_monthly fs on dm.product_code=fs.product_code),
cte2 as (select segment,count(distinct product_code) as product_count_2020 from cte1 where fiscal_year=2020 group by segment),
cte3 as (select segment,count(distinct product_code) as product_count_2021 from cte1 where fiscal_year=2021 group by segment)
SELECT cte2.segment, product_count_2020, product_count_2021 ,
(product_count_2021-product_count_2020) as difference
FROM cte2
JOIN cte3 ON cte2.segment = cte3.segment
order by difference desc;

