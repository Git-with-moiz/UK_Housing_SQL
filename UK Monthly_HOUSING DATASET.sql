/* 
--Author: @Moiz_Aurangabadwala
--MySQL

-- Import DATASET USING MYSQL WORKBENCH
-- DATASET: housing_in_london_monthly_variables

-- Houses with highest average price in the UK region by joining yearly and monthy dataset:
select a.area,max(a.average_price) as max_avg_price
from housing_in_london_monthly_variables as a
join housing_in_london_yearly_variables as b
ON a.code=b.code
group by area
order by max_avg_price desc;

-- Most Houses sold in london borough region:
select area,borough_flag,max(houses_sold) as max_houses_sold
from housing_in_london_monthly_variables
group by area,borough_flag
having borough_flag = 1 -- Using having in aggregate function in MYSQL
order by max_houses_sold desc;

-- Least Houses sold in london borough region:
select area,borough_flag,min(houses_sold) as min_houses_sold
from housing_in_london_monthly_variables
group by area,borough_flag
having borough_flag = 1 -- Using having in aggregate function in MYSQL
order by min_houses_sold asc;


-- Five Highest number of crimes in the UK residential areas:
select area,borough_flag,round(avg(no_of_crimes),0) as max_crimes -- Rounded the average
from housing_in_london_monthly_variables
group by area,borough_flag
order by max_crimes desc
limit 5;

--- THANK-YOU----
