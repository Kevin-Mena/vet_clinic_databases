/*Queries that provide answers to the questions from all projects.*/
/*Find all animals whose name ends in "mon"*/
SELECT * from animals WHERE name like '%mon';

/*List the name of all animals born between 2016 and 2019*/
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/*List the name of all animals that are neutered and have less than 3 escape attempts*/
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

/*List the date of birth of all animals named either "Agumon" or "Pikachu"*/
SELECT date_of_birth from animals WHERE name = 'Agumon' or name = 'Pikachu';

/*List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

/*Find all animals that are neutered*/
SELECT * from animals WHERE neutered = 'TRUE';

/*Find all animals not named Gabumon*/
SELECT * from animals WHERE name != 'Gabumon';

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT * from animals WHERE weight_kg >= 10.5 AND weight_kg <= 17.3;

-- Update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals 
SET species = 'unspecified';
ROLLBACK;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals 
SET species = 'digimon'
WHERE name like '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set and commit the changes
UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

-- Delete all records from animals table and roll back the changes
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- Delete all animals born after Jan 1st, 2022.
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
