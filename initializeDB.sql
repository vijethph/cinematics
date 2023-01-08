--
-- PostgreSQL database dump
--


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

--
-- Name: check_profit_or_loss(bigint, bigint, bigint, character varying); Type: PROCEDURE; Schema: public; Owner: testcomposeuser
--

CREATE PROCEDURE public.check_profit_or_loss(budget bigint, gross bigint, INOUT diff bigint, INOUT msg character varying)
    LANGUAGE plpgsql
    AS $$
BEGIN
    diff := gross - budget;
    IF(diff<0) THEN
        msg := 'Movie in loss';
    ELSE
        msg := 'Movie in profit';
    END IF;
END; 
$$;


ALTER PROCEDURE public.check_profit_or_loss(budget bigint, gross bigint, INOUT diff bigint, INOUT msg character varying) OWNER TO testcomposeuser;

--
-- Name: do_check_actor_age(); Type: FUNCTION; Schema: public; Owner: testcomposeuser
--

CREATE FUNCTION public.do_check_actor_age() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 NEW.age:=(date_part('year',CURRENT_DATE) - date_part('year',OLD.dob));
END;
$$;


ALTER FUNCTION public.do_check_actor_age() OWNER TO testcomposeuser;

--
-- Name: do_check_rating(); Type: FUNCTION; Schema: public; Owner: testcomposeuser
--

CREATE FUNCTION public.do_check_rating() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
 IF NEW.rating>10 THEN
        NEW.rating:=10;
    ELSEIF NEW.rating<0 THEN
        NEW.rating:=0;
    END IF;
END;
$$;


ALTER FUNCTION public.do_check_rating() OWNER TO testcomposeuser;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: actor; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.actor (
    name character varying(50) NOT NULL,
    dob date,
    age integer,
    gender character varying(10) DEFAULT NULL::character varying,
    file_path character varying(2048) DEFAULT NULL::character varying
);


ALTER TABLE public.actor OWNER TO testcomposeuser;

