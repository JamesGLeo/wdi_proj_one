DROP TABLE IF EXISTS parties CASCADE;
DROP TABLE IF EXISTS foods CASCADE;
DROP TABLE IF EXISTS orders CASCADE;

CREATE TABLE parties(
  id SERIAL PRIMARY KEY,
  assigned_table integer,
  groupsize integer,
  paid_check boolean
);

CREATE TABLE foods(
  id SERIAL PRIMARY KEY,
  dishname varchar(255),
  course varchar(255),
  price money,
  allergens varchar(510),
  calories integer
);

CREATE TABLE\q
 orders(
  id SERIAL PRIMARY KEY,
  time TIMESTAMP,
  party_id INTEGER,
  food_id INTEGER
);