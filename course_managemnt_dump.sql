--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2023-05-15 01:35:07 UTC

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
-- TOC entry 209 (class 1259 OID 33126)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33132)
-- Name: courses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.courses (
    id integer NOT NULL,
    title text NOT NULL,
    semester integer
);


ALTER TABLE public.courses OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33131)
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
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 210
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.courses_id_seq OWNED BY public.courses.id;


--
-- TOC entry 219 (class 1259 OID 33180)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    building integer NOT NULL,
    capacity integer NOT NULL,
    faculty_id integer NOT NULL,
    course_id integer NOT NULL,
    professor_id integer
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 33179)
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
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 218
-- Name: departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departments_id_seq OWNED BY public.departments.id;


--
-- TOC entry 213 (class 1259 OID 33143)
-- Name: faculties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculties (
    id integer NOT NULL,
    name character varying(128) NOT NULL,
    building integer NOT NULL
);


ALTER TABLE public.faculties OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 33142)
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
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 212
-- Name: faculties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculties_id_seq OWNED BY public.faculties.id;


--
-- TOC entry 215 (class 1259 OID 33154)
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 33153)
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
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 214
-- Name: professors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_id_seq OWNED BY public.professors.id;


--
-- TOC entry 217 (class 1259 OID 33167)
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL
);


ALTER TABLE public.students OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33208)
-- Name: students_accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_accounts (
    id integer NOT NULL,
    username character varying(128) NOT NULL,
    password character varying(128) NOT NULL,
    student_id integer NOT NULL
);


ALTER TABLE public.students_accounts OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 33207)
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
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 220
-- Name: students_accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_accounts_id_seq OWNED BY public.students_accounts.id;


--
-- TOC entry 223 (class 1259 OID 33224)
-- Name: students_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students_departments (
    id integer NOT NULL,
    student_id integer NOT NULL,
    department_id integer NOT NULL
);


ALTER TABLE public.students_departments OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 33223)
-- Name: students_departments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_departments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_departments_id_seq OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 222
-- Name: students_departments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_departments_id_seq OWNED BY public.students_departments.id;


--
-- TOC entry 216 (class 1259 OID 33166)
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
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 216
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- TOC entry 3200 (class 2604 OID 33135)
-- Name: courses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses ALTER COLUMN id SET DEFAULT nextval('public.courses_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 33183)
-- Name: departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments ALTER COLUMN id SET DEFAULT nextval('public.departments_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 33146)
-- Name: faculties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties ALTER COLUMN id SET DEFAULT nextval('public.faculties_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 33157)
-- Name: professors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN id SET DEFAULT nextval('public.professors_id_seq'::regclass);


--
-- TOC entry 3203 (class 2604 OID 33170)
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 33211)
-- Name: students_accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts ALTER COLUMN id SET DEFAULT nextval('public.students_accounts_id_seq'::regclass);


--
-- TOC entry 3206 (class 2604 OID 33227)
-- Name: students_departments id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments ALTER COLUMN id SET DEFAULT nextval('public.students_departments_id_seq'::regclass);


--
-- TOC entry 3392 (class 0 OID 33126)
-- Dependencies: 209
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
0bed88e5a803
\.


--
-- TOC entry 3394 (class 0 OID 33132)
-- Dependencies: 211
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.courses (id, title, semester) FROM stdin;
1	Engineering Drawing	1
2	Engineering Mathematics	1
3	Thermodynamics	1
4	Fluid Mechanics	1
5	Engineering Machines	2
6	Telecomminucations Principles	2
7	Software Engineering	2
8	Electronics Design	2
9	Engineering Project	2
10	Engineering Management	2
11	Management Sciences	2
12	Business Principles	2
\.


--
-- TOC entry 3402 (class 0 OID 33180)
-- Dependencies: 219
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departments (id, name, building, capacity, faculty_id, course_id, professor_id) FROM stdin;
9	Electrical Engineering	2	25	1	5	4
10	Business Analysis	11	15	2	12	7
11	Telecommunications Engineering	6	20	3	3	3
12	Mechanical Engineering	4	15	4	3	5
\.


--
-- TOC entry 3396 (class 0 OID 33143)
-- Dependencies: 213
-- Data for Name: faculties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculties (id, name, building) FROM stdin;
1	Faculty of Engineering	10
2	Faculty of Management	5
3	Faculty of Sciences	3
4	Faculty of Arts	15
\.


--
-- TOC entry 3398 (class 0 OID 33154)
-- Dependencies: 215
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (id, first_name, last_name) FROM stdin;
1	Bruce	Jenkins
2	John	Doe
3	Phillip	Dumelo
4	Jennifer	Hopkins
5	Joseph	Dunamis
6	Andrew	Melrose
7	Ramsey	Tokunbo
\.


--
-- TOC entry 3400 (class 0 OID 33167)
-- Dependencies: 217
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, last_name) FROM stdin;
1	Bryce	Phillip
2	James	CaliDoe
3	Phillip	Jenkins
4	Jennifer	Steinbacher
5	Joseph	Kolawole
6	Andrew	Kingsley
7	Ramsey	Adams
8	Nagaraju	Singh
9	Jude	Scotsdale
10	Julliet	Blanchard
11	Michael	Cubana
12	Rumi	Eze
\.


--
-- TOC entry 3404 (class 0 OID 33208)
-- Dependencies: 221
-- Data for Name: students_accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_accounts (id, username, password, student_id) FROM stdin;
2	lobster	tail123	1
3	ajasco	alinco321	12
4	perimeter	area243	3
5	flatiron	noble456	5
6	thousandoaks	iroko789	7
\.


--
-- TOC entry 3406 (class 0 OID 33224)
-- Dependencies: 223
-- Data for Name: students_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students_departments (id, student_id, department_id) FROM stdin;
\.


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 210
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.courses_id_seq', 12, true);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 218
-- Name: departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departments_id_seq', 12, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 212
-- Name: faculties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculties_id_seq', 4, true);


--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 214
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_id_seq', 7, true);


--
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 220
-- Name: students_accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_accounts_id_seq', 6, true);


--
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 222
-- Name: students_departments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_departments_id_seq', 1, false);


--
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 216
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 12, true);


