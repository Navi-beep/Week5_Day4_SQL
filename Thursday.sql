--Q1 Stored Procedure--

CREATE OR REPLACE PROCEDURE add_film_2(
	title VARCHAR(250),
	description VARCHAR,
	release_year INTEGER,
	language_id INTEGER,
	rental_duration INTEGER,
	rental_rate NUMERIC(4,2),
	length INTEGER,
	replacement_cost NUMERIC(5,2),
	rating mpaa_rating
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO film(title, description, release_year, language_id, rental_duration, rental_rate,
	length, replacement_cost, rating)
	VALUES(title, description, release_year, language_id, rental_duration, rental_rate,
	length, replacement_cost, rating);
END
$$

CALL add_film_2('A Cat too Far', 'Pspspspspspsps', 2006, 1, 7, 2.99, 120, 99.99, 'G');

SELECT * FROM film WHERE title LIKE 'A Cat too Far%';






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





