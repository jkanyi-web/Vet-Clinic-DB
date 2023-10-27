/* Database schema to keep the structure of entire database. */

-- animals table
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2),
    species_id INTEGER REFERENCES species(id),
    owner_id INTEGER REFERENCES owners(id)
);

-- owners table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR,
    age INTEGER
);
-- species table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,
    name VARCHAR
);

-- DAY 4

-- vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    age INTEGER,
    date_of_graduation DATE
);

-- visits table
CREATE TABLE visits (
    visit_id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    visit_date DATE
);
-- specializations table
CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);
