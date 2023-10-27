/*Queries that provide answers to the questions from all projects.*/

-- DAY 1
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

-- DAY2

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

-- DAY 3

UPDATE animals
SET owner_id = 
    CASE
        WHEN full_name = 'Agumon' THEN 1
        WHEN full_name IN ('Gabumon', 'Pikachu') THEN 2
        WHEN full_name IN ('Devimon', 'Plantmon') THEN 3
        WHEN full_name IN ('Charmander', 'Squirtle', 'Blossom') THEN 4
        WHEN full_name IN ('Angemon', 'Boarmon') THEN 5
        ELSE owner_id  
    END;

SELECT a.full_name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Melody Pond';

SELECT a.full_name
FROM animals AS a
JOIN species AS s ON a.species_id = s.id
WHERE s.name = 'Pokemon';

SELECT o.full_name, a.full_name
FROM owners AS o
LEFT JOIN animals AS a ON a.owner_id = o.id;

SELECT s.name as species_name, COUNT(a.id) as animal_count
FROM species AS s
JOIN animals AS a ON s.id = a.species_id
GROUP BY s.name;

SELECT a.full_name as animal
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
JOIN species AS s ON a.species_id = s.id
WHERE o.full_name = 'Jennifer Orwell' AND s.name = 'Digimon';

SELECT a.full_name
FROM animals AS a
JOIN owners AS o ON a.owner_id = o.id
WHERE o.full_name = 'Dean Winchester' AND a.escape_attempts = 0;

SELECT o.full_name, COUNT(a.id) AS animal_count
FROM owners AS o
LEFT JOIN animals AS a ON a.owner_id = o.id
GROUP BY o.full_name
ORDER BY animal_count DESC
LIMIT 1;

-- DAY 4
SELECT a.full_name AS animal_name
FROM visits v
JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id = 1
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(DISTINCT v.animal_id) AS animals_seen
FROM visits v
WHERE v.vet_id = 3;

SELECT ve.name AS vet_name, COALESCE(s2.name, 'No Specialty') AS specialty
FROM vets ve
LEFT JOIN specializations s ON ve.id = s.vet_id
LEFT JOIN species s2 ON s.species_id = s2.id
ORDER BY vet_name, specialty;

SELECT a.full_name AS animal_name
FROM visits v
JOIN animals a ON v.animal_id = a.id
WHERE v.vet_id = 3
  AND v.visit_date >= '2020-04-01'
  AND v.visit_date <= '2020-08-30';

SELECT a.full_name AS animal_name, COUNT(*) AS visit_count
FROM visits v
JOIN animals a ON v.animal_id = a.id
GROUP BY a.full_name
ORDER BY visit_count DESC
LIMIT 1;

SELECT a.full_name AS animal_name, v.visit_date
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
WHERE ve.name = 'Maisy Smith'
ORDER BY v.visit_date ASC
LIMIT 1;

SELECT a.full_name AS animal_name, ve.name AS vet_name, v.visit_date
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
ORDER BY v.visit_date DESC
LIMIT 1;

SELECT COUNT(*) AS visits_with_unspecialized_vet
FROM visits v
JOIN animals a ON v.animal_id = a.id
JOIN vets ve ON v.vet_id = ve.id
LEFT JOIN specializations s ON ve.id = s.vet_id AND a.species_id = s.species_id
WHERE s.vet_id IS NULL;

SELECT species.name AS specialty
FROM species
JOIN animals ON species.id = animals.species_id
JOIN vets ON animals.id = vets.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.name
ORDER BY COUNT(animals.id) DESC
LIMIT 1;
