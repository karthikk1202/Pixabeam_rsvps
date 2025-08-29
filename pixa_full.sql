--
-- PostgreSQL database dump
--

\restrict 6qfBgCeuE50L04TU1KcE22sVOQvcsT0j8q89bPuoW4jAQWQLDAT9PqlfXgklzf2

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: rsvp_status; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.rsvp_status AS ENUM (
    'yes',
    'no',
    'maybe'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: events; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.events (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    description text,
    date timestamp with time zone NOT NULL,
    city text NOT NULL,
    created_by uuid,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT events_title_check CHECK ((length(title) >= 1))
);


--
-- Name: rsvps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rsvps (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    event_id uuid NOT NULL,
    status public.rsvp_status NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    CONSTRAINT users_name_check CHECK ((length(name) >= 1))
);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.events (id, title, description, date, city, created_by, created_at) FROM stdin;
fd08c923-6d7c-4762-8128-996c0d2b20fe	Hyderabad JS Meetup	Monthly JS talks & networking	2025-09-03 07:07:34.247978+00	Hyderabad	40dfe511-0d38-4d9e-8bca-236dc4c2f3e7	2025-08-27 07:07:34.247978+00
2d8778c6-c5cf-4ed2-9ba8-cf1a82047e03	Data Science Saturdays	Hands-on ML workshop	2025-09-06 07:07:34.247978+00	Bengaluru	e4d61811-b640-418c-9671-1e95822f93c1	2025-08-27 07:07:34.247978+00
39d2404e-5036-4e7f-ae7a-dd921c6b6768	Web3 Builders Night	Demos & dev panel	2025-09-10 07:07:34.247978+00	Mumbai	f3ec7519-3ca6-4a1e-b30a-25c4505e766d	2025-08-27 07:07:34.247978+00
8f902d0e-9136-457e-b222-c85cad5d74b4	AI in Production	Case studies and pitfalls	2025-09-17 07:07:34.247978+00	Pune	ebc58a04-5463-4567-8ff1-e4250fddd721	2025-08-27 07:07:34.247978+00
52412cfa-660a-40ec-a121-699a5e77b2cd	Startup Pitch Jam	Early-stage pitch practice	2025-09-24 07:07:34.247978+00	Chennai	efe6e2b9-223c-48df-a96b-a07ae7a8a712	2025-08-27 07:07:34.247978+00
\.


--
-- Data for Name: rsvps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rsvps (id, user_id, event_id, status, created_at) FROM stdin;
7a660a3c-c34d-4378-8bed-d05e04e99224	40dfe511-0d38-4d9e-8bca-236dc4c2f3e7	fd08c923-6d7c-4762-8128-996c0d2b20fe	yes	2025-08-27 07:07:34.247978+00
9c91302c-ec77-421a-aa69-df123070f3d9	e4d61811-b640-418c-9671-1e95822f93c1	fd08c923-6d7c-4762-8128-996c0d2b20fe	maybe	2025-08-27 07:07:34.247978+00
f0287af9-400a-49eb-ad72-b8c38592232d	f3ec7519-3ca6-4a1e-b30a-25c4505e766d	fd08c923-6d7c-4762-8128-996c0d2b20fe	no	2025-08-27 07:07:34.247978+00
06e810f6-e713-48fb-aa85-04d51dcac52a	ebc58a04-5463-4567-8ff1-e4250fddd721	fd08c923-6d7c-4762-8128-996c0d2b20fe	yes	2025-08-27 07:07:34.247978+00
8d02bda8-5b26-46b4-8b56-c0dc1ed2e5cf	efe6e2b9-223c-48df-a96b-a07ae7a8a712	2d8778c6-c5cf-4ed2-9ba8-cf1a82047e03	yes	2025-08-27 07:07:34.247978+00
f72ec9ff-2e71-4ea0-bc6e-c8ee18b82924	8df5af2e-cab0-4ec4-b2ff-bff66d23f1e1	2d8778c6-c5cf-4ed2-9ba8-cf1a82047e03	maybe	2025-08-27 07:07:34.247978+00
52a5eb26-5362-4c2b-a7c2-d1bebc79e4a5	e56c3a3f-6753-4c29-aa04-6d452eb615c0	2d8778c6-c5cf-4ed2-9ba8-cf1a82047e03	yes	2025-08-27 07:07:34.247978+00
dc013381-9ac2-40e1-95cc-8ebf8c7a9a0f	277c0264-5b99-4f0d-a1af-4be5a4ec80ca	2d8778c6-c5cf-4ed2-9ba8-cf1a82047e03	no	2025-08-27 07:07:34.247978+00
6a2f60b1-e1b7-4df9-89fc-c7359328df9c	4fa92dfe-e1ec-4f13-b95a-c33988673e7d	39d2404e-5036-4e7f-ae7a-dd921c6b6768	maybe	2025-08-27 07:07:34.247978+00
4f8512a2-af5f-42b9-ab60-c3741cb68c67	cabc28de-5782-46df-8975-84fc0839994f	39d2404e-5036-4e7f-ae7a-dd921c6b6768	yes	2025-08-27 07:07:34.247978+00
aa6f30b1-a8f9-4011-a655-87a926716981	40dfe511-0d38-4d9e-8bca-236dc4c2f3e7	39d2404e-5036-4e7f-ae7a-dd921c6b6768	maybe	2025-08-27 07:07:34.247978+00
55724636-6fa6-470d-b92e-bad2d7a875a3	e4d61811-b640-418c-9671-1e95822f93c1	39d2404e-5036-4e7f-ae7a-dd921c6b6768	yes	2025-08-27 07:07:34.247978+00
3bd58ba0-37ae-4ba2-8b26-54be4d6a4fd3	f3ec7519-3ca6-4a1e-b30a-25c4505e766d	8f902d0e-9136-457e-b222-c85cad5d74b4	yes	2025-08-27 07:07:34.247978+00
9443c925-a1b8-4584-b519-9d1dce70555b	ebc58a04-5463-4567-8ff1-e4250fddd721	8f902d0e-9136-457e-b222-c85cad5d74b4	maybe	2025-08-27 07:07:34.247978+00
33ad1292-5867-4fe8-81f0-4f13defc1360	efe6e2b9-223c-48df-a96b-a07ae7a8a712	8f902d0e-9136-457e-b222-c85cad5d74b4	no	2025-08-27 07:07:34.247978+00
787ad9e3-3250-461b-b649-87fc1d7867a2	8df5af2e-cab0-4ec4-b2ff-bff66d23f1e1	52412cfa-660a-40ec-a121-699a5e77b2cd	yes	2025-08-27 07:07:34.247978+00
2abbe2a0-4868-4459-8299-e3d9c625d877	e56c3a3f-6753-4c29-aa04-6d452eb615c0	52412cfa-660a-40ec-a121-699a5e77b2cd	maybe	2025-08-27 07:07:34.247978+00
58dcdc18-025f-4dfe-81df-41e36058b211	277c0264-5b99-4f0d-a1af-4be5a4ec80ca	52412cfa-660a-40ec-a121-699a5e77b2cd	yes	2025-08-27 07:07:34.247978+00
ce8e4af6-a2c3-4852-976a-514cf82a6090	4fa92dfe-e1ec-4f13-b95a-c33988673e7d	52412cfa-660a-40ec-a121-699a5e77b2cd	no	2025-08-27 07:07:34.247978+00
3a35c6c6-fddc-4c62-bc24-cdc575a92158	cabc28de-5782-46df-8975-84fc0839994f	52412cfa-660a-40ec-a121-699a5e77b2cd	yes	2025-08-27 07:07:34.247978+00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, name, email, created_at) FROM stdin;
40dfe511-0d38-4d9e-8bca-236dc4c2f3e7	Aarav Mehta	aarav@example.com	2025-08-27 07:07:34.247978+00
e4d61811-b640-418c-9671-1e95822f93c1	Isha Sharma	isha@example.com	2025-08-27 07:07:34.247978+00
f3ec7519-3ca6-4a1e-b30a-25c4505e766d	Rohan Gupta	rohan@example.com	2025-08-27 07:07:34.247978+00
ebc58a04-5463-4567-8ff1-e4250fddd721	Ananya Rao	ananya@example.com	2025-08-27 07:07:34.247978+00
efe6e2b9-223c-48df-a96b-a07ae7a8a712	Vihaan Iyer	vihaan@example.com	2025-08-27 07:07:34.247978+00
8df5af2e-cab0-4ec4-b2ff-bff66d23f1e1	Sara Khan	sara@example.com	2025-08-27 07:07:34.247978+00
e56c3a3f-6753-4c29-aa04-6d452eb615c0	Kabir Singh	kabir@example.com	2025-08-27 07:07:34.247978+00
277c0264-5b99-4f0d-a1af-4be5a4ec80ca	Meera Das	meera@example.com	2025-08-27 07:07:34.247978+00
4fa92dfe-e1ec-4f13-b95a-c33988673e7d	Arjun Jain	arjun@example.com	2025-08-27 07:07:34.247978+00
cabc28de-5782-46df-8975-84fc0839994f	Nisha Patel	nisha@example.com	2025-08-27 07:07:34.247978+00
\.


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: rsvps rsvps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvps
    ADD CONSTRAINT rsvps_pkey PRIMARY KEY (id);


--
-- Name: rsvps rsvps_user_id_event_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvps
    ADD CONSTRAINT rsvps_user_id_event_id_key UNIQUE (user_id, event_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: events fk_events_created_by; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_created_by FOREIGN KEY (created_by) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: rsvps fk_rsvps_event; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvps
    ADD CONSTRAINT fk_rsvps_event FOREIGN KEY (event_id) REFERENCES public.events(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rsvps fk_rsvps_user; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rsvps
    ADD CONSTRAINT fk_rsvps_user FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 6qfBgCeuE50L04TU1KcE22sVOQvcsT0j8q89bPuoW4jAQWQLDAT9PqlfXgklzf2

