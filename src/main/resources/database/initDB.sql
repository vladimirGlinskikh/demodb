-- DROP database IF EXISTS demo;
-- CREATE database demo;
--
-- \connect demo

DROP TABLE  aircrafts CASCADE ;
CREATE TABLE aircrafts
(
  aircraft_code char(3) not null,
  model text not null,
  range integer not null,
  check(range > 0),
  primary key(aircraft_code)
);

DROP TABLE seats CASCADE ;
CREATE TABLE seats
(
  aircraft_code char( 3 ) NOT NULL,
  seat_no varchar( 4 ) NOT NULL,
  fare_conditions varchar( 10 ) NOT NULL,
  CHECK
    ( fare_conditions IN ( 'Economy', 'Comfort', 'Business' )
    ),
  PRIMARY KEY ( aircraft_code, seat_no ),
  FOREIGN KEY ( aircraft_code )
    REFERENCES aircrafts (aircraft_code )
    ON DELETE CASCADE
);
