--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: user_record; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_record (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    total_games integer NOT NULL,
    best_score integer NOT NULL
);


ALTER TABLE public.user_record OWNER TO freecodecamp;

--
-- Name: user_record_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_record_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_record_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_record_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_record_user_id_seq OWNED BY public.user_record.user_id;


--
-- Name: user_record user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_record ALTER COLUMN user_id SET DEFAULT nextval('public.user_record_user_id_seq'::regclass);


--
-- Data for Name: user_record; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_record VALUES (2, 'Paul', 0, 0);
INSERT INTO public.user_record VALUES (4, 'Frank', 0, 0);
INSERT INTO public.user_record VALUES (5, 'user_1779072990206', 0, 0);
INSERT INTO public.user_record VALUES (6, 'user_1779072990205', 0, 0);
INSERT INTO public.user_record VALUES (7, 'user_1779074341646', 0, 0);
INSERT INTO public.user_record VALUES (8, 'user_1779074341645', 0, 0);
INSERT INTO public.user_record VALUES (1, 'Matt', 0, 1);
INSERT INTO public.user_record VALUES (3, 'Jeff', 1, 2);
INSERT INTO public.user_record VALUES (11, 'user_1779076224156', 2, 341);
INSERT INTO public.user_record VALUES (10, 'user_1779076224157', 5, 131);
INSERT INTO public.user_record VALUES (9, 'Anne', 2, 5);
INSERT INTO public.user_record VALUES (12, 'Sue', 2, 10);
INSERT INTO public.user_record VALUES (14, 'user_1779076687447', 2, 583);
INSERT INTO public.user_record VALUES (13, 'user_1779076687448', 4, 171);
INSERT INTO public.user_record VALUES (16, 'user_1779076815150', 2, 353);
INSERT INTO public.user_record VALUES (15, 'user_1779076815151', 4, 9);


--
-- Name: user_record_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_record_user_id_seq', 16, true);


--
-- Name: user_record user_record_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_record
    ADD CONSTRAINT user_record_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

