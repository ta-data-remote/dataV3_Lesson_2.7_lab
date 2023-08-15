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