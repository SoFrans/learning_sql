--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE universe OWNER TO postgres;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: blank; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.blank (
    notes character varying(30),
    blank_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.blank OWNER TO postgres;

--
-- Name: blank_blank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.blank_blank_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.blank_blank_id_seq OWNER TO postgres;

--
-- Name: blank_blank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.blank_blank_id_seq OWNED BY public.blank.blank_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    star_id integer,
    notes character varying(30)
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    circumference_miles_rounded integer,
    planet_id integer,
    description text,
    notes character varying(30)
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30),
    circumference_miles_rounded integer,
    distance_from_sun_au numeric,
    star_id integer,
    has_life boolean,
    true_planet boolean,
    description text,
    notes character varying(30)
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    notes character varying(30)
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: blank blank_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank ALTER COLUMN blank_id SET DEFAULT nextval('public.blank_blank_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blank; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.blank VALUES (NULL, 1, 'blank 1');
INSERT INTO public.blank VALUES (NULL, 2, 'blank 2');
INSERT INTO public.blank VALUES (NULL, 3, 'blank 3');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'The Antennae Galaxies', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'NGC 5584', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Messier 106', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'NGC 2525', NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 6786, 3, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'Io', 10000, 5, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'Europa', 6094, 5, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'Ganymede', 10273, 5, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Callisto', 9410, 5, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Mimas', 774, 6, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Enceladus', 984, 6, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Tethys', 2081, 6, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', 2193, 6, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Rhea', 2984, 6, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Titan', 10052, 6, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', 2872, 6, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Miranda', 921, 7, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Ariel', 2260, 7, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Umbriel', 2320, 7, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Titania', 3080, 7, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Triton', 5284, 8, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Dysnomia', NULL, 13, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Charon', 2357, 9, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Nix', NULL, 9, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Hydra', 79, 9, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Kerberos', 15, 9, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Styx', NULL, 9, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Namaka', 106, 11, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Hiiaka', 190, 11, NULL, NULL);
INSERT INTO public.moon VALUES (26, 'S2015 136472 1', 345, 12, NULL, NULL);
INSERT INTO public.moon VALUES (27, 'Oberon', 2980, 7, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 9525, 0.4, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 38025, 0.72, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 24901, 1, 1, true, true, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 13263, 1.5, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 272946, 5.2, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 234837, 9.5, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 99215, 19, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 96700, 30, 1, false, true, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 4634, 39, 1, false, false, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Ceres', 929, 2.8, 1, false, false, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Haumea', 1396, 43, 1, false, false, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Makemake', 1396, 45.8, 1, false, false, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Eris', 4710, 68, 1, false, false, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'UY Scuti', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, NULL, NULL);
INSERT INTO public.star VALUES (4, 'V354 Cephei', 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'RW Cephei', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'KW Sagittarii', 1, NULL, NULL);


--
-- Name: blank_blank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.blank_blank_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blank blank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.blank
    ADD CONSTRAINT blank_pkey PRIMARY KEY (blank_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon frk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT frk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet frk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT frk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star frk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT frk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

