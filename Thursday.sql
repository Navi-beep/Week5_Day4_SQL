--Q1 Stored Procedure--

CREATE OR REPLACE PROCEDURE add_film(
	film_id INTEGER,
	title VARCHAR(50),
	description VARCHAR(100),
	release_year VARCHAR,
	language_id INTEGER,
	rental_duration INTEGER,
	rental_rate NUMERIC(4,2),
	length INTEGER,
	replacement_cost NUMERIC(5,2),
	rating VARCHAR(5)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO film(film_id, title, description, release_year, language_id, rental_duration, rental_rate,
	length, replacement_cost, rating)
	VALUES(film_id, title, description, release_year, language_id, rental_duration, rental_rate,
	length, replacement_cost, rating);
END
$$


SELECT*
FROM film;

CALL add_film('1234', 'A Cat too Far', 'Pspspspspspsps', '2006', '1', '7', '2.99', '120', '99.99', 'PG');
--it will not run!--







--Q2 Stored Function--


SELECT COUNT(*)
FROM film_category
WHERE category_id = 15;


CREATE OR REPLACE FUNCTION get_films_in_cat(your_number INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql
AS $$
	DECLARE films_in_cat INTEGER;
BEGIN
	SELECT COUNT(*) INTO films_in_cat
	FROM film_category 
	WHERE category_id = your_number;
	RETURN films_in_cat;
END;
$$;


SELECT get_films_in_cat('15');





