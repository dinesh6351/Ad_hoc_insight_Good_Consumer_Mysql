/* 2. What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg  */

with cte1 as (
select count(distinct product_code) as pc1 from fact_gross_price where fiscal_year=2020
),
cte2 as(
select count(distinct product_code) as pc2 from fact_gross_price where fiscal_year=2021
)select cte1.pc1 as unique_product_2020,cte2.pc2 as unique_product_2021,
(cte2.pc2-cte1.pc1)*100/cte1.pc1 as percentage_chg from cte1,cte2 

