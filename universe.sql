--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(30),
    distance_from_earth_lym numeric(7,3)
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
    name character varying(30) NOT NULL,
    is_spherical boolean,
    description text,
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
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    description text,
    planet_type character varying(30),
    distance_from_sun_km numeric(7,3),
    number_of_moons integer,
    star_id integer
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
    name character varying(30) NOT NULL,
    description text,
    distance_lym integer,
    galaxy_id integer
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
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_km integer
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


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
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of Earth', 'Spiral', 0.265);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest galaxy to the Milky Way', 'Spiral', 2.538);
INSERT INTO public.galaxy VALUES (3, 'Bodes Galaxy', 'Named after Johan Bode who discovered the galaxy in 1774', 'Spiral', 1.100);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Named for its distinct cigar like shape', 'Starburst', 11.420);
INSERT INTO public.galaxy VALUES (5, 'Hoags Object', 'Named after Art Hoag who discovered the galaxy in 1920', 'Ring', 612.800);
INSERT INTO public.galaxy VALUES (6, 'Antennae', 'Appearance is similar to an insects antennae', 'Starburst', 45.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 'The only moon of Earth', 1);
INSERT INTO public.moon VALUES (2, 'Io', true, 'A volcanic active moon', 5);
INSERT INTO public.moon VALUES (3, 'Phobos', true, 'The first moon of Mars', 2);
INSERT INTO public.moon VALUES (4, 'Mimas', true, 'Discovered in 1789', 6);
INSERT INTO public.moon VALUES (5, 'Ariel', true, 'Discovered in 1851', 7);
INSERT INTO public.moon VALUES (6, 'Triton', true, 'Triton is the largest of Neptunes moons', 8);
INSERT INTO public.moon VALUES (7, 'Charon', true, 'This moon is big it makes Pluto wobble', 9);
INSERT INTO public.moon VALUES (8, 'Deimos', true, 'The second moon of Mars', 2);
INSERT INTO public.moon VALUES (9, 'Europa', true, 'Could possible have life beyond Mars', 5);
INSERT INTO public.moon VALUES (10, 'Ganymeade', true, 'Largest moon in the solar system', 5);
INSERT INTO public.moon VALUES (11, 'Callisto', true, 'Most heavily cratered moon in the solar system', 5);
INSERT INTO public.moon VALUES (12, 'Enceladus', true, 'Discovered in 1789', 6);
INSERT INTO public.moon VALUES (13, 'Tethys', true, 'Discovered in 1684', 6);
INSERT INTO public.moon VALUES (14, 'Dione', true, 'Discovered in 1684', 6);
INSERT INTO public.moon VALUES (15, 'Oberon', true, 'Discovered in 1787', 7);
INSERT INTO public.moon VALUES (16, 'Puck', true, 'Discovered in 1985', 7);
INSERT INTO public.moon VALUES (17, 'Proteus', true, 'Discovered in 1989 by Voyager 2', 8);
INSERT INTO public.moon VALUES (18, 'Larissa', true, 'Discovered in 1989 by Voyager 2', 8);
INSERT INTO public.moon VALUES (19, 'Naiad', true, 'Was the last moon discovered by the Voyager 2', 8);
INSERT INTO public.moon VALUES (20, 'Titania', true, 'The largest moon of Uranus', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 'Where we live', 'Terrestial', 0.000, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mercury', false, true, 'Closest to the sun', 'Terrestial', 82.500, 0, 1);
INSERT INTO public.planet VALUES (3, 'Venus', false, true, 'Second closest to the sun', 'Terrestial', 39.790, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, true, 'The next great frontier', 'Terrestial', 55.650, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, true, 'Fifth closest to the sun', 'Gas', 591.970, 80, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', false, true, 'Sixth closest to the sun', 'Gas', 1204.280, 145, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', false, true, 'Seventh closest to the sun', 'Gas', 2586.880, 27, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', false, true, 'Eighth closest to the sun', 'Ice', 4311.020, 14, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', false, true, 'Maybe not a planet', 'Dwarf', 4293.370, 5, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', false, true, 'Dwarf planet in the asteroid belt between Mars and Jupiter', 'Dwarf', 413.000, 0, 1);
INSERT INTO public.planet VALUES (11, 'Eris', false, true, 'Second largest dwarf planet in the solar system', 'Dwarf', 1015.000, 1, 1);
INSERT INTO public.planet VALUES (12, 'Haumea', false, true, 'Located beyond Neptunes orbit', 'Dwarf', 6452.000, 2, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 'The brightest star in the night sky', 8, 1);
INSERT INTO public.star VALUES (2, 'Antares', 'Brightest star in the Scorpius Constellation', 550, 1);
INSERT INTO public.star VALUES (3, 'Rigel', 'Brightest star in the Orion Constellation', 860, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Tenth brightest star in the night sky', 548, 1);
INSERT INTO public.star VALUES (5, 'Vega', 'Brightest star in the Lyra constellation', 25, 1);
INSERT INTO public.star VALUES (6, 'Altair', 'Brightest star in the Aquila constellation', 16, 1);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sun', 1400000);
INSERT INTO public.sun VALUES (2, 'Sun II', 45000000);
INSERT INTO public.sun VALUES (3, 'Sun III', 6980000);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: sun sun_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_unique UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--
