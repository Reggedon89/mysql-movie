-- Question 1 Select all columns and rows from the movies table

SELECT id,title,genres
FROM movies;

-- Question 2 Select only the title and id of the first 10 rows

SELECT id, title
FROM movies
WHERE  id <= 10;

-- Find Movie with the id of 485
SELECT id, title
FROM movies
WHERE id = 485;

--  Find the id (only that column) of the movie Made in America (1993)
SELECT id, title
FROM movies
WHERE title = "Made in America (1993)" 

-- Find the first 10 sorted alphabetically
SELECT id, title
FROM movies 
WHERE id <= 10
ORDER BY title ASC;

-- Find all movies from 2002
SELECT id, title
FROM movies
WHERE title  LIKE "%(2002)%";

-- Find out what year the Godfather came out

SELECT id, title
FROM movies
WHERE title LIKE "%Godfather,The%"

-- Without using joins find all the comedies

SELECT title, genres
FROM movies
WHERE genres = "Comedy";

-- Find all comedies in the year 2000

SELECT  title, genres
FROM movies
WHERE genres = "comedy" AND title LIKE '%death%'

-- Find any movies from either 2001 or 2002 with a title containing super

SELECT id, title
FROM movies
WHERE title LIKE "%super%" AND title LIKE "%2001%";

-- Create a new table called actors (We are going to pretend the actor can only play in one movie). The table should include name, character name, foreign key to movies and date of birth at least plus an id field.
INSERT INTO actors (name, character_name, movie_id, dob)
VALUES ('Tom Hanks', 'Woody', 1, '1956-07-09'),
('Tim Allen', 'Buzz Lightyear', 1, '1953-06-13'),
('Annie Potts', 'Little Bo Peep', 1, '1952-10-28'),
('Don Rickles', 'Mr. Potato Head', 1, '1926-05-08'),
('Wallace Shawn', 'Rex', 1, '1943-11-12'),
('John Ratzenberger', 'Hamm', 1, '1947-04-06'),
('Jim Varney', 'Slinky Dog', 1, "1949-06-15"),
('John Morris', 'Andy', 1, '1984-06-21'),
('Erik von Detten', 'Sid', 1, '1982-10-03'),
('R. Lee Ermey', 'Sergeant', 1, '1944-03-24'),
('Viggo Mortensen', 'Aragorn', 2, '1958-10-20'),
('Ian McKellen', 'Gandalf', 2, '1939-05-25'),
('Elijah Wood', 'Frodo Baggins', 2, '1981-01-28'),
('Orlando Bloom', 'Legolas', 2, '1977-01-13'),
('Sean Astin', 'Samwise Gamgee', 2, '1971-02-25'),
('Sean Bean', 'Boromir', 2, '1959-04-17'),
('Billy Boy', 'Peregrin Took', 2, '1968-08-28'),
('Dominic Managhan', 'Meriadoc Brandybuck', 2, '1976-12-02'),
('John Rhys-Davies', 'Gimli', 2, '1944-05-05'),
('Andy Serkis', 'Gollum', 2, '1964-04-20'),
('Sarah Polley', 'Ana', 3, '1979-01-08'),
('Ving Rhames', 'Kenneth', 3, '1959-05-12'),
('Mekhi Phifer', 'Andre', 3, '1974-12-29'),
('Jake Weber', 'Michael', 3, '1963-03-12'),
('Ty Burrell', 'Steve', 3, '1967-08-22'),
('Kevin Zegers', 'Terry', 3, '1984-09-19'),
('Kim Poirier', 'Monica', 3, '1980-02-06'),
('Michael Kelly', 'CJ', 3, '1969-05-22'),
('Lindy Booth', 'Nicole', 3, '1979-04-02'),
('Boyd Banks', 'Tucker', 3, '1964-04-16')

-- Create a new column in the movie table to hold the MPAA rating. UPDATE 5 different movies to their correct rating
UPDATE movies
SET mpaa_ratings ="G"
WHERE id =1


UPDATE movies
SET mpaa_rating = 'PG13'
WHERE id = 2;

UPDATE movies
SET mpaa_rating = 'PG13'
WHERE id = 3;

UPDATE movies
SET mpaa_rating = 'R'
WHERE id = 4;

UPDATE movies
SET mpaa_rating = 'PG'
WHERE id = 5;

-- WITH JOINS
 -- Find all the ratings for the movie Godfather, show just the title and the rating

-- Find all the ratings for the movie Godfather, show just the title and the rating
SELECT movies.title, rating
FROM movies
LEFT JOIN ratings ON id = movie_id
WHERE title LIKE '%GodFather, The%';

-- Order the previous objective by newest to oldest
SELECT movies.title, rating, timestamp
FROM movies
LEFT JOIN ratings ON id = movie_id
WHERE title LIKE '%GodFather, The%'
ORDER BY timestamp DESC;

-- Find the comedies from 2005 and get the title and imdbid from the links table
SELECT movies.title, links.imdb_id 
FROM movies
LEFT JOIN links ON id = movie_id
WHERE title LIKE '%(2005)%' AND genres='comedy';


-- Find all movies that have no ratings
SELECT movies.title, ratings.rating
FROM movies
LEFT JOIN ratings ON id = movie_id
WHERE rating = null;





--                              COMPLETE THE FOLLOWING AGGREGATION OBJECTIVES



-- Get the average rating for a movie
SELECT AVG(rating)
FROM ratings
WHERE movie_id = 1;

-- Get the total ratings for a movie
SELECT SUM(rating)
FROM ratings
WHERE movie_id = 1;

-- Get the total movies for a genre
SELECT genres, SUM(title)
FROM movies
WHERE title
Group By genres;

-- Get the average rating for a user
SELECT AVG(rating)
FROM ratings
WHERE user_id = 670;

-- Find the user with the most ratings
SELECT user_id, SUM(rating)
FROM ratings
WHERE rating > 4
GROUP BY user_id
Order By SUM(rating) DESC
LIMIT 1;

-- Find the user with the highest average rating
SELECT user_id, AVG(rating)
FROM ratings
WHERE rating > 4
GROUP BY user_id
Order By AVG(rating) DESC
LIMIT 1;

-- Find the user with the highest average rating with more than 50 reviews
SELECT COUNT(rating),user_id, AVG(rating)
FROM ratings
GROUP BY user_id
HAVING COUNT(rating) >= 50
ORDER BY AVG(rating) DESC
LIMIT 1;


-- Find the movies with an average rating over 4
SELECT movies.title, rating
FROM movies
LEFT JOIN ratings ON id = movie_id
WHERE rating
HAVING rating > 4
ORDER BY rating ASC;
