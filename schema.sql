/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    "id " integer NOT NULL,
    name character(1) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg real NOT NULL,
    CONSTRAINT animals_pkey PRIMARY KEY ("id ")
)
