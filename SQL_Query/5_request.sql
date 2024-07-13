/*5. Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
product_code
product
manufacturing_cost 
*/
with cte1 as (select dp.product_code,dp.product,fmc.manufacturing_cost as manufacturing_cost from dim_product dp 
join fact_manufacturing_cost fmc on dp.product_code=fmc.product_code),
cte2 as ( select product_code,product,min(manufacturing_cost) as min from cte1 group by product_code order by min limit 1),
cte3 as (select product_code,product,max(manufacturing_cost) as max from cte1 group by product_code order by max desc limit 1)
select product_code,product,min as manufacturing_cost from cte2
union
select product_code,product,max as manufacturing_cost from cte3

