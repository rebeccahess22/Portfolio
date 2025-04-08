
psql --username=freecodecamp --dbname=postgres


CREATE DATABASE universe;
\c universe 
CREATE TABLE galaxy(
  galaxy_id SERIAL PRIMARY KEY, 
  name VARCHAR(30) NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  planet_types TEXT,
  distance_from_earth NUMERIC
  );
CREATE TABLE star(
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  description TEXT,
  age_in_millions_of_years INT,
  planet_types TEXT,
  distance_from_earth NUMERIC
  );
CREATE TABLE planet(
  planet_id INT NOT NULL PRIMARY KEY, 
  name VARCHAR(30) NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  distance_from_earth NUMERIC
  );
CREATE TABLE moon(
  moon_id SERIAL PRIMARY KEY, 
  name VARCHAR(30) NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  is_spherical BOOLEAN,
  age_in_millions_of_years INT,
  planet_types TEXT,
  distance_from_earth NUMERIC
  );
-- need some 5th table 
CREATE TABLE spaceship(
  spaceship_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  description TEXT,
  has_life BOOLEAN,
  distance_from_earth NUMERIC
  );

-- adding foreign keys 
ALTER TABLE star ADD COLUMN galaxy_id INT;
ALTER TABLE star ADD FOREIGN KEY(galaxy_id) REFERENCES galaxy(galaxy_id);

ALTER TABLE planet ADD COLUMN star_id INT;
ALTER TABLE planet ADD FOREIGN KEY(star_id) REFERENCES star(star_id);

ALTER TABLE moon ADD COLUMN planet_id INT;
ALTER TABLE moon ADD FOREIGN KEY(planet_id) REFERENCES planet(planet_id);

-- adding rows to the tables(galaxy, star, planet, moon, spaceship)
-- GALAXY NEEDS TO HAVE 6 ROWS BASED ON THE INSTRUCTIONS
INSERT INTO galaxy(name, has_life) 
  VALUES
    ('Harry Potter', TRUE),
    ('Dune', TRUE),
    ('Hunger Games', FALSE),
    ('Twilight', TRUE),
    ('Bridge to Taribithia', FALSE),
    ('United States of America', FALSE)
    ;
--no requirement on length for stars 
INSERT INTO star(name, galaxy_id) 
  VALUES
    ('Miley Cyrus', 1),
    ('Selena Gomez', 1),
    ('Justin Beiber', 6),
    ('Chappell Roan', 5),
    ('CharliXCX', 4),
    ('FKA Twigs', 4)
    ;

--need 12 planets, FOR SOME REASON WE NEEDED OT TYPE HE PLANET INDEX 
INSERT INTO planet(planet_id, name, star_id) 
  VALUES
    (1, 'Tik Tok', 1),
    (2, 'Facebook', 3),
    (3, 'Snapchat', 3),
    (4, 'Instagram', 2),
    (5, 'Twitter', 3),
    (6, 'Whatsapp', 3),
    (7, 'Threads', 1),
    (8, 'YikYak', 3),
    (9, 'Pinterest', 2),
    (10, 'Reddit', 1),
    (11, 'LinkedIn', 2),
    (12, 'Youtube', 1)
    ;

--need 20 moons
INSERT INTO moon(name, planet_id) 
  VALUES
    ('Jon Krakauer', 9),
    ('Aldous Huxley', 9),
    ('Karl Marx', 9),
    ('Fyodor Dostoevsky', 9),
    ('Max Bennet', 1),
    ('Colene Hoover', 4),
    ('Richard Thaler', 11),
    ('Susan Collins', 2),
    ('Roxanne Gay', 5),
    ('Mary Shelley', 1),
    ('Rebecca Yarros', 4),
    ('Buddha', 6),
    ('Ghandi', 6),
    ('Abraham Lincoln', 12),
    ('Barack Obama', 12),
    ('Michelle Obama', 12),
    ('Hillary Clinton', 12),
    ('Iliza Shlesinger', 12),
    ('Valor Coffee', 4),
    ('Dany Khaneman', 11)
    ;

-- no requirement for spaceships
INSERT INTO spaceship(name)
  VALUES
    ('Anticos Pizza'),
    ('Okiboru'),
    ('Vanilla Sweet Cream Coldbew')
  ;

  INSERT INTO star(name, galaxy_id) 
  VALUES
    ('Chappell Roan', 5),
    ('CharliXCX', 4),
    ('FKA Twigs', 4)
    ;