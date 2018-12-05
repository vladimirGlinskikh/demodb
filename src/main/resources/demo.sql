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

INSERT INTO aircrafts(aircraft_code, model, range)
VALUES ('SU9', 'Sukhoi SuperJet-100', 3000);