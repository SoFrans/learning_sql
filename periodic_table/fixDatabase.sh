#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# delete records
DELETE_1000=$($PSQL "DELETE FROM properties WHERE atomic_number=1000")
DELETE_1000_elements=$($PSQL "DELETE FROM elements WHERE atomic_number=1000")
# add types table
CREATE_TABLE=$($PSQL "CREATE TABLE types(type_id serial primary key, type varchar(30))")
MOVE_TYPES=$($PSQL "INSERT INTO types(type) SELECT DISTINCT(type) FROM properties")

# fix elements table
UNIQUE_SYMBOL=$($PSQL "ALTER TABLE elements ADD CONSTRAINT unqiuesym UNIQUE(symbol)")
NOTNULL_SYMBOL=$($PSQL "ALTER TABLE elements ALTER COLUMN symbol SET NOT NULL")

UNIQUE_NAME=$($PSQL "ALTER TABLE elements ADD CONSTRAINT uniquename UNIQUE(name)")
NOTNULL_NAME=$($PSQL "ALTER TABLE elements ALTER COLUMN name SET NOT NULL")
CAP_NAME=$($PSQL" UPDATE elements SET symbol = INITCAP(symbol)")


# add records
ADD_9=$($PSQL "INSERT INTO elements(name, symbol, atomic_number) VALUES('Fluorine','F',9)")
ADD_10=$($PSQL "INSERT INTO elements(name, symbol, atomic_number) VALUES('Neon','Ne',10)")
ADD_9_prop=$($PSQL "INSERT INTO properties(atomic_number,weight,melting_point,boiling_point,type) VALUES(9,18.998,-220,-188.1,'nonmetal')")
ADD_10_prop=$($PSQL "INSERT INTO properties(atomic_number,weight,melting_point,boiling_point,type) VALUES(10,20.18,-248.6,-246.1,'nonmetal')")

# fix properties table

RENAME_WEIGHT=$($PSQL "ALTER TABLE properties RENAME COLUMN weight TO atomic_mass")
CHANGE_VAR=$($PSQL "ALTER TABLE properties ALTER COLUMN atomic_mass type varchar(30)")
ROUND_ATOMIC_MASS=$($PSQL "UPDATE properties SET atomic_mass=CAST(atomic_mass AS FLOAT);")
RENAME_MELT=$($PSQL "ALTER TABLE properties RENAME COLUMN melting_point TO melting_point_celsius")
RENAME_BOIL=$($PSQL "ALTER TABLE properties RENAME COLUMN boiling_point TO boiling_point_celsius")

NOTNULL_MELT=$($PSQL "ALTER TABLE properties ALTER COLUMN melting_point_celsius SET NOT NULL")
NOTNULL_BOIL=$($PSQL "ALTER TABLE properties ALTER COLUMN boiling_point_celsius SET NOT NULL")
ADD_TYPEID=$($PSQL "ALTER TABLE properties ADD COLUMN type_id int")
UPDATE_TYPE=$($PSQL "UPDATE properties SET type_id = 1 WHERE type='metal'")
UPDATE_TYPE=$($PSQL "UPDATE properties SET type_id=2 WHERE type='metalloid'")
UPDATE_TYPE=$($PSQL "UPDATE properties SET type_id=3 WHERE type='nonmetal'")
DELETE_TYPE=$($PSQL "ALTER TABLE properties DROP COLUMN type")
ADD_FK=$($PSQL "ALTER TABLE properties ADD CONSTRAINT fktype FOREIGN KEY(type_id) REFERENCES types(type_id)")
ADD_FK_element=$($PSQL "ALTER TABLE properties ADD CONSTRAINT fkelement FOREIGN KEY(atomic_number) REFERENCES elements(atomic_number)")
ADD_NOTNULL=$($PSQL "ALTER TABLE properties ALTER COLUMN type_id SET NOT NULL")
ADD_NOTNULLTYPES=$($PSQL "ALTER TABLE types ALTER COLUMN type SET NOT NULL")
