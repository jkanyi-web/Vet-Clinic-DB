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
