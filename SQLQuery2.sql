-- total revenue

SELECT SUM(total_price)
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  --817860.049999993


  --average order value
select SUM(total_price)/COUNT(distinct order_ID) as avg_order_value
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  --38.3072622950816 

  --total pizza sold
SELECT SUM(quantity) as total_pizza_sold
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  --49574

  --total orders
SELECT COUNT(distinct order_id) as total_orders
 FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
 --21350

 --average pizzas per order
 SELECT cast(SUM(quantity)/COUNT(distinct order_id) AS DECIMAL(10,2)) as average_pizzas_per_order
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  --2.32

  --Chart requirements

  --daily trend for total orders
  select DATENAME(DW,order_date) as order_day, COUNT(distinct order_id) as total_orders
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by DATENAME(DW,order_date)
 

--monthly trend for orders
  select DATENAME(MONTH,order_date) as month_name, COUNT(distinct order_id) as total_orders
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by DATENAME(MONTH,order_date)


  --% of sales by pizza category
  select pizza_category, cast(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
  cast(sum(total_price) * 100 / (select	SUM(total_price) from [Project-Grow Data Skills].[dbo].[dominos_sales]) as decimal(10,2)) as sales_percent
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_category

  --% of sales by pizza size
  select pizza_size, cast(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
  cast(sum(total_price) * 100 / (select	SUM(total_price) from [Project-Grow Data Skills].[dbo].[dominos_sales]) as decimal(10,2)) as sales_percent
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_size


  --total pizza sold by pizza category
  select pizza_category, SUM(quantity) as total_pizza
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_category
  order by SUM(quantity) desc


  -- top 5 best sellers by revenue, total quantity, total orders
  select top 5 pizza_name, SUM(total_price) as revenue
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_name
  order by SUM(total_price) desc

  select top 5 pizza_name, SUM(quantity) as total_quantity
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_name
  order by SUM(quantity) desc

  select top 5 pizza_name, COUNT(distinct order_ID)
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_name
  order by COUNT(distinct order_ID) desc


  -- bottom 5 best sellers by revenue, total quantity, total orders
  select top 5 pizza_name, SUM(total_price) as revenue
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_name
  order by SUM(total_price)

  select top 5 pizza_name, SUM(quantity) as total_quantity
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_name
  order by SUM(quantity)

  select top 5 pizza_name, COUNT(distinct order_ID)
  FROM [Project-Grow Data Skills].[dbo].[dominos_sales]
  group by pizza_name
  order by COUNT(distinct order_ID)