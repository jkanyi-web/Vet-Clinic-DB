/* Database schema to keep the structure of entire database. */

CREATE TABLE IF NOT EXISTS public.animals
(
    id integer NOT NULL,
    name character varying(50) COLLATE pg_catalog."default" NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts integer NOT NULL,
    neutered boolean NOT NULL,
    weight_kg numeric,
    CONSTRAINT animals_pkey PRIMARY KEY (id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.animals
    OWNER to postgres;
