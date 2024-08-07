select * from customer

select * from product

create table sales(
	id serial primary key,
	customer_age int,
	Sales_date date,
	discount int,
	profit int,
	sales int,
	state varchar
	)

insert into sales values(1,21,'1/1/2017',0,36,5,'Sockhlom')

select * from sales

copy sales from 'D:\Task 7 Sql csv data 1.csv'DELIMITER ',' csv header

select * from sales

--Create a report of all state sales,quantity,discount,profit with following aggregate sum,avg,max.count

select s.state,
sum(s.sales) as sum_sales,
avg(s.sales) as avg_sales,
count(quantity) as count_quantity,
min(discount) as min_discount,
sum (profit) as sum_profit from sales as s
inner join product as p
on s.id= product_id
group by s.state

--get data of all state and city's avg customer age  

select state,avg(customer_age) from sales group by state 

--get data of 2017 to 2018  with product name and sales per quantity                   

select p.name,sales_date,sum(p.sales)/sum(p.quantity) as sales_per_quantity
from sales as s
inner join product as p
on product_id=s.id
where sales_date between '2017-01-01' and '2018-02-01'
group by p.name,sales_date
