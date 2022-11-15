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

ALTER TABLE ONLY public.planet DROP CONSTRAINT star_fk;
ALTER TABLE ONLY public.moon DROP CONSTRAINT planet_fk;
ALTER TABLE ONLY public.star DROP CONSTRAINT galaxy_fk;
ALTER TABLE ONLY public.star DROP CONSTRAINT unique_star_name;
ALTER TABLE ONLY public.planet DROP CONSTRAINT unique_planet_name;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT unique_name;
ALTER TABLE ONLY public.moon DROP CONSTRAINT unique_moon_name;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_contraint_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_contraint_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.black_hole DROP CONSTRAINT black_hole_name_key;
ALTER TABLE ONLY public.black_hole DROP CONSTRAINT black_hole_key;
ALTER TABLE ONLY public.black_hole DROP CONSTRAINT black_hole_black_hole_id_key;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.black_hole ALTER COLUMN black_hole_id DROP DEFAULT;
DROP SEQUENCE public.star_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_id_seq;
DROP TABLE public.galaxy;
DROP SEQUENCE public.black_hole_black_hole_id_seq;
DROP TABLE public.black_hole;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying NOT NULL,
    mass_in_kg integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    has_super_massive_black_hole boolean,
    name character varying NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    moon_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    has_water boolean,
    contraint name,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    has_water boolean,
    contraint name,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying NOT NULL,
    star_id integer NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    mass_in_kg numeric,
    description text,
    has_life boolean,
    is_in_constelation boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Thunder', NULL);
INSERT INTO public.black_hole VALUES (2, 'Lighting', NULL);
INSERT INTO public.black_hole VALUES (3, 'Blasting', NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, 'Andromeda');
INSERT INTO public.galaxy VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, 'Milky Way');
INSERT INTO public.galaxy VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, 'ZX404');
INSERT INTO public.galaxy VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, 'GB1212');
INSERT INTO public.galaxy VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, 'YZ0022');
INSERT INTO public.galaxy VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, 'RJ0022');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Lua', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua2', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua3', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua4', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua5', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua6', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua7', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua8', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua9', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua10', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua11', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua12', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua13', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua14', 15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua15', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua16', 17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua17', 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua18', 19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua19', 20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.moon VALUES ('Lua20', 21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Venus', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Terra', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Marte', 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Planeta A', 4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta B', 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta C', 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta D', 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta E', 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta F', 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta G', 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta H', 11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta Z', 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta X', 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Planeta Y', 14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sol', 1, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES ('Taurus', 2, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES ('C207', 3, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES ('PG018', 4, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES ('MM017', 5, NULL, NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO public.star VALUES ('MA088', 6, NULL, NULL, NULL, NULL, NULL, NULL, 5);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 9, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 21, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 14, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: black_hole black_hole_black_hole_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_black_hole_id_key UNIQUE (black_hole_id);


--
-- Name: black_hole black_hole_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_key PRIMARY KEY (black_hole_id);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_contraint_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_contraint_key UNIQUE (contraint);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_contraint_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_contraint_key UNIQUE (contraint);


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
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

