/* Database schema to keep the structure of entire database. */

-- animals table
CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL DEFAULT nextval('new_animals_id_seq'::regclass),
    full_name character varying(255) COLLATE pg_catalog."default",
    date_of_birth date,
    escape_attempts integer,
    neutered boolean,
    weight_kg numeric,
    species_id integer,
    owner_id integer,
    CONSTRAINT new_animals_pkey PRIMARY KEY (id),
    CONSTRAINT animals_owner_id_fkey FOREIGN KEY (owner_id)
        REFERENCES public.owners (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT animals_species_id_fkey FOREIGN KEY (species_id)
        REFERENCES public.species (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;

-- owners table
CREATE TABLE IF NOT EXISTS public.owners
(
    id integer NOT NULL DEFAULT nextval('owners_id_seq'::regclass),
    full_name character varying(255) COLLATE pg_catalog."default",
    age integer,
    CONSTRAINT owners_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.owners
    OWNER to postgres;

-- species table
CREATE TABLE IF NOT EXISTS public.species
(
    id integer NOT NULL DEFAULT nextval('species_id_seq'::regclass),
    name character varying(255) COLLATE pg_catalog."default",
    CONSTRAINT species_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.species
    OWNER to postgres;

-- DAY 4

-- vets table
CREATE TABLE IF NOT EXISTS public.vets
(
    id integer NOT NULL DEFAULT nextval('vets_id_seq'::regclass),
    name character varying(100) COLLATE pg_catalog."default",
    age integer,
    date_of_graduation date,
    CONSTRAINT vets_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.vets
    OWNER to postgres;

-- visits table
CREATE TABLE IF NOT EXISTS public.visits
(
    vet_id integer NOT NULL,
    animal_id integer NOT NULL,
    visit_date date NOT NULL,
    CONSTRAINT visits_pkey PRIMARY KEY (vet_id, animal_id, visit_date),
    CONSTRAINT visits_animal_id_fkey FOREIGN KEY (animal_id)
        REFERENCES public.animals (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT visits_vet_id_fkey FOREIGN KEY (vet_id)
        REFERENCES public.vets (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.visits
    OWNER to postgres;

-- specializations table
CREATE TABLE IF NOT EXISTS public.specializations
(
    vet_id integer NOT NULL,
    species_id integer NOT NULL,
    CONSTRAINT specializations_pkey PRIMARY KEY (vet_id, species_id),
    CONSTRAINT specializations_species_id_fkey FOREIGN KEY (species_id)
        REFERENCES public.species (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT specializations_vet_id_fkey FOREIGN KEY (vet_id)
        REFERENCES public.vets (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.specializations
    OWNER to postgres;
