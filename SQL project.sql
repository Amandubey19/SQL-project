--- Q1. Who is the senior most employee based on job title?

select * from employee
order by levels desc
limit 1

--- Answer:-Mr. M.Mohan is the senior most employee whose level is L7 and his employee id is 09.


---Q2. Which county have the most invoices?

Select * from invoice

select count (*) as c, billing_country
from invoice
group by billing_country
order by c desc

---Answer:- USA is the city which have the most Invoice that is 131.

---Q3. What are the top Three values of total invoice?

select total from invoice 
order by total desc 
limit 3

---Answer:- Top three values are 1) 23.7599 , 2) 19.8 , 3) 19.8

---Q4. Which City has the best Customer? We would like to throw a promotional Music Festival in the city 
---we made the most money. Write a query that returns one city that has the highest SUM of incoice total.
---Return both the city name & Sum of all invoice total

Select Sum(total) as invoice_total, billing_city
from Invoice
group by billing_city
order by invoice_total desc

---Answer:- Prague is the city which has the best customer and the total invoice is 273.24

---Q5. who is the best customer? The customer who has spent the most money will be declared the best customer.
---Write a query that returns the person who has spent the most money.

select customer.customer_id, customer.first_name, customer.last_name, Sum(invoice.total) as total
from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1

---Answer:- Mr. R.Madhav is declared as a best customer, who spent the most money which is 144.54

---Q6:- Top 5 Artists by Total Track Sales

select 
    ar.name as artist_name,
    round(sum(il.unit_price * il.quantity)::numeric, 2) as total_sales
from 
    artist ar
join 
    album al on ar.artist_id = al.artist_id
join 
    track t on al.album_id = t.album_id
join 
    invoice_line il on t.track_id = il.track_id
group by 
    ar.name
order by 
    total_sales desc
limit 5;

---Q7:- top 5 music genres by total sales
select 
    g.name as genre,
    sum(il.unit_price * il.quantity) as total_sales
from 
    invoice_line il
join 
    track t on il.track_id = t.track_id
join 
    genre g on t.genre_id = g.genre_id
group by 
    g.name
order by 
    total_sales desc
limit 5;

---Q8:- monthly revenue trend
select 
    date_trunc('month', i.invoice_date) as month,
    round(sum(il.unit_price * il.quantity)::numeric, 2) as revenue
from 
    invoice i
join 
    invoice_line il on i.invoice_id = il.invoice_id
group by 
    date_trunc('month', i.invoice_date)
order by 
    month;

---Q9:- top 5 customers by total spend
select 
    c.first_name || ' ' || c.last_name as customer_name,
    round(sum(il.unit_price * il.quantity)::numeric, 2) as total_spent
from 
    customer c
join 
    invoice i on c.customer_id = i.customer_id
join 
    invoice_line il on i.invoice_id = il.invoice_id
group by 
    customer_name
order by 
    total_spent desc
limit 5;

---Q10:- top 5 artists by track sales
select 
    ar.name as artist_name,
    round(sum(il.unit_price * il.quantity)::numeric, 2) as total_sales
from 
    artist ar
join 
    album al on ar.artist_id = al.artist_id
join 
    track t on al.album_id = t.album_id
join 
    invoice_line il on t.track_id = il.track_id
group by 
    ar.name
order by 
    total_sales desc
limit 5;

