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

DROP DATABASE salon;
--
-- Name: salon; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE salon WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE salon OWNER TO freecodecamp;

\connect salon

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
-- Name: appointments; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.appointments (
    appointment_id integer NOT NULL,
    customer_id integer,
    service_id integer,
    "time" character varying(20)
);


ALTER TABLE public.appointments OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.appointments_appointment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.appointments_appointment_id_seq OWNER TO freecodecamp;

--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.appointments_appointment_id_seq OWNED BY public.appointments.appointment_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    phone character varying(20),
    name character varying(50)
);


ALTER TABLE public.customers OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO freecodecamp;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.services (
    service_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.services OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.services_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.services_service_id_seq OWNER TO freecodecamp;

--
-- Name: services_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.services_service_id_seq OWNED BY public.services.service_id;


--
-- Name: appointments appointment_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments ALTER COLUMN appointment_id SET DEFAULT nextval('public.appointments_appointment_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: services service_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services ALTER COLUMN service_id SET DEFAULT nextval('public.services_service_id_seq'::regclass);


--
-- Data for Name: appointments; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.appointments VALUES (1, 13, 1, '10:20PM');
INSERT INTO public.appointments VALUES (70, 13, 3, '12');
INSERT INTO public.appointments VALUES (140, 111, 2, '49');
INSERT INTO public.appointments VALUES (4, 16, 1, '');
INSERT INTO public.appointments VALUES (141, 13, 3, '59282');
INSERT INTO public.appointments VALUES (142, 13, 3, '109191');
INSERT INTO public.appointments VALUES (9, 13, 3, '20:10AM');
INSERT INTO public.appointments VALUES (12, 16, 1, '');
INSERT INTO public.appointments VALUES (79, 67, 3, '2929');
INSERT INTO public.appointments VALUES (80, 67, 3, '41242');
INSERT INTO public.appointments VALUES (81, 68, 3, '41');
INSERT INTO public.appointments VALUES (17, 13, 2, '20:20');
INSERT INTO public.appointments VALUES (82, 68, 3, '4141');
INSERT INTO public.appointments VALUES (83, 13, 2, '4141');
INSERT INTO public.appointments VALUES (20, 16, 1, '');
INSERT INTO public.appointments VALUES (90, 13, 3, '4141');
INSERT INTO public.appointments VALUES (91, 13, 3, '40401');
INSERT INTO public.appointments VALUES (31, 13, 1, '20:20 PM');
INSERT INTO public.appointments VALUES (161, 127, 2, '519');
INSERT INTO public.appointments VALUES (38, 40, 1, '492');
INSERT INTO public.appointments VALUES (45, 46, 1, '5959');
INSERT INTO public.appointments VALUES (168, 13, 2, '11am');
INSERT INTO public.appointments VALUES (108, 16, 1, '');
INSERT INTO public.appointments VALUES (175, 138, 1, 'ññ[3~');
INSERT INTO public.appointments VALUES (115, 16, 1, '');
INSERT INTO public.appointments VALUES (58, 57, 2, '55');
INSERT INTO public.appointments VALUES (122, 16, 1, '');
INSERT INTO public.appointments VALUES (127, 13, 1, '12am');


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.customers VALUES (1, '1231-111', 'caco');
INSERT INTO public.customers VALUES (127, '555-55555', 'Patrik');
INSERT INTO public.customers VALUES (4, 'FakeTime', '');
INSERT INTO public.customers VALUES (67, '456456', 'CACA');
INSERT INTO public.customers VALUES (68, '}546456456', 'CACACACa');
INSERT INTO public.customers VALUES (13, '444-4444', 'caco');
INSERT INTO public.customers VALUES (16, '', '');
INSERT INTO public.customers VALUES (138, '5646546', 'klkl');
INSERT INTO public.customers VALUES (40, '809809', 'CAMILO');
INSERT INTO public.customers VALUES (46, '54655', 'Maria');
INSERT INTO public.customers VALUES (111, '123123124', 'Camilo');
INSERT INTO public.customers VALUES (57, '22222', '2222');


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.services VALUES (1, 'Wash');
INSERT INTO public.services VALUES (2, 'Cut');
INSERT INTO public.services VALUES (3, 'Paint');


--
-- Name: appointments_appointment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.appointments_appointment_id_seq', 181, true);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 143, true);


--
-- Name: services_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.services_service_id_seq', 3, true);


--
-- Name: appointments appointments_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT appointments_pkey PRIMARY KEY (appointment_id);


--
-- Name: customers customers_phone_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_phone_key UNIQUE (phone);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (service_id);


--
-- Name: appointments fk_customer_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: appointments fk_service_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.appointments
    ADD CONSTRAINT fk_service_id FOREIGN KEY (service_id) REFERENCES public.services(service_id);


--
-- PostgreSQL database dump complete
--

