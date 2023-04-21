-- In this assignment, you'll be building the domain model, database 
-- structure, and data for "KMDB" (the Kellogg Movie Database).
-- The end product will be a report that prints the movies and the 
-- top-billed cast for each movie in the database.

-- Requirements/assumptions
--
-- - There will only be three movies in the database – the three films
--   that make up Christopher Nolan's Batman trilogy.
-- - Movie data includes the movie title, year released, MPAA rating,
--   and studio.
-- - There are many studios, and each studio produces many movies, but
--   a movie belongs to a single studio.
-- - An actor can be in multiple movies.
-- - Everything you need to do in this assignment is marked with TODO!

-- User stories
--
-- - As a guest, I want to see a list of movies with the title, year released,
--   MPAA rating, and studio information.
-- - As a guest, I want to see the movies which a single studio has produced.
-- - As a guest, I want to see each movie's cast including each actor's
--   name and the name of the character they portray.
-- - As a guest, I want to see the movies which a single actor has acted in.
-- * Note: The "guest" user role represents the experience prior to logging-in
--   to an app and typically does not have a corresponding database table.


-- Deliverables
-- 
-- There are three deliverables for this assignment, all delivered via
-- this file and submitted via GitHub and Canvas:
-- - A domain model, implemented via CREATE TABLE statements for each
--   model/table. Also, include DROP TABLE IF EXISTS statements for each
--   table, so that each run of this script starts with a blank database.
-- - Insertion of "Batman" sample data into tables.
-- - Selection of data, so that something similar to the sample "report"
--   below can be achieved.

-- Rubric
--
-- 1. Domain model - 6 points
-- - Think about how the domain model needs to reflect the
--   "real world" entities and the relationships with each other. 
--   Hint #1: It's not just a single table that contains everything in the 
--   expected output. There are multiple real world entities and
--   relationships including at least one many-to-many relationship.
--   Hint #2: Do NOT name one of your models/tables “cast” or “casts”; this 
--   is a reserved word in sqlite and will break your database! Instead, 
--   think of a better word to describe this concept; i.e. the relationship 
--   between an actor and the movie in which they play a part.
-- 2. Execution of the domain model (CREATE TABLE) - 4 points
-- - Follow best practices for table and column names
-- - Use correct data column types (i.e. TEXT/INTEGER)
-- - Use of the `model_id` naming convention for foreign key columns
-- 3. Insertion of data (INSERT statements) - 4 points
-- - Insert data into all the tables you've created
-- - It actually works, i.e. proper INSERT syntax
-- 4. "The report" (SELECT statements) - 6 points
-- - Write 2 `SELECT` statements to produce something similar to the
--   sample output below - 1 for movies and 1 for cast. You will need
--   to read data from multiple tables in each `SELECT` statement.
--   Formatting does not matter.

-- Submission
-- 
-- - "Use this template" to create a brand-new "hw1" repository in your
--   personal GitHub account, e.g. https://github.com/<USERNAME>/hw1
-- - Do the assignment, committing and syncing often
-- - When done, commit and sync a final time, before submitting the GitHub
--   URL for the finished "hw1" repository as the "Website URL" for the 
--   Homework 1 assignment in Canvas

-- Successful sample output is as shown:

-- Movies
-- ======

-- Batman Begins          2005           PG-13  Warner Bros.
-- The Dark Knight        2008           PG-13  Warner Bros.
-- The Dark Knight Rises  2012           PG-13  Warner Bros.

-- Top Cast
-- ========

-- Batman Begins          Christian Bale        Bruce Wayne
-- Batman Begins          Michael Caine         Alfred
-- Batman Begins          Liam Neeson           Ra's Al Ghul
-- Batman Begins          Katie Holmes          Rachel Dawes
-- Batman Begins          Gary Oldman           Commissioner Gordon
-- The Dark Knight        Christian Bale        Bruce Wayne
-- The Dark Knight        Heath Ledger          Joker
-- The Dark Knight        Aaron Eckhart         Harvey Dent
-- The Dark Knight        Michael Caine         Alfred
-- The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
-- The Dark Knight Rises  Christian Bale        Bruce Wayne
-- The Dark Knight Rises  Gary Oldman           Commissioner Gordon
-- The Dark Knight Rises  Tom Hardy             Bane
-- The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
-- The Dark Knight Rises  Anne Hathaway         Selina Kyle

