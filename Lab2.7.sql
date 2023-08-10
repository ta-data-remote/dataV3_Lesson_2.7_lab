-- Lab | SQL Join (Part I)
-- How many films are there for each of the categories in the category table. 
-- Use appropriate join to write this query.
USE sakila;

-- Films - count film_id from film category 
-- Categories category_id from category 

SELECT count(fc.film_id), c.category_id
FROM category c 
JOIN film_category fc 
USING(category_id)
GROUP BY category_id;


-- Display the total amount rung up by each staff member in August of 2005.


SELECT s.last_name, SUM(p.amount)
FROM staff s 
JOIN payment p 
USING(staff_id)
GROUP BY s.staff_id;


-- Which actor has appeared in the most films?

SELECT fa.actor_id, COUNT(f.film_id)
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
GROUP BY fa.actor_id;

-- Most active customer (the customer that has rented the most number of films)

SELECT COUNT(r.rental_id), c.customer_id, c.first_name, c.last_name
FROM rental r 
JOIN customer c 
USING (customer_id)
GROUP BY customer_id
ORDER BY count(r.rental_id) DESC;


-- Display the first and last names, as well as the address, of each staff member.

SELECT s.first_name, s.last_name, a.address
FROM staff s 
JOIN address a 
USING(address_id);


-- List each film and the number of actors who are listed for that film.

SELECT f.title, count(fa.actor_id) 
FROM film f 
JOIN film_actor fa 
USING(film_id)
GROUP BY title;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

USE Sakila;

-- 1. How many films are there for each of the categories in the category table. Use appropriate join to write this query.
    -- Number of films: COUNTS (film_id) FROM film 
    -- Categories: category_id FROM film_category
    -- Commun column:  film_id
    
SELECT  fc.category_id , COUNT(f.film_id)
FROM film f
JOIN film_category fc
ON f.film_id = fc.film_id
GROUP BY fc.category_id
ORDER BY fc.category_id;
    
-- 2. Display the total amount rung up by each staff member in August of 2005.
	-- Total amount: SUM(amount) FROM Payment
    -- Date: payment_date FROM Payment
    -- Staff name: first_name FROM staff
    -- Commun column: staff_id
    -- GROUP BY: first_name

SELECT s.staff_id ,s.first_name, SUM(p.amount)
FROM sakila.staff s
JOIN sakila.payment p
USING (staff_id)
GROUP BY s.staff_id;


-- 3. Which actor has appeared in the most films?
  -- Actor: actor_id FROM film_actor
  -- film: film_id FROM film
  -- commun column: film_id
  -- GROUP BY: Actor_id

SELECT fa.actor_id, COUNT(f.film_id)
FROM sakila.film_actor fa
JOIN sakila.film f
USING (film_id)
GROUP BY fa.actor_id;

-- 4. Most active customer (the customer that has rented the most number of films)
   -- Customer: costumer_id FROM customer
   -- Number of rented films: COUNT (rental_id) FROM rental
   -- Commun column: costumer_id
   -- GROUP BY: email FROM costumer
   
SELECT r.customer_id, COUNT(r.rental_id), c.email, c.first_name, c.last_name
FROM sakila.rental r
JOIN sakila.customer c
USING (customer_id)
GROUP BY r.customer_id
ORDER BY COUNT(r.rental_id) DESC;


-- 5. Display the first and last names, as well as the address, of each staff member.
   -- Staff names: first_name, last_name FROM staff
   -- Adresses: address FROM address
   -- Common column: address_id

SELECT s.first_name, s.last_name, a.address
FROM sakila.staff s
JOIN sakila.address a
USING (address_id);

-- 6. List each film and the number of actors who are listed for that film.
	-- Film: title FROM film
    -- Actors: COUNT(actor_id) FROM film actor
    -- Common column: film_id
    -- GROUP BY film_id

SELECT f.title, COUNT(fa.actor_id)
FROM film f
JOIN film_actor fa
USING (film_id)
GROUP BY film_id;

-- 7. Using the tables `payment` and `customer` and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
	-- Payments:  SUM(amount) FROM payment
    -- Customer name:  last_name FROM customer 
    -- Common column: customer_id
    -- GROUP BY customer_id
    -- ORDER BY last_name asc

SELECT SUM(p.amount), c.last_name
FROM payment p
JOIN customer c
USING (customer_id)
GROUP BY customer_id
ORDER BY last_name ASC;


-- List the titles of films per category.

SELECT f.title, fc.category_id
FROM film f
JOIN film_category fc
USING (film_id);