-- Database: swiprolog

-- DROP DATABASE swiprolog;

CREATE DATABASE swiprolog
  WITH OWNER = postgres
       ENCODING = 'UNICODE'
       TABLESPACE = pg_default;

-- Schema: "public"

-- DROP SCHEMA public;

CREATE SCHEMA public
  AUTHORIZATION postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO public;
COMMENT ON SCHEMA public IS 'Standard public schema';

-- Table: datos

-- DROP TABLE datos;

CREATE TABLE datos
(
  nombre varchar,
  celular varchar,
  mail varchar,
  direccion varchar
) 
WITHOUT OIDS;
ALTER TABLE datos OWNER TO postgres;

-- Column: nombre

-- ALTER TABLE datos DROP COLUMN nombre

ALTER TABLE datos ADD COLUMN nombre varchar;
ALTER TABLE datos ALTER COLUMN nombre SET STORAGE EXTENDED;

-- Column: celular

-- ALTER TABLE datos DROP COLUMN celular

ALTER TABLE datos ADD COLUMN celular varchar;
ALTER TABLE datos ALTER COLUMN celular SET STORAGE EXTENDED;

-- Column: mail

-- ALTER TABLE datos DROP COLUMN mail

ALTER TABLE datos ADD COLUMN mail varchar;
ALTER TABLE datos ALTER COLUMN mail SET STORAGE EXTENDED;

-- Column: direccion

-- ALTER TABLE datos DROP COLUMN direccion

ALTER TABLE datos ADD COLUMN direccion varchar;
ALTER TABLE datos ALTER COLUMN direccion SET STORAGE EXTENDED;