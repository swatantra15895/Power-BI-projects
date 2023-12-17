----  First Assignment  -----

use mavenmovies;

---Identify the primary keys and foreign keys in maven movies db. Discuss the differences ---

describe actor; --- Primary key - actor_id ---
describe actor_award; --- primary key - actor_award_id, foreign key - actor_id ---
describe address; --- primary key - address_id, foreign key - city_id ---
describe advisor; --- primary key - advisor_id ----
describe category; --- primary key - category_id ---
describe city; --- primary key - city_id, foreign key - country_id ---
describe country; --- primary key - country_id ---
describe customer; --- primary key - customer_id, foreign keys - address_id, store_id ---
describe film; --- primary key - film_id, foreign key - language_id ---
describe film_actor; --- primary keys - actor_id, film_id ---
describe film_category; --- primary keys - film_id, category_id ---
describe film_text; --- primary key- film_id ---
describe inventory; --- primary key - inventory_id, foreign keys - film_id, store_id ---
describe investor; --- primary key - investor_id ---
describe language; --- primary key - language_id ---
describe payment; --- primary key - payment_id, foreign keys - customer_id, staff_id, rental_id ---
describe rental; --- primary key - rental_id, foreign keys - inventory_id, customer_id, staff_id ---
describe staff; --- primary key - staff_id, foreign keys - address_id, store_id ---
describe store; --- primary key - store_id, foreign key - address_id ---

--- List all details of actors ---
select * from actor;

---- List all customer information from DB---
select * from customer;

---- List different countries ---
select distinct(country) from country;

------ Display all active customers----
select concat(first_name, " ",last_name) as customer_name from customer where active=1;

---- List of all rental IDs for customer with ID 1-----
select rental_id from rental where customer_id=1;

---- Display all the films whose rental duration is greater than 5----
select title from film where rental_duration>5;

--- List the total number of films whose replacement cost is greater than $15 and less than $20.--

select count(film_id) from film where replacement_cost between 15 and 20;

--- Display the count of unique first names of actors ---

select count(distinct(first_name)) from actor;

---  Display the first 10 records from the customer table ---

select * from customer limit 10;

---  Display the first 3 records from the customer table whose first name starts with ‘b’ ---

select * from customer where first_name like"b%" limit 3;

--- Display the names of the first 5 movies which are rated as ‘G’ ---

select title from film where rating='G' limit 5;

--- Find all customers whose first name starts with "a" ---

select concat(first_name," ",last_name) as customers from customer where first_name like"a%";

---  Find all customers whose first name ends with "a" ---

select concat(first_name," ",last_name) as customers from customer where first_name like"%a";

---  Display the list of first 4 cities which start and end with ‘a’ ---

select city from city where city like"a%a" limit 4;

 --- Find all customers whose first name have "NI" in any position ---
 
 select concat(first_name," ",last_name) as customers from customer where first_name like"%NI%";
 
 ---  Find all customers whose first name have "r" in the second position ---
 
 select concat(first_name," ",last_name) as customers from customer where first_name like"_r%";
 
 ---  Find all customers whose first name starts with "a" and are at least 5 characters in length ---
 
select concat(first_name," ",last_name) as customers from customer where first_name like"a%" and length(first_name)=5;

---  Find all customers whose first name starts with "a" and ends with "o" ---

select concat(first_name," ",last_name) as customers from customer where first_name like"a%o";

---  Get the films with pg and pg-13 rating using IN operator ---

select title from film where rating in('PG','PG-13');

---  Get the films with length between 50 to 100 using between operator ---

select * from film where length between 50 and 100;

--- Get the top 50 actors using limit operator ---

select concat(first_name," ",last_name) as actors from actor limit 50;

---  Get the distinct film ids from inventory table ---

select distinct(film_id) from inventory;