--
-- Name: actor_awards; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.actor_awards (
    actor_name character varying(50) NOT NULL,
    award1 character varying(50) DEFAULT NULL::character varying,
    award2 character varying(50) DEFAULT NULL::character varying,
    award3 character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.actor_awards OWNER TO testcomposeuser;

--
-- Name: also_an; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.also_an (
    director_name character varying(50) NOT NULL,
    actor_name character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.also_an OWNER TO testcomposeuser;

--
-- Name: directed_by; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.directed_by (
    movie_id integer NOT NULL,
    director_name character varying(50) NOT NULL
);


ALTER TABLE public.directed_by OWNER TO testcomposeuser;

--
-- Name: director; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.director (
    name character varying(50) NOT NULL,
    dob date,
    age integer,
    filmography character varying(200) DEFAULT NULL::character varying,
    file_path character varying(2048) DEFAULT NULL::character varying
);


ALTER TABLE public.director OWNER TO testcomposeuser;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: testcomposeuser
--

CREATE SEQUENCE public.hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO testcomposeuser;

--
-- Name: movie; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.movie (
    movie_id integer NOT NULL,
    title character varying(100) NOT NULL,
    length integer,
    release_date date,
    rating double precision,
    language character varying(50) DEFAULT NULL::character varying,
    budget bigint,
    gross bigint,
    company_name character varying(50) DEFAULT NULL::character varying,
    file_path character varying(2048) DEFAULT NULL::character varying
);


ALTER TABLE public.movie OWNER TO testcomposeuser;

--
-- Name: movie_genre; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.movie_genre (
    movie_id integer NOT NULL,
    genre1 character varying(50) DEFAULT NULL::character varying,
    genre2 character varying(50) DEFAULT NULL::character varying,
    genre3 character varying(50) DEFAULT NULL::character varying
);


ALTER TABLE public.movie_genre OWNER TO testcomposeuser;

--
-- Name: performed_by; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.performed_by (
    movie_id integer NOT NULL,
    actor_name character varying(50) NOT NULL
);


ALTER TABLE public.performed_by OWNER TO testcomposeuser;

--
-- Name: primary_sequence; Type: SEQUENCE; Schema: public; Owner: testcomposeuser
--

CREATE SEQUENCE public.primary_sequence
    START WITH 10000
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.primary_sequence OWNER TO testcomposeuser;

--
-- Name: production_company; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.production_company (
    name character varying(100) NOT NULL,
    address character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.production_company OWNER TO testcomposeuser;

--
-- Name: quote; Type: TABLE; Schema: public; Owner: testcomposeuser
--

CREATE TABLE public.quote (
    actor_name character varying(50) NOT NULL,
    movie_id integer NOT NULL,
    type character varying(50) DEFAULT NULL::character varying,
    dialogue character varying(200) DEFAULT NULL::character varying
);


ALTER TABLE public.quote OWNER TO testcomposeuser;

--
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.actor (name, dob, age, gender, file_path) FROM stdin;
Aamir Khan	1965-03-14	54	Male	/assets/images/aamirkhan.jpg
Chiranjeevi	1955-08-22	64	Male	/assets/images/chiranjeevi.jpg
Chris Evans	1981-06-13	38	Male	/assets/images/chrisevans.jpg
Prabhas	1979-10-23	40	Male	/assets/images/prabhas.jpeg
Puneeth Rajkumar	1975-03-17	44	Male	/assets/images/puneethrajkumar.jpg
Rajinikanth	1950-12-12	68	Male	/assets/images/rajinikanth.jpg
Salman Khan	1965-12-27	53	Male	/assets/images/salmankhan.jpg
Sam Worthington	1976-08-02	43	Male	/assets/images/samworthington.jpg
Vijay	1974-06-22	45	Male	/assets/images/vijay.jpg
Yash	1986-01-08	33	Male	/assets/images/yash.jpg
\.


--
-- Data for Name: actor_awards; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.actor_awards (actor_name, award1, award2, award3) FROM stdin;
Aamir Khan	IIFA Awards	AACTA Awards	National Film Awards
Chiranjeevi	SIIMA Awards	Nandi Awards	Filmfare Awards
Chris Evans	Scream Awards	MTV Movie Awards	Teen Choice Awards
Prabhas	SIIMA Awards	IIFA Utsavam Awards	Filmfare Awards
Puneeth Rajkumar	SIIMA Awards	National Film Award	Filmfare Awards
Rajinikanth	IIFA Utsavam Awards	Vijay Awards	Filmfare Awards
Salman Khan	IIFA Awards	ITA Awards	National Film Awards
Sam Worthington	FCCA Awards	AFI Awards	IF Awards
Vijay	SIIMA Awards	BIFAN Awards	Vijay Awards
Yash	IIFA Utsavam Awards	SIIMA Awards	Filmfare Awards
\.


--
-- Data for Name: also_an; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.also_an (director_name, actor_name) FROM stdin;
Aamir Khan	Aamir Khan
\.


--
-- Data for Name: directed_by; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.directed_by (movie_id, director_name) FROM stdin;
101	Russo Brothers
102	James Cameron
103	Aamir Khan
104	Kabir Khan
105	Prashanth Neel
106	Santosh Anandram
107	S.Shankar
108	Atlee
109	Surender Reddy
110	Sujeeth
\.


--
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.director (name, dob, age, filmography, file_path) FROM stdin;
Aamir Khan	1965-03-14	54	Dangal, Taare Zameen Par, Lagaan, Ghajini	/assets/images/aamirkhan.jpg
Atlee	1986-09-21	33	Theri, Mersal, Bigil	/assets/images/atlee.jpg
James Cameron	1954-07-16	65	The Terminator Series	/assets/images/jamescameron.jpg
Kabir Khan	1971-05-21	48	Ek Tha Tiger, Bajrangi Bhaijaan, Phantom	/assets/images/kabirkhan.jpg
Prashanth Neel	1980-06-04	39	Ugramm, KGF Series	/assets/images/prashanthneel.jpg
Russo Brothers	1970-02-03	49	Captain America Series	/assets/images/russobros.jpeg
S.Shankar	1963-08-17	56	Sivaji-The Boss, Enthiran, 2.0	/assets/images/sshankar.jpg
Santhosh Anandram	1985-08-15	34	Mr and Mrs Ramachari, Rocky, Raajakumara	/assets/images/santoshanandram.jpg
Sujeeth	1988-10-29	31	Run Raja Run, Saaho	/assets/images/sujeeth.jpg
Surender Reddy	1975-12-07	43	Race Gurram, Kick Series, Dhruva	/assets/images/surenderreddy.jpg
\.


--
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.movie (movie_id, title, length, release_date, rating, language, budget, gross, company_name, file_path) FROM stdin;
101	Avengers Endgame	181	2019-04-22	8.5	English	356000000	2798000000	Marvel Studios	/assets/images/avengersendgame.jpg
102	Avatar	161	2009-12-10	7.8	English	237000000	2790000000	Lightstorm Entertainment	/assets/images/avatar.jpg
103	Taare Zameen Par	164	2007-12-14	8.4	Hindi	120000000	889000000	Aamir Khan Productions	/assets/images/threeidiots.jpg
104	Bajrangi Bhaijaan	159	2015-07-22	8	Hindi	90000000	970000000	Salman Khan Films	/assets/images/bhajrangi.jpg
105	KGF	155	2018-12-20	8.2	Kannada	50000000	250000000	Hombale Films	/assets/images/kgf.jpg
106	Raajakumara	148	2017-03-24	8	Kannada	200000000	750000000	Jayanna Combines	/assets/images/rajkumaara.jpg
107	2.0	147	2018-11-29	6.4	Tamil	570000000	821000000	Lyca Productions	/assets/images/twopointo.jpg
108	Bigil	177	2019-10-25	7.6	Tamil	180000000	270000000	AGS Entertainment	/assets/images/bigil.jpg
109	Sye Raa Narasimha Reddy	171	2019-10-02	8.1	Telugu	250000000	270000000	Konidela Production Company	/assets/images/syeraa.jpg
110	Saaho	170	2019-08-30	5.5	Telugu	350000000	433000000	UV Creations	/assets/images/saaho.jpg
\.


--
-- Data for Name: movie_genre; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.movie_genre (movie_id, genre1, genre2, genre3) FROM stdin;
101	Action	Superhero	Adventure
102	Action	Science Fiction	Fantasy
103	Drama	Musical	Family
104	Drama	Comedy	Adventure
105	Thriller	Drama	Action
106	Family	Drama	Romance
107	Action	Science Fiction	Thriller
108	Drama	Sports	Adventure
109	Drama	History	War
110	Action	Thriller	Romance
\.


--
-- Data for Name: performed_by; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.performed_by (movie_id, actor_name) FROM stdin;
101	Chris Evans
102	Sam Worthington
103	Aamir Khan
104	Salman Khan
105	Yash
106	Puneeth Rajkumar
107	Rajinikanth
108	Vijay
109	Chiranjeevi
110	Prabhas
\.


--
-- Data for Name: production_company; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.production_company (name, address) FROM stdin;
Aamir Khan Productions	Mumbai, Maharashtra, India
AGS Entertainment	Chennai, Tamil Nadu, India
Hombale Films	Bengaluru, Karnataka, India
Jayanna Combines	Bengaluru, Karnataka, India
Konidela Production Company	Hyderabad, Telangana, India
Lightstorm Entertainment	Santa Monica, Los Angeles, California
Lyca Productions	Chennai, Tamil Nadu, India
Marvel Studios	500 South Buena Vista Street, Burbank, California, United States
Salman Khan Films	Mumbai, Maharashtra, India
UV Creations	Hyderabad, Telangana, India
\.


--
-- Data for Name: quote; Type: TABLE DATA; Schema: public; Owner: testcomposeuser
--

COPY public.quote (actor_name, movie_id, type, dialogue) FROM stdin;
Aamir Khan	103	Drama	Let us not lose these stars on Earth
Chiranjeevi	109	Stroke	Renadu Virulara..Charitralo Manam Undakapovachu, Charitra Ee Roju Manathone Modalavvali
Chris Evans	101	Moment of truth	Some people move on, but not us.
Prabhas	110	Delimiting	Gallilo Yavadina Sixer Kodathadu...Kaani Stadiumlo Kotivadike Okka Range Untadi
Puneeth Rajkumar	106	Revolting	Neen noor sala nanna meele attack maadidru, noor sala naane hodiyoodu
Rajinikanth	107	Zeitgeist	Vaangada selfie pullengala...I will set your screen on fire
Salman Khan	104	Zeitgeist	Hum bajrang bali ke bhakt hai koi kaam chori chupe nahi karte
Sam Worthington	102	Memorable	The Navi say, that every person is born twice.
Vijay	108	Niche	Happy deepavali nanba
Yash	105	Fad, Cutting Edge	If you think you are bad, I am your dad
\.


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: testcomposeuser
--

SELECT pg_catalog.setval('public.hibernate_sequence', 1, false);


--
-- Name: primary_sequence; Type: SEQUENCE SET; Schema: public; Owner: testcomposeuser
--

SELECT pg_catalog.setval('public.primary_sequence', 10000, false);


--
-- Name: actor_awards actor_awards_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.actor_awards
    ADD CONSTRAINT actor_awards_pkey PRIMARY KEY (actor_name);


--
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (name);


--
-- Name: also_an also_an_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.also_an
    ADD CONSTRAINT also_an_pkey PRIMARY KEY (director_name);


--
-- Name: directed_by directed_by_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.directed_by
    ADD CONSTRAINT directed_by_pkey PRIMARY KEY (movie_id, director_name);


--
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (name);


--
-- Name: movie_genre movie_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.movie_genre
    ADD CONSTRAINT movie_genre_pkey PRIMARY KEY (movie_id);


--
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (movie_id);


--
-- Name: performed_by performed_by_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.performed_by
    ADD CONSTRAINT performed_by_pkey PRIMARY KEY (movie_id, actor_name);


--
-- Name: production_company production_company_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.production_company
    ADD CONSTRAINT production_company_pkey PRIMARY KEY (name);


--
-- Name: quote quote_pkey; Type: CONSTRAINT; Schema: public; Owner: testcomposeuser
--

ALTER TABLE ONLY public.quote
    ADD CONSTRAINT quote_pkey PRIMARY KEY (actor_name, movie_id);


--
-- Name: actor check_actor_age; Type: TRIGGER; Schema: public; Owner: testcomposeuser
--

CREATE TRIGGER check_actor_age BEFORE UPDATE ON public.actor FOR EACH ROW EXECUTE FUNCTION public.do_check_actor_age();


--
-- Name: director check_director_age; Type: TRIGGER; Schema: public; Owner: testcomposeuser
--

CREATE TRIGGER check_director_age BEFORE UPDATE ON public.director FOR EACH ROW EXECUTE FUNCTION public.do_check_actor_age();


--
-- Name: movie check_rating; Type: TRIGGER; Schema: public; Owner: testcomposeuser
--

CREATE TRIGGER check_rating BEFORE INSERT ON public.movie FOR EACH ROW EXECUTE FUNCTION public.do_check_rating();

--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: testcomposeuser
--

GRANT ALL ON SCHEMA public TO testcomposeuser;


--
-- Name: TABLE actor; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.actor TO testcomposeuser;


--
-- Name: TABLE actor_awards; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.actor_awards TO testcomposeuser;


--
-- Name: TABLE also_an; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.also_an TO testcomposeuser;


--
-- Name: TABLE directed_by; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.directed_by TO testcomposeuser;


--
-- Name: TABLE director; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.director TO testcomposeuser;


--
-- Name: TABLE movie; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.movie TO testcomposeuser;


--
-- Name: TABLE movie_genre; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.movie_genre TO testcomposeuser;


--
-- Name: TABLE performed_by; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.performed_by TO testcomposeuser;


--
-- Name: TABLE production_company; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.production_company TO testcomposeuser;


--
-- Name: TABLE quote; Type: ACL; Schema: public; Owner: testcomposeuser
--

GRANT ALL ON TABLE public.quote TO testcomposeuser;


--
-- PostgreSQL database dump complete
--

