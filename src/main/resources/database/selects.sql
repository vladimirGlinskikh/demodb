
-- SELECT * FROM aircrafts;

-- SELECT model, aircraft_code, range
-- FROM aircrafts
-- ORDER BY model;

-- SELECT model, aircraft_code, range
-- FROM aircrafts
-- WHERE range >= 4000 AND range <= 6000;
SELECT aircraft_code, fare_conditions, count( * )
FROM seats
GROUP BY aircraft_code, fare_conditions
ORDER BY aircraft_code, fare_conditions;