/*Queries that provide answers to the questions from all projects.*/

        ^
SELECT * FROM animals WHERE name LIKE '%mon%' ;

SELECT * FROM animals 
WHERE date_of_birth >= '2016-01-01' AND date_of_birth < '2020-01-01';

SELECT * FROM animals
WHERE neutered = 'true' AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name = 'Agumon' OR name LIKE 'Pikachu';

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = 'true';

SELECT * FROM animals
WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

UPDATE animals
SET species = 'unspecified'

UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;

SELECT name, species FROM animals;

COMMIT;

SELECT name, species FROM animals;

BEGIN;

DELETE FROM animals;

ROLLBACK;

SELECT * FROM animals

BEGIN;

DELETE FROM animals
WHERE date_of_birth > '2022-01-01';

SAVEPOINT my_savepoint;

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO my_savepoint;

SELECT weight_kg FROM animals

SELECT date_of_birth FROM animals

UPDATE animals
SET weight_kg = weight_kg * -1;

ROLLBACK TO my_savepoint;

UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

COMMIT;

SELECT COUNT(*) as total_animals FROM animals;

SELECT COUNT(*) as non_escape_count FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) as average_weight FROM animals;

SELECT neutered, SUM(escape_attempts) as total_escape_attempts
FROM animals
GROUP BY neutered
ORDER BY total_escape_attempts DESC
LIMIT 1;

SELECT name, MIN(weight_kg) as min_weight, MAX(weight_kg) as max_weight
FROM animals
GROUP BY name;

SELECT name, AVG(escape_attempts) as avg_escape_attempts
FROM animals
WHERE date_of_birth >= '1990-01-01' AND date_of_birth < '2001-01-01'
GROUP BY name;
