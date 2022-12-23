--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.12 (Ubuntu 12.12-0ubuntu0.20.04.1)

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
-- Name: session; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session (
    id integer NOT NULL,
    "idUser" integer NOT NULL,
    token text NOT NULL
);


--
-- Name: session_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_id_seq OWNED BY public.session.id;


--
-- Name: shortLink; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."shortLink" (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "seesionId" integer NOT NULL,
    "shortUrl" text NOT NULL,
    url text NOT NULL,
    counter integer DEFAULT 0 NOT NULL
);


--
-- Name: shortLink_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."shortLink_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: shortLink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."shortLink_id_seq" OWNED BY public."shortLink".id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: session id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session ALTER COLUMN id SET DEFAULT nextval('public.session_id_seq'::regclass);


--
-- Name: shortLink id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortLink" ALTER COLUMN id SET DEFAULT nextval('public."shortLink_id_seq"'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: session; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.session VALUES (17, 11, 'a2bd6b8a-7f32-41d6-ba75-defea52a770a');
INSERT INTO public.session VALUES (19, 12, 'ad576862-8b08-42fb-88fe-285c2ee51f6e');
INSERT INTO public.session VALUES (21, 13, 'f8429e67-1693-45d1-a5d5-3d3ac61e244c');
INSERT INTO public.session VALUES (23, 14, '61cc2e2d-80dd-4c44-b60b-df2d31603c1d');
INSERT INTO public.session VALUES (24, 15, '0ce63e23-2a9d-43c3-a267-ff8acaea8bdc');
INSERT INTO public.session VALUES (25, 16, 'be8d974c-7cae-4220-b174-3d2d99ad2f79');
INSERT INTO public.session VALUES (27, 17, '23670cc4-1490-4bad-80ee-18644d455e93');
INSERT INTO public.session VALUES (29, 18, '649d586c-f6d1-4636-9bc2-01fb7ebff31d');
INSERT INTO public.session VALUES (30, 19, '6a53f2c3-8b74-43c8-9fc2-fe897027221f');
INSERT INTO public.session VALUES (41, 20, '9a4479ed-79fb-45ff-abd2-bf43b1357d6d');
INSERT INTO public.session VALUES (44, 21, '07020e90-d146-438b-b0d7-fc17c44bd3dd');


--
-- Data for Name: shortLink; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."shortLink" VALUES (9, 21, 44, 'mf2CmZ8XOP', 'https://www.w3schools.com/sql/sql_create_table.asp', 3);
INSERT INTO public."shortLink" VALUES (7, 21, 44, 'lRqvHXZSvc', 'https://meyerweb.com/eric/tools/css/reset/', 1);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'João', 'joao@driven.com.br', 'driven');
INSERT INTO public.users VALUES (10, 'João fenício', 'joaofenicio@driven.com.br', '$2b$10$/SV1KBY2piGkCCXVcsTzHurLyy9Ou49lXoTBNuKPKIL4gY7mhCp5u');
INSERT INTO public.users VALUES (11, 'Maicon', 'maincon@driven.com.br', '$2b$10$TcOpUGDN8s3uq7ikpdfiouhC6WPjZFwgYiWX2MObD.kkP/1/IgHb.');
INSERT INTO public.users VALUES (12, 'Lucas', 'lucas@driven.com.br', '$2b$10$/lxQSdfANvOXO9JrYkxf/e.wxnw0IbdWnUd0uImBGSg.x2zKvhDQC');
INSERT INTO public.users VALUES (13, 'Helena', 'Helena@driven.com.br', '$2b$10$w9m5BdvwBvZxeH3kePh1Ae0kGiUMFGQBu89c/ElT/yiw4ZXLXhHsq');
INSERT INTO public.users VALUES (14, 'Luiza', 'Luiza@driven.com.br', '$2b$10$yS/lorcgUZERRl9MAhCNCeHFWPlWmYWqQxPjZKI1RGCWAAwNNrEX2');
INSERT INTO public.users VALUES (15, 'Randolphinho', 'Roro@driven.com.br', '$2b$10$WzSJDJlVMUC4Xibvslxd1e5Gnz1ScvmOh1vugUiWKX.zmow38UJjy');
INSERT INTO public.users VALUES (16, 'Sergio', 'Sergio@driven.com.br', '$2b$10$Jyy72gRVOZOLr10cLTWDWOLhq0QmxCv5jwbmEBy2R9r2RoyBpd3l2');
INSERT INTO public.users VALUES (17, 'Sergio 2', 'Sergio2@driven.com.br', '$2b$10$jKP6yWYOJiez9wFKVOjfoOr2rgyaqvNs00qHVQzMCVPZc6.zikFFG');
INSERT INTO public.users VALUES (18, 'Sergio 3', 'Sergio3@driven.com.br', '$2b$10$VbSTuTarExkQvcBOKMBgt.MICXj9TDb4LyVwL4jctCLgyL5hfifjW');
INSERT INTO public.users VALUES (19, 'Sergio 4', 'Sergio4@driven.com.br', '$2b$10$ET/s9oazPm6DZy9e1cSDX.nnR3LDtWqbkHYlhvAhNICB01991e82u');
INSERT INTO public.users VALUES (20, 'Felipe', 'felipe@driven.com.br', '$2b$10$dWNw1GvHswHthccne6EOSOHlxxHKO4Zrff4W543MwN/mu7ay2fBQS');
INSERT INTO public.users VALUES (21, 'Gabriel', 'gabri@driven.com.br', '$2b$10$s/UpE4jiuQRQNHuJLdKaUeEgNa0Vk0nZer0xat05AbXzbv.zsHuia');


--
-- Name: session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.session_id_seq', 45, true);


--
-- Name: shortLink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."shortLink_id_seq"', 9, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 21, true);


--
-- Name: session session_idUser_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_idUser_key" UNIQUE ("idUser");


--
-- Name: session session_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_pkey PRIMARY KEY (id);


--
-- Name: session session_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT session_token_key UNIQUE (token);


--
-- Name: shortLink shortLink_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortLink"
    ADD CONSTRAINT "shortLink_pkey" PRIMARY KEY (id);


--
-- Name: shortLink shortLink_url_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortLink"
    ADD CONSTRAINT "shortLink_url_key" UNIQUE (url);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_password_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_password_key UNIQUE (password);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: session session_idUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session
    ADD CONSTRAINT "session_idUser_fkey" FOREIGN KEY ("idUser") REFERENCES public.users(id);


--
-- Name: shortLink shortLink_seesionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortLink"
    ADD CONSTRAINT "shortLink_seesionId_fkey" FOREIGN KEY ("seesionId") REFERENCES public.session(id);


--
-- Name: shortLink shortLink_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."shortLink"
    ADD CONSTRAINT "shortLink_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

