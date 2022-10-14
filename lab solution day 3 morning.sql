use sakila;

/* 1) Select all the actors with the first name ‘Scarlett’. */

SELECT * FROM actor
WHERE first_name = ('Scarlett');

/* 2) How many films (movies) are available for rent and how many films have been rented? */

SELECT COUNT(DISTINCT inventory_id) as 'Number of films available for rent' FROM rental;
SELECT COUNT(rental_date) as 'Number of films rented' FROM rental;
 
/* 3) What are the shortest and longest movie duration? Name the values max_duration and min_duration. */

SELECT MAX(length) AS max_duration FROM film;
SELECT MIN(length) AS min_duration FROM film;

/* 4) What's the average movie duration expressed in format (hours, minutes)? */

SELECT date_format(CONVERT(AVG(length),date), '%hh:%mm') AS 'Average length' FROM film;

-- 5) How many distinct (different) actors' last names are there? --

SELECT COUNT(last_name) AS 'Number of different Last Names' FROM ACTOR;

-- 6)Since how many days has the company been operating (check DATEDIFF() function)? --

SELECT payment_date FROM payment;

SELECT DATEDIFF('2005-05-25', '2006-02-14')AS 'Days of Operation';

-- 7) Show rental info with additional columns month and weekday. Get 20 results. --

SELECT *, DAYOFWEEK(rental_date) AS a FROM rental;

SELECT *, DAYOFWEEK(rental_date) AS DAYS,
CASE
	WHEN(DAYOFWEEK(rental_date) LIKE '%6') THEN 'WEEKEND'
	WHEN(DAYOFWEEK(rental_date) LIKE '%7' ) THEN 'WEEKEND'
    ELSE 'WORKDAY'
END AS 'Column day type'
FROM rental;

-- 8) Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.--


-- 9) Get release years. --

SELECT title AS 'Film Title', release_year AS 'Release years' FROM film;

-- 10) Get all films with ARMAGEDDON in the title. --

SELECT title AS 'Film Title' FROM film
WHERE title LIKE '%ARMAGEDDON%'; 

-- 11) Get all films which title ends with APOLLO. --

SELECT title AS 'Film Title' FROM film
WHERE title LIKE '%APOLLO'; 

-- 12) Get 10 the longest films. --

SELECT length, title as 'Longest Films' FROM film
ORDER BY length DESC
LIMIT 10;

-- 13) How many films include Behind the Scenes content? -- 

SELECT title as 'Film Title', special_features AS 'Special Features with Behind the Scenes' FROM film
WHERE special_features LIKE '%Behind the Scenes%';