-- Turns column mode on but headers off
.mode column
.headers off

-- Drop existing tables, so you'll start fresh each time this script is run.
-- TODO!

-- Create new tables, according to your domain model
-- TODO!

-- Insert data into your database that reflects the sample data shown above
-- Use hard-coded foreign key IDs when necessary
-- TODO!

-- Prints a header for the movies output


-- The SQL statement for the movies output
-- TODO!

-- Prints a header for the cast output


-- The SQL statement for the cast output
-- TODO!

DROP TABLE IF EXISTS hollywoodpeople;
DROP TABLE IF EXISTS studios;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS characters;

CREATE TABLE hollywoodpeople (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Whole_Name TEXT, 
    movies_id INTEGER
);

CREATE TABLE studios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Studio_name TEXT
);

CREATE TABLE movies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Movie_Name TEXT, 
    MPAA_Rating TEXT,
    studios_id INTEGER,
    year_release TEXT,
    hollywoodpeople_id INTEGER,
    characters_id INTEGER
);

CREATE TABLE characters (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    Character_name TEXT, 
    hollywoodpeople_id INTEGER,
    movies_id INTEGER
);





INSERT INTO studios (Studio_name)
VALUES ("Warner Bros.");
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Christian Bale");
-- hollywoodpeople #1 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Michael Cain");
-- hollywoodpeople #2 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Liam Neeson");
-- hollywoodpeople #3 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Katie Holmes");
-- hollywoodpeople #4 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Gary Oldman");
-- hollywoodpeople #5 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Heath Ledger");
-- hollywoodpeople #6 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Aaron Eckhart");
-- hollywoodpeople #7 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Maggie Gyllenhaal");
-- hollywoodpeople #8 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Tom Hardy");
-- hollywoodpeople #9 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Joseph Gordan-Levitt");
-- hollywoodpeople #10 
INSERT INTO hollywoodpeople (Whole_Name)
VALUES ("Anne Hathaway");
-- hollywoodpeople #11 
INSERT INTO movies (Movie_Name, MPAA_Rating, studios_id, year_release)
VALUES ("Batman Begins", "PG-13",1, "2005");
INSERT INTO movies (Movie_Name, MPAA_Rating, studios_id, year_release)
VALUES ("The Dark Knight", "PG-13",1, "2008");
INSERT INTO movies (Movie_Name, MPAA_Rating, studios_id, year_release)
VALUES ("The Dark Knight Rises", "PG-13",1, "2012");

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Bruce Wayne", 1, 1);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Bruce Wayne", 1, 2);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Bruce Wayne", 1, 3);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Alfred", 2, 1);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Alfred", 2, 2);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Alfred", 2, 3);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Ra's Al Ghul", 3,1);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Rachel Dawes", 4, 1);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Commissioner Gordon", 5, 1);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Commissioner Gordon", 5, 2);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Commissioner Gordon", 5, 3);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("The Joker", 6, 2);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Harvey Dent / Two-Face", 7, 2);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Rachel Dawes", 8, 2);

INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Bane", 9, 3);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("John Blake / Robin", 10, 3);
INSERT INTO characters (Character_name, hollywoodpeople_id, movies_id)
VALUES ("Selina Kyle", 11, 3);


.print "Movies"
.print ""
SELECT Movie_Name, year_release, MPAA_Rating, Studio_name FROM movies, studios;
.print ""
.print "======"
.print ""

.print ""
.print "Top Cast"
.print ""

SELECT movies.Movie_Name, hollywoodpeople.Whole_Name, characters.Character_name
FROM movies INNER JOIN characters on (movies.id = characters.movies_id) INNER JOIN hollywoodpeople on (hollywoodpeople.id = characters.hollywoodpeople_id) ORDER BY Movie_Name;

.print ""
.print "========"
.print ""