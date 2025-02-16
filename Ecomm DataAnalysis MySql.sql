   -- (1) Total Sales by Year
select year(order_date) as years, round(sum(sales),2) as value from ecomm
group by years
order by years;

-- (2) Profit by Region

select region, sum(profit) as profit from ecomm
group by region
order by profit desc;

-- (3) Top 10 Most Sold Sub-category

select sub_category, round(sum(sales), 2) as total_sales from ecomm
group by sub_category
order by Total_sales desc
limit 10;

-- (4) Total and Average Shipping Cost by Ship Mode
                  -- Total Shipping Cost
select ship_mode, round(sum(shipping_cost), 2) as Total_cost from ecomm
group by ship_mode
Order by Total_cost desc;

        -- Average Shipping Cost
select ship_mode, round(avg(shipping_cost), 2) as Avg_cost from ecomm
group by ship_mode
Order by Avg_cost;

-- (5) Customer Ranking by Total Sales By Location

select customer_name, state, country, round(sum(sales), 2) as sales_by_Customer from ecomm 
group by  Customer_name, state, country
Order By sales_by_customer desc 
limit 10;

-- (6) Order Priority Impact on Profit

select count(order_id) as Total_order, Order_priority, round(sum(profit), 1) as Profit from ecomm
group by Order_priority
order by Total_order desc;

-- (7) Percentage of Orders By Sub Category

select sub_category, count(order_id) as total_order, round(count(order_id) * 100 / (select count(*) from ecomm),2) as Percent_of_Order from ecomm
group by sub_category
order by Percent_of_Order desc;

-- (8) Profitability of Product Categories

select category, round(sum(profit),2) as Profit from ecomm
group by category
order by profit desc; 

-- (9)  Most and least profitable products      
        
select product_name, round(sum(profit),2) as Total_Profit from ecomm
group by Product_name
Order by Total_Profit;

-- (10)  Average Shipping Cost by Order Priority

select Order_priority, round(avg(shipping_cost), 2) as AvgShipping_Cost from ecomm
group by Order_priority
Order by AvgShipping_Cost desc;
