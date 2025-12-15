-- New and Repeat Customers

create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000);


select * from customer_orders;

-- order_date,new_customer_count,repeat_customer_count
-- 2022-01-01,3,0 
-- 2022-01-02,2,1  100 is repeat one time
-- 2022-01-03,1,2  100,400 repeat one time 

-- select customer_id,min(order_date) as first_visit_date from customer_orders
-- group by customer_id;

-- visit and not visit 
-- use cte ()

-- with first_visit as(
 -- select customer_id,min(order_date) as first_visit_date from customer_orders
-- group by customer_id)

-- select co.*,first_visit_date from customer_orders co 
-- inner join first_visit fv on co.customer_id=fv.customer_id
-- order by order_id 

-- we have use simple alias, case stmt use

with first_visit as(
  select customer_id,min(order_date) as first_visit_date from customer_orders
 group by customer_id)

 select co.*,first_visit_date  
 , case when co.order_date=fv.first_visit_date then 1 else 0 end as first_visit_flag
 -- note that != not equal and repeat_visit
 , case when co.order_date!=fv.first_visit_date then 1 else 0 end as repeat_customer_flag
from customer_orders co
 inner join first_visit fv on co.customer_id=fv.customer_id
 order by order_id 

-- aggregating so use one more cte use

 -- with first_visit as(
 -- select customer_id,min(order_date) as first_visit_date from customer_orders
 -- group by customer_id)
-- , visit_flag as

 -- (select co.*,first_visit_date  
 -- , case when co.order_date=fv.first_visit_date then 1 else 0 end as first_visit_flag
 -- note that != not equal and repeat_visit
 -- , case when co.order_date!=fv.first_visit_date then 1 else 0 end as repeat_customer_flag
-- from customer_orders co
 -- inner join first_visit fv on co.customer_id=fv.customer_id
 -- order by order_id)
-- select order_date from customer_orders


