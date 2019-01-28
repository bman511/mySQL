
SET SQL_SAFE_UPDATES = 0;

#1a
USE sakila;
SELECT first_name, last_name
FROM actor;

#1b
USE sakila;
SELECT CONCAT(first_name," ",last_name) AS 'Actor Name'
FROM actor;

#2a
USE sakila;
SELECT first_name, last_name, actor_id
FROM actor WHERE first_name = 'Joe';

#2b
USE sakila;
SELECT first_name, last_name, actor_id
FROM actor WHERE last_name LIKE '%GEN%';

#2c
USE sakila;
SELECT first_name, last_name, actor_id
FROM actor WHERE last_name LIKE '%LI%'
ORDER BY last_name, first_name;

#2d
USE sakila;
SELECT country_id, country
FROM country
WHERE country in ('China','Afghanistan','Bangladesh');

#3a
USE sakila;
ALTER TABLE actor
ADD COLUMN description BLOB;

#3b
USE sakila;
ALTER TABLE actor
DROP COLUMN description;

#4a
USE sakila;
SELECT last_name, COUNT(last_name) AS 'Count'
FROM actor
GROUP BY last_name;

#4b
USE sakila;
SELECT last_name, COUNT(last_name) AS 'Count' 
FROM actor 
GROUP BY last_name
HAVING COUNT(last_name) > 1;

#4c
USE sakila;
UPDATE actor
SET first_name = 'HARPO'
WHERE first_name = 'GROUCHO' AND last_name='WILLIAMS';

#4d
USE sakila;
UPDATE actor
SET first_name = 'GROUCHO'
WHERE first_name = 'HARPO';

#5a
SHOW CREATE TABLE address;

#6a
SELECT first_name, last_name, address
FROM staff
JOIN address
USING(address_id);

#6b
USE sakila;
SELECT first_name, last_name, SUM(amount) AS 'Total', payment_date
FROM payment
JOIN staff
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY last_name;

#6c
USE sakila;
SELECT title, COUNT(actor_id) AS 'Actor Count'
FROM film
INNER JOIN film_actor
USING(film_id)
GROUP BY title;

#6d
SELECT COUNT(film_id) as 'Total Count'
FROM inventory
WHERE film_id IN 
(
    SELECT film_id
    FROM film_text
    WHERE title = 'Hunchback Impossible'
);

#6e
USE sakila;
SELECT last_name, SUM(payment_amount) AS 'Total Paid'
FROM payment
JOIN customer
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY last_name;

#7a
USE sakila;
SELECT title
FROM film_text
WHERE film_id IN
(
    SELECT film_id
    FROM film 
    WHERE language_id IN 
    (
        SELECT language_id
        FROM language 
        WHERE name = 'English'
    )
)
AND title LIKE 'K%' OR title LIKE 'Q%';

#7b
USE sakila;
SELECT first_name, last_name
FROM actor
WHERE actor_id IN
(
    SELECT actor_id
    FROM film_actor 
    WHERE film_id IN 
    (
        SELECT film_id
        FROM film 
        WHERE title = 'Alone Trip'
    )
);

#7c
USE sakila;
SELECT first_name, last_name, email, country
FROM customer
    JOIN address
        USING (address_id)
    JOIN city
        USING(city_id)
    JOIN country
        USING(country_id)
WHERE country = 'Canada';

#7d
USE sakila;
SELECT title
FROM film
WHERE film_id IN
(
    SELECT film_id
    FROM film_category 
    WHERE category_id IN 
    (
        SELECT category_id
        FROM category 
        WHERE name = 'Family'
    )
);

#7e
USE sakila;
SELECT title, COUNT(inventory_id) as 'Total Rentals'
FROM rental
JOIN inventory
    USING(inventory_id)
JOIN film_text
    USING(film_id)
GROUP BY title
ORDER BY COUNT(inventory_id) DESC;

#7f
SELECT store_id, SUM(amount) as 'Total'
FROM store
JOIN staff
	USING(store_id)
JOIN payment
	USING(staff_id)
GROUP BY store_id
ORDER BY SUM(amount) DESC

#7g



