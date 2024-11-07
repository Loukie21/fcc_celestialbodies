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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(64) NOT NULL,
    distance_to_earth_millions integer,
    is_spiral boolean,
    estimated_stars text,
    interesting_facts text NOT NULL
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
    name character varying(64) NOT NULL,
    orbit text NOT NULL,
    diameter numeric,
    orbit_period numeric,
    unique_features text,
    planet_id integer NOT NULL
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
    name character varying(64) NOT NULL,
    planet_type character varying(40) NOT NULL,
    temperature character varying(50),
    nr_of_moons integer,
    is_there_life boolean,
    star_id integer NOT NULL
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(100) NOT NULL,
    launch_date date NOT NULL,
    moon_id integer NOT NULL,
    team_name text
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(64) NOT NULL,
    type text NOT NULL,
    distance_from_earth_lightyears integer,
    temperature character varying(20),
    interesting_fact text,
    galaxy_id integer NOT NULL
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 0, true, '100-400 billion', 'The Milky Way is about 13.6 billion years old and contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy (M31)', 3, true, '1 trillion', 'The Andromeda Galaxy is on a collision course with the Milky Way, expected to merge in about 4.5 billion years.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum Galaxy (M33)', 3, true, '40 billion', 'The Triangulum Galaxy is the third-largest galaxy in the Local Group, which includes the Milky Way and Andromeda.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool Galaxy (M51)', 31, true, '100 billion', 'Known for its beautiful, well-defined spiral arms and interaction with a smaller companion galaxy, NGC 5195.');
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy (M104)', 29, true, '800 billion', 'Named for its resemblance to a sombrero, it has a prominent halo of stars and dark dust lanes.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87 (M87)', 53, false, 'Several trillion', 'M87 contains a supermassive black hole at its center, which was the first black hole ever directly imaged by the Event Horizon Telescope in 2019.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', '1st satellite of Earth', 3474, 27.3, 'The only natural satellite of Earth, it has large impact craters like Tycho and Mare Imbrium.', 1);
INSERT INTO public.moon VALUES (2, 'Io', '4th moon of Jupiter', 3643, 1.8, 'Most volcanically active body in the solar system, with over 400 active volcanoes.', 1);
INSERT INTO public.moon VALUES (3, 'Europa', '6th moon of Jupiter', 3121.6, 3.5, 'Likely has a subsurface ocean beneath its icy crust, making it a candidate for potential life.', 1);
INSERT INTO public.moon VALUES (4, 'Ganymede', '3rd moon of Jupiter', 5268, 7.1, 'Largest moon in the solar system, even bigger than Mercury. Has a magnetic field.', 1);
INSERT INTO public.moon VALUES (5, 'Callisto', '2nd moon of Jupiter', 4820.6, 16.7, 'Heavily cratered surface and is thought to have a subsurface ocean beneath its icy crust.', 1);
INSERT INTO public.moon VALUES (6, 'Titan', '1st moon of Saturn', 5151.8, 15.9, 'Has a thick nitrogen-rich atmosphere and lakes of liquid methane. Only moon with a dense atmosphere.', 1);
INSERT INTO public.moon VALUES (7, 'Rhea', '2nd moon of Saturn', 1527.6, 4.5, 'Has a faint ring system and large impact craters.', 1);
INSERT INTO public.moon VALUES (8, 'Enceladus', '6th moon of Saturn', 504.2, 1.4, 'Known for its water geysers that erupt from beneath its icy surface, suggesting a subsurface ocean.', 1);
INSERT INTO public.moon VALUES (9, 'Mimas', '7th moon of Saturn', 396, 0.9, 'Has a large impact crater called Herschel, which gives it the appearance of the Death Star.', 1);
INSERT INTO public.moon VALUES (10, 'Tethys', '4th moon of Saturn', 1066, 1.9, 'Known for the large impact crater, Odysseus, and a massive valley called Ithaca Chasma.', 1);
INSERT INTO public.moon VALUES (11, 'Hyperion', 'Irregular moon of Saturn', 270, 21.3, 'Sponge-like appearance, with an irregular shape and chaotic rotation.', 1);
INSERT INTO public.moon VALUES (12, 'Triton ', '1st moon of Neptune', 2710, 5.9, 'Retrograde orbit (opposite direction to Neptunes rotation), suggesting it was captured. Has geysers that eject nitrogen gas.', 1);
INSERT INTO public.moon VALUES (13, 'Nereid', '2nd moon of Neptune', 340, 360, 'Highly eccentric orbit, one of the most eccentric orbits in the solar system.', 1);
INSERT INTO public.moon VALUES (14, 'Charon', '1st moon of Pluto', 1208.6, 6.4, 'Large compared to Pluto (about half its size), leading to Pluto and Charon being considered a binary system.', 1);
INSERT INTO public.moon VALUES (15, 'Ceres (Dawn)', 'Main asteroid belt', 940, 1680.15, 'Ceres is the largest object in the asteroid belt. Has a large, mysterious white spot on its surface, possibly salt deposits.', 1);
INSERT INTO public.moon VALUES (16, 'Leda', '13th moon of Jupiter', 16.6, 0.3, 'Very small, irregular moon, likely captured by Jupiters gravity.', 1);
INSERT INTO public.moon VALUES (17, 'Phoebe', 'Irregular moon of Saturn', 213.5, 550, 'Retrograde orbit thought to be a captured asteroid from the Kuiper Belt.', 1);
INSERT INTO public.moon VALUES (18, 'Pandora', '8th moon of Saturn', 81.4, 0.6, 'Creates the outer edge of Saturns F ring, with a distinctive, elliptical shape.', 1);
INSERT INTO public.moon VALUES (19, 'Umbriel', '4th moon of Uranus', 1170, 4.1, 'Umbriel is one of the darker moons of Uranus, with a very low reflectivity. Its surface is covered in ancient, heavily cratered terrain, which suggests it has not been geologically active for billions of years.', 1);
INSERT INTO public.moon VALUES (20, 'Miranda', '5th moon of Uranus', 471.6, 1.4, 'Very unusual surface with large cliffs and canyons, thought to be the result of tectonic activity or past internal heating.', 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', '-173°C to 427°C', 0, false, 2);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', '467°C', 0, false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', '15°C average', 1, true, 2);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', '-125°C to 20°C', 2, false, 2);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', '-145°C', 79, false, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', '-178°C', 83, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', '-224°C', 27, false, 2);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', '-214°C', 14, false, 2);
INSERT INTO public.planet VALUES (9, 'Planet Nine', 'Likely Ice Giant', 'Extremely Cold', 0, false, 2);
INSERT INTO public.planet VALUES (10, 'Proxima b', 'Rocky Exoplanet', 'Suitable for liquid water', 0, false, 2);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Rocky Exoplanet', 'Unknown', 0, false, 2);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Rocky Exoplanet', 'Suitable for liquid water', 0, false, 2);


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_mission VALUES (2, 'Mission Phoebs', '2025-01-01', 17, 'Red');
INSERT INTO public.space_mission VALUES (3, 'Mission Panda', '2027-01-01', 18, 'Blue');
INSERT INTO public.space_mission VALUES (4, 'Mission Umbra', '2030-01-01', 19, 'Yellow');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sun', 'G-type', 1, '5500 °C', 'The Sun contains 99.86% of the mass in the Solar System and is essential for life on Earth.', 1);
INSERT INTO public.star VALUES (3, 'Sirius (Alpha Canis Majoris)', 'A-type', 8, '9940 °C', 'Sirius is the brightest star in the night sky and part of the constellation Canis Major.', 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse (Alpha Orionis)', 'Red Supergiant', 640, '3,500 °C', 'Betelgeuse is expected to go supernova in the next million years, which will be visible from Earth.', 1);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 'Red Dwarf', 4, '3042 °C', 'Proxima Centauri has two known exoplanets, one of which lies in the habitable zone.', 1);
INSERT INTO public.star VALUES (6, 'Rigel (Beta Orionis)', 'Blue Supergiant', 860, '11000 °C', 'Rigel is one of the brightest stars in the night sky and serves as Orion’s "foot" in the constellation Orion.', 1);
INSERT INTO public.star VALUES (7, 'Vega (Alpha Lyrae)', 'A-type', 25, '9602 °C', 'Vega was one of the first stars to be photographed and studied, and it’s often used as a standard for calibrating brightness.', 1);


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
-- Name: space_mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_mission_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: space_mission space_mission_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: space_mission space_mission_target_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_target_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

