CREATE TABLE galaxy(galaxy_id SERIAL PRIMARY KEY);
ALTER TABLE galaxy ADD COLUMN name VARCHAR(30);
ALTER TABLE galaxy ADD COLUMN description TEXT;
ALTER TABLE galaxy ADD COLUMN age_in_millions_of_years NUMERIC;
ALTER TABLE galaxy ADD COLUMN has_life BOOLEAN;
ALTER TABLE galaxy ADD COLUMN light_years_from_earth INT;
ALTER TABLE galaxy ADD UNIQUE(name);
ALTER TABLE galaxy RENAME COLUMN light_years_from_earth TO light_years_in_millions_from_earth;
INSERT INTO galaxy(name, description, age_in_millions_of_years, has_life, light_years_in_millions_from_earth)
VALUES('Andromeda', 'A spiral galaxy that is the closest large galaxy to the Milky Way', 10010, FALSE, 2),
('GN-z11', 'A high-redshift galaxy in the Ursa Major constellation', 13400, FALSE, 32400),
('IC 1101', 'A supergiant elliptical galaxy around  the the Abell 2029 galaxy', 12310, FALSE, 1045),
('Sombrero', 'The details pertaining to this galaxy are still unclear', 13250, FALSE, 29),
('Tadpole', 'This galaxy is the largest disrupted spiral galaxy of its sort', 100, FALSE, 400),
('Whirlpool', 'This was the first galaxy to be classified as a spiral galaxy', 400, FALSE, 23);
CREATE TABLE star(star_id SERIAL PRIMARY KEY);
ALTER TABLE star
ADD COLUMN name VARCHAR(30) UNIQUE NOT NULL,
ADD COLUMN magnitude INT,
ADD COLUMN approximate_planets INT,
ADD COLUMN liveable_solar_system BOOLEAN NOT NULL;
INSERT INTO star(name, magnitude, approximate_planets, liveable_solar_system)
VALUES('Alphertz', 2, 0, FALSE),
('UNKNOWN', 1, 1, FALSE),
('ANITS', 3, 12, TRUE),
('Pecul', 3, 5, TRUE),
('Tidal', 2, 18, TRUE),
('NGC 51', 2, 11, FALSE);
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
UPDATE star SET galaxy_id=1 WHERE star_id=1;
CREATE TABLE planet(planet_id SERIAL PRIMARY KEY);
ALTER TABLE planet ADD COLUMN star_id INT NOT NULL REFERENCES star(star_id);
ALTER TABLE planet
ADD COLUMN name VARCHAR(30) UNIQUE NOT NULL,
ADD COLUMN color VARCHAR(30),
ADD COLUMN age_in_millions_of_years INT,
ADD COLUMN liveable BOOLEAN,
ADD COLUMN nearby_blackholes INT;
INSERT INTO planet(star_id, name, color, age_in_millions_of_years, liveable, nearby_blackholes)
VALUES(2, 'Justice', 'Orange', 32423, FALSE, 0),
(3, 'Breathe', 'Purple', 65, TRUE, 1),
(3, 'Flip', 'Black', 456, TRUE, 1),
(3, 'Venti', 'Red', 91, TRUE, 1),
(4, 'Primitive', 'Green', 586840, TRUE, 2),
(5, 'Blind', 'Cotton Candy', 727, TRUE, 0),
(5, 'Almost', 'Pink', 47395, TRUE, 0),
(5, 'Thrasher', 'Gray', 666, TRUE, 0),
(5, 'Birdhouse', 'Blue', 92846, TRUE, 0),
(6, 'Enjoi', 'White', 1234, FALSE, 13),
(6, 'Girl', 'Brown', 83950, FALSE, 13),
(6, 'Independent', 'Teal', 9951, FALSE, 13);
CREATE TABLE moon(moon_id SERIAL PRIMARY KEY);
ALTER TABLE moon ADD COLUMN planet_id INT NOT NULL REFERENCES planet(planet_id);
ALTER TABLE moon ADD UNIQUE(moon_id);
ALTER TABLE moon
ADD COLUMN order_to_planet INT,
ADD COLUMN day_length_in_hours NUMERIC,
ADD COLUMN number_of_craters INT;
INSERT INTO moon(planet_id, order_to_planet, day_length_in_hours, number_of_craters) VALUES(1, 1, 32.5, 2);
INSERT INTO moon(planet_id, order_to_planet, day_length_in_hours, number_of_craters)
VALUES(1, 2, 42.5, 1),
(2, 1, 6, 11),
(3, 1, 112, 3),
(3, 2, 120, 7),
(3, 3, 164.4, 1),
(4, 1, 24, 2),
(6, 1, 22.3, 30),
(6, 2, 50.1, 23),
(7, 1, 300, 5),
(8, 1, 72, 21),
(8, 2, 73, 13),
(8, 3, 86.8, 2),
(10, 1, 31, 41),
(11, 1, 11.11, 111),
(11, 2, 33.33, 333),
(11, 3, 44.44, 444),
(11, 4, 55.55, 555),
(12, 1, 1, 5),
(12, 2, 4, 69),
(12, 3, 456, 789);
UPDATE moon SET name='moon' WHERE moon_id=1;
UPDATE moon SET name='mooon' WHERE moon_id=2;
UPDATE moon SET name='moooon' WHERE moon_id=3;
UPDATE moon SET name='mooooon' WHERE moon_id=4;
UPDATE moon SET name='moooooon' WHERE moon_id=5;
UPDATE moon SET name='mooooooon' WHERE moon_id=6;
UPDATE moon SET name='moooooooon' WHERE moon_id=7;
UPDATE moon SET name='mooooooooon' WHERE moon_id=8;
UPDATE moon SET name='moooooooooon' WHERE moon_id=9;
UPDATE moon SET name='mooooooooooon' WHERE moon_id=10;
UPDATE moon SET name='moooooooooooon' WHERE moon_id=11;
UPDATE moon SET name='mooooooooooooon' WHERE moon_id=12;
UPDATE moon SET name='moooooooooooooon' WHERE moon_id=13;
UPDATE moon SET name='mooooooooooooooon' WHERE moon_id=14;
UPDATE moon SET name='moooooooooooooooon' WHERE moon_id=15;
UPDATE moon SET name='mooooooooooooooooon' WHERE moon_id=16;
UPDATE moon SET name='moooooooooooooooooon' WHERE moon_id=17;
UPDATE moon SET name='mooooooooooooooooooon' WHERE moon_id=18;
UPDATE moon SET name='moooooooooooooooooooon' WHERE moon_id=19;
UPDATE moon SET name='mooooooooooooooooooooon' WHERE moon_id=20;
UPDATE moon SET name='moooooooooooooooooooooon' WHERE moon_id=21;
ALTER TABLE galaxy ALTER COLUMN name SET NOT NULL;
CREATE TABLE journey();
ALTER TABLE journey ADD COLUMN galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id);
ALTER TABLE journey
ADD COLUMN journey_id SERIAL UNIQUE PRIMARY KEY,
ADD COLUMN name VARCHAR(30),
ADD COLUMN will_humanity_survive_trip BOOLEAN;
INSERT INTO journey(galaxy_id, will_humanity_survive_trip)
VALUES(1, TRUE),
(2, FALSE),
(3, TRUE),
(4, TRUE),
(5, FALSE),
(6, FALSE);
ALTER TABLE journey ADD UNIQUE(journey_id);
