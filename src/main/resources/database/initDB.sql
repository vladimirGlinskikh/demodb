DROP database IF EXISTS demo;
CREATE database demo;

\connect demo

DROP TABLE IF EXISTS aircrafts;
CREATE TABLE aircrafts
(
  aircraft_code char(3) not null,
  model text not null,
  range integer not null,
  check(range > 0),
  primary key(aircraft_code)
);