/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id INTEGER PRIMARY KEY NOT NULL, name VARCHAR(150), date_of_birth DATE, escape_attempts INTEGER, neutered BOOLEAN, weight_kg DECIMAL);

ALTER TABLE animals
ADD species VARCHAR(255);


CREATE TABLE owners (id SERIAL PRIMARY KEY, full_name varchar(255) NOT NULL, age int NOT NULL);

CREATE TABLE species (id SERIAL PRIMARY KEY, name varchar(255) NOT NULL);



ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE animals DROP COLUMN species;
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR,
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets(id),
  species_id INTEGER REFERENCES species(id),
  PRIMARY KEY (vet_id, species_id)
);

CREATE TABLE visits (
  animal_id INTEGER REFERENCES animals(id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE,
  PRIMARY KEY (animal_id, vet_id, visit_date)
);