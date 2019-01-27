
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
SELECT first_name, last_name, SUM(amount) as 'Total', payment_date
FROM payment
JOIN staff
USING(staff_id)
WHERE payment_date LIKE '2005-08%'
GROUP BY last_name;