--
-- TOC entry 3208 (class 2606 OID 33130)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3210 (class 2606 OID 33139)
-- Name: courses courses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 33141)
-- Name: courses courses_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.courses
    ADD CONSTRAINT courses_title_key UNIQUE (title);


--
-- TOC entry 3232 (class 2606 OID 33187)
-- Name: departments departments_building_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_building_key UNIQUE (building);


--
-- TOC entry 3234 (class 2606 OID 33189)
-- Name: departments departments_faculty_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_faculty_id_key UNIQUE (faculty_id);


--
-- TOC entry 3236 (class 2606 OID 33191)
-- Name: departments departments_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_name_key UNIQUE (name);


--
-- TOC entry 3238 (class 2606 OID 33185)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3214 (class 2606 OID 33150)
-- Name: faculties faculties_building_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_building_key UNIQUE (building);


--
-- TOC entry 3216 (class 2606 OID 33152)
-- Name: faculties faculties_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_name_key UNIQUE (name);


--
-- TOC entry 3218 (class 2606 OID 33148)
-- Name: faculties faculties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculties
    ADD CONSTRAINT faculties_pkey PRIMARY KEY (id);


--
-- TOC entry 3220 (class 2606 OID 33163)
-- Name: professors professors_first_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_first_name_key UNIQUE (first_name);


--
-- TOC entry 3222 (class 2606 OID 33165)
-- Name: professors professors_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_last_name_key UNIQUE (last_name);


--
-- TOC entry 3224 (class 2606 OID 33161)
-- Name: professors professors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 33213)
-- Name: students_accounts students_accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3242 (class 2606 OID 33215)
-- Name: students_accounts students_accounts_student_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_student_id_key UNIQUE (student_id);


--
-- TOC entry 3244 (class 2606 OID 33217)
-- Name: students_accounts students_accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_username_key UNIQUE (username);


--
-- TOC entry 3246 (class 2606 OID 33229)
-- Name: students_departments students_departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments
    ADD CONSTRAINT students_departments_pkey PRIMARY KEY (id);


--
-- TOC entry 3226 (class 2606 OID 33176)
-- Name: students students_first_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_first_name_key UNIQUE (first_name);


--
-- TOC entry 3228 (class 2606 OID 33178)
-- Name: students students_last_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_last_name_key UNIQUE (last_name);


--
-- TOC entry 3230 (class 2606 OID 33174)
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 33192)
-- Name: departments departments_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.courses(id);


--
-- TOC entry 3248 (class 2606 OID 33197)
-- Name: departments departments_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculties(id);


--
-- TOC entry 3249 (class 2606 OID 33202)
-- Name: departments departments_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professors(id);


--
-- TOC entry 3250 (class 2606 OID 33218)
-- Name: students_accounts students_accounts_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_accounts
    ADD CONSTRAINT students_accounts_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- TOC entry 3251 (class 2606 OID 33230)
-- Name: students_departments students_departments_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments
    ADD CONSTRAINT students_departments_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(id);


--
-- TOC entry 3252 (class 2606 OID 33235)
-- Name: students_departments students_departments_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students_departments
    ADD CONSTRAINT students_departments_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


-- Completed on 2023-05-15 01:35:08 UTC

--
-- PostgreSQL database dump complete
--

