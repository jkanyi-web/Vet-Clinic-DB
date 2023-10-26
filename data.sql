/* Populate database with sample data. */
-- DAY 1
INSERT INTO animals VALUES
    (1, 'Agumon', '2020-02-03', 0, 'true', 10.23),
    (2, 'Gabumon', '2018-11-15', 2, 'true', 8),
    (3, 'Pikachu', '2021-01-07', 1, 'false', 15.04),
    (4, 'Devimon', '2017-05-12', 5, 'true', 11),

-- DAY 2
INSERT INTO animals VALUES
    (1, 'Agumon', '2020-02-03', 0, 'true', 10.23),
    (2, 'Gabumon', '2018-11-15', 2, 'true', 8),
    (3, 'Pikachu', '2021-01-07', 1, 'false', 15.04),
    (4, 'Devimon', '2017-05-12', 5, 'true', 11),
    (5, 'Charmander', '2020-02-08', 0, 'false', -11),
    (6, 'Plantmon', '2021-11-15', 2, 'true', -5.7),
    (7, 'Squirtle', '1993-04-02', 3, 'false', -12.13),
    (8, 'Angemon', '2005-06-12', 1, 'true', -45),
    (9, 'Boarmon', '2005-06-07', 7, 'true', 20.4),	
    (10, 'Blossom', '1998-10-13', 3, 'true', 17),	
    (11, 'Ditto', '2022-05-14', 4, 'true', 22);	

    -- DAY 3

INSERT INTO owners (full_name, age) VALUES
    ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES
    ('Pokemon'),
    ('Digimon');

-- DAY 4
INSERT INTO vets (full_name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '2000-04-23'),
  ('Maisy Smith', 26, '2019-01-17'),
  ('Stephanie Mendez', 64, '1981-05-04'),
  ('Jack Harkness', 38, '2008-06-08');

INSERT INTO specializations
VALUES
  (1, 1),
  (3, 1),
  (3, 2),
  (4, 2)

ALTER TABLE visits
ADD COLUMN visit_date date;

ALTER TABLE visits
DROP CONSTRAINT visits_pkey;

ALTER TABLE visits
ADD CONSTRAINT visits_pkey PRIMARY KEY (vet_id, animal_id, visit_date);

INSERT INTO visits (vet_id, animal_id, visit_date)
VALUES
(1, 4, '2020-05-24'),
(1, 3, '2020-07-22'),
(4, 5, '2021-02-02'),
(2, 10, '2020-01-05'),
(2, 10, '2020-03-08'),
(2, 10, '2020-05-14'),
(3, 6, '2021-05-04'),
(4, 7, '2021-02-24'),
(2, 1, '2019-12-21'),
(1, 1, '2020-08-10'),
(2, 1, '2021-04-07'),
(3, 8, '2019-09-29'),
(4, 2, '2020-10-03'),
(4, 2, '2020-11-04'),
(2, 3, '2019-01-24'),
(2, 3, '2019-05-15'),
(2, 3, '2020-02-27'),
(2, 3, '2020-08-03'),
(3, 9, '2020-05-24'),
(1, 9, '2021-01-11');
