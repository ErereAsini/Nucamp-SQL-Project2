--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title text NOT NULL,
    semester integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.courses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO postgres;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name text NOT NULL,
    building integer NOT NULL,
    capacity integer NOT NULL,
    faculty_id integer NOT NULL,
    course_id integer NOT NULL,
    professor_id integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departments_id_seq OWNER TO postgres;

--
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculties (
    id integer NOT NULL,
    name text NOT NULL,
    building integer NOT NULL
);


ALTER TABLE public.faculties OWNER TO postgres;

--
-- Name: faculties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faculties_id_seq OWNER TO postgres;

--
-- Name: faculties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculties_id_seq OWNED BY public.faculties.id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: professors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.professors_id_seq OWNER TO postgres;

--
-- Name: professors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_id_seq OWNED BY public.professors.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_accounts (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.students_accounts OWNER TO postgres;

--
-- Name: students_accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_accounts_id_seq OWNER TO postgres;

--
-- Name: students_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_accounts_id_seq OWNED BY public.students_accounts.id;


--
-- Name: students_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_departments (
    student_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.students_departments OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- Name: faculties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties ALTER COLUMN id SET DEFAULT nextval('public.faculties_id_seq'::regclass);


--
-- Name: professors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN id SET DEFAULT nextval('public.professors_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Name: students_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts ALTER COLUMN id SET DEFAULT nextval('public.students_accounts_id_seq'::regclass);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, title, semester) FROM stdin;
\.


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name, building, capacity, faculty_id, course_id, professor_id) FROM stdin;
\.


--
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculties (id, name, building) FROM stdin;
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, last_name) FROM stdin;
\.


--
-- Data for Name: students_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_accounts (id, username, password, student_id) FROM stdin;
\.


--
-- Data for Name: students_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_departments (student_id, department_id) FROM stdin;
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 1, false);


--
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 1, false);


--
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculties_id_seq', 1, false);


--
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_id_seq', 1, false);


--
-- Name: students_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_accounts_id_seq', 1, false);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 1, false);


--
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: courses courses_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_title_key UNIQUE (title);


--
-- Name: departments departments_building_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_building_key UNIQUE (building);


--
-- Name: departments departments_faculty_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_faculty_id_key UNIQUE (faculty_id);


--
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: faculties faculties_building_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_building_key UNIQUE (building);


--
-- Name: faculties faculties_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_name_key UNIQUE (name);


--
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- Name: professors professors_first_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_first_name_key UNIQUE (first_name);


--
-- Name: professors professors_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_last_name_key UNIQUE (last_name);


--
-- Name: professors professors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


--
-- Name: students_accounts students_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_pkey PRIMARY KEY (id);


--
-- Name: students_accounts students_accounts_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_student_id_key UNIQUE (student_id);


--
-- Name: students_accounts students_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_username_key UNIQUE (username);


--
-- Name: students_departments students_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments
    ADD CONSTRAINT students_departments_pkey PRIMARY KEY (student_id, department_id);


--
-- Name: students students_first_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_first_name_key UNIQUE (first_name);


--
-- Name: students students_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_last_name_key UNIQUE (last_name);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: departments fk_departments_courses; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_courses FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- Name: departments fk_departments_faculties; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_faculties FOREIGN KEY (faculty_id) REFERENCES public.faculties(id);


--
-- Name: departments fk_departments_professors; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT fk_departments_professors FOREIGN KEY (professor_id) REFERENCES public.professors(id);


--
-- Name: students_accounts fk_students_accounts_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT fk_students_accounts_students FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: students_departments fk_students_departments_departments; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments
    ADD CONSTRAINT fk_students_departments_departments FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- Name: students_departments fk_students_departments_students; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments
    ADD CONSTRAINT fk_students_departments_students FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- PostgreSQL database dump complete
--

