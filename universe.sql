--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter numeric(10,2),
    lenght numeric(10,2),
    visits_earth boolean NOT NULL,
    notes text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: commet_commet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.commet_commet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.commet_commet_id_seq OWNER TO freecodecamp;

--
-- Name: commet_commet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.commet_commet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    notes text,
    diameter numeric(10,2)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean,
    is_spherical boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    diameter numeric(10,2),
    notes text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    notes text,
    star_id integer,
    diameter numeric(10,2)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth integer NOT NULL,
    age_in_millions_of_years integer,
    has_planets boolean NOT NULL,
    galaxy_id integer,
    notes text,
    diameter numeric(10,2)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.commet_commet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 11.00, 15.00, true, NULL);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 60.00, 50.00, false, NULL);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 2.00, 50.00, false, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 27000, 13600, NULL, 150000.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 2500000, 10000, NULL, 220000.00);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 23000000, 7000000, NULL, 70000.00);
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 3, 1000, NULL, 60.00);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 29, 13000, NULL, 50.00);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 14, 13000, NULL, 60.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', false, true, 0, 4500, 3474.00, NULL, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, false, 2, 4500, 22.00, NULL, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, false, 2, 4500, 12.00, NULL, 4);
INSERT INTO public.moon VALUES (4, 'Io', false, true, 5, 4500, 3643.00, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Europa', false, true, 5, 4500, 3122.00, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, true, 5, 4500, 5268.00, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', false, true, 5, 4500, 4821.00, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Titan', false, true, 10, 4500, 5150.00, NULL, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', false, true, 10, 4500, 504.00, NULL, 6);
INSERT INTO public.moon VALUES (10, 'Mima', false, true, 10, 4500, 396.00, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Dione', false, true, 10, 4500, 1123.00, NULL, 6);
INSERT INTO public.moon VALUES (12, 'Rhea', false, true, 10, 4500, 1528.00, NULL, 6);
INSERT INTO public.moon VALUES (13, 'Iapetus', false, true, 10, 4500, 1470.00, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Miranda', false, true, 19, 4500, 472.00, NULL, 7);
INSERT INTO public.moon VALUES (15, 'Ariel', false, true, 19, 4500, 1158.00, NULL, 7);
INSERT INTO public.moon VALUES (16, 'Umbriel', false, true, 19, 4500, 1169.00, NULL, 7);
INSERT INTO public.moon VALUES (17, 'Titania', false, true, 19, 4500, 1578.00, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Oberon', false, true, 19, 4500, 1523.00, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Triton', false, true, 30, 4500, 2707.00, NULL, 8);
INSERT INTO public.moon VALUES (20, 'Charon', false, true, 40, 4500, 1212.00, NULL, 9);
INSERT INTO public.moon VALUES (21, 'Dysnomia', false, false, 40, 4500, 700.00, NULL, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 0, 4500, NULL, 1, 4879.00);
INSERT INTO public.planet VALUES (2, 'Venus', false, 1, 4500, NULL, 1, 12104.00);
INSERT INTO public.planet VALUES (3, 'Earth', true, 0, 4500, NULL, 1, 12756.00);
INSERT INTO public.planet VALUES (4, 'Mars', false, 2, 4500, NULL, 1, 6792.00);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 5, 4600, NULL, 1, 142984.00);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 10, 4600, NULL, 1, 120536.00);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 19, 4500, NULL, 1, 51118.00);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 30, 4500, NULL, 1, 49528.00);
INSERT INTO public.planet VALUES (9, 'Pluto', false, 40, 4600, NULL, 1, 2376.00);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', false, 4, 7000, NULL, 2, 13648.90);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri c', false, 4, 7000, NULL, 2, 89292.00);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', false, 4, 7000, NULL, 2, 3316.56);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 0, 4600, true, 1, NULL, 392684.00);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, 4, 7000, true, 1, NULL, 2088852.00);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', true, 4, 6500, false, 1, NULL, 16989334.00);
INSERT INTO public.star VALUES (5, 'Sirius A', true, 9, 225, false, 1, NULL, 1193007.00);
INSERT INTO public.star VALUES (6, 'Vega', true, 25, 455, false, 1, NULL, 1650590.00);
INSERT INTO public.star VALUES (7, 'Betelgeuse', false, 643, 10, false, 1, NULL, 55000.00);


--
-- Name: commet_commet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.commet_commet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet commet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT commet_name_key UNIQUE (name);


--
-- Name: comet commet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT commet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

