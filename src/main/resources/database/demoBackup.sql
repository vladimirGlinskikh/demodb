--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: aircrafts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aircrafts (
    aircraft_code character(3) NOT NULL,
    model text NOT NULL,
    range integer NOT NULL,
    CONSTRAINT aircrafts_range_check CHECK ((range > 0))
);


ALTER TABLE public.aircrafts OWNER TO postgres;

--
-- Name: databases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databases (
    is_open_source boolean,
    dbms_name text
);


ALTER TABLE public.databases OWNER TO postgres;

--
-- Name: pilots; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pilots (
    pilot_name text,
    schedule integer[]
);


ALTER TABLE public.pilots OWNER TO postgres;

--
-- Name: seats; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seats (
    aircraft_code character(3) NOT NULL,
    seat_no character varying(4) NOT NULL,
    fare_conditions character varying(10) NOT NULL,
    CONSTRAINT seats_fare_conditions_check CHECK (((fare_conditions)::text = ANY ((ARRAY['Economy'::character varying, 'Comfort'::character varying, 'Business'::character varying])::text[])))
);


ALTER TABLE public.seats OWNER TO postgres;

--
-- Data for Name: aircrafts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aircrafts (aircraft_code, model, range) FROM stdin;
SU9	Sukhoi SuperJet-100	3000
773	Boeing 777-300	11100
763	Boeing 767-300	7900
733	Boeing 737-300	4200
320	Airbus A320-200	5700
321	Airbus A321-200	5600
319	Airbus A319-100	6700
CN1	Cessna 208 Caravan	1200
CR2	Bombardier CRJ-200	2700
\.


--
-- Data for Name: databases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databases (is_open_source, dbms_name) FROM stdin;
t	PostgreSQL
f	Oracle
t	MySQL
f	MS SQL Server
\.


--
-- Data for Name: pilots; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pilots (pilot_name, schedule) FROM stdin;
Boris	{3,5,6,7}
Pavel	{1,2,5,6}
Ivan	{1,3,6,7}
Petr	{2,3,5,7}
\.


--
-- Data for Name: seats; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seats (aircraft_code, seat_no, fare_conditions) FROM stdin;
SU9	1A	Business
SU9	1B	Business
SU9	10A	Economy
SU9	10B	Economy
SU9	10F	Economy
SU9	20F	Economy
\.


--
-- Name: aircrafts aircrafts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aircrafts
    ADD CONSTRAINT aircrafts_pkey PRIMARY KEY (aircraft_code);


--
-- Name: seats seats_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_pkey PRIMARY KEY (aircraft_code, seat_no);


--
-- Name: seats seats_aircraft_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seats
    ADD CONSTRAINT seats_aircraft_code_fkey FOREIGN KEY (aircraft_code) REFERENCES public.aircrafts(aircraft_code) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

