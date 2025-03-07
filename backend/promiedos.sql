--
-- PostgreSQL database dump
--

-- Dumped from database version 14.14 (Homebrew)
-- Dumped by pg_dump version 16.4 (Homebrew)

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: avnadmin
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO avnadmin;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: avnadmin
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Competition; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Competition" (
    id text NOT NULL,
    name text NOT NULL,
    country text NOT NULL,
    logo text
);


ALTER TABLE public."Competition" OWNER TO avnadmin;

--
-- Name: Jersey; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Jersey" (
    id integer NOT NULL,
    "teamId" text NOT NULL,
    type text,
    "baseColor" text,
    "numberColor" text,
    "sleeveColor" text
);


ALTER TABLE public."Jersey" OWNER TO avnadmin;

--
-- Name: Jersey_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public."Jersey_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Jersey_id_seq" OWNER TO avnadmin;

--
-- Name: Jersey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public."Jersey_id_seq" OWNED BY public."Jersey".id;


--
-- Name: Match; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Match" (
    id text NOT NULL,
    "competitionId" text NOT NULL,
    "homeTeamId" text NOT NULL,
    "awayTeamId" text NOT NULL,
    "scoreHome" integer,
    "scoreAway" integer,
    status text NOT NULL,
    round integer NOT NULL,
    "stadiumId" text NOT NULL,
    start_time timestamp(3) without time zone NOT NULL
);


ALTER TABLE public."Match" OWNER TO avnadmin;

--
-- Name: Player; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Player" (
    id text NOT NULL,
    name text,
    "teamId" text NOT NULL,
    "position" text,
    country text,
    number integer
);


ALTER TABLE public."Player" OWNER TO avnadmin;

--
-- Name: Stadium; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Stadium" (
    id text NOT NULL,
    name text NOT NULL,
    city text NOT NULL,
    country text NOT NULL,
    capacity integer NOT NULL
);


ALTER TABLE public."Stadium" OWNER TO avnadmin;

--
-- Name: Standings; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Standings" (
    id integer NOT NULL,
    "competitionId" text NOT NULL,
    "teamId" text NOT NULL,
    "position" integer NOT NULL,
    played integer NOT NULL,
    win integer NOT NULL,
    loss integer NOT NULL,
    draw integer NOT NULL,
    goals_for integer NOT NULL,
    goals_against integer NOT NULL,
    points integer NOT NULL,
    form text NOT NULL
);


ALTER TABLE public."Standings" OWNER TO avnadmin;

--
-- Name: Standings_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public."Standings_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Standings_id_seq" OWNER TO avnadmin;

--
-- Name: Standings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public."Standings_id_seq" OWNED BY public."Standings".id;


--
-- Name: Team; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."Team" (
    id text NOT NULL,
    name text NOT NULL,
    city text NOT NULL,
    country text NOT NULL,
    "managerName" text NOT NULL,
    "stadiumId" text NOT NULL,
    logo text,
    "shortName" text NOT NULL
);


ALTER TABLE public."Team" OWNER TO avnadmin;

--
-- Name: User; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."User" (
    id integer NOT NULL,
    email text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    password text NOT NULL,
    username text NOT NULL
);


ALTER TABLE public."User" OWNER TO avnadmin;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: avnadmin
--

CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."User_id_seq" OWNER TO avnadmin;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avnadmin
--

ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;


--
-- Name: _CompetitionToTeam; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."_CompetitionToTeam" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_CompetitionToTeam" OWNER TO avnadmin;

--
-- Name: _CompetitionToUser; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."_CompetitionToUser" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_CompetitionToUser" OWNER TO avnadmin;

--
-- Name: _TeamToUser; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public."_TeamToUser" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_TeamToUser" OWNER TO avnadmin;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: avnadmin
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO avnadmin;

--
-- Name: Jersey id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Jersey" ALTER COLUMN id SET DEFAULT nextval('public."Jersey_id_seq"'::regclass);


--
-- Name: Standings id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Standings" ALTER COLUMN id SET DEFAULT nextval('public."Standings_id_seq"'::regclass);


--
-- Name: User id; Type: DEFAULT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);


--
-- Data for Name: Competition; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Competition" (id, name, country, logo) FROM stdin;
sr:season:119847	Liga Portugal	PRT	https://upload.wikimedia.org/wikipedia/commons/5/5a/S%C3%ADmbolo_da_Liga_Portuguesa_de_Futebol_Profissional.png
sr:season:118689	Premier League	ENG	https://ssl.gstatic.com/onebox/media/sports/logos/5D811WOqeV3SRG6qt-DDPA_64x64.png
sr:season:118691	LaLiga	ESP	https://crests.football-data.org/laliga.png
sr:season:118693	Bundesliga	DEU	https://crests.football-data.org/BL1.png
sr:season:118699	Championship	ENG	https://crests.football-data.org/ELC.png
sr:season:119799	Eredivisie	NLD	https://crests.football-data.org/ED.png
sr:season:119835	Ligue 1	FRA	https://crests.football-data.org/FL1.png
sr:season:114317	Liga Profesional	ARG	https://upload.wikimedia.org/wikipedia/commons/8/85/Logo_lpf_afa.png
\.


--
-- Data for Name: Jersey; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Jersey" (id, "teamId", type, "baseColor", "numberColor", "sleeveColor") FROM stdin;
3609	sr:competitor:3001	away	ffffff	007a43	007a43
3611	sr:competitor:3002	home	0754a6	ffffff	005ec2
3612	sr:competitor:3001	goalkeeper	fee62e	000000	fee62e
3610	sr:competitor:3001	home	187312	ffffff	050505
3613	sr:competitor:3002	away	f77118	042f78	043587
3614	sr:competitor:3002	goalkeeper	fffb5d	050505	fa99bb
3615	sr:competitor:3001	third	ec4684	000000	ec4684
3616	sr:competitor:3006	away	000000	cc0000	000000
3617	sr:competitor:3002	third	24315c	7bd1eb	0808aa
3619	sr:competitor:3006	third	d6d7db	404040	d6d7db
3618	sr:competitor:3006	goalkeeper	feff65	ffffff	0ceb1d
3620	sr:competitor:3006	home	ff0000	ffffff	ff0000
3621	sr:competitor:3011	goalkeeper	000000	ffec16	fffc66
3622	sr:competitor:3011	away	ffffff	1c295b	1c295b
3623	sr:competitor:3011	home	ff0000	ffffff	ff0000
3624	sr:competitor:3009	third	fb4c2d	020000	020000
3625	sr:competitor:3011	third	172770	ff0000	ffffff
3626	sr:competitor:2999	third	32c9c9	000000	ffffff
3627	sr:competitor:2999	goalkeeper	ff8405	ffffff	fea876
3628	sr:competitor:3009	home	ffffff	000000	ffffff
3629	sr:competitor:2999	home	ff0000	ffffff	ffffff
3630	sr:competitor:49531	home	ffffff	004080	fcfcfc
3631	sr:competitor:49531	goalkeeper	56b30f	ffffff	56b30f
3632	sr:competitor:3009	away	000000	ffffff	f7cc84
3633	sr:competitor:49531	third	e0cf00	000000	e0cf00
3634	sr:competitor:3009	goalkeeper	25ff00	000000	2dff1c
3635	sr:competitor:3014	home	ffffff	050505	ffffff
3636	sr:competitor:3014	away	0c00b3	ffffff	0c00b3
3637	sr:competitor:49531	away	212197	ffffff	212197
3639	sr:competitor:3014	third	0c711e	ffffff	1b7d2d
3638	sr:competitor:3014	goalkeeper	1f0808	ffffff	0e0404
3640	sr:competitor:36365	away	ffffff	050505	ffffff
3641	sr:competitor:36365	goalkeeper	1583dc	fafafa	1583dc
3642	sr:competitor:3036	goalkeeper	ff6f00	ffffff	1d1c1b
3643	sr:competitor:3036	home	ffffff	000000	ffffff
3644	sr:competitor:3036	away	006b4d	ffffff	ffffff
3645	sr:competitor:36365	home	000000	ffffff	030303
3646	sr:competitor:2999	away	303030	b50056	646567
3647	sr:competitor:36365	third	d61a05	ffffff	d61a05
3648	sr:competitor:3010	away	1f3872	ffffff	1f3872
3649	sr:competitor:3010	home	ff0000	ffffff	ff0000
3650	sr:competitor:3010	goalkeeper	cff50d	000000	000000
3651	sr:competitor:3036	third	ffffff	020202	04690b
3652	sr:competitor:4500	goalkeeper	2ea532	ffffff	b507ce
3653	sr:competitor:3010	third	ffffff	ff0000	ff0000
3654	sr:competitor:2995	home	ffffff	000000	ffffff
3655	sr:competitor:1031053	away	ffffff	ff0000	ffffff
3656	sr:competitor:1031053	third	fff100	fff100	fff100
3657	sr:competitor:4500	home	ffff00	023453	ffff00
3658	sr:competitor:4500	third	f490e2	000000	ffffff
3659	sr:competitor:1031053	goalkeeper	01fe40	ffffff	01fe40
3660	sr:competitor:2995	third	ababab	000000	ffffff
3662	sr:competitor:2995	away	fd7543	000000	fd7543
3663	sr:competitor:744135	home	9b0000	ffffff	30625f
3664	sr:competitor:744135	third	ffffff	c3ac0f	fcfcfc
3665	sr:competitor:1031053	home	ee0000	ffb84d	ff0000
3666	sr:competitor:2995	goalkeeper	edaae0	000000	edaae0
3661	sr:competitor:4500	away	1b3464	a3a8b0	1b3464
3667	sr:competitor:744135	away	ffffff	060607	ffffff
3668	sr:competitor:25777	home	ffff00	047dcd	ffff00
3669	sr:competitor:744135	goalkeeper	0a0a0a	f6f6f6	0f0f0f
3670	sr:competitor:25777	goalkeeper	f70707	242121	000000
3671	sr:competitor:3013	home	ffffff	000000	ffffff
3672	sr:competitor:3013	away	8f22e2	ffffff	8f22e2
3673	sr:competitor:25777	third	ffffff	000000	ffffff
3674	sr:competitor:25777	away	1f2a53	ffffff	3b4c6a
3675	sr:competitor:3013	goalkeeper	94eec2	000000	ffffff
3676	sr:competitor:2998	home	ffffff	f00000	ffffff
3677	sr:competitor:2998	away	ffffff	000000	000000
3678	sr:competitor:3013	third	e2d40e	291c1c	000000
3679	sr:competitor:2998	goalkeeper	0033cc	ffffff	0033cc
3680	sr:competitor:41	home	ffffff	000000	ffffff
3681	sr:competitor:2998	third	000502	dabf08	0c383d
3682	sr:competitor:41	away	2d3446	ffffff	ffffff
3684	sr:competitor:15	home	dc2c36	050505	dc2c36
3685	sr:competitor:15	away	d5be50	da0b0b	000000
3686	sr:competitor:41	third	b5f53d	ffffff	181138
3683	sr:competitor:41	goalkeeper	42b792	ffffff	42b792
3687	sr:competitor:15	goalkeeper	080808	ffffff	6ebd8b
3688	sr:competitor:34	goalkeeper	e3257a	ffe860	e3257a
3689	sr:competitor:15	third	e1e1e3	000000	ffffff
3690	sr:competitor:6	third	f1f1f1	b4fff8	a3cabb
3691	sr:competitor:34	third	f0eb00	3669fd	3669fd
3692	sr:competitor:8	home	ffffff	ff0000	ffffff
3693	sr:competitor:34	home	ffffff	3491fc	fcfcfc
3695	sr:competitor:8	away	dbfcd1	2d3853	2d3853
3696	sr:competitor:6	away	d9db5e	611724	d9db5e
3694	sr:competitor:6	home	990033	fafafa	64b1ff
3698	sr:competitor:24	third	37219c	ffffff	0fa2ce
3704	sr:competitor:8	third	eb4191	df6ae6	e45dba
3714	sr:competitor:25	home	2d456e	ffffff	ffffff
3715	sr:competitor:74	home	ffffff	000000	ffffff
3727	sr:competitor:263	third	e2bcfb	000000	e2bcfb
3728	sr:competitor:29	away	000000	404750	090a1d
3740	sr:competitor:74	third	87839d	3c3a5e	87839d
3744	sr:competitor:95	home	ffee7d	171d33	ffee7d
3758	sr:competitor:27	away	1d2235	ffffff	1d2235
3759	sr:competitor:72	third	22252c	ffffff	e06f93
3774	sr:competitor:1	third	00002f	ffffff	408080
3776	sr:competitor:11	goalkeeper	0f0f0f	ffffff	050505
3791	sr:competitor:3210	goalkeeper	e919dc	ffffff	1c3060
3793	sr:competitor:3204	home	fcfcfc	d30f23	c3040a
3806	sr:competitor:36833	third	444b72	fdfdfd	b6e1fc
3808	sr:competitor:3202	third	fdfcff	223bce	fffffe
3823	sr:competitor:6074	home	2566c1	ffffff	ffffff
3826	sr:competitor:36837	goalkeeper	49a229	ffffff	99d175
3839	sr:competitor:7628	home	073eaf	ffffff	073eaf
3844	sr:competitor:7628	third	000000	ffffff	210099
3856	sr:competitor:36839	home	ffff00	49af12	ffff00
3855	sr:competitor:36839	away	282f39	cba85f	262d36
3872	sr:competitor:42338	away	ffffff	164533	ffffff
3875	sr:competitor:42338	goalkeeper	cf4f96	ffffff	92112b
3887	sr:competitor:44	home	e41e2c	ffffff	e41e2c
3891	sr:competitor:17	home	abd1f5	ffffff	abd1f5
3907	sr:competitor:42	third	afe9f5	0b1b59	1a2d6f
3908	sr:competitor:14	third	49e8ff	ffffff	343f61
3926	sr:competitor:33	home	ffffff	001e6c	252f50
3927	sr:competitor:33	goalkeeper	fcee00	131314	fcee00
3940	sr:competitor:37	away	000000	ffffff	590303
3943	sr:competitor:31	home	2424eb	ffffff	2424eb
3953	sr:competitor:32	home	0055aa	ffffff	0055aa
3960	sr:competitor:3	home	fecd32	000000	fecd32
3971	sr:competitor:2829	home	ffffff	000000	ffffff
3977	sr:competitor:2820	away	dfd4c8	323b53	323b53
3985	sr:competitor:2819	away	8ca2c3	020817	0a101b
3994	sr:competitor:2826	home	000000	ffffff	bd0404
4000	sr:competitor:2821	goalkeeper	1f9116	faf2da	db46a2
4008	sr:competitor:2824	goalkeeper	d6322c	080808	86e0cf
4024	sr:competitor:6577	away	00499a	e4c001	00499a
4028	sr:competitor:2859	home	063ba1	ffffff	063ba1
4040	sr:competitor:2828	home	ffffff	040404	000000
4054	sr:competitor:2952	home	e51323	000000	000000
4057	sr:competitor:2953	away	8399c8	f2e992	8499c7
4070	sr:competitor:2950	away	ffffff	000000	000000
4073	sr:competitor:2957	goalkeeper	16205f	ffffff	16205f
4086	sr:competitor:2979	away	41325f	efc272	ffffff
4094	sr:competitor:2964	third	ffffff	2a2c2b	1265a9
4111	sr:competitor:2960	goalkeeper	b1deb7	000000	b1deb7
4126	sr:competitor:36360	goalkeeper	73e0f0	100c09	3fe0e9
4138	sr:competitor:2538	away	ffffff	cd0e15	c71116
4140	sr:competitor:2547	away	f7222c	ffffff	ffffff
4150	sr:competitor:2673	goalkeeper	ddddd3	1a1919	fd7729
4159	sr:competitor:2556	goalkeeper	21d2ec	0c0202	ffffff
4166	sr:competitor:2524	third	e2e2e2	000000	000000
4176	sr:competitor:2569	away	efeef4	162c66	efeef4
4187	sr:competitor:2542	away	9bb7ea	2d3051	ffffff
4201	sr:competitor:1641	home	ffffff	0275b9	fbf9f9
4202	sr:competitor:1641	away	004864	ffffff	3792a4
4217	sr:competitor:1682	home	d22b33	ffffff	ffffff
4219	sr:competitor:1682	goalkeeper	158d00	000000	ffff00
4234	sr:competitor:1659	goalkeeper	76bb41	ffffff	dde726
4235	sr:competitor:1659	third	25429a	65b6e3	000000
4243	sr:competitor:1647	away	1a1919	dfaf50	e3ac50
4253	sr:competitor:1684	away	ffffff	000000	ffffff
4262	sr:competitor:1642	goalkeeper	26ddd3	000000	111110
3705	sr:competitor:36	goalkeeper	f9ff05	f7f6f8	f9ff05
3699	sr:competitor:36	home	db0000	ffffff	d60000
3716	sr:competitor:58	third	20201d	cfe2d4	252926
3721	sr:competitor:46	goalkeeper	37e918	ffffff	a8a8a8
3731	sr:competitor:12	goalkeeper	9be4f6	0d0c0c	a2edee
3739	sr:competitor:71	third	fae516	050505	040404
3751	sr:competitor:96	third	ef7b2a	ffe3c8	054fa8
3757	sr:competitor:21	away	c93a3f	ffffff	c93a3f
3773	sr:competitor:1	goalkeeper	cc3041	f4e5b0	cc3041
3775	sr:competitor:11	third	ffffff	fafafa	ffffff
3786	sr:competitor:3210	home	ffffff	1b1e3f	004080
3789	sr:competitor:7629	third	00377e	ffffff	ffffff
3803	sr:competitor:3202	goalkeeper	1ccf50	000000	d4e469
3807	sr:competitor:191648	third	000000	f6f0f0	990000
3818	sr:competitor:4937	goalkeeper	f56619	ffffff	000000
3824	sr:competitor:36837	away	2c2315	ffffff	2c2315
3834	sr:competitor:3218	goalkeeper	dec746	803a28	98452f
3837	sr:competitor:3205	away	20283d	ffffff	ffffff
3849	sr:competitor:3206	goalkeeper	fafafa	0a0000	000000
3857	sr:competitor:36839	goalkeeper	2a3e8a	f2f2f2	283b83
3865	sr:competitor:3208	third	000000	ffffff	000000
3874	sr:competitor:65676	third	f0f0f0	050505	000000
3884	sr:competitor:3217	home	004080	d9e0d8	004080
3889	sr:competitor:3201	away	ffffff	004080	ffffff
3897	sr:competitor:38	goalkeeper	fa7f00	050505	cbc750
3906	sr:competitor:14	goalkeeper	e3f660	0e0b0b	181816
3914	sr:competitor:43	goalkeeper	1ed031	ffffff	d01e2a
3921	sr:competitor:40	goalkeeper	089c0d	ffffff	000000
3933	sr:competitor:50	goalkeeper	60d9ff	ffffff	60d9ff
3939	sr:competitor:35	third	ffffff	f30b0b	ffffff
3949	sr:competitor:48	home	0237ab	ffffff	0938a8
3962	sr:competitor:3	away	000000	ffffff	000000
3970	sr:competitor:45	third	fa59c2	fcf3f3	f0f0f0
3984	sr:competitor:2825	home	f50000	ffffff	ff0000
3988	sr:competitor:2819	goalkeeper	97447e	fbfdf8	93467e
4002	sr:competitor:2816	third	fbfbfb	f2f2f2	ffffff
4006	sr:competitor:24264	away	2a3247	e9d964	e02d2b
4014	sr:competitor:2845	third	f5f5f5	000000	000000
4019	sr:competitor:2824	away	f2d497	000000	b59555
4027	sr:competitor:2859	away	c0062b	ffffff	c0062b
4031	sr:competitor:2859	third	ffffff	0a6a3b	0a6a3b
4047	sr:competitor:2948	third	ffffff	000000	ffffff
4053	sr:competitor:2948	goalkeeper	e2dd77	0e0d0d	e2dd77
4061	sr:competitor:2959	goalkeeper	17e1ed	020202	fcfcfc
4066	sr:competitor:2950	home	d83638	ffffff	ffffff
4076	sr:competitor:2962	goalkeeper	abc9b3	000000	96eaaf
4085	sr:competitor:2979	goalkeeper	d7db24	090606	131311
4090	sr:competitor:2947	third	ff0000	ffffff	ffffff
4102	sr:competitor:2977	home	ffffff	f0eeed	ffffff
4106	sr:competitor:2977	goalkeeper	0059c1	ffffff	0059c1
4120	sr:competitor:2956	goalkeeper	1b3661	e4b117	e4b117
4123	sr:competitor:2672	third	faf8f6	000000	f9f8ec
4136	sr:competitor:2672	goalkeeper	05db0d	eee9e7	f0e9e6
4137	sr:competitor:2538	home	ff0008	ffffff	ff0000
4152	sr:competitor:2534	third	223a38	ffffff	0a6368
4154	sr:competitor:2527	away	007549	ffffff	007549
4168	sr:competitor:2524	goalkeeper	4019ce	f0f2f8	fbdf28
4170	sr:competitor:5885	goalkeeper	070702	ffffff	181816
4184	sr:competitor:2573	home	0548bd	ffffff	042970
4189	sr:competitor:2542	home	1d3059	ffffff	1d3059
4196	sr:competitor:1644	away	fcfcfc	1f317a	1f317a
4204	sr:competitor:1641	third	fe842f	f6f5f4	000000
4218	sr:competitor:1661	third	0041ff	a68b4e	0041ff
4222	sr:competitor:1648	home	ffed29	e9393c	000000
4236	sr:competitor:1659	away	ffffff	0a0a99	ffffff
4242	sr:competitor:1658	home	ff0000	ffffff	ff0000
4252	sr:competitor:1684	third	ffffff	ffffff	e8ceb7
4261	sr:competitor:1662	third	121212	fafafa	f2eded
3706	sr:competitor:46	third	ec95bc	0d38fb	0d38fb
3700	sr:competitor:34	away	2f4672	83dbcd	2f4672
3719	sr:competitor:25	away	c5c5c5	130101	c5c5c5
3726	sr:competitor:12	away	d03709	01060e	ffffff
3737	sr:competitor:263	home	ffff00	000000	ffff37
3752	sr:competitor:95	away	f0242e	000000	f0242e
3755	sr:competitor:72	away	ffffff	0a0e48	151852
3767	sr:competitor:61	goalkeeper	74db94	080707	74db94
3768	sr:competitor:27	goalkeeper	3ec253	ffffff	3ec253
3785	sr:competitor:3208	goalkeeper	ff7e47	ffffff	f27843
3792	sr:competitor:3204	away	adb4c2	040405	adb4c2
3799	sr:competitor:36833	home	ffffff	143a90	ffffff
3814	sr:competitor:3209	third	013050	fefefe	ededed
3819	sr:competitor:3205	third	043565	6be7e9	56dcf6
3831	sr:competitor:3205	home	ffffff	1b2f44	ffffff
3836	sr:competitor:3218	third	3f6ca6	f5f5f5	741616
3848	sr:competitor:3217	goalkeeper	26c5dc	ffffff	1a1818
3859	sr:competitor:65676	away	ae0000	ffffff	ae0000
3864	sr:competitor:36842	third	ff22e3	ffffff	ffffff
3876	sr:competitor:3219	goalkeeper	6a4abd	ffffff	030303
3878	sr:competitor:65668	home	ffffff	0d0d0d	ff0000
3893	sr:competitor:17	away	000000	ffffff	008dc7
3894	sr:competitor:44	goalkeeper	faec00	f3f5f0	121820
3911	sr:competitor:30	away	fabc01	1f1d28	131d3f
3912	sr:competitor:43	home	ffffff	000000	ffffff
3924	sr:competitor:40	third	07304d	ffffff	022136
3929	sr:competitor:33	third	345c62	e6e6e6	e0b95a
3938	sr:competitor:37	home	74112e	ffffff	bbd6e9
3945	sr:competitor:37	third	ffffff	000000	702022
3954	sr:competitor:32	away	490d25	f0d560	000000
3958	sr:competitor:7	goalkeeper	31e631	ffffff	008000
3967	sr:competitor:45	goalkeeper	3cabb0	ffffff	3cabb0
3975	sr:competitor:2829	third	7f747a	e3e3e3	3b4247
3982	sr:competitor:2819	home	ffff00	1f4e7a	ffff00
3986	sr:competitor:2825	away	053b8b	fafafa	053b8b
3999	sr:competitor:2821	home	9ed9f5	535e88	9ed9f5
4007	sr:competitor:24264	goalkeeper	8cd1ff	ffffff	0c0d0d
4015	sr:competitor:2833	third	000000	ffffff	0c0c0d
4023	sr:competitor:2885	home	046ac0	fffafa	046ac0
4033	sr:competitor:2831	home	96549b	ffffff	ffffff
4036	sr:competitor:2831	away	eceade	000000	2895b2
4046	sr:competitor:2948	home	ffffff	000000	fefbfb
4051	sr:competitor:2885	away	cbc8c3	023f7e	063877
4065	sr:competitor:2955	goalkeeper	feac4d	ffffff	feac4d
4068	sr:competitor:2955	away	cee3de	050505	e80604
4077	sr:competitor:2961	third	00040a	fdfdfd	00040a
4089	sr:competitor:2947	home	f7e135	000000	000000
4093	sr:competitor:2964	away	22283e	f6eeee	ffffff
4098	sr:competitor:2964	goalkeeper	e5f353	000000	daf103
4110	sr:competitor:2960	away	063455	a09166	b4a373
4116	sr:competitor:2977	away	2e2b32	ffffff	00abe0
4124	sr:competitor:2674	home	ffffff	282222	cd142b
4129	sr:competitor:2674	goalkeeper	a3e0ef	000000	ade4f2
4142	sr:competitor:2538	third	161817	ffffff	161817
4146	sr:competitor:2673	away	000000	ffff00	000000
4158	sr:competitor:2534	home	048d79	fbfefd	113f30
4162	sr:competitor:2677	home	ffffff	0b0a0a	ffffff
4174	sr:competitor:5885	home	ff0000	ffffff	ff0000
4180	sr:competitor:2573	away	ffffff	0e77bf	ffffff
4186	sr:competitor:2573	goalkeeper	f5f100	0d0d0d	f5f100
4194	sr:competitor:1644	home	000066	ffffff	000066
4203	sr:competitor:1641	goalkeeper	e5322f	ffffff	da2f2d
4210	sr:competitor:1661	goalkeeper	ffcc00	000000	ffd500
4220	sr:competitor:1682	third	fdfcfc	eec17a	000000
4225	sr:competitor:1646	goalkeeper	0c38d6	0e0d0d	0b5dec
4245	sr:competitor:1658	goalkeeper	0e141d	ffffff	eff1f6
4249	sr:competitor:1647	home	e8cd34	14783a	e3ce40
4264	sr:competitor:1642	home	203049	ffffff	ec5c1e
3707	sr:competitor:25	third	ffffff	384b91	384b91
3697	sr:competitor:6	goalkeeper	1e3288	ffffff	1f307f
3720	sr:competitor:74	away	000000	483f3a	483f3a
3729	sr:competitor:24	goalkeeper	00da00	000000	55b599
3734	sr:competitor:29	third	f39ad4	000000	e7cb5c
3743	sr:competitor:96	goalkeeper	2797d3	ffffff	ee76c2
3750	sr:competitor:21	home	ffffff	00004d	000847
3762	sr:competitor:21	goalkeeper	e2dd8c	009bdd	e2dd8c
3764	sr:competitor:61	home	0246b5	ffffff	0246b5
3779	sr:competitor:7629	home	ffffff	ff3c3c	ffffff
3780	sr:competitor:7629	away	ff0000	ffffff	ff0000
3795	sr:competitor:3210	third	1726a9	ecedf3	262d44
3800	sr:competitor:191648	goalkeeper	fbe709	0a0000	eedb09
3810	sr:competitor:3202	home	325492	ffffff	002f91
3822	sr:competitor:3203	home	a0b6e3	000000	a0b6e3
3828	sr:competitor:3201	goalkeeper	000000	ffffff	090909
3841	sr:competitor:7628	away	ffffff	0d0d0d	ffffff
3845	sr:competitor:3206	away	bdb9c1	ff1a1a	bbb8bf
3853	sr:competitor:65676	home	000000	fbf3f3	ffffff
3866	sr:competitor:3219	third	dd6800	ffffff	ffffff
3873	sr:competitor:3212	home	fd0808	ededed	0e0101
3883	sr:competitor:65668	third	cf0a09	e9c01c	ffffff
3892	sr:competitor:44	third	ffffff	000000	de020e
3901	sr:competitor:42	home	e10000	ffffff	ffffff
3909	sr:competitor:30	home	ffffff	0935e1	0047a3
3922	sr:competitor:39	goalkeeper	4ed4e8	000000	4ed4e8
3928	sr:competitor:50	home	ff0000	000000	ff0000
3942	sr:competitor:35	away	26504f	ffffff	26504f
3952	sr:competitor:48	third	ccb498	291b21	281a20
3955	sr:competitor:7	away	fede4b	0454bb	005abc
3969	sr:competitor:2817	home	7d1537	efc006	0d0d0d
3972	sr:competitor:2817	third	13f18c	4848f0	3557f1
3983	sr:competitor:2820	third	000000	ffffff	000000
3989	sr:competitor:2825	third	ddc8df	1f1f1f	888fb3
3997	sr:competitor:24264	third	ebd5dd	795384	e9d0d6
4005	sr:competitor:2821	third	380692	ffffff	f1f1f1
4012	sr:competitor:2818	goalkeeper	f1ff00	000000	8eee68
4018	sr:competitor:2824	third	ffffff	2a2943	2f2e4b
4026	sr:competitor:2817	goalkeeper	eff206	faf9f9	15aa85
4037	sr:competitor:2831	third	aa1b46	ffffff	f5c427
4043	sr:competitor:2818	third	f9f9fa	1d0202	000000
4055	sr:competitor:2948	away	232325	ca423b	131b26
4060	sr:competitor:2959	home	f4f4f6	000000	ff0000
4075	sr:competitor:2962	home	dd2b29	ffffff	008a65
4088	sr:competitor:2962	third	e4e2e3	7f3e41	7f3e41
4096	sr:competitor:2951	away	3e4349	c4d7c9	dcf1e2
4099	sr:competitor:2951	goalkeeper	f73a80	1e2328	c40e59
4112	sr:competitor:2960	third	40c0e4	fcfdf8	29b1d4
4118	sr:competitor:2956	away	ffffff	1a1a1a	010101
4128	sr:competitor:2674	away	000000	ffffff	fcfcfc
4133	sr:competitor:36360	away	762837	ffffff	fd6661
4143	sr:competitor:2547	home	ffffff	f71d28	ffffff
4147	sr:competitor:2527	home	ffffff	050505	ffffff
4153	sr:competitor:2677	away	cb0529	ffffff	cb0529
4164	sr:competitor:2524	away	3b4145	95f049	3b4145
4172	sr:competitor:2600	goalkeeper	3ba3ca	f1f0f0	080808
4178	sr:competitor:2526	home	523514	ffffff	ffffff
4191	sr:competitor:2542	third	e9071e	ffffff	273d5d
4198	sr:competitor:1644	goalkeeper	40a344	ffffff	a5e2d5
4209	sr:competitor:1643	away	ffffff	1c2863	ffffff
4215	sr:competitor:1649	away	000000	f0f0ef	000000
4227	sr:competitor:1646	away	000000	ffffff	ffffff
4233	sr:competitor:1681	third	ffffff	3d3052	ffffff
4247	sr:competitor:1684	goalkeeper	550257	000000	020202
4251	sr:competitor:1684	home	1a2124	ffffff	ffffff
4260	sr:competitor:1642	away	fdfcfc	f4591d	ffffff
3708	sr:competitor:36	third	2c5283	ffffff	080808
3701	sr:competitor:8	goalkeeper	e1fc54	0d0c0c	ecfc54
3717	sr:competitor:46	away	000000	ffffff	000000
3732	sr:competitor:74	goalkeeper	b0d079	244a07	b0d079
3733	sr:competitor:71	home	095b3c	f2f2f2	f0f0f0
3747	sr:competitor:263	away	0f6935	ffd822	8f7c00
3748	sr:competitor:96	away	fd8623	000000	fd8623
3765	sr:competitor:2	home	082892	ffffff	082892
3769	sr:competitor:2	away	ffffff	000000	ffffff
3781	sr:competitor:3215	home	ffffff	19181a	ffffff
3790	sr:competitor:3210	away	222140	ffffff	4583e8
3796	sr:competitor:3211	third	f6f4f4	f60b0b	f6f5f5
3809	sr:competitor:3209	home	ff0000	ffffff	ff0000
3812	sr:competitor:191648	away	ffffff	050000	ffffff
3825	sr:competitor:4937	third	798792	f9f8f8	73808b
3827	sr:competitor:6074	away	ffffff	1642d0	1642d0
3842	sr:competitor:7628	goalkeeper	d60e00	ffffff	b80037
3843	sr:competitor:6074	goalkeeper	2911e3	ffffff	ffffff
3854	sr:competitor:3216	goalkeeper	799318	ffffff	ffffff
3863	sr:competitor:3216	third	545167	fff0a2	fff1a7
3871	sr:competitor:42338	home	007002	ffffff	ffffff
3877	sr:competitor:3212	away	ffffff	000000	ffffff
3890	sr:competitor:44	away	000000	ffffff	4fb5c1
3896	sr:competitor:17	third	5e232b	c3c1ae	5d222a
3905	sr:competitor:14	away	1f2f60	ffffff	243464
3913	sr:competitor:30	third	ffffff	000000	fdfdfd
3919	sr:competitor:39	third	ffffff	49b69c	49b69c
3930	sr:competitor:50	away	f8cbd8	602b63	602b63
3937	sr:competitor:35	goalkeeper	000000	ffffff	00aff0
3947	sr:competitor:31	away	000000	ffffff	000000
3961	sr:competitor:7	third	000000	ffffff	020000
3963	sr:competitor:3	goalkeeper	fe2e8c	ffffff	fe2e8c
3976	sr:competitor:2820	home	ff001e	ffffff	2a2637
3978	sr:competitor:2836	goalkeeper	3cda42	ffffff	303030
3993	sr:competitor:2826	away	e9f763	000000	555353
3996	sr:competitor:2816	away	ccee37	000000	01130a
4017	sr:competitor:6577	third	ff32d6	162352	172447
4020	sr:competitor:2845	goalkeeper	f6ba17	000000	000000
4032	sr:competitor:2814	third	404b50	ffffff	172325
4038	sr:competitor:2831	goalkeeper	39f654	000000	181815
4049	sr:competitor:2952	away	000000	ffffff	90ccc5
4052	sr:competitor:2885	goalkeeper	ff4f40	000000	ff4f40
4069	sr:competitor:2953	third	ffffff	973b3b	ffffff
4071	sr:competitor:2957	away	ffffff	0b4849	0b4849
4080	sr:competitor:2961	away	c1d3e1	2e394e	2f3845
4081	sr:competitor:2979	home	f7edae	0d0e0a	d20e20
4095	sr:competitor:2979	third	eaeaea	71356b	c9954c
4100	sr:competitor:2971	away	090e11	ffffff	000000
4108	sr:competitor:2977	third	eeedf3	433e67	86bc51
4119	sr:competitor:2990	goalkeeper	ccc334	1c1a17	080700
4125	sr:competitor:36360	third	1b4d69	ffffff	54b1c0
4134	sr:competitor:2681	away	fdffff	141615	000000
4144	sr:competitor:2547	third	ffffff	ef0034	ff0000
4157	sr:competitor:2527	third	030303	ffffff	0f0f0f
4161	sr:competitor:2524	home	88e863	245d3e	88e863
4173	sr:competitor:2569	home	005296	ffffff	005296
4177	sr:competitor:5885	third	e6e5e3	008dd7	e6e5e3
4190	sr:competitor:2573	third	fb0909	ffffff	fcf7f7
4195	sr:competitor:1653	home	f9f9f9	d63838	ce413d
4207	sr:competitor:1643	home	df0000	ffffff	df0000
4214	sr:competitor:1661	away	f6f3f0	c18c46	c7964c
4223	sr:competitor:1648	away	014747	f7f8f7	0d0d0d
4230	sr:competitor:1681	away	e9d110	38315e	e9d110
4239	sr:competitor:1658	third	000000	ffffff	4f4f4f
4240	sr:competitor:1715	goalkeeper	f1ff00	000000	f1ff00
4255	sr:competitor:1678	goalkeeper	f7f8f1	ffffff	e8eee9
4257	sr:competitor:1678	third	d6b671	000000	212226
3709	sr:competitor:58	goalkeeper	802ca6	ffffff	802ca6
3703	sr:competitor:25	goalkeeper	6ad2f5	ffffff	6ad2f5
3730	sr:competitor:29	goalkeeper	fdf236	ffffff	dfc513
3745	sr:competitor:27	home	ffffff	000000	ffffff
3749	sr:competitor:21	third	6eb6e2	f2f2f3	293050
3760	sr:competitor:61	away	892036	ffffff	8f233a
3771	sr:competitor:2	goalkeeper	eec006	000000	eec006
3778	sr:competitor:3208	home	ffffff	003366	ffffff
3788	sr:competitor:3211	away	0d0d0d	ffffff	f50505
3797	sr:competitor:3211	goalkeeper	8bb4d0	ffffff	000000
3805	sr:competitor:191648	home	28272c	ffffff	26252a
3813	sr:competitor:3209	goalkeeper	000000	ffffff	000000
3821	sr:competitor:3203	goalkeeper	b7f170	4e4949	2fdb1a
3830	sr:competitor:3201	third	343031	ffffff	e1a756
3838	sr:competitor:4937	home	ff0000	ffffff	ff0000
3847	sr:competitor:3216	home	dd2d2f	ffffff	693b45
3858	sr:competitor:36842	away	ffffff	0e0101	14163f
3860	sr:competitor:3211	home	ffffff	000000	ffffff
3870	sr:competitor:36842	home	14163f	ffffff	243b89
3879	sr:competitor:3212	goalkeeper	8f957c	ffffff	888e76
3888	sr:competitor:3201	home	22314e	ffffff	22314e
3895	sr:competitor:38	away	f1e3d6	033481	095bc8
3902	sr:competitor:42	goalkeeper	b9dd27	030303	c1d632
3910	sr:competitor:30	goalkeeper	0edbdf	ffffff	000000
3920	sr:competitor:40	home	88002d	ffffff	93c9ff
3925	sr:competitor:33	away	7c9bd0	e5f6ee	ecd469
3936	sr:competitor:60	third	03879f	f2deda	f0dbd6
3944	sr:competitor:37	goalkeeper	d400ff	ffffff	d400ff
3957	sr:competitor:32	goalkeeper	0f0f0e	000000	13110f
3959	sr:competitor:7	home	1017da	ffffff	1017da
3974	sr:competitor:2836	home	f00000	ffffff	f00000
3979	sr:competitor:2836	away	bccacb	ffffff	ff0000
3991	sr:competitor:2816	home	ffffff	176421	ffffff
3995	sr:competitor:2826	goalkeeper	022fb6	ffffff	022fb6
4009	sr:competitor:2818	home	ffffff	000000	ffffff
4013	sr:competitor:2845	home	ffffff	004099	ffffff
4030	sr:competitor:2814	home	0158ab	ffffff	0560c7
4034	sr:competitor:2814	goalkeeper	da3e9e	ffffff	303030
4044	sr:competitor:2833	goalkeeper	e8ff01	0d0d0d	000e57
4045	sr:competitor:2833	away	c40000	ffffff	c40000
4062	sr:competitor:2959	third	ffffff	ffffff	1a2124
4064	sr:competitor:2952	goalkeeper	fd7a62	000000	fd7a62
4082	sr:competitor:2962	away	69ace3	fafafa	000000
4083	sr:competitor:2961	goalkeeper	ff7990	000000	ea0369
4101	sr:competitor:2971	third	ffffff	0e0d0d	1c95bb
4104	sr:competitor:2971	home	ffffff	000000	ffffff
4114	sr:competitor:2990	third	1b5514	ffffff	000000
4121	sr:competitor:2672	away	4b5467	c87f76	4b5467
4135	sr:competitor:2681	third	24282b	14a2c6	000000
4141	sr:competitor:2547	goalkeeper	dce452	121111	b5e905
4155	sr:competitor:2534	goalkeeper	f3e04f	10110e	f3e04f
4160	sr:competitor:2556	home	ff0000	ffffff	ff0000
4165	sr:competitor:2556	third	ffffff	ecc289	f6f4f4
4179	sr:competitor:2600	third	6c1945	f7f7f7	722a2a
4181	sr:competitor:2526	away	ffffff	493628	ffffff
4197	sr:competitor:1653	away	254c58	ffffff	131e1c
4208	sr:competitor:1649	home	ffffff	466db6	ffffff
4212	sr:competitor:1649	third	ae9d99	803040	9e5a5f
4221	sr:competitor:1648	goalkeeper	0b8ddd	ffffff	ffffff
4232	sr:competitor:1659	home	0034a5	ffffff	0034a5
4241	sr:competitor:1715	home	cd1535	ffffff	cd1535
4250	sr:competitor:1678	home	019a5d	ffffff	ffffff
3711	sr:competitor:58	away	9222a8	0cf91b	08f419
3723	sr:competitor:27	third	e6c800	ffffff	ffffff
3738	sr:competitor:71	goalkeeper	2f0f58	ffffff	ec2d65
3754	sr:competitor:72	home	e0281c	ffffff	df2719
3766	sr:competitor:1	away	1e1e1e	ca9e64	ca9e64
3784	sr:competitor:3215	goalkeeper	17bd78	f5f5f5	06fee1
3802	sr:competitor:3202	away	ecd900	004080	ecd900
3816	sr:competitor:3206	third	070707	ffffff	020000
3835	sr:competitor:36837	third	ac1b1b	000000	000000
3852	sr:competitor:3216	away	f8f4f4	bd051a	f8f4f4
3867	sr:competitor:3219	home	007c59	0a0a0a	417a59
3882	sr:competitor:65668	goalkeeper	fc3564	000000	000000
3903	sr:competitor:42	away	000000	ffffff	000000
3918	sr:competitor:39	home	ffffff	e32d2b	000000
3941	sr:competitor:60	goalkeeper	3fcdf1	020300	020300
3956	sr:competitor:32	third	ed2b67	fcfcfc	ed2b67
3973	sr:competitor:2829	goalkeeper	43c1c4	ffffff	49dd54
3992	sr:competitor:2829	away	ed5b08	0f0f0f	ed5b08
4010	sr:competitor:2845	away	02a74a	ffffff	1d714a
4025	sr:competitor:6577	goalkeeper	00c746	ffffff	00c746
4042	sr:competitor:2828	third	fd803e	ffffff	fd803e
4059	sr:competitor:2959	away	000000	ffffff	15c659
4074	sr:competitor:2957	third	134081	ffffff	dd3308
4091	sr:competitor:2947	away	ffffff	050505	ffffff
4107	sr:competitor:2960	home	ffffff	000000	ff0000
4122	sr:competitor:2672	home	cb0303	151414	cb0303
4139	sr:competitor:2538	goalkeeper	e4e136	0b0909	16bed4
4156	sr:competitor:2556	away	2c3047	fa8f7d	2c3047
4175	sr:competitor:2600	home	fcfcfc	ff0000	ffffff
4193	sr:competitor:2542	goalkeeper	6cb8e2	102442	6cb8e2
4206	sr:competitor:1643	third	858489	eaed74	19191b
4224	sr:competitor:1648	third	f8f8f8	000000	fafafa
4244	sr:competitor:1647	goalkeeper	8db7cf	f0f0f4	8db7cf
4258	sr:competitor:1662	away	ffffff	294861	2b4b5f
3710	sr:competitor:58	home	cc0000	ffffff	cc0000
3718	sr:competitor:24	away	ffffff	5e1c28	ffffff
3735	sr:competitor:71	away	ffffff	243b02	ffffff
3746	sr:competitor:11	home	99ccff	ffffff	99ccff
3763	sr:competitor:61	third	a2c3e2	000000	a2c3e2
3783	sr:competitor:3215	third	7fc7f3	ffffff	7fc7f3
3798	sr:competitor:3204	third	0225f5	ffffff	002bf0
3815	sr:competitor:3203	away	e41616	ffffff	e41616
3833	sr:competitor:3218	away	ffffff	991d2d	ffffff
3851	sr:competitor:3217	third	0e16f3	ffffff	ffffff
3869	sr:competitor:3219	away	522a8f	ffffff	1c202c
3885	sr:competitor:65668	away	050505	f2f2f2	f50a0a
3899	sr:competitor:38	third	000000	ffffff	cd015e
3916	sr:competitor:39	away	842633	ffffff	313c80
3932	sr:competitor:60	home	ff0000	dbb85e	ff0000
3946	sr:competitor:31	goalkeeper	5ee937	ffffff	3d3d3d
3965	sr:competitor:45	home	ff0000	000000	ffffff
3980	sr:competitor:2820	goalkeeper	ffea20	000000	ffea20
3998	sr:competitor:2816	goalkeeper	60d9ff	f5f5f5	60d9ff
4021	sr:competitor:2885	third	000052	f4d58e	000052
4039	sr:competitor:2828	away	000000	c4a263	c0a366
4056	sr:competitor:2953	home	eb2b3b	ffffff	ffffff
4072	sr:competitor:2950	third	fafafa	070000	050000
4087	sr:competitor:2950	goalkeeper	ffc300	ffffff	000000
4103	sr:competitor:2971	goalkeeper	f18c23	ffffff	f18c23
4117	sr:competitor:2956	third	fafafa	101111	c6fff8
4130	sr:competitor:2674	third	ffffff	0d0d0d	050505
4148	sr:competitor:2673	third	fcfbf9	000000	fcfbf9
4169	sr:competitor:5885	away	0a1043	ffffff	ffffff
4185	sr:competitor:2569	goalkeeper	335f1d	ffffff	517648
4199	sr:competitor:1653	third	ffffff	405c6f	39576a
4211	sr:competitor:1661	home	ff0000	b8a96c	cfbe79
4229	sr:competitor:1681	home	47137c	ffffff	47137b
4237	sr:competitor:1715	third	201f40	ffffff	201f40
4254	sr:competitor:1678	away	ffffff	03884d	ffffff
3712	sr:competitor:46	home	fafafa	ff0000	f9fafb
3722	sr:competitor:29	home	ffffff	000000	ffffff
3741	sr:competitor:96	home	1d1e24	fb9f1e	101215
3756	sr:competitor:95	goalkeeper	23b88e	ffffff	23b88e
3772	sr:competitor:2	third	012a03	fafffa	6d001b
3787	sr:competitor:3215	away	050505	ffffff	487eb0
3811	sr:competitor:3209	away	ffffff	313250	ffffff
3829	sr:competitor:3218	home	4d0026	c09211	4d0026
3850	sr:competitor:3217	away	f7f7f7	193a85	004080
3868	sr:competitor:65676	goalkeeper	f9b43e	ffffff	fa7824
3886	sr:competitor:6074	third	001fd3	ffffff	ffffff
3900	sr:competitor:17	goalkeeper	30c492	f5ff3c	30c492
3915	sr:competitor:43	third	000000	ffffff	6a3692
3931	sr:competitor:50	third	183b35	cee19b	d4ff92
3948	sr:competitor:31	third	ffffff	242865	ffffff
3964	sr:competitor:3	third	94e2ea	ffffff	94e2ea
3990	sr:competitor:2819	third	000000	e0d1dc	dfd1dc
4004	sr:competitor:24264	home	ea4a3e	ffffff	ffffff
4022	sr:competitor:6577	home	ffff00	0a4088	ffff00
4041	sr:competitor:2828	goalkeeper	a400b4	ffffff	006ab4
4058	sr:competitor:2953	goalkeeper	3a3a44	d8e71e	142c10
4079	sr:competitor:2957	home	edbd11	036f5c	edbd11
4092	sr:competitor:2951	home	ffffff	000000	ffffff
4109	sr:competitor:2990	home	c71815	eee8e8	c5141d
4127	sr:competitor:36360	home	ffffff	ff0000	ffffff
4145	sr:competitor:2673	home	feda01	000000	050505
4163	sr:competitor:2677	goalkeeper	9919c9	ffffff	ffffff
4183	sr:competitor:2526	goalkeeper	fe603d	ffffff	ff0000
4200	sr:competitor:1653	goalkeeper	e6f830	221e1f	ffffff
4216	sr:competitor:1682	away	1d2962	c2a152	1d2962
4228	sr:competitor:1681	goalkeeper	cd3334	ffffff	ce3334
4246	sr:competitor:1647	third	ffffff	14632f	ffffff
4259	sr:competitor:1662	goalkeeper	fffa00	ffffff	fcfbf7
3713	sr:competitor:24	home	ffff00	242321	ffff00
3725	sr:competitor:263	goalkeeper	e62569	f7f7f7	e62569
3736	sr:competitor:12	third	190909	f8eeee	ffffff
3753	sr:competitor:11	away	d8d1cb	030303	d8d1cb
3770	sr:competitor:1	home	ffffff	f50505	ffffff
3782	sr:competitor:7629	goalkeeper	9ce2ca	ffffff	ffffff
3801	sr:competitor:36833	away	6b6a6e	ffffff	353537
3820	sr:competitor:4937	away	000000	f00000	ffffff
3840	sr:competitor:3206	home	ee1725	ffffff	ee1725
3861	sr:competitor:36839	third	ffffff	292222	f0e800
3881	sr:competitor:42338	third	fafafa	1dfc37	1cef34
3904	sr:competitor:14	home	ff0000	ffffff	ff0000
3923	sr:competitor:40	away	ffffff	890b0b	ffffff
3935	sr:competitor:35	home	ea0000	ffffff	ea0000
3951	sr:competitor:48	goalkeeper	32e953	ffffff	080808
3968	sr:competitor:2817	away	0d0d0d	ffffff	000000
3987	sr:competitor:2825	goalkeeper	000000	ffffff	fffeff
4003	sr:competitor:2826	third	6d030e	ffffff	050000
4016	sr:competitor:2818	away	ea413e	2b2626	ffffff
4029	sr:competitor:2859	goalkeeper	e8ff43	000000	aef12d
4048	sr:competitor:2833	home	ffffff	ce0000	ffffff
4063	sr:competitor:2955	home	d10000	ffffff	d10000
4078	sr:competitor:2961	home	ffffff	696b75	ffffff
4097	sr:competitor:2964	home	ffffff	dd0000	1b42d0
4113	sr:competitor:2990	away	73d5ca	201e1e	76d5ca
4132	sr:competitor:2681	goalkeeper	080808	00f1ff	000000
4151	sr:competitor:2527	goalkeeper	dddd0e	0d0d0d	c6e208
4171	sr:competitor:2600	away	116b80	ffffff	e00626
4188	sr:competitor:2569	third	d3ed07	ffffff	d3ed07
4205	sr:competitor:1643	goalkeeper	9333ff	ffffff	050505
4226	sr:competitor:1646	home	ffffff	2654d7	ffffff
4248	sr:competitor:1658	away	fafafa	000000	fcfcfc
4263	sr:competitor:1642	third	ff0002	ffffff	f1eeee
3702	sr:competitor:36	away	ffffff	1b252e	ffffff
3724	sr:competitor:12	home	ffffff	051da6	ffffff
3742	sr:competitor:95	third	e7e4e9	221818	2d3f55
3761	sr:competitor:72	goalkeeper	97d9a9	ffffff	3da980
3777	sr:competitor:3208	away	031843	ffffff	547fba
3794	sr:competitor:3204	goalkeeper	43b6fe	ffffff	998f8f
3804	sr:competitor:36833	goalkeeper	d6efb7	0f0f0f	d4edb4
3817	sr:competitor:36837	home	ffffff	57413d	ffffff
3832	sr:competitor:3203	third	000000	96d0e2	a8d5e0
3846	sr:competitor:3205	goalkeeper	f028a7	ffffff	0a0000
3862	sr:competitor:36842	goalkeeper	b0e80d	0a0000	a7dc0c
3880	sr:competitor:3212	third	1a1717	fef4f4	050505
3898	sr:competitor:38	home	1532c1	ffffff	1532c1
3917	sr:competitor:43	away	000000	ffffff	000000
3934	sr:competitor:60	away	ffffff	cfb68d	2b1d45
3950	sr:competitor:48	away	262626	e8d100	262626
3966	sr:competitor:45	away	c4ea87	000000	eaf759
3981	sr:competitor:2836	third	abe7e0	ffffff	143fca
4001	sr:competitor:2821	away	202d4b	f3755a	202d4b
4011	sr:competitor:2824	home	ffffff	000000	ffffff
4035	sr:competitor:2814	away	2c2545	e54496	4b5056
4050	sr:competitor:2952	third	edecea	0057a2	00458c
4067	sr:competitor:2955	third	616067	ffffff	616067
4084	sr:competitor:2947	goalkeeper	26a4bb	000000	aee1ea
4105	sr:competitor:2951	third	ffffff	2a3535	024503
4115	sr:competitor:2956	home	eeff00	0062ff	eeff00
4131	sr:competitor:2681	home	f31212	ffffff	0f0b0b
4149	sr:competitor:2534	away	ffffff	72c6ba	6dc0b9
4167	sr:competitor:2677	third	0f2525	ffffff	000000
4182	sr:competitor:2526	third	151316	ffffff	ffffff
4192	sr:competitor:1644	third	e1b5b9	000000	ddb6b9
4213	sr:competitor:1649	goalkeeper	ffbf00	080808	d39e00
4231	sr:competitor:1646	third	242cff	ffffff	0009ff
4238	sr:competitor:1715	away	ffffff	a1122a	ffffff
4256	sr:competitor:1662	home	85ceef	ffffff	ffffff
\.


--
-- Data for Name: Match; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Match" (id, "competitionId", "homeTeamId", "awayTeamId", "scoreHome", "scoreAway", status, round, "stadiumId", start_time) FROM stdin;
sr:sport_event:51388983	sr:season:119847	sr:competitor:1031053	sr:competitor:744135	\N	\N	not_started	16	sr:venue:8249	2024-12-28 15:30:00
sr:sport_event:51388775	sr:season:119847	sr:competitor:3009	sr:competitor:49531	2	1	closed	4	sr:venue:1137	2024-09-01 19:30:00
sr:sport_event:51389033	sr:season:119847	sr:competitor:49531	sr:competitor:744135	\N	\N	not_started	19	sr:venue:16520	2025-01-26 18:00:00
sr:sport_event:51388803	sr:season:119847	sr:competitor:2998	sr:competitor:25777	0	1	closed	6	sr:venue:12069	2024-09-22 17:00:00
sr:sport_event:51388981	sr:season:119847	sr:competitor:2998	sr:competitor:3009	\N	\N	not_started	16	sr:venue:12069	2024-12-29 15:30:00
sr:sport_event:51388823	sr:season:119847	sr:competitor:744135	sr:competitor:3014	2	1	closed	7	sr:venue:53523	2024-09-28 14:30:00
sr:sport_event:51388819	sr:season:119847	sr:competitor:36365	sr:competitor:3009	1	1	closed	7	sr:venue:43626	2024-09-28 17:00:00
sr:sport_event:51388815	sr:season:119847	sr:competitor:3006	sr:competitor:3010	5	1	closed	7	sr:venue:902	2024-09-28 19:30:00
sr:sport_event:51388963	sr:season:119847	sr:competitor:3010	sr:competitor:3001	\N	\N	not_started	15	sr:venue:2539	2024-12-22 20:30:00
sr:sport_event:51388777	sr:season:119847	sr:competitor:3006	sr:competitor:3011	4	1	closed	5	sr:venue:902	2024-09-14 19:30:00
sr:sport_event:51095013	sr:season:118699	sr:competitor:6	sr:competitor:2	2	1	closed	6	sr:venue:806	2024-09-21 14:00:00
sr:sport_event:51388993	sr:season:119847	sr:competitor:3011	sr:competitor:2998	\N	\N	not_started	17	sr:venue:5318	2025-01-05 18:00:00
sr:sport_event:51388783	sr:season:119847	sr:competitor:36365	sr:competitor:3014	3	1	closed	5	sr:venue:43626	2024-09-14 14:30:00
sr:sport_event:51388829	sr:season:119847	sr:competitor:3002	sr:competitor:25777	4	0	closed	7	sr:venue:907	2024-09-29 17:00:00
sr:sport_event:51388879	sr:season:119847	sr:competitor:3002	sr:competitor:4500	4	0	closed	10	sr:venue:907	2024-11-03 20:30:00
sr:sport_event:51388813	sr:season:119847	sr:competitor:3011	sr:competitor:2995	1	0	closed	7	sr:venue:5318	2024-09-29 19:30:00
sr:sport_event:51388987	sr:season:119847	sr:competitor:3002	sr:competitor:2995	\N	\N	not_started	16	sr:venue:907	2024-12-28 20:30:00
sr:sport_event:51388743	sr:season:119847	sr:competitor:3002	sr:competitor:3036	2	0	closed	3	sr:venue:907	2024-08-24 17:00:00
sr:sport_event:51388811	sr:season:119847	sr:competitor:3001	sr:competitor:1031053	3	0	closed	6	sr:venue:910	2024-09-22 19:30:00
sr:sport_event:51388781	sr:season:119847	sr:competitor:25777	sr:competitor:3001	0	3	closed	5	sr:venue:8289	2024-09-13 19:15:00
sr:sport_event:51388927	sr:season:119847	sr:competitor:2995	sr:competitor:2998	\N	\N	not_started	13	sr:venue:14556	2024-12-08 15:30:00
sr:sport_event:51383353	sr:season:119847	sr:competitor:2998	sr:competitor:3014	1	2	closed	1	sr:venue:12069	2024-08-11 17:00:00
sr:sport_event:51388817	sr:season:119847	sr:competitor:2999	sr:competitor:3036	4	0	closed	7	sr:venue:951	2024-09-29 19:30:00
sr:sport_event:51383351	sr:season:119847	sr:competitor:25777	sr:competitor:3009	0	1	closed	1	sr:venue:8289	2024-08-12 19:15:00
sr:sport_event:51388977	sr:season:119847	sr:competitor:25777	sr:competitor:3010	\N	\N	not_started	16	sr:venue:8289	2024-12-27 20:15:00
sr:sport_event:51388787	sr:season:119847	sr:competitor:49531	sr:competitor:3010	1	1	closed	5	sr:venue:16520	2024-09-14 19:30:00
sr:sport_event:51388821	sr:season:119847	sr:competitor:4500	sr:competitor:3001	0	3	closed	7	sr:venue:5326	2024-09-27 19:15:00
sr:sport_event:51388869	sr:season:119847	sr:competitor:3009	sr:competitor:3014	1	0	closed	10	sr:venue:1137	2024-11-03 18:00:00
sr:sport_event:51388767	sr:season:119847	sr:competitor:3010	sr:competitor:2999	0	0	closed	4	sr:venue:2539	2024-09-01 19:30:00
sr:sport_event:51388789	sr:season:119847	sr:competitor:1031053	sr:competitor:3036	1	0	closed	5	sr:venue:8249	2024-09-14 17:00:00
sr:sport_event:51388883	sr:season:119847	sr:competitor:3013	sr:competitor:3011	2	0	closed	10	sr:venue:1335	2024-11-04 20:15:00
sr:sport_event:51388875	sr:season:119847	sr:competitor:3010	sr:competitor:2995	1	2	closed	10	sr:venue:2539	2024-11-02 20:30:00
sr:sport_event:51388867	sr:season:119847	sr:competitor:25777	sr:competitor:2999	1	2	closed	10	sr:venue:8289	2024-11-03 18:00:00
sr:sport_event:51389035	sr:season:119847	sr:competitor:3001	sr:competitor:3013	\N	\N	not_started	19	sr:venue:910	2025-01-26 18:00:00
sr:sport_event:51388975	sr:season:119847	sr:competitor:2999	sr:competitor:36365	\N	\N	not_started	16	sr:venue:951	2024-12-29 18:00:00
sr:sport_event:51388793	sr:season:119847	sr:competitor:3002	sr:competitor:2998	2	1	closed	5	sr:venue:907	2024-09-15 14:30:00
sr:sport_event:51388805	sr:season:119847	sr:competitor:3010	sr:competitor:36365	1	1	closed	6	sr:venue:2539	2024-09-22 14:30:00
sr:sport_event:51388873	sr:season:119847	sr:competitor:2998	sr:competitor:3006	1	2	closed	10	sr:venue:1199	2024-11-02 18:00:00
sr:sport_event:51388909	sr:season:119847	sr:competitor:1031053	sr:competitor:2999	\N	\N	not_started	12	sr:venue:8249	2024-12-01 20:30:00
sr:sport_event:51388969	sr:season:119847	sr:competitor:49531	sr:competitor:2998	\N	\N	not_started	15	sr:venue:16520	2024-12-21 15:30:00
sr:sport_event:51388727	sr:season:119847	sr:competitor:2995	sr:competitor:2999	0	1	closed	2	sr:venue:14556	2024-08-18 19:30:00
sr:sport_event:51388949	sr:season:119847	sr:competitor:3001	sr:competitor:2995	\N	\N	not_started	14	sr:venue:910	2024-12-14 20:30:00
sr:sport_event:51389261	sr:season:119847	sr:competitor:25777	sr:competitor:49531	\N	\N	not_started	28	sr:venue:8289	2025-04-06 17:00:00
sr:sport_event:51389075	sr:season:119847	sr:competitor:36365	sr:competitor:744135	\N	\N	not_started	21	sr:venue:43626	2025-02-09 18:00:00
sr:sport_event:51388881	sr:season:119847	sr:competitor:3001	sr:competitor:744135	5	1	closed	10	sr:venue:910	2024-11-01 20:15:00
sr:sport_event:51389329	sr:season:119847	sr:competitor:3002	sr:competitor:3014	\N	\N	not_started	32	sr:venue:907	2025-05-04 17:00:00
sr:sport_event:51094999	sr:season:118699	sr:competitor:95	sr:competitor:29	1	0	closed	5	sr:venue:2366	2024-09-14 11:30:00
sr:sport_event:51095223	sr:season:118699	sr:competitor:21	sr:competitor:263	2	2	closed	11	sr:venue:3002	2024-10-22 18:45:00
sr:sport_event:51389179	sr:season:119847	sr:competitor:3036	sr:competitor:2999	\N	\N	not_started	24	sr:venue:2013	2025-03-02 18:00:00
sr:sport_event:51388979	sr:season:119847	sr:competitor:4500	sr:competitor:3014	\N	\N	not_started	16	sr:venue:5326	2024-12-28 18:00:00
sr:sport_event:51389029	sr:season:119847	sr:competitor:36365	sr:competitor:3006	\N	\N	not_started	19	sr:venue:43626	2025-01-26 18:00:00
sr:sport_event:51388999	sr:season:119847	sr:competitor:36365	sr:competitor:49531	\N	\N	not_started	17	sr:venue:43626	2025-01-05 18:00:00
sr:sport_event:51092187	sr:season:118699	sr:competitor:72	sr:competitor:6	1	4	closed	1	sr:venue:2178	2024-08-12 19:00:00
sr:sport_event:51388989	sr:season:119847	sr:competitor:3036	sr:competitor:3013	\N	\N	not_started	16	sr:venue:2013	2024-12-29 15:30:00
sr:sport_event:51388847	sr:season:119847	sr:competitor:3014	sr:competitor:3011	1	0	closed	8	sr:venue:5312	2024-10-05 14:30:00
sr:sport_event:51388885	sr:season:119847	sr:competitor:3011	sr:competitor:3009	1	0	closed	11	sr:venue:5318	2024-11-10 16:30:00
sr:sport_event:51094971	sr:season:118699	sr:competitor:34	sr:competitor:96	2	0	closed	4	sr:venue:2223	2024-08-31 14:00:00
sr:sport_event:51389321	sr:season:119847	sr:competitor:4500	sr:competitor:3006	\N	\N	not_started	32	sr:venue:5326	2025-05-04 17:00:00
sr:sport_event:51388955	sr:season:119847	sr:competitor:3013	sr:competitor:3014	\N	\N	not_started	14	sr:venue:1335	2024-12-14 18:00:00
sr:sport_event:51389089	sr:season:119847	sr:competitor:3014	sr:competitor:36365	\N	\N	not_started	22	sr:venue:5312	2025-02-16 18:00:00
sr:sport_event:51389011	sr:season:119847	sr:competitor:3011	sr:competitor:4500	\N	\N	not_started	18	sr:venue:5318	2025-01-19 18:00:00
sr:sport_event:51389003	sr:season:119847	sr:competitor:744135	sr:competitor:4500	\N	\N	not_started	17	sr:venue:53523	2025-01-05 18:00:00
sr:sport_event:51094941	sr:season:118699	sr:competitor:58	sr:competitor:11	1	1	closed	3	sr:venue:2505	2024-08-24 11:30:00
sr:sport_event:51389313	sr:season:119847	sr:competitor:2995	sr:competitor:3001	\N	\N	not_started	31	sr:venue:14556	2025-04-27 17:00:00
sr:sport_event:51094833	sr:season:118699	sr:competitor:58	sr:competitor:25	4	3	closed	2	sr:venue:2505	2024-08-17 14:00:00
sr:sport_event:51389289	sr:season:119847	sr:competitor:2998	sr:competitor:2995	\N	\N	not_started	30	sr:venue:12069	2025-04-19 17:00:00
sr:sport_event:51389189	sr:season:119847	sr:competitor:2998	sr:competitor:1031053	\N	\N	not_started	24	sr:venue:12069	2025-03-02 18:00:00
sr:sport_event:51095279	sr:season:118699	sr:competitor:71	sr:competitor:21	3	3	closed	12	sr:venue:660	2024-10-26 14:00:00
sr:sport_event:51095015	sr:season:118699	sr:competitor:61	sr:competitor:34	0	2	closed	6	sr:venue:1514	2024-09-21 14:00:00
sr:sport_event:51389351	sr:season:119847	sr:competitor:3006	sr:competitor:3001	\N	\N	not_started	33	sr:venue:902	2025-05-11 17:00:00
sr:sport_event:51095169	sr:season:118699	sr:competitor:96	sr:competitor:41	0	1	closed	10	sr:venue:1138	2024-10-20 14:00:00
sr:sport_event:51388895	sr:season:119847	sr:competitor:744135	sr:competitor:3013	2	0	closed	11	sr:venue:53523	2024-11-10 15:30:00
sr:sport_event:51095321	sr:season:118699	sr:competitor:34	sr:competitor:71	3	0	closed	13	sr:venue:2223	2024-11-02 15:00:00
sr:sport_event:51095219	sr:season:118699	sr:competitor:95	sr:competitor:27	1	1	closed	11	sr:venue:2366	2024-10-22 18:45:00
sr:sport_event:51096245	sr:season:118699	sr:competitor:21	sr:competitor:25	\N	\N	not_started	31	sr:venue:3002	2025-02-08 15:00:00
sr:sport_event:51095019	sr:season:118699	sr:competitor:72	sr:competitor:12	2	1	closed	6	sr:venue:2178	2024-09-21 14:00:00
sr:sport_event:51095049	sr:season:118699	sr:competitor:71	sr:competitor:72	3	1	closed	7	sr:venue:660	2024-09-27 19:00:00
sr:sport_event:51094977	sr:season:118699	sr:competitor:95	sr:competitor:21	3	1	closed	4	sr:venue:2366	2024-08-31 14:00:00
sr:sport_event:51383345	sr:season:119847	sr:competitor:2999	sr:competitor:744135	1	1	closed	1	sr:venue:951	2024-08-11 19:30:00
sr:sport_event:51388961	sr:season:119847	sr:competitor:3009	sr:competitor:3013	\N	\N	not_started	15	sr:venue:1137	2024-12-23 18:45:00
sr:sport_event:51095051	sr:season:118699	sr:competitor:2	sr:competitor:15	0	0	closed	7	sr:venue:638	2024-09-28 14:00:00
sr:sport_event:51095157	sr:season:118699	sr:competitor:41	sr:competitor:34	2	2	closed	9	sr:venue:851	2024-10-04 19:00:00
sr:sport_event:51389015	sr:season:119847	sr:competitor:3009	sr:competitor:25777	\N	\N	not_started	18	sr:venue:1137	2025-01-19 18:00:00
sr:sport_event:51389361	sr:season:119847	sr:competitor:49531	sr:competitor:36365	\N	\N	not_started	34	sr:venue:16520	2025-05-17 17:00:00
sr:sport_event:51388887	sr:season:119847	sr:competitor:3006	sr:competitor:3002	4	1	closed	11	sr:venue:902	2024-11-10 20:45:00
sr:sport_event:50955807	sr:season:119835	sr:competitor:1659	sr:competitor:1681	\N	\N	not_started	26	sr:venue:847	2025-03-16 17:00:00
sr:sport_event:51389007	sr:season:119847	sr:competitor:2995	sr:competitor:25777	\N	\N	not_started	17	sr:venue:14556	2025-01-05 18:00:00
sr:sport_event:51389161	sr:season:119847	sr:competitor:744135	sr:competitor:3011	\N	\N	not_started	23	sr:venue:53523	2025-02-23 18:00:00
sr:sport_event:51092211	sr:season:118699	sr:competitor:25	sr:competitor:24	2	3	closed	1	sr:venue:2352	2024-08-10 11:30:00
sr:sport_event:51389187	sr:season:119847	sr:competitor:3013	sr:competitor:49531	\N	\N	not_started	24	sr:venue:1335	2025-03-02 18:00:00
sr:sport_event:51389157	sr:season:119847	sr:competitor:2998	sr:competitor:3002	\N	\N	not_started	22	sr:venue:12069	2025-02-16 18:00:00
sr:sport_event:51389311	sr:season:119847	sr:competitor:3009	sr:competitor:3036	\N	\N	not_started	31	sr:venue:1137	2025-04-27 17:00:00
sr:sport_event:51389287	sr:season:119847	sr:competitor:4500	sr:competitor:2999	\N	\N	not_started	30	sr:venue:5326	2025-04-19 17:00:00
sr:sport_event:51388831	sr:season:119847	sr:competitor:25777	sr:competitor:1031053	1	1	closed	8	sr:venue:8289	2024-10-05 17:00:00
sr:sport_event:51389209	sr:season:119847	sr:competitor:744135	sr:competitor:3010	\N	\N	not_started	25	sr:venue:53523	2025-03-09 18:00:00
sr:sport_event:51389031	sr:season:119847	sr:competitor:2999	sr:competitor:2995	\N	\N	not_started	19	sr:venue:951	2025-01-26 18:00:00
sr:sport_event:51389219	sr:season:119847	sr:competitor:3013	sr:competitor:36365	\N	\N	not_started	26	sr:venue:1335	2025-03-16 18:00:00
sr:sport_event:51388991	sr:season:119847	sr:competitor:49531	sr:competitor:3011	\N	\N	not_started	16	sr:venue:16520	2024-12-30 20:15:00
sr:sport_event:51389229	sr:season:119847	sr:competitor:25777	sr:competitor:4500	\N	\N	not_started	26	sr:venue:8289	2025-03-16 18:00:00
sr:sport_event:51388951	sr:season:119847	sr:competitor:4500	sr:competitor:36365	\N	\N	not_started	14	sr:venue:5326	2024-12-15 20:30:00
sr:sport_event:51389009	sr:season:119847	sr:competitor:3014	sr:competitor:1031053	\N	\N	not_started	17	sr:venue:5312	2025-01-05 18:00:00
sr:sport_event:51092207	sr:season:118699	sr:competitor:34	sr:competitor:2	3	3	closed	1	sr:venue:2223	2024-08-10 11:30:00
sr:sport_event:51095347	sr:season:118699	sr:competitor:1	sr:competitor:41	0	0	closed	13	sr:venue:1693	2024-11-02 15:00:00
sr:sport_event:51389335	sr:season:119847	sr:competitor:25777	sr:competitor:36365	\N	\N	not_started	32	sr:venue:8289	2025-05-04 17:00:00
sr:sport_event:51389309	sr:season:119847	sr:competitor:3006	sr:competitor:1031053	\N	\N	not_started	31	sr:venue:902	2025-04-27 17:00:00
sr:sport_event:51388835	sr:season:119847	sr:competitor:3002	sr:competitor:2999	2	1	closed	8	sr:venue:907	2024-10-06 19:30:00
sr:sport_event:51092185	sr:season:118699	sr:competitor:12	sr:competitor:71	4	0	closed	1	sr:venue:2547	2024-08-11 15:00:00
sr:sport_event:51389095	sr:season:119847	sr:competitor:3036	sr:competitor:1031053	\N	\N	not_started	22	sr:venue:2013	2025-02-16 18:00:00
sr:sport_event:51094989	sr:season:118699	sr:competitor:27	sr:competitor:61	1	0	closed	5	sr:venue:852	2024-09-14 14:00:00
sr:sport_event:51094993	sr:season:118699	sr:competitor:34	sr:competitor:6	0	1	closed	5	sr:venue:2223	2024-09-14 11:30:00
sr:sport_event:51389271	sr:season:119847	sr:competitor:3010	sr:competitor:3009	\N	\N	not_started	29	sr:venue:2539	2025-04-13 17:00:00
sr:sport_event:51094995	sr:season:118699	sr:competitor:36	sr:competitor:21	1	1	closed	5	sr:venue:743	2024-09-14 14:00:00
sr:sport_event:51388845	sr:season:119847	sr:competitor:3036	sr:competitor:49531	1	1	closed	8	sr:venue:2013	2024-10-04 19:15:00
sr:sport_event:51389343	sr:season:119847	sr:competitor:3010	sr:competitor:25777	\N	\N	not_started	33	sr:venue:2539	2025-05-11 17:00:00
sr:sport_event:51095137	sr:season:118699	sr:competitor:21	sr:competitor:24	3	0	closed	8	sr:venue:3002	2024-10-02 18:45:00
sr:sport_event:51095305	sr:season:118699	sr:competitor:8	sr:competitor:61	0	0	closed	12	sr:venue:1136	2024-10-26 14:00:00
sr:sport_event:51095257	sr:season:118699	sr:competitor:58	sr:competitor:34	0	0	closed	12	sr:venue:2505	2024-10-26 11:30:00
sr:sport_event:51095029	sr:season:118699	sr:competitor:29	sr:competitor:96	1	3	closed	6	sr:venue:1135	2024-09-20 19:00:00
sr:sport_event:51095409	sr:season:118699	sr:competitor:21	sr:competitor:41	0	0	closed	14	sr:venue:3002	2024-11-06 20:00:00
sr:sport_event:51095035	sr:season:118699	sr:competitor:46	sr:competitor:1	2	0	closed	7	sr:venue:631	2024-09-28 11:30:00
sr:sport_event:51094973	sr:season:118699	sr:competitor:72	sr:competitor:1	1	2	closed	4	sr:venue:2178	2024-08-30 19:00:00
sr:sport_event:51095047	sr:season:118699	sr:competitor:95	sr:competitor:6	0	0	closed	7	sr:venue:2366	2024-09-28 14:00:00
sr:sport_event:50850667	sr:season:118689	sr:competitor:48	sr:competitor:32	\N	\N	not_started	35	sr:venue:12	2025-05-03 14:00:00
sr:sport_event:51095133	sr:season:118699	sr:competitor:58	sr:competitor:12	0	0	closed	8	sr:venue:2505	2024-10-02 19:00:00
sr:sport_event:51388903	sr:season:119847	sr:competitor:25777	sr:competitor:3006	\N	\N	not_started	12	sr:venue:8289	2024-12-01 18:00:00
sr:sport_event:51389013	sr:season:119847	sr:competitor:744135	sr:competitor:2999	\N	\N	not_started	18	sr:venue:53523	2025-01-19 18:00:00
sr:sport_event:51095171	sr:season:118699	sr:competitor:34	sr:competitor:15	2	0	closed	10	sr:venue:2223	2024-10-18 19:00:00
sr:sport_event:51388919	sr:season:119847	sr:competitor:3001	sr:competitor:3011	\N	\N	not_started	12	sr:venue:910	2024-11-30 20:30:00
sr:sport_event:46655537	sr:season:114317	sr:competitor:3203	sr:competitor:3215	4	4	closed	1	sr:venue:4750	2024-05-12 20:45:00
sr:sport_event:51389325	sr:season:119847	sr:competitor:3001	sr:competitor:3010	\N	\N	not_started	32	sr:venue:910	2025-05-04 17:00:00
sr:sport_event:46655583	sr:season:114317	sr:competitor:3206	sr:competitor:191648	2	0	closed	2	sr:venue:1007	2024-05-20 22:00:00
sr:sport_event:51389367	sr:season:119847	sr:competitor:3002	sr:competitor:3013	\N	\N	not_started	34	sr:venue:907	2025-05-17 17:00:00
sr:sport_event:51389225	sr:season:119847	sr:competitor:3002	sr:competitor:1031053	\N	\N	not_started	26	sr:venue:907	2025-03-16 18:00:00
sr:sport_event:51388763	sr:season:119847	sr:competitor:3014	sr:competitor:3006	1	1	closed	4	sr:venue:5312	2024-08-30 19:15:00
sr:sport_event:51389093	sr:season:119847	sr:competitor:3010	sr:competitor:49531	\N	\N	not_started	22	sr:venue:2539	2025-02-16 18:00:00
sr:sport_event:51389203	sr:season:119847	sr:competitor:2995	sr:competitor:3009	\N	\N	not_started	25	sr:venue:14556	2025-03-09 18:00:00
sr:sport_event:51388973	sr:season:119847	sr:competitor:2995	sr:competitor:1031053	\N	\N	not_started	15	sr:venue:14556	2024-12-21 18:00:00
sr:sport_event:51094987	sr:season:118699	sr:competitor:46	sr:competitor:58	3	0	closed	5	sr:venue:631	2024-09-14 14:00:00
sr:sport_event:51095351	sr:season:118699	sr:competitor:12	sr:competitor:24	2	6	closed	13	sr:venue:2547	2024-11-02 15:00:00
sr:sport_event:51389047	sr:season:119847	sr:competitor:3011	sr:competitor:36365	\N	\N	not_started	20	sr:venue:5318	2025-02-02 18:00:00
sr:sport_event:46655611	sr:season:114317	sr:competitor:3212	sr:competitor:36839	1	0	closed	3	sr:venue:1567	2024-05-25 20:30:00
sr:sport_event:51389195	sr:season:119847	sr:competitor:3011	sr:competitor:3014	\N	\N	not_started	25	sr:venue:5318	2025-03-09 18:00:00
sr:sport_event:51389079	sr:season:119847	sr:competitor:49531	sr:competitor:3009	\N	\N	not_started	21	sr:venue:16520	2025-02-09 18:00:00
sr:sport_event:51095461	sr:season:118699	sr:competitor:24	sr:competitor:95	1	0	closed	15	sr:venue:813	2024-11-08 20:00:00
sr:sport_event:51095445	sr:season:118699	sr:competitor:2	sr:competitor:21	3	1	closed	15	sr:venue:638	2024-11-09 15:00:00
sr:sport_event:51095839	sr:season:118699	sr:competitor:27	sr:competitor:8	\N	\N	not_started	23	sr:venue:852	2024-12-26 17:30:00
sr:sport_event:50850073	sr:season:118689	sr:competitor:38	sr:competitor:30	4	2	closed	6	sr:venue:799	2024-09-28 14:00:00
sr:sport_event:46655663	sr:season:114317	sr:competitor:3205	sr:competitor:65668	2	1	closed	5	sr:venue:12003	2024-06-13 00:15:00
sr:sport_event:51095955	sr:season:118699	sr:competitor:71	sr:competitor:58	\N	\N	not_started	25	sr:venue:660	2025-01-01 12:30:00
sr:sport_event:51094969	sr:season:118699	sr:competitor:27	sr:competitor:58	3	0	closed	4	sr:venue:852	2024-08-31 14:00:00
sr:sport_event:51095993	sr:season:118699	sr:competitor:36	sr:competitor:61	\N	\N	not_started	26	sr:venue:743	2025-01-04 15:00:00
sr:sport_event:51096437	sr:season:118699	sr:competitor:36	sr:competitor:95	\N	\N	not_started	39	sr:venue:743	2025-03-29 15:00:00
sr:sport_event:51095885	sr:season:118699	sr:competitor:11	sr:competitor:25	\N	\N	not_started	24	sr:venue:2194	2024-12-29 15:00:00
sr:sport_event:51092201	sr:season:118699	sr:competitor:61	sr:competitor:41	0	2	closed	1	sr:venue:1514	2024-08-10 11:30:00
sr:sport_event:51096373	sr:season:118699	sr:competitor:24	sr:competitor:25	\N	\N	not_started	36	sr:venue:813	2025-03-08 15:00:00
sr:sport_event:51095231	sr:season:118699	sr:competitor:12	sr:competitor:74	0	0	closed	11	sr:venue:2547	2024-10-22 18:45:00
sr:sport_event:51094939	sr:season:118699	sr:competitor:46	sr:competitor:95	2	1	closed	3	sr:venue:631	2024-08-24 14:00:00
sr:sport_event:51096251	sr:season:118699	sr:competitor:29	sr:competitor:36	\N	\N	not_started	31	sr:venue:1135	2025-02-07 20:00:00
sr:sport_event:51095577	sr:season:118699	sr:competitor:11	sr:competitor:61	\N	\N	not_started	18	sr:venue:2194	2024-11-30 15:00:00
sr:sport_event:51096407	sr:season:118699	sr:competitor:72	sr:competitor:36	\N	\N	not_started	38	sr:venue:2178	2025-03-15 15:00:00
sr:sport_event:51096265	sr:season:118699	sr:competitor:71	sr:competitor:25	\N	\N	not_started	32	sr:venue:660	2025-02-11 19:45:00
sr:sport_event:51096329	sr:season:118699	sr:competitor:46	sr:competitor:263	\N	\N	not_started	35	sr:venue:631	2025-03-01 15:00:00
sr:sport_event:51095715	sr:season:118699	sr:competitor:1	sr:competitor:95	\N	\N	not_started	20	sr:venue:1693	2024-12-11 19:45:00
sr:sport_event:51096443	sr:season:118699	sr:competitor:15	sr:competitor:11	\N	\N	not_started	39	sr:venue:598	2025-03-29 15:00:00
sr:sport_event:51096575	sr:season:118699	sr:competitor:27	sr:competitor:6	\N	\N	not_started	41	sr:venue:852	2025-04-09 18:45:00
sr:sport_event:51095791	sr:season:118699	sr:competitor:72	sr:competitor:27	\N	\N	not_started	22	sr:venue:2178	2024-12-20 20:00:00
sr:sport_event:51096853	sr:season:118699	sr:competitor:46	sr:competitor:25	\N	\N	not_started	43	sr:venue:631	2025-04-18 14:00:00
sr:sport_event:51096151	sr:season:118699	sr:competitor:2	sr:competitor:36	\N	\N	not_started	27	sr:venue:638	2025-01-18 15:00:00
sr:sport_event:51096923	sr:season:118699	sr:competitor:15	sr:competitor:46	\N	\N	not_started	46	sr:venue:598	2025-05-03 14:00:00
sr:sport_event:51095161	sr:season:118699	sr:competitor:24	sr:competitor:36	2	1	closed	9	sr:venue:813	2024-10-05 14:00:00
sr:sport_event:51095039	sr:season:118699	sr:competitor:96	sr:competitor:61	4	1	closed	7	sr:venue:1138	2024-09-28 14:00:00
sr:sport_event:51096361	sr:season:118699	sr:competitor:263	sr:competitor:95	\N	\N	not_started	36	sr:venue:2221	2025-03-08 15:00:00
sr:sport_event:51389171	sr:season:119847	sr:competitor:4500	sr:competitor:3036	\N	\N	not_started	23	sr:venue:5326	2025-02-23 18:00:00
sr:sport_event:51389181	sr:season:119847	sr:competitor:3009	sr:competitor:36365	\N	\N	not_started	24	sr:venue:1137	2025-03-02 18:00:00
sr:sport_event:51388841	sr:season:119847	sr:competitor:2998	sr:competitor:4500	1	0	closed	8	sr:venue:12069	2024-10-06 14:30:00
sr:sport_event:51389281	sr:season:119847	sr:competitor:744135	sr:competitor:2998	\N	\N	not_started	29	sr:venue:53523	2025-04-13 17:00:00
sr:sport_event:51389315	sr:season:119847	sr:competitor:36365	sr:competitor:4500	\N	\N	not_started	31	sr:venue:43626	2025-04-27 17:00:00
sr:sport_event:51389185	sr:season:119847	sr:competitor:3014	sr:competitor:744135	\N	\N	not_started	24	sr:venue:5312	2025-03-02 18:00:00
sr:sport_event:51389191	sr:season:119847	sr:competitor:25777	sr:competitor:3002	\N	\N	not_started	24	sr:venue:8289	2025-03-02 18:00:00
sr:sport_event:51389039	sr:season:119847	sr:competitor:25777	sr:competitor:3014	\N	\N	not_started	19	sr:venue:8289	2025-01-26 18:00:00
sr:sport_event:51389253	sr:season:119847	sr:competitor:3036	sr:competitor:2995	\N	\N	not_started	28	sr:venue:2013	2025-04-06 17:00:00
sr:sport_event:51095067	sr:season:118699	sr:competitor:1	sr:competitor:96	1	3	closed	8	sr:venue:1693	2024-10-01 18:45:00
sr:sport_event:51389357	sr:season:119847	sr:competitor:2999	sr:competitor:3006	\N	\N	not_started	34	sr:venue:951	2025-05-17 17:00:00
sr:sport_event:46655547	sr:season:114317	sr:competitor:6074	sr:competitor:65668	0	1	closed	1	sr:venue:15676	2024-05-11 18:30:00
sr:sport_event:51389301	sr:season:119847	sr:competitor:1031053	sr:competitor:36365	\N	\N	not_started	30	sr:venue:8249	2025-04-19 17:00:00
sr:sport_event:51389041	sr:season:119847	sr:competitor:4500	sr:competitor:3009	\N	\N	not_started	19	sr:venue:5326	2025-01-26 18:00:00
sr:sport_event:46655543	sr:season:114317	sr:competitor:191648	sr:competitor:3201	1	0	closed	1	sr:venue:17150	2024-05-12 18:30:00
sr:sport_event:51389199	sr:season:119847	sr:competitor:3006	sr:competitor:3013	\N	\N	not_started	25	sr:venue:902	2025-03-09 18:00:00
sr:sport_event:51094985	sr:season:118699	sr:competitor:8	sr:competitor:74	1	0	closed	4	sr:venue:1136	2024-08-31 14:00:00
sr:sport_event:46655607	sr:season:114317	sr:competitor:7629	sr:competitor:4937	1	0	closed	3	sr:venue:12021	2024-05-26 18:30:00
sr:sport_event:51095557	sr:season:118699	sr:competitor:27	sr:competitor:74	1	2	closed	17	sr:venue:852	2024-11-27 20:00:00
sr:sport_event:51096163	sr:season:118699	sr:competitor:27	sr:competitor:41	\N	\N	not_started	28	sr:venue:852	2025-01-21 19:45:00
sr:sport_event:51095145	sr:season:118699	sr:competitor:11	sr:competitor:12	1	2	closed	9	sr:venue:2194	2024-10-05 14:00:00
sr:sport_event:51095843	sr:season:118699	sr:competitor:36	sr:competitor:12	\N	\N	not_started	23	sr:venue:743	2024-12-26 15:00:00
sr:sport_event:50850665	sr:season:118689	sr:competitor:7	sr:competitor:14	\N	\N	not_started	35	sr:venue:10	2025-05-03 14:00:00
sr:sport_event:46655575	sr:season:114317	sr:competitor:4937	sr:competitor:3204	1	1	closed	2	sr:venue:12033	2024-05-18 23:30:00
sr:sport_event:51094835	sr:season:118699	sr:competitor:6	sr:competitor:61	5	0	closed	2	sr:venue:806	2024-08-17 14:00:00
sr:sport_event:51095647	sr:season:118699	sr:competitor:71	sr:competitor:95	\N	\N	not_started	19	sr:venue:660	2024-12-07 15:00:00
sr:sport_event:51095177	sr:season:118699	sr:competitor:36	sr:competitor:58	0	2	closed	10	sr:venue:743	2024-10-19 14:00:00
sr:sport_event:51096839	sr:season:118699	sr:competitor:12	sr:competitor:95	\N	\N	not_started	42	sr:venue:2547	2025-04-12 14:00:00
sr:sport_event:51095437	sr:season:118699	sr:competitor:36	sr:competitor:72	5	1	closed	15	sr:venue:743	2024-11-09 12:30:00
sr:sport_event:51096889	sr:season:118699	sr:competitor:6	sr:competitor:15	\N	\N	not_started	44	sr:venue:806	2025-04-21 14:00:00
sr:sport_event:51095585	sr:season:118699	sr:competitor:36	sr:competitor:96	\N	\N	not_started	18	sr:venue:743	2024-11-30 12:30:00
sr:sport_event:51096301	sr:season:118699	sr:competitor:12	sr:competitor:11	\N	\N	not_started	33	sr:venue:2547	2025-02-15 15:00:00
sr:sport_event:46655653	sr:season:114317	sr:competitor:3218	sr:competitor:3215	2	0	closed	5	sr:venue:981	2024-06-14 00:15:00
sr:sport_event:51096277	sr:season:118699	sr:competitor:41	sr:competitor:72	\N	\N	not_started	32	sr:venue:851	2025-02-12 19:45:00
sr:sport_event:51096343	sr:season:118699	sr:competitor:95	sr:competitor:11	\N	\N	not_started	35	sr:venue:2366	2025-03-01 15:00:00
sr:sport_event:51095483	sr:season:118699	sr:competitor:25	sr:competitor:41	1	1	closed	16	sr:venue:2352	2024-11-23 15:00:00
sr:sport_event:51095033	sr:season:118699	sr:competitor:8	sr:competitor:71	1	0	closed	6	sr:venue:1136	2024-09-21 14:00:00
sr:sport_event:51095701	sr:season:118699	sr:competitor:41	sr:competitor:58	\N	\N	not_started	20	sr:venue:851	2024-12-10 19:45:00
sr:sport_event:51095621	sr:season:118699	sr:competitor:6	sr:competitor:36	\N	\N	not_started	19	sr:venue:806	2024-12-06 20:00:00
sr:sport_event:51094965	sr:season:118699	sr:competitor:61	sr:competitor:36	0	2	closed	4	sr:venue:1514	2024-08-31 11:30:00
sr:sport_event:51095659	sr:season:118699	sr:competitor:12	sr:competitor:21	\N	\N	not_started	19	sr:venue:2547	2024-12-07 12:30:00
sr:sport_event:51389065	sr:season:119847	sr:competitor:4500	sr:competitor:2995	\N	\N	not_started	21	sr:venue:5326	2025-02-09 18:00:00
sr:sport_event:51096915	sr:season:118699	sr:competitor:8	sr:competitor:72	\N	\N	not_started	46	sr:venue:1136	2025-05-03 14:00:00
sr:sport_event:51095261	sr:season:118699	sr:competitor:6	sr:competitor:1	0	0	closed	12	sr:venue:806	2024-10-26 14:00:00
sr:sport_event:51096457	sr:season:118699	sr:competitor:72	sr:competitor:34	\N	\N	not_started	40	sr:venue:2178	2025-04-05 11:30:00
sr:sport_event:51096467	sr:season:118699	sr:competitor:1	sr:competitor:61	\N	\N	not_started	40	sr:venue:1693	2025-04-05 14:00:00
sr:sport_event:51096919	sr:season:118699	sr:competitor:74	sr:competitor:95	\N	\N	not_started	46	sr:venue:1689	2025-05-03 14:00:00
sr:sport_event:51389163	sr:season:119847	sr:competitor:3006	sr:competitor:2995	\N	\N	not_started	23	sr:venue:902	2025-02-23 18:00:00
sr:sport_event:51389341	sr:season:119847	sr:competitor:36365	sr:competitor:2999	\N	\N	not_started	33	sr:venue:43626	2025-05-11 17:00:00
sr:sport_event:51095335	sr:season:118699	sr:competitor:25	sr:competitor:6	1	0	closed	13	sr:venue:2352	2024-11-03 15:00:00
sr:sport_event:51389067	sr:season:119847	sr:competitor:3006	sr:competitor:3014	\N	\N	not_started	21	sr:venue:902	2025-02-09 18:00:00
sr:sport_event:46655535	sr:season:114317	sr:competitor:3211	sr:competitor:65676	3	0	closed	1	sr:venue:1009	2024-05-11 22:45:00
sr:sport_event:51389211	sr:season:119847	sr:competitor:49531	sr:competitor:3036	\N	\N	not_started	25	sr:venue:16520	2025-03-09 18:00:00
sr:sport_event:51389307	sr:season:119847	sr:competitor:3010	sr:competitor:2998	\N	\N	not_started	31	sr:venue:2539	2025-04-27 17:00:00
sr:sport_event:51389249	sr:season:119847	sr:competitor:3002	sr:competitor:3006	\N	\N	not_started	28	sr:venue:907	2025-04-06 17:00:00
sr:sport_event:51094981	sr:season:118699	sr:competitor:2	sr:competitor:41	1	3	closed	4	sr:venue:638	2024-08-31 14:00:00
sr:sport_event:51389043	sr:season:119847	sr:competitor:2998	sr:competitor:3036	\N	\N	not_started	19	sr:venue:12069	2025-01-26 18:00:00
sr:sport_event:51389373	sr:season:119847	sr:competitor:1031053	sr:competitor:3014	\N	\N	not_started	34	sr:venue:8249	2025-05-17 17:00:00
sr:sport_event:51389349	sr:season:119847	sr:competitor:744135	sr:competitor:1031053	\N	\N	not_started	33	sr:venue:53523	2025-05-11 17:00:00
sr:sport_event:51388891	sr:season:119847	sr:competitor:2995	sr:competitor:3036	0	2	closed	11	sr:venue:14556	2024-11-09 20:30:00
sr:sport_event:46655593	sr:season:114317	sr:competitor:3216	sr:competitor:3211	1	0	closed	3	sr:venue:613	2024-05-25 18:00:00
sr:sport_event:46655605	sr:season:114317	sr:competitor:3204	sr:competitor:65668	2	0	closed	3	sr:venue:4754	2024-05-27 22:00:00
sr:sport_event:51095433	sr:season:118699	sr:competitor:34	sr:competitor:1	2	0	closed	15	sr:venue:2223	2024-11-09 15:00:00
sr:sport_event:51095299	sr:season:118699	sr:competitor:24	sr:competitor:46	1	0	closed	12	sr:venue:813	2024-10-26 11:30:00
sr:sport_event:51095805	sr:season:118699	sr:competitor:2	sr:competitor:11	\N	\N	not_started	22	sr:venue:638	2024-12-21 12:30:00
sr:sport_event:51389155	sr:season:119847	sr:competitor:2995	sr:competitor:744135	\N	\N	not_started	22	sr:venue:14556	2025-02-16 18:00:00
sr:sport_event:46655579	sr:season:114317	sr:competitor:36842	sr:competitor:6074	0	0	closed	2	sr:venue:12031	2024-05-18 18:30:00
sr:sport_event:46655657	sr:season:114317	sr:competitor:42338	sr:competitor:3206	2	0	closed	5	sr:venue:8975	2024-06-13 22:00:00
sr:sport_event:46655671	sr:season:114317	sr:competitor:3202	sr:competitor:3208	1	0	closed	5	sr:venue:44628	2024-06-14 22:00:00
sr:sport_event:51094839	sr:season:118699	sr:competitor:27	sr:competitor:36	1	0	closed	2	sr:venue:852	2024-08-17 11:30:00
sr:sport_event:51095309	sr:season:118699	sr:competitor:46	sr:competitor:15	0	2	closed	13	sr:venue:631	2024-11-02 12:30:00
sr:sport_event:51095159	sr:season:118699	sr:competitor:74	sr:competitor:29	0	0	closed	9	sr:venue:1689	2024-10-05 14:00:00
sr:sport_event:51094975	sr:season:118699	sr:competitor:25	sr:competitor:12	3	0	closed	4	sr:venue:2352	2024-08-31 14:00:00
sr:sport_event:51095025	sr:season:118699	sr:competitor:1	sr:competitor:25	1	1	closed	6	sr:venue:1693	2024-09-21 11:30:00
sr:sport_event:51095799	sr:season:118699	sr:competitor:71	sr:competitor:36	\N	\N	not_started	22	sr:venue:660	2024-12-21 15:00:00
sr:sport_event:51096261	sr:season:118699	sr:competitor:27	sr:competitor:95	\N	\N	not_started	32	sr:venue:852	2025-02-11 19:45:00
sr:sport_event:51096045	sr:season:118699	sr:competitor:11	sr:competitor:58	\N	\N	not_started	27	sr:venue:2194	2025-01-18 15:00:00
sr:sport_event:50852241	sr:season:118691	sr:competitor:2859	sr:competitor:2820	1	1	closed	9	sr:venue:608	2024-10-05 14:15:00
sr:sport_event:51096363	sr:season:118699	sr:competitor:71	sr:competitor:12	\N	\N	not_started	36	sr:venue:660	2025-03-08 15:00:00
sr:sport_event:51095761	sr:season:118699	sr:competitor:29	sr:competitor:61	\N	\N	not_started	21	sr:venue:1135	2024-12-14 15:00:00
sr:sport_event:55569685	sr:season:118699	sr:competitor:6	sr:competitor:34	\N	\N	not_started	29	sr:venue:806	2025-01-27 20:00:00
sr:sport_event:51096315	sr:season:118699	sr:competitor:71	sr:competitor:61	\N	\N	not_started	34	sr:venue:660	2025-02-22 12:30:00
sr:sport_event:51095513	sr:season:118699	sr:competitor:8	sr:competitor:263	2	2	closed	16	sr:venue:1136	2024-11-23 15:00:00
sr:sport_event:51096219	sr:season:118699	sr:competitor:25	sr:competitor:1	\N	\N	not_started	30	sr:venue:2352	2025-02-01 15:00:00
sr:sport_event:51096595	sr:season:118699	sr:competitor:2	sr:competitor:27	\N	\N	not_started	42	sr:venue:638	2025-04-12 14:00:00
sr:sport_event:51096391	sr:season:118699	sr:competitor:96	sr:competitor:95	\N	\N	not_started	37	sr:venue:1138	2025-03-12 19:45:00
sr:sport_event:51096155	sr:season:118699	sr:competitor:15	sr:competitor:263	\N	\N	not_started	27	sr:venue:598	2025-01-18 15:00:00
sr:sport_event:51095565	sr:season:118699	sr:competitor:2	sr:competitor:25	\N	\N	abandoned	17	sr:venue:638	2024-11-27 19:45:00
sr:sport_event:51096453	sr:season:118699	sr:competitor:58	sr:competitor:24	\N	\N	not_started	40	sr:venue:2505	2025-04-05 14:00:00
sr:sport_event:51096381	sr:season:118699	sr:competitor:27	sr:competitor:11	\N	\N	not_started	37	sr:venue:852	2025-03-11 19:45:00
sr:sport_event:51388849	sr:season:119847	sr:competitor:3011	sr:competitor:3010	2	1	closed	9	sr:venue:5318	2024-10-25 19:45:00
sr:sport_event:51096465	sr:season:118699	sr:competitor:21	sr:competitor:29	\N	\N	not_started	40	sr:venue:3002	2025-04-05 14:00:00
sr:sport_event:51096933	sr:season:118699	sr:competitor:11	sr:competitor:36	\N	\N	not_started	46	sr:venue:2194	2025-05-03 14:00:00
sr:sport_event:51096031	sr:season:118699	sr:competitor:6	sr:competitor:41	\N	\N	not_started	27	sr:venue:806	2025-01-17 20:00:00
sr:sport_event:51096159	sr:season:118699	sr:competitor:8	sr:competitor:29	\N	\N	not_started	27	sr:venue:1136	2025-01-18 15:00:00
sr:sport_event:51096875	sr:season:118699	sr:competitor:1	sr:competitor:74	\N	\N	not_started	44	sr:venue:1693	2025-04-21 14:00:00
sr:sport_event:51095227	sr:season:118699	sr:competitor:1	sr:competitor:11	1	1	closed	11	sr:venue:1693	2024-10-22 19:00:00
sr:sport_event:51389257	sr:season:119847	sr:competitor:3013	sr:competitor:744135	\N	\N	not_started	28	sr:venue:1335	2025-04-06 17:00:00
sr:sport_event:51389265	sr:season:119847	sr:competitor:1031053	sr:competitor:4500	\N	\N	not_started	28	sr:venue:8249	2025-04-06 17:00:00
sr:sport_event:46655541	sr:season:114317	sr:competitor:7628	sr:competitor:3206	0	1	closed	1	sr:venue:4738	2024-05-12 18:30:00
sr:sport_event:51388967	sr:season:119847	sr:competitor:3014	sr:competitor:3002	\N	\N	not_started	15	sr:venue:5312	2024-12-21 20:30:00
sr:sport_event:51389197	sr:season:119847	sr:competitor:1031053	sr:competitor:25777	\N	\N	not_started	25	sr:venue:8249	2025-03-09 18:00:00
sr:sport_event:51389231	sr:season:119847	sr:competitor:3011	sr:competitor:3013	\N	\N	not_started	27	sr:venue:5318	2025-03-30 17:00:00
sr:sport_event:51388745	sr:season:119847	sr:competitor:2999	sr:competitor:3014	3	1	closed	3	sr:venue:951	2024-08-25 19:30:00
sr:sport_event:51389303	sr:season:119847	sr:competitor:3011	sr:competitor:25777	\N	\N	not_started	31	sr:venue:5318	2025-04-27 17:00:00
sr:sport_event:51389327	sr:season:119847	sr:competitor:3036	sr:competitor:744135	\N	\N	not_started	32	sr:venue:2013	2025-05-04 17:00:00
sr:sport_event:51094933	sr:season:118699	sr:competitor:74	sr:competitor:21	3	0	closed	2	sr:venue:1689	2024-08-17 14:00:00
sr:sport_event:51389205	sr:season:119847	sr:competitor:36365	sr:competitor:3001	\N	\N	not_started	25	sr:venue:43626	2025-03-09 18:00:00
sr:sport_event:51389083	sr:season:119847	sr:competitor:3011	sr:competitor:3006	\N	\N	not_started	22	sr:venue:5318	2025-02-16 18:00:00
sr:sport_event:51095611	sr:season:118699	sr:competitor:74	sr:competitor:2	\N	\N	not_started	18	sr:venue:1689	2024-11-30 15:00:00
sr:sport_event:51389001	sr:season:119847	sr:competitor:3010	sr:competitor:3036	\N	\N	not_started	17	sr:venue:2539	2025-01-05 18:00:00
sr:sport_event:46655553	sr:season:114317	sr:competitor:7629	sr:competitor:36839	3	1	closed	1	sr:venue:12021	2024-05-11 17:30:00
sr:sport_event:51389239	sr:season:119847	sr:competitor:3006	sr:competitor:2998	\N	\N	not_started	27	sr:venue:902	2025-03-30 17:00:00
sr:sport_event:51095441	sr:season:118699	sr:competitor:263	sr:competitor:58	0	2	closed	15	sr:venue:2221	2024-11-09 15:00:00
sr:sport_event:51094991	sr:season:118699	sr:competitor:96	sr:competitor:15	0	2	closed	5	sr:venue:1138	2024-09-13 19:00:00
sr:sport_event:51095131	sr:season:118699	sr:competitor:8	sr:competitor:36	0	1	closed	8	sr:venue:1136	2024-10-01 19:00:00
sr:sport_event:51096131	sr:season:118699	sr:competitor:34	sr:competitor:12	\N	\N	not_started	27	sr:venue:2223	2025-01-19 12:00:00
sr:sport_event:51388859	sr:season:119847	sr:competitor:744135	sr:competitor:3009	2	2	closed	9	sr:venue:53523	2024-10-27 20:30:00
sr:sport_event:46655585	sr:season:114317	sr:competitor:3217	sr:competitor:7628	1	1	closed	2	sr:venue:1329	2024-05-21 00:15:00
sr:sport_event:51095449	sr:season:118699	sr:competitor:15	sr:competitor:12	1	0	closed	15	sr:venue:598	2024-11-10 12:30:00
sr:sport_event:51095821	sr:season:118699	sr:competitor:8	sr:competitor:58	\N	\N	not_started	22	sr:venue:1136	2024-12-22 15:00:00
sr:sport_event:51096167	sr:season:118699	sr:competitor:36	sr:competitor:8	\N	\N	not_started	28	sr:venue:743	2025-01-21 19:45:00
sr:sport_event:51095467	sr:season:118699	sr:competitor:46	sr:competitor:2	\N	\N	postponed	16	sr:venue:631	2024-11-23 15:00:00
sr:sport_event:51095881	sr:season:118699	sr:competitor:58	sr:competitor:2	\N	\N	not_started	24	sr:venue:2505	2024-12-29 15:00:00
sr:sport_event:51096285	sr:season:118699	sr:competitor:96	sr:competitor:263	\N	\N	not_started	33	sr:venue:1138	2025-02-15 15:00:00
sr:sport_event:51096369	sr:season:118699	sr:competitor:41	sr:competitor:61	\N	\N	not_started	36	sr:venue:851	2025-03-08 15:00:00
sr:sport_event:51096211	sr:season:118699	sr:competitor:27	sr:competitor:15	\N	\N	not_started	30	sr:venue:852	2025-02-01 15:00:00
sr:sport_event:51096411	sr:season:118699	sr:competitor:95	sr:competitor:24	\N	\N	not_started	38	sr:venue:2366	2025-03-15 15:00:00
sr:sport_event:51096485	sr:season:118699	sr:competitor:15	sr:competitor:25	\N	\N	not_started	41	sr:venue:598	2025-04-08 18:45:00
sr:sport_event:46655637	sr:season:114317	sr:competitor:3206	sr:competitor:6074	1	1	closed	4	sr:venue:1007	2024-06-04 00:15:00
sr:sport_event:46655677	sr:season:114317	sr:competitor:3208	sr:competitor:3210	3	0	closed	6	sr:venue:1079	2024-07-21 23:00:00
sr:sport_event:51096837	sr:season:118699	sr:competitor:41	sr:competitor:74	\N	\N	not_started	42	sr:venue:851	2025-04-12 14:00:00
sr:sport_event:51095383	sr:season:118699	sr:competitor:12	sr:competitor:263	2	0	closed	14	sr:venue:2547	2024-11-05 19:45:00
sr:sport_event:51096395	sr:season:118699	sr:competitor:263	sr:competitor:12	\N	\N	not_started	37	sr:venue:2221	2025-03-12 19:45:00
sr:sport_event:51095723	sr:season:118699	sr:competitor:46	sr:competitor:72	\N	\N	not_started	21	sr:venue:631	2024-12-14 15:00:00
sr:sport_event:51096881	sr:season:118699	sr:competitor:72	sr:competitor:58	\N	\N	not_started	44	sr:venue:2178	2025-04-21 14:00:00
sr:sport_event:51096931	sr:season:118699	sr:competitor:27	sr:competitor:29	\N	\N	not_started	46	sr:venue:852	2025-05-03 14:00:00
sr:sport_event:51095847	sr:season:118699	sr:competitor:263	sr:competitor:25	\N	\N	not_started	23	sr:venue:2221	2024-12-26 15:00:00
sr:sport_event:51096435	sr:season:118699	sr:competitor:34	sr:competitor:74	\N	\N	not_started	39	sr:venue:2223	2025-03-29 15:00:00
sr:sport_event:51389169	sr:season:119847	sr:competitor:36365	sr:competitor:3010	\N	\N	not_started	23	sr:venue:43626	2025-02-23 18:00:00
sr:sport_event:51096895	sr:season:118699	sr:competitor:12	sr:competitor:2	\N	\N	not_started	45	sr:venue:2547	2025-04-26 14:00:00
sr:sport_event:51092209	sr:season:118699	sr:competitor:36	sr:competitor:74	1	0	closed	1	sr:venue:743	2024-08-10 11:30:00
sr:sport_event:51389073	sr:season:119847	sr:competitor:25777	sr:competitor:3036	\N	\N	not_started	21	sr:venue:8289	2025-02-09 18:00:00
sr:sport_event:51095021	sr:season:118699	sr:competitor:263	sr:competitor:24	4	1	closed	6	sr:venue:2221	2024-09-21 11:30:00
sr:sport_event:51095045	sr:season:118699	sr:competitor:25	sr:competitor:21	3	1	closed	7	sr:venue:2352	2024-09-28 14:00:00
sr:sport_event:51388901	sr:season:119847	sr:competitor:4500	sr:competitor:1031053	0	0	closed	11	sr:venue:5326	2024-11-09 15:30:00
sr:sport_event:51389051	sr:season:119847	sr:competitor:3036	sr:competitor:3002	\N	\N	not_started	20	sr:venue:2013	2025-02-02 18:00:00
sr:sport_event:51389217	sr:season:119847	sr:competitor:3014	sr:competitor:2995	\N	\N	not_started	26	sr:venue:5312	2025-03-16 18:00:00
sr:sport_event:46655589	sr:season:114317	sr:competitor:3211	sr:competitor:3203	\N	\N	postponed	2	sr:venue:1009	2024-05-11 22:45:00
sr:sport_event:51389243	sr:season:119847	sr:competitor:36365	sr:competitor:3036	\N	\N	not_started	27	sr:venue:43626	2025-03-30 17:00:00
sr:sport_event:51388843	sr:season:119847	sr:competitor:3010	sr:competitor:744135	3	0	closed	8	sr:venue:2539	2024-10-05 14:30:00
sr:sport_event:51389269	sr:season:119847	sr:competitor:3006	sr:competitor:25777	\N	\N	not_started	29	sr:venue:902	2025-04-13 17:00:00
sr:sport_event:51388939	sr:season:119847	sr:competitor:2999	sr:competitor:49531	\N	\N	not_started	14	sr:venue:951	2024-12-16 18:45:00
sr:sport_event:51092279	sr:season:118699	sr:competitor:29	sr:competitor:11	1	0	closed	1	sr:venue:1135	2024-08-10 11:30:00
sr:sport_event:51389273	sr:season:119847	sr:competitor:49531	sr:competitor:4500	\N	\N	not_started	29	sr:venue:16520	2025-04-13 17:00:00
sr:sport_event:51095505	sr:season:118699	sr:competitor:12	sr:competitor:61	1	1	closed	16	sr:venue:2547	2024-11-23 12:30:00
sr:sport_event:51389319	sr:season:119847	sr:competitor:3014	sr:competitor:3013	\N	\N	not_started	31	sr:venue:5312	2025-04-27 17:00:00
sr:sport_event:46655563	sr:season:114317	sr:competitor:65676	sr:competitor:3202	2	4	closed	2	sr:venue:49307	2024-05-19 23:00:00
sr:sport_event:51095155	sr:season:118699	sr:competitor:15	sr:competitor:72	2	0	closed	9	sr:venue:598	2024-10-05 14:00:00
sr:sport_event:51095607	sr:season:118699	sr:competitor:29	sr:competitor:6	\N	\N	not_started	18	sr:venue:1135	2024-11-30 15:00:00
sr:sport_event:51095745	sr:season:118699	sr:competitor:263	sr:competitor:6	\N	\N	not_started	21	sr:venue:2221	2024-12-15 15:00:00
sr:sport_event:51388771	sr:season:119847	sr:competitor:744135	sr:competitor:36365	0	1	closed	4	sr:venue:53523	2024-08-31 17:00:00
sr:sport_event:51092175	sr:season:118699	sr:competitor:46	sr:competitor:27	4	2	closed	1	sr:venue:631	2024-08-09 19:00:00
sr:sport_event:51095153	sr:season:118699	sr:competitor:2	sr:competitor:95	1	1	closed	9	sr:venue:638	2024-10-05 11:30:00
sr:sport_event:51096461	sr:season:118699	sr:competitor:95	sr:competitor:15	\N	\N	not_started	40	sr:venue:2366	2025-04-05 14:00:00
sr:sport_event:51095283	sr:season:118699	sr:competitor:2	sr:competitor:12	1	2	closed	12	sr:venue:638	2024-10-25 19:00:00
sr:sport_event:51095989	sr:season:118699	sr:competitor:96	sr:competitor:34	\N	\N	not_started	26	sr:venue:1138	2025-01-04 15:00:00
sr:sport_event:51095749	sr:season:118699	sr:competitor:95	sr:competitor:12	\N	\N	not_started	21	sr:venue:2366	2024-12-14 15:00:00
sr:sport_event:51095873	sr:season:118699	sr:competitor:24	sr:competitor:2	\N	\N	not_started	23	sr:venue:813	2024-12-26 15:00:00
sr:sport_event:51094945	sr:season:118699	sr:competitor:36	sr:competitor:2	2	2	closed	3	sr:venue:743	2024-08-24 14:00:00
sr:sport_event:51096423	sr:season:118699	sr:competitor:74	sr:competitor:6	\N	\N	not_started	38	sr:venue:1689	2025-03-15 15:00:00
sr:sport_event:51095135	sr:season:118699	sr:competitor:263	sr:competitor:34	1	1	closed	8	sr:venue:2221	2024-10-01 18:45:00
sr:sport_event:51096843	sr:season:118699	sr:competitor:21	sr:competitor:1	\N	\N	not_started	43	sr:venue:3002	2025-04-18 14:00:00
sr:sport_event:51096577	sr:season:118699	sr:competitor:95	sr:competitor:1	\N	\N	not_started	41	sr:venue:2366	2025-04-09 18:45:00
sr:sport_event:46655751	sr:season:114317	sr:competitor:3211	sr:competitor:42338	1	0	closed	8	sr:venue:1009	2024-07-28 21:30:00
sr:sport_event:51095915	sr:season:118699	sr:competitor:29	sr:competitor:41	\N	\N	not_started	24	sr:venue:1135	2024-12-29 15:00:00
sr:sport_event:51096593	sr:season:118699	sr:competitor:71	sr:competitor:15	\N	\N	not_started	42	sr:venue:660	2025-04-12 14:00:00
sr:sport_event:51096181	sr:season:118699	sr:competitor:2	sr:competitor:29	\N	\N	not_started	28	sr:venue:638	2025-01-22 19:45:00
sr:sport_event:51096357	sr:season:118699	sr:competitor:11	sr:competitor:29	\N	\N	not_started	36	sr:venue:2194	2025-03-08 15:00:00
sr:sport_event:51096345	sr:season:118699	sr:competitor:21	sr:competitor:74	\N	\N	not_started	35	sr:venue:3002	2025-03-01 15:00:00
sr:sport_event:51095413	sr:season:118699	sr:competitor:6	sr:competitor:74	1	0	closed	15	sr:venue:806	2024-11-10 15:00:00
sr:sport_event:51096927	sr:season:118699	sr:competitor:71	sr:competitor:34	\N	\N	not_started	46	sr:venue:660	2025-05-03 14:00:00
sr:sport_event:51096319	sr:season:118699	sr:competitor:15	sr:competitor:34	\N	\N	postponed	34	sr:venue:598	2025-02-22 15:00:00
sr:sport_event:51096305	sr:season:118699	sr:competitor:58	sr:competitor:36	\N	\N	not_started	34	sr:venue:2505	2025-02-21 19:45:00
sr:sport_event:51095027	sr:season:118699	sr:competitor:15	sr:competitor:27	1	0	closed	6	sr:venue:598	2024-09-21 14:00:00
sr:sport_event:51095705	sr:season:118699	sr:competitor:61	sr:competitor:21	\N	\N	not_started	20	sr:venue:1514	2024-12-11 19:45:00
sr:sport_event:51096195	sr:season:118699	sr:competitor:263	sr:competitor:74	\N	\N	not_started	29	sr:venue:2221	2025-01-25 12:30:00
sr:sport_event:51096879	sr:season:118699	sr:competitor:25	sr:competitor:263	\N	\N	not_started	44	sr:venue:2352	2025-04-21 14:00:00
sr:sport_event:51096893	sr:season:118699	sr:competitor:29	sr:competitor:15	\N	\N	not_started	45	sr:venue:1135	2025-04-26 14:00:00
sr:sport_event:46655561	sr:season:114317	sr:competitor:36833	sr:competitor:3202	1	0	closed	1	sr:venue:12017	2024-05-12 23:15:00
sr:sport_event:51389055	sr:season:119847	sr:competitor:3013	sr:competitor:25777	\N	\N	not_started	20	sr:venue:1335	2025-02-02 18:00:00
sr:sport_event:51388935	sr:season:119847	sr:competitor:744135	sr:competitor:25777	\N	\N	not_started	13	sr:venue:53523	2024-12-09 20:15:00
sr:sport_event:51389305	sr:season:119847	sr:competitor:49531	sr:competitor:2999	\N	\N	not_started	31	sr:venue:16520	2025-04-27 17:00:00
sr:sport_event:50955925	sr:season:119835	sr:competitor:1684	sr:competitor:1659	\N	\N	not_started	33	sr:venue:19889	2025-05-11 17:00:00
sr:sport_event:51388915	sr:season:119847	sr:competitor:2998	sr:competitor:744135	\N	\N	not_started	12	sr:venue:12069	2024-11-29 20:15:00
sr:sport_event:51389299	sr:season:119847	sr:competitor:25777	sr:competitor:744135	\N	\N	not_started	30	sr:venue:8289	2025-04-19 17:00:00
sr:sport_event:51389201	sr:season:119847	sr:competitor:2999	sr:competitor:3002	\N	\N	not_started	25	sr:venue:951	2025-03-09 18:00:00
sr:sport_event:51389069	sr:season:119847	sr:competitor:3002	sr:competitor:3001	\N	\N	not_started	21	sr:venue:907	2025-02-09 18:00:00
sr:sport_event:51388997	sr:season:119847	sr:competitor:3009	sr:competitor:3001	\N	\N	not_started	17	sr:venue:1137	2025-01-05 18:00:00
sr:sport_event:51389285	sr:season:119847	sr:competitor:3009	sr:competitor:3006	\N	\N	not_started	30	sr:venue:1137	2025-04-19 17:00:00
sr:sport_event:51095201	sr:season:118699	sr:competitor:29	sr:competitor:263	1	1	closed	10	sr:venue:1135	2024-10-19 14:00:00
sr:sport_event:51388971	sr:season:119847	sr:competitor:36365	sr:competitor:25777	\N	\N	not_started	15	sr:venue:43626	2024-12-20 20:15:00
sr:sport_event:50955779	sr:season:119835	sr:competitor:1682	sr:competitor:1646	\N	\N	not_started	25	sr:venue:1871	2025-03-09 17:00:00
sr:sport_event:51389091	sr:season:119847	sr:competitor:3013	sr:competitor:4500	\N	\N	not_started	22	sr:venue:1335	2025-02-16 18:00:00
sr:sport_event:51389251	sr:season:119847	sr:competitor:3001	sr:competitor:2999	\N	\N	not_started	28	sr:venue:910	2025-04-06 17:00:00
sr:sport_event:51095005	sr:season:118699	sr:competitor:12	sr:competitor:1	1	1	closed	5	sr:venue:2547	2024-09-14 14:00:00
sr:sport_event:51095063	sr:season:118699	sr:competitor:11	sr:competitor:46	3	0	closed	8	sr:venue:2194	2024-10-01 18:45:00
sr:sport_event:51095151	sr:season:118699	sr:competitor:71	sr:competitor:46	2	1	closed	9	sr:venue:660	2024-10-05 14:00:00
sr:sport_event:51095851	sr:season:118699	sr:competitor:95	sr:competitor:61	\N	\N	not_started	23	sr:venue:2366	2024-12-26 15:00:00
sr:sport_event:51095405	sr:season:118699	sr:competitor:72	sr:competitor:61	1	0	closed	14	sr:venue:2178	2024-11-06 20:00:00
sr:sport_event:51389059	sr:season:119847	sr:competitor:3001	sr:competitor:2998	\N	\N	not_started	20	sr:venue:910	2025-02-02 18:00:00
sr:sport_event:46655587	sr:season:114317	sr:competitor:3215	sr:competitor:3216	3	0	closed	2	sr:venue:1082	2024-05-21 00:15:00
sr:sport_event:51094937	sr:season:118699	sr:competitor:8	sr:competitor:34	0	0	closed	2	sr:venue:1136	2024-08-17 11:30:00
sr:sport_event:51095291	sr:season:118699	sr:competitor:41	sr:competitor:95	2	0	closed	12	sr:venue:851	2024-10-26 14:00:00
sr:sport_event:51095741	sr:season:118699	sr:competitor:36	sr:competitor:25	\N	\N	not_started	21	sr:venue:743	2024-12-14 15:00:00
sr:sport_event:51096271	sr:season:118699	sr:competitor:24	sr:competitor:34	\N	\N	not_started	32	sr:venue:813	2025-02-11 19:45:00
sr:sport_event:51096377	sr:season:118699	sr:competitor:6	sr:competitor:8	\N	\N	not_started	37	sr:venue:806	2025-03-11 19:45:00
sr:sport_event:52359043	sr:season:118699	sr:competitor:1	sr:competitor:72	\N	\N	not_started	26	sr:venue:1693	2025-01-06 20:00:00
sr:sport_event:51096335	sr:season:118699	sr:competitor:34	sr:competitor:8	\N	\N	not_started	35	sr:venue:2223	2025-03-01 15:00:00
sr:sport_event:46655621	sr:season:114317	sr:competitor:36837	sr:competitor:3202	1	0	closed	4	sr:venue:12712	2024-06-02 17:30:00
sr:sport_event:51095007	sr:season:118699	sr:competitor:74	sr:competitor:263	1	0	closed	5	sr:venue:1689	2024-09-14 14:00:00
sr:sport_event:51096293	sr:season:118699	sr:competitor:25	sr:competitor:8	\N	\N	not_started	33	sr:venue:2352	2025-02-15 15:00:00
sr:sport_event:51095535	sr:season:118699	sr:competitor:15	sr:competitor:95	3	0	closed	17	sr:venue:598	2024-11-26 19:45:00
sr:sport_event:51095525	sr:season:118699	sr:competitor:34	sr:competitor:72	3	0	closed	17	sr:venue:2223	2024-11-27 19:45:00
sr:sport_event:51096479	sr:season:118699	sr:competitor:36	sr:competitor:34	\N	\N	not_started	41	sr:venue:743	2025-04-08 18:45:00
sr:sport_event:51096867	sr:season:118699	sr:competitor:71	sr:competitor:11	\N	\N	not_started	44	sr:venue:660	2025-04-21 14:00:00
sr:sport_event:51094943	sr:season:118699	sr:competitor:96	sr:competitor:25	0	0	closed	3	sr:venue:1138	2024-08-24 11:30:00
sr:sport_event:51096877	sr:season:118699	sr:competitor:2	sr:competitor:24	\N	\N	not_started	44	sr:venue:638	2025-04-21 14:00:00
sr:sport_event:51096389	sr:season:118699	sr:competitor:41	sr:competitor:21	\N	\N	not_started	37	sr:venue:851	2025-03-11 19:45:00
sr:sport_event:51095929	sr:season:118699	sr:competitor:6	sr:competitor:29	\N	\N	not_started	25	sr:venue:806	2025-01-01 15:00:00
sr:sport_event:51096431	sr:season:118699	sr:competitor:27	sr:competitor:21	\N	\N	not_started	39	sr:venue:852	2025-03-29 15:00:00
sr:sport_event:51095599	sr:season:118699	sr:competitor:21	sr:competitor:8	\N	\N	not_started	18	sr:venue:3002	2024-11-30 15:00:00
sr:sport_event:51096173	sr:season:118699	sr:competitor:74	sr:competitor:15	\N	\N	not_started	28	sr:venue:1689	2025-01-21 19:45:00
sr:sport_event:51096873	sr:season:118699	sr:competitor:12	sr:competitor:36	\N	\N	not_started	44	sr:venue:2547	2025-04-21 14:00:00
sr:sport_event:51096297	sr:season:118699	sr:competitor:21	sr:competitor:6	\N	\N	not_started	33	sr:venue:3002	2025-02-15 12:30:00
sr:sport_event:51389063	sr:season:119847	sr:competitor:2995	sr:competitor:49531	\N	\N	not_started	20	sr:venue:14556	2025-02-02 18:00:00
sr:sport_event:51096589	sr:season:118699	sr:competitor:72	sr:competitor:46	\N	\N	not_started	42	sr:venue:2178	2025-04-12 14:00:00
sr:sport_event:51095471	sr:season:118699	sr:competitor:58	sr:competitor:6	0	1	closed	16	sr:venue:2505	2024-11-23 12:30:00
sr:sport_event:51389023	sr:season:119847	sr:competitor:2995	sr:competitor:36365	\N	\N	not_started	18	sr:venue:14556	2025-01-19 18:00:00
sr:sport_event:51389267	sr:season:119847	sr:competitor:3011	sr:competitor:3001	\N	\N	not_started	29	sr:venue:5318	2025-04-13 17:00:00
sr:sport_event:46655609	sr:season:114317	sr:competitor:3205	sr:competitor:3219	3	0	closed	3	sr:venue:12003	2024-05-26 20:45:00
sr:sport_event:51389177	sr:season:119847	sr:competitor:3010	sr:competitor:3006	\N	\N	not_started	24	sr:venue:2539	2025-03-02 18:00:00
sr:sport_event:51389275	sr:season:119847	sr:competitor:2999	sr:competitor:1031053	\N	\N	not_started	29	sr:venue:951	2025-04-13 17:00:00
sr:sport_event:51389207	sr:season:119847	sr:competitor:4500	sr:competitor:2998	\N	\N	not_started	25	sr:venue:5326	2025-03-09 18:00:00
sr:sport_event:46655549	sr:season:114317	sr:competitor:42338	sr:competitor:4937	1	2	closed	1	sr:venue:8975	2024-05-10 22:00:00
sr:sport_event:51389323	sr:season:119847	sr:competitor:3013	sr:competitor:3009	\N	\N	not_started	32	sr:venue:1335	2025-05-04 17:00:00
sr:sport_event:51095197	sr:season:118699	sr:competitor:12	sr:competitor:6	0	2	closed	10	sr:venue:2547	2024-10-19 14:00:00
sr:sport_event:51389297	sr:season:119847	sr:competitor:3036	sr:competitor:3011	\N	\N	not_started	30	sr:venue:2013	2025-04-19 17:00:00
sr:sport_event:51389331	sr:season:119847	sr:competitor:2998	sr:competitor:49531	\N	\N	not_started	32	sr:venue:12069	2025-05-04 17:00:00
sr:sport_event:46655601	sr:season:114317	sr:competitor:6074	sr:competitor:3201	1	1	closed	3	sr:venue:15676	2024-05-25 20:30:00
sr:sport_event:51389037	sr:season:119847	sr:competitor:3002	sr:competitor:3011	\N	\N	not_started	19	sr:venue:907	2025-01-26 18:00:00
sr:sport_event:46655555	sr:season:114317	sr:competitor:3205	sr:competitor:3208	3	1	closed	1	sr:venue:12003	2024-05-13 22:00:00
sr:sport_event:51389291	sr:season:119847	sr:competitor:3013	sr:competitor:3010	\N	\N	not_started	30	sr:venue:1335	2025-04-19 17:00:00
sr:sport_event:51095497	sr:season:118699	sr:competitor:21	sr:competitor:27	1	1	closed	16	sr:venue:3002	2024-11-23 15:00:00
sr:sport_event:51095037	sr:season:118699	sr:competitor:27	sr:competitor:263	2	3	closed	7	sr:venue:852	2024-09-28 11:30:00
sr:sport_event:51096171	sr:season:118699	sr:competitor:95	sr:competitor:72	\N	\N	not_started	28	sr:venue:2366	2025-01-21 19:45:00
sr:sport_event:51095129	sr:season:118699	sr:competitor:41	sr:competitor:27	2	0	closed	8	sr:venue:851	2024-10-01 18:45:00
sr:sport_event:51094923	sr:season:118699	sr:competitor:263	sr:competitor:46	2	2	closed	2	sr:venue:2221	2024-08-17 14:00:00
sr:sport_event:46655631	sr:season:114317	sr:competitor:65668	sr:competitor:7629	0	2	closed	4	sr:venue:69401	2024-06-04 18:00:00
sr:sport_event:51095001	sr:season:118699	sr:competitor:71	sr:competitor:41	3	2	closed	5	sr:venue:660	2024-09-14 14:00:00
sr:sport_event:51094955	sr:season:118699	sr:competitor:29	sr:competitor:8	1	2	closed	3	sr:venue:1135	2024-08-24 14:00:00
sr:sport_event:51095757	sr:season:118699	sr:competitor:15	sr:competitor:71	\N	\N	not_started	21	sr:venue:598	2024-12-14 15:00:00
sr:sport_event:51096579	sr:season:118699	sr:competitor:74	sr:competitor:71	\N	\N	not_started	41	sr:venue:1689	2025-04-09 18:45:00
sr:sport_event:51096143	sr:season:118699	sr:competitor:95	sr:competitor:46	\N	\N	not_started	27	sr:venue:2366	2025-01-18 15:00:00
sr:sport_event:51095633	sr:season:118699	sr:competitor:34	sr:competitor:27	\N	\N	not_started	19	sr:venue:2223	2024-12-07 12:30:00
sr:sport_event:51095429	sr:season:118699	sr:competitor:96	sr:competitor:8	1	2	closed	15	sr:venue:1138	2024-11-10 13:00:00
sr:sport_event:51095817	sr:season:118699	sr:competitor:41	sr:competitor:263	\N	\N	not_started	22	sr:venue:851	2024-12-21 15:00:00
sr:sport_event:51096573	sr:season:118699	sr:competitor:11	sr:competitor:2	\N	\N	not_started	41	sr:venue:2194	2025-04-09 18:45:00
sr:sport_event:46655669	sr:season:114317	sr:competitor:36833	sr:competitor:36839	1	1	closed	5	sr:venue:12017	2024-06-15 23:30:00
sr:sport_event:51388861	sr:season:119847	sr:competitor:49531	sr:competitor:3001	0	3	closed	9	sr:venue:16520	2024-10-26 19:30:00
sr:sport_event:51096313	sr:season:118699	sr:competitor:263	sr:competitor:29	\N	\N	not_started	34	sr:venue:2221	2025-02-22 15:00:00
sr:sport_event:51096273	sr:season:118699	sr:competitor:6	sr:competitor:96	\N	\N	not_started	32	sr:venue:806	2025-02-12 19:45:00
sr:sport_event:51095531	sr:season:118699	sr:competitor:263	sr:competitor:71	6	1	closed	17	sr:venue:2221	2024-11-26 19:45:00
sr:sport_event:51096239	sr:season:118699	sr:competitor:11	sr:competitor:34	\N	\N	not_started	31	sr:venue:2194	2025-02-08 15:00:00
sr:sport_event:51096403	sr:season:118699	sr:competitor:58	sr:competitor:263	\N	\N	not_started	38	sr:venue:2505	2025-03-15 15:00:00
sr:sport_event:51095603	sr:season:118699	sr:competitor:15	sr:competitor:41	\N	\N	not_started	18	sr:venue:598	2024-11-29 20:00:00
sr:sport_event:51095591	sr:season:118699	sr:competitor:263	sr:competitor:72	\N	\N	not_started	18	sr:venue:2221	2024-11-30 15:00:00
sr:sport_event:51096845	sr:season:118699	sr:competitor:15	sr:competitor:61	\N	\N	not_started	43	sr:venue:598	2025-04-18 14:00:00
sr:sport_event:51096383	sr:season:118699	sr:competitor:36	sr:competitor:1	\N	\N	not_started	37	sr:venue:743	2025-03-11 19:45:00
sr:sport_event:51096213	sr:season:118699	sr:competitor:96	sr:competitor:29	\N	\N	not_started	30	sr:venue:1138	2025-02-01 15:00:00
sr:sport_event:51095709	sr:season:118699	sr:competitor:96	sr:competitor:24	\N	\N	not_started	20	sr:venue:1138	2024-12-11 19:45:00
sr:sport_event:51095625	sr:season:118699	sr:competitor:61	sr:competitor:24	\N	\N	not_started	19	sr:venue:1514	2024-12-07 15:00:00
sr:sport_event:51096891	sr:season:118699	sr:competitor:34	sr:competitor:58	\N	\N	not_started	45	sr:venue:2223	2025-04-26 14:00:00
sr:sport_event:51096929	sr:season:118699	sr:competitor:263	sr:competitor:61	\N	\N	not_started	46	sr:venue:2221	2025-05-03 14:00:00
sr:sport_event:51094935	sr:season:118699	sr:competitor:24	sr:competitor:29	3	0	closed	2	sr:venue:813	2024-08-17 14:00:00
sr:sport_event:51095141	sr:season:118699	sr:competitor:58	sr:competitor:61	1	1	closed	9	sr:venue:2505	2024-10-06 14:00:00
sr:sport_event:51388965	sr:season:119847	sr:competitor:744135	sr:competitor:3036	\N	\N	not_started	15	sr:venue:53523	2024-12-23 20:45:00
sr:sport_event:51388765	sr:season:119847	sr:competitor:3001	sr:competitor:3002	2	0	closed	4	sr:venue:910	2024-08-31 19:30:00
sr:sport_event:46655591	sr:season:114317	sr:competitor:3203	sr:competitor:65676	2	1	closed	3	sr:venue:4750	2024-05-25 00:15:00
sr:sport_event:51389293	sr:season:119847	sr:competitor:3001	sr:competitor:3014	\N	\N	not_started	30	sr:venue:910	2025-04-19 17:00:00
sr:sport_event:51388995	sr:season:119847	sr:competitor:3006	sr:competitor:2999	\N	\N	not_started	17	sr:venue:902	2025-01-05 18:00:00
sr:sport_event:51389085	sr:season:119847	sr:competitor:3009	sr:competitor:2999	\N	\N	not_started	22	sr:venue:1137	2025-02-16 18:00:00
sr:sport_event:51389347	sr:season:119847	sr:competitor:3009	sr:competitor:2998	\N	\N	not_started	33	sr:venue:1137	2025-05-11 17:00:00
sr:sport_event:51389317	sr:season:119847	sr:competitor:744135	sr:competitor:3002	\N	\N	not_started	31	sr:venue:53523	2025-04-27 17:00:00
sr:sport_event:51389173	sr:season:119847	sr:competitor:49531	sr:competitor:3014	\N	\N	not_started	23	sr:venue:16520	2025-02-23 18:00:00
sr:sport_event:51389359	sr:season:119847	sr:competitor:3001	sr:competitor:3009	\N	\N	not_started	34	sr:venue:910	2025-05-17 17:00:00
sr:sport_event:51389213	sr:season:119847	sr:competitor:3036	sr:competitor:3006	\N	\N	not_started	26	sr:venue:2013	2025-03-16 18:00:00
sr:sport_event:51388839	sr:season:119847	sr:competitor:3001	sr:competitor:36365	2	0	closed	8	sr:venue:910	2024-10-05 19:30:00
sr:sport_event:51389279	sr:season:119847	sr:competitor:36365	sr:competitor:3002	\N	\N	not_started	29	sr:venue:43626	2025-04-13 17:00:00
sr:sport_event:51094997	sr:season:118699	sr:competitor:25	sr:competitor:72	0	1	closed	5	sr:venue:2352	2024-09-14 11:30:00
sr:sport_event:51095479	sr:season:118699	sr:competitor:72	sr:competitor:96	1	0	closed	16	sr:venue:2178	2024-11-23 15:00:00
sr:sport_event:51095265	sr:season:118699	sr:competitor:11	sr:competitor:72	3	2	closed	12	sr:venue:2194	2024-10-26 11:30:00
sr:sport_event:51095313	sr:season:118699	sr:competitor:61	sr:competitor:263	2	1	closed	13	sr:venue:1514	2024-11-02 15:00:00
sr:sport_event:51095693	sr:season:118699	sr:competitor:2	sr:competitor:263	\N	\N	not_started	20	sr:venue:638	2024-12-10 19:45:00
sr:sport_event:51096481	sr:season:118699	sr:competitor:263	sr:competitor:41	\N	\N	not_started	41	sr:venue:2221	2025-04-08 18:45:00
sr:sport_event:51389167	sr:season:119847	sr:competitor:25777	sr:competitor:2998	\N	\N	not_started	23	sr:venue:8289	2025-02-23 18:00:00
sr:sport_event:46655577	sr:season:114317	sr:competitor:65668	sr:competitor:42338	1	1	closed	2	sr:venue:69401	2024-05-19 18:00:00
sr:sport_event:51094837	sr:season:118699	sr:competitor:11	sr:competitor:95	3	2	closed	2	sr:venue:2194	2024-08-16 19:00:00
sr:sport_event:46655683	sr:season:114317	sr:competitor:4937	sr:competitor:3209	3	1	closed	6	sr:venue:2388	2024-07-19 00:00:00
sr:sport_event:51095041	sr:season:118699	sr:competitor:34	sr:competitor:11	3	0	closed	7	sr:venue:2223	2024-09-28 14:00:00
sr:sport_event:51095951	sr:season:118699	sr:competitor:25	sr:competitor:95	\N	\N	not_started	25	sr:venue:2352	2025-01-01 13:00:00
sr:sport_event:51096449	sr:season:118699	sr:competitor:24	sr:competitor:71	\N	\N	not_started	39	sr:venue:813	2025-03-29 15:00:00
sr:sport_event:51095269	sr:season:118699	sr:competitor:27	sr:competitor:96	1	1	closed	12	sr:venue:852	2024-10-26 14:00:00
sr:sport_event:51095377	sr:season:118699	sr:competitor:1	sr:competitor:36	1	4	closed	14	sr:venue:1693	2024-11-05 19:45:00
sr:sport_event:51096217	sr:season:118699	sr:competitor:36	sr:competitor:41	\N	\N	postponed	30	sr:venue:743	2025-02-01 15:00:00
sr:sport_event:51095671	sr:season:118699	sr:competitor:6	sr:competitor:27	\N	\N	not_started	20	sr:venue:806	2024-12-10 19:45:00
sr:sport_event:51096175	sr:season:118699	sr:competitor:24	sr:competitor:21	\N	\N	not_started	28	sr:venue:813	2025-01-21 19:45:00
sr:sport_event:51096187	sr:season:118699	sr:competitor:6	sr:competitor:34	\N	\N	postponed	29	sr:venue:806	2024-11-27 20:00:00
sr:sport_event:51096203	sr:season:118699	sr:competitor:29	sr:competitor:95	\N	\N	not_started	29	sr:venue:1135	2025-01-25 12:30:00
sr:sport_event:51096199	sr:season:118699	sr:competitor:1	sr:competitor:12	\N	\N	not_started	29	sr:venue:1693	2025-01-25 15:00:00
sr:sport_event:51095069	sr:season:118699	sr:competitor:15	sr:competitor:74	1	0	closed	8	sr:venue:598	2024-10-02 18:45:00
sr:sport_event:51096209	sr:season:118699	sr:competitor:46	sr:competitor:21	\N	\N	not_started	30	sr:venue:631	2025-01-31 20:00:00
sr:sport_event:51096591	sr:season:118699	sr:competitor:25	sr:competitor:36	\N	\N	not_started	42	sr:venue:2352	2025-04-12 14:00:00
sr:sport_event:46655625	sr:season:114317	sr:competitor:36839	sr:competitor:3209	0	0	closed	4	sr:venue:12025	2024-06-04 00:15:00
sr:sport_event:51096359	sr:season:118699	sr:competitor:27	sr:competitor:46	\N	\N	not_started	36	sr:venue:852	2025-03-08 15:00:00
sr:sport_event:51096337	sr:season:118699	sr:competitor:72	sr:competitor:2	\N	\N	not_started	35	sr:venue:2178	2025-03-01 15:00:00
sr:sport_event:51096441	sr:season:118699	sr:competitor:2	sr:competitor:46	\N	\N	not_started	39	sr:venue:638	2025-03-29 15:00:00
sr:sport_event:51096243	sr:season:118699	sr:competitor:263	sr:competitor:27	\N	\N	not_started	31	sr:venue:2221	2025-02-08 15:00:00
sr:sport_event:51096005	sr:season:118699	sr:competitor:1	sr:competitor:72	\N	\N	postponed	26	sr:venue:1693	2025-01-04 15:00:00
sr:sport_event:51096841	sr:season:118699	sr:competitor:1	sr:competitor:58	\N	\N	not_started	42	sr:venue:1693	2025-04-12 14:00:00
sr:sport_event:51096865	sr:season:118699	sr:competitor:95	sr:competitor:34	\N	\N	not_started	43	sr:venue:2366	2025-04-18 14:00:00
sr:sport_event:51094931	sr:season:118699	sr:competitor:41	sr:competitor:12	4	0	closed	2	sr:venue:851	2024-08-18 11:00:00
sr:sport_event:51389025	sr:season:119847	sr:competitor:3036	sr:competitor:3001	\N	\N	not_started	18	sr:venue:2013	2025-01-19 18:00:00
sr:sport_event:46655659	sr:season:114317	sr:competitor:3204	sr:competitor:3201	2	1	closed	5	sr:venue:4754	2024-06-15 19:00:00
sr:sport_event:51095167	sr:season:118699	sr:competitor:61	sr:competitor:71	5	0	closed	10	sr:venue:1514	2024-10-19 11:30:00
sr:sport_event:51388907	sr:season:119847	sr:competitor:4500	sr:competitor:49531	\N	\N	not_started	12	sr:venue:5326	2024-12-01 15:30:00
sr:sport_event:46655539	sr:season:114317	sr:competitor:3216	sr:competitor:3217	3	2	closed	1	sr:venue:613	2024-05-11 00:15:00
sr:sport_event:51389215	sr:season:119847	sr:competitor:2998	sr:competitor:2999	\N	\N	not_started	26	sr:venue:12069	2025-03-16 18:00:00
sr:sport_event:51389363	sr:season:119847	sr:competitor:3036	sr:competitor:3010	\N	\N	not_started	34	sr:venue:2013	2025-05-17 17:00:00
sr:sport_event:51389027	sr:season:119847	sr:competitor:3010	sr:competitor:3002	\N	\N	not_started	18	sr:venue:2539	2025-01-19 18:00:00
sr:sport_event:51389221	sr:season:119847	sr:competitor:3009	sr:competitor:744135	\N	\N	not_started	26	sr:venue:1137	2025-03-16 18:00:00
sr:sport_event:51389237	sr:season:119847	sr:competitor:49531	sr:competitor:1031053	\N	\N	not_started	27	sr:venue:16520	2025-03-30 17:00:00
sr:sport_event:51389295	sr:season:119847	sr:competitor:3002	sr:competitor:49531	\N	\N	not_started	30	sr:venue:907	2025-04-19 17:00:00
sr:sport_event:51389049	sr:season:119847	sr:competitor:744135	sr:competitor:3006	\N	\N	not_started	20	sr:venue:53523	2025-02-02 18:00:00
sr:sport_event:51388833	sr:season:119847	sr:competitor:3013	sr:competitor:3006	\N	\N	postponed	8	sr:venue:1335	2024-10-06 17:00:00
sr:sport_event:50955525	sr:season:119835	sr:competitor:1642	sr:competitor:1715	3	1	closed	11	sr:venue:1275	2024-11-10 16:00:00
sr:sport_event:46655559	sr:season:114317	sr:competitor:3209	sr:competitor:3210	1	3	closed	1	sr:venue:1099	2024-05-11 20:30:00
sr:sport_event:46655597	sr:season:114317	sr:competitor:191648	sr:competitor:3217	0	2	closed	3	sr:venue:17150	2024-05-24 18:30:00
sr:sport_event:51095195	sr:season:118699	sr:competitor:1	sr:competitor:2	1	2	closed	10	sr:venue:1693	2024-10-19 14:00:00
sr:sport_event:51095011	sr:season:118699	sr:competitor:58	sr:competitor:95	2	1	closed	6	sr:venue:2505	2024-09-21 14:00:00
sr:sport_event:51096871	sr:season:118699	sr:competitor:41	sr:competitor:46	\N	\N	not_started	44	sr:venue:851	2025-04-21 14:00:00
sr:sport_event:51094929	sr:season:118699	sr:competitor:15	sr:competitor:1	2	2	closed	2	sr:venue:598	2024-08-17 14:00:00
sr:sport_event:51389061	sr:season:119847	sr:competitor:3009	sr:competitor:1031053	\N	\N	not_started	20	sr:venue:1137	2025-02-02 18:00:00
sr:sport_event:51092183	sr:season:118699	sr:competitor:95	sr:competitor:263	2	0	closed	1	sr:venue:2366	2024-08-10 11:30:00
sr:sport_event:51095501	sr:season:118699	sr:competitor:1	sr:competitor:29	1	1	closed	16	sr:venue:1693	2024-11-23 15:00:00
sr:sport_event:51095043	sr:season:118699	sr:competitor:36	sr:competitor:29	2	0	closed	7	sr:venue:743	2024-09-28 14:00:00
sr:sport_event:51095967	sr:season:118699	sr:competitor:12	sr:competitor:27	\N	\N	not_started	25	sr:venue:2547	2025-01-01 15:00:00
sr:sport_event:51096165	sr:season:118699	sr:competitor:96	sr:competitor:1	\N	\N	not_started	28	sr:venue:1138	2025-01-21 19:45:00
sr:sport_event:51095401	sr:season:118699	sr:competitor:11	sr:competitor:27	1	2	closed	14	sr:venue:2194	2024-11-06 19:45:00
sr:sport_event:51096321	sr:season:118699	sr:competitor:41	sr:competitor:96	\N	\N	not_started	34	sr:venue:851	2025-02-22 12:30:00
sr:sport_event:51095581	sr:season:118699	sr:competitor:27	sr:competitor:12	\N	\N	not_started	18	sr:venue:852	2024-12-01 15:00:00
sr:sport_event:51096201	sr:season:118699	sr:competitor:15	sr:competitor:96	\N	\N	not_started	29	sr:venue:598	2025-01-24 20:00:00
sr:sport_event:51389339	sr:season:119847	sr:competitor:3011	sr:competitor:49531	\N	\N	not_started	33	sr:venue:5318	2025-05-11 17:00:00
sr:sport_event:51096353	sr:season:118699	sr:competitor:58	sr:competitor:96	\N	\N	not_started	36	sr:venue:2505	2025-03-08 15:00:00
sr:sport_event:51095175	sr:season:118699	sr:competitor:72	sr:competitor:24	3	0	closed	10	sr:venue:2178	2024-10-19 11:30:00
sr:sport_event:51095769	sr:season:118699	sr:competitor:24	sr:competitor:8	\N	\N	not_started	21	sr:venue:813	2024-12-15 14:00:00
sr:sport_event:51096855	sr:season:118699	sr:competitor:263	sr:competitor:2	\N	\N	not_started	43	sr:venue:2221	2025-04-18 14:00:00
sr:sport_event:51095295	sr:season:118699	sr:competitor:74	sr:competitor:25	0	1	closed	12	sr:venue:1689	2024-10-26 14:00:00
sr:sport_event:51096439	sr:season:118699	sr:competitor:263	sr:competitor:8	\N	\N	not_started	39	sr:venue:2221	2025-03-29 15:00:00
sr:sport_event:55549257	sr:season:118699	sr:competitor:36	sr:competitor:41	\N	\N	not_started	30	sr:venue:743	2025-02-03 20:00:00
sr:sport_event:51096909	sr:season:118699	sr:competitor:61	sr:competitor:8	\N	\N	not_started	45	sr:venue:1514	2025-04-26 14:00:00
sr:sport_event:51096339	sr:season:118699	sr:competitor:36	sr:competitor:27	\N	\N	not_started	35	sr:venue:743	2025-03-01 15:00:00
sr:sport_event:51096235	sr:season:118699	sr:competitor:6	sr:competitor:95	\N	\N	not_started	31	sr:venue:806	2025-02-08 15:00:00
sr:sport_event:51095907	sr:season:118699	sr:competitor:21	sr:competitor:12	\N	\N	not_started	24	sr:venue:3002	2024-12-29 12:30:00
sr:sport_event:51095675	sr:season:118699	sr:competitor:34	sr:competitor:36	\N	\N	not_started	20	sr:venue:2223	2024-12-10 20:00:00
sr:sport_event:51095475	sr:season:118699	sr:competitor:11	sr:competitor:15	2	2	closed	16	sr:venue:2194	2024-11-23 12:30:00
sr:sport_event:51096427	sr:season:118699	sr:competitor:6	sr:competitor:58	\N	\N	not_started	39	sr:venue:806	2025-03-29 15:00:00
sr:sport_event:51096455	sr:season:118699	sr:competitor:11	sr:competitor:6	\N	\N	not_started	40	sr:venue:2194	2025-04-05 14:00:00
sr:sport_event:51095877	sr:season:118699	sr:competitor:46	sr:competitor:96	\N	\N	not_started	24	sr:venue:631	2024-12-29 15:00:00
sr:sport_event:51094979	sr:season:118699	sr:competitor:71	sr:competitor:29	0	1	closed	4	sr:venue:660	2024-08-31 14:00:00
sr:sport_event:51095143	sr:season:118699	sr:competitor:6	sr:competitor:21	0	0	closed	9	sr:venue:806	2024-10-05 11:30:00
sr:sport_event:51389345	sr:season:119847	sr:competitor:3014	sr:competitor:4500	\N	\N	not_started	33	sr:venue:5312	2025-05-11 17:00:00
sr:sport_event:51389235	sr:season:119847	sr:competitor:3014	sr:competitor:3009	\N	\N	not_started	27	sr:venue:5312	2025-03-30 17:00:00
sr:sport_event:51389255	sr:season:119847	sr:competitor:2998	sr:competitor:36365	\N	\N	not_started	28	sr:venue:12069	2025-04-06 17:00:00
sr:sport_event:51389175	sr:season:119847	sr:competitor:1031053	sr:competitor:3001	\N	\N	not_started	23	sr:venue:8249	2025-02-23 18:00:00
sr:sport_event:51389193	sr:season:119847	sr:competitor:2995	sr:competitor:3011	\N	\N	not_started	24	sr:venue:14556	2025-03-02 18:00:00
sr:sport_event:51389353	sr:season:119847	sr:competitor:2995	sr:competitor:3002	\N	\N	not_started	33	sr:venue:14556	2025-05-11 17:00:00
sr:sport_event:51389005	sr:season:119847	sr:competitor:3013	sr:competitor:3002	\N	\N	not_started	17	sr:venue:1335	2025-01-05 18:00:00
sr:sport_event:51389371	sr:season:119847	sr:competitor:25777	sr:competitor:2995	\N	\N	not_started	34	sr:venue:8289	2025-05-17 17:00:00
sr:sport_event:51388749	sr:season:119847	sr:competitor:4500	sr:competitor:3010	0	0	closed	3	sr:venue:5326	2024-08-25 17:00:00
sr:sport_event:46655599	sr:season:114317	sr:competitor:3218	sr:competitor:3206	2	1	closed	3	sr:venue:981	2024-05-25 00:15:00
sr:sport_event:51095287	sr:season:118699	sr:competitor:15	sr:competitor:29	2	0	closed	12	sr:venue:598	2024-10-26 14:00:00
sr:sport_event:51389223	sr:season:119847	sr:competitor:3001	sr:competitor:49531	\N	\N	not_started	26	sr:venue:910	2025-03-16 18:00:00
sr:sport_event:51094949	sr:season:118699	sr:competitor:21	sr:competitor:72	1	0	closed	3	sr:venue:3002	2024-08-24 14:00:00
sr:sport_event:51096287	sr:season:118699	sr:competitor:34	sr:competitor:41	\N	\N	postponed	33	sr:venue:2223	2024-11-17 20:00:00
sr:sport_event:51095387	sr:season:118699	sr:competitor:74	sr:competitor:24	1	0	closed	14	sr:venue:1689	2024-11-05 20:00:00
sr:sport_event:51095325	sr:season:118699	sr:competitor:72	sr:competitor:8	1	1	closed	13	sr:venue:2178	2024-11-01 20:00:00
sr:sport_event:51388943	sr:season:119847	sr:competitor:2998	sr:competitor:3010	\N	\N	not_started	14	sr:venue:12069	2024-12-14 15:30:00
sr:sport_event:51388769	sr:season:119847	sr:competitor:3036	sr:competitor:25777	1	0	closed	4	sr:venue:2013	2024-09-01 17:00:00
sr:sport_event:49973577	sr:season:114317	sr:competitor:3211	sr:competitor:3203	3	0	closed	2	sr:venue:1009	2024-05-18 21:00:00
sr:sport_event:51095903	sr:season:118699	sr:competitor:95	sr:competitor:71	\N	\N	not_started	24	sr:venue:2366	2024-12-29 15:00:00
sr:sport_event:51096231	sr:season:118699	sr:competitor:24	sr:competitor:263	\N	\N	not_started	30	sr:venue:813	2025-02-01 12:30:00
sr:sport_event:51096835	sr:season:118699	sr:competitor:8	sr:competitor:24	\N	\N	not_started	42	sr:venue:1136	2025-04-12 14:00:00
sr:sport_event:55549267	sr:season:118699	sr:competitor:34	sr:competitor:41	\N	\N	not_started	33	sr:venue:2223	2025-02-17 20:00:00
sr:sport_event:51096169	sr:season:118699	sr:competitor:25	sr:competitor:61	\N	\N	not_started	28	sr:venue:2352	2025-01-21 20:00:00
sr:sport_event:46655719	sr:season:114317	sr:competitor:3212	sr:competitor:36842	0	0	closed	7	sr:venue:1567	2024-07-23 21:45:00
sr:sport_event:51095813	sr:season:118699	sr:competitor:12	sr:competitor:29	\N	\N	not_started	22	sr:venue:2547	2024-12-21 12:30:00
sr:sport_event:51096463	sr:season:118699	sr:competitor:71	sr:competitor:263	\N	\N	not_started	40	sr:venue:660	2025-04-05 14:00:00
sr:sport_event:51096185	sr:season:118699	sr:competitor:58	sr:competitor:46	\N	\N	not_started	29	sr:venue:2505	2025-01-25 15:00:00
sr:sport_event:51095355	sr:season:118699	sr:competitor:29	sr:competitor:27	2	1	closed	13	sr:venue:1135	2024-11-02 12:30:00
sr:sport_event:51095561	sr:season:118699	sr:competitor:36	sr:competitor:46	0	1	closed	17	sr:venue:743	2024-11-27 19:45:00
sr:sport_event:51096417	sr:season:118699	sr:competitor:21	sr:competitor:2	\N	\N	not_started	38	sr:venue:3002	2025-03-15 15:00:00
sr:sport_event:51096237	sr:season:118699	sr:competitor:61	sr:competitor:96	\N	\N	not_started	31	sr:venue:1514	2025-02-08 15:00:00
sr:sport_event:51096351	sr:season:118699	sr:competitor:29	sr:competitor:24	\N	\N	not_started	35	sr:venue:1135	2025-03-01 15:00:00
sr:sport_event:51096309	sr:season:118699	sr:competitor:11	sr:competitor:21	\N	\N	not_started	34	sr:venue:2194	2025-02-22 15:00:00
sr:sport_event:51096429	sr:season:118699	sr:competitor:61	sr:competitor:12	\N	\N	not_started	39	sr:venue:1514	2025-03-29 15:00:00
sr:sport_event:51096371	sr:season:118699	sr:competitor:74	sr:competitor:36	\N	\N	not_started	36	sr:venue:1689	2025-03-08 15:00:00
sr:sport_event:51095971	sr:season:118699	sr:competitor:41	sr:competitor:15	\N	\N	not_started	25	sr:venue:851	2025-01-01 20:00:00
sr:sport_event:51095207	sr:season:118699	sr:competitor:61	sr:competitor:2	2	0	closed	11	sr:venue:1514	2024-10-22 18:45:00
sr:sport_event:51096263	sr:season:118699	sr:competitor:263	sr:competitor:21	\N	\N	not_started	32	sr:venue:2221	2025-02-11 20:00:00
sr:sport_event:51092203	sr:season:118699	sr:competitor:96	sr:competitor:58	1	1	closed	1	sr:venue:1138	2024-08-10 11:30:00
sr:sport_event:51096587	sr:season:118699	sr:competitor:34	sr:competitor:21	\N	\N	not_started	42	sr:venue:2223	2025-04-12 14:00:00
sr:sport_event:51095727	sr:season:118699	sr:competitor:58	sr:competitor:1	\N	\N	not_started	21	sr:venue:2505	2024-12-14 12:30:00
sr:sport_event:51096477	sr:season:118699	sr:competitor:58	sr:competitor:8	\N	\N	not_started	41	sr:venue:2505	2025-04-08 18:45:00
sr:sport_event:51096913	sr:season:118699	sr:competitor:25	sr:competitor:74	\N	\N	not_started	45	sr:venue:2352	2025-04-26 14:00:00
sr:sport_event:51095053	sr:season:118699	sr:competitor:12	sr:competitor:8	3	2	closed	7	sr:venue:2547	2024-09-28 11:30:00
sr:sport_event:51389071	sr:season:119847	sr:competitor:2999	sr:competitor:3010	\N	\N	not_started	21	sr:venue:951	2025-02-09 18:00:00
sr:sport_event:51094957	sr:season:118699	sr:competitor:41	sr:competitor:6	1	0	closed	3	sr:venue:851	2024-08-24 14:00:00
sr:sport_event:51096869	sr:season:118699	sr:competitor:8	sr:competitor:27	\N	\N	not_started	44	sr:venue:1136	2025-04-21 14:00:00
sr:sport_event:51095941	sr:season:118699	sr:competitor:34	sr:competitor:46	\N	\N	not_started	25	sr:venue:2223	2025-01-01 15:00:00
sr:sport_event:51095149	sr:season:118699	sr:competitor:263	sr:competitor:96	4	0	closed	9	sr:venue:2221	2024-10-05 11:30:00
sr:sport_event:51388933	sr:season:119847	sr:competitor:49531	sr:competitor:3002	\N	\N	not_started	13	sr:venue:16520	2024-12-07 20:30:00
sr:sport_event:51389277	sr:season:119847	sr:competitor:2995	sr:competitor:3013	\N	\N	not_started	29	sr:venue:14556	2025-04-13 17:00:00
sr:sport_event:51388877	sr:season:119847	sr:competitor:3036	sr:competitor:36365	2	2	closed	10	sr:venue:2013	2024-11-02 15:30:00
sr:sport_event:51389241	sr:season:119847	sr:competitor:2995	sr:competitor:3010	\N	\N	not_started	27	sr:venue:14556	2025-03-30 17:00:00
sr:sport_event:51389245	sr:season:119847	sr:competitor:4500	sr:competitor:3002	\N	\N	not_started	27	sr:venue:5326	2025-03-30 17:00:00
sr:sport_event:51389333	sr:season:119847	sr:competitor:2999	sr:competitor:3011	\N	\N	not_started	32	sr:venue:951	2025-05-04 17:00:00
sr:sport_event:51389337	sr:season:119847	sr:competitor:1031053	sr:competitor:2995	\N	\N	not_started	32	sr:venue:8249	2025-05-04 17:00:00
sr:sport_event:51389365	sr:season:119847	sr:competitor:4500	sr:competitor:744135	\N	\N	not_started	34	sr:venue:5326	2025-05-17 17:00:00
sr:sport_event:51388923	sr:season:119847	sr:competitor:3006	sr:competitor:3009	\N	\N	not_started	13	sr:venue:902	2024-12-07 18:00:00
sr:sport_event:51094925	sr:season:118699	sr:competitor:71	sr:competitor:96	1	1	closed	2	sr:venue:660	2024-08-17 14:00:00
sr:sport_event:46655581	sr:season:114317	sr:competitor:3201	sr:competitor:3218	1	1	closed	2	sr:venue:14324	2024-05-20 22:00:00
sr:sport_event:46655619	sr:season:114317	sr:competitor:65676	sr:competitor:3210	2	4	closed	4	sr:venue:49307	2024-06-02 21:00:00
sr:sport_event:51095017	sr:season:118699	sr:competitor:11	sr:competitor:74	1	2	closed	6	sr:venue:2194	2024-09-21 14:00:00
sr:sport_event:46655623	sr:season:114317	sr:competitor:3208	sr:competitor:36833	1	1	closed	4	sr:venue:1079	2024-06-01 23:15:00
sr:sport_event:51094967	sr:season:118699	sr:competitor:11	sr:competitor:263	0	1	closed	4	sr:venue:2194	2024-08-31 11:30:00
sr:sport_event:51094959	sr:season:118699	sr:competitor:74	sr:competitor:61	1	1	closed	3	sr:venue:1689	2024-08-25 14:00:00
sr:sport_event:51095343	sr:season:118699	sr:competitor:21	sr:competitor:58	1	3	closed	13	sr:venue:3002	2024-11-02 15:00:00
sr:sport_event:51095487	sr:season:118699	sr:competitor:95	sr:competitor:36	2	6	closed	16	sr:venue:2366	2024-11-23 15:00:00
sr:sport_event:51388925	sr:season:119847	sr:competitor:2999	sr:competitor:4500	\N	\N	not_started	13	sr:venue:951	2024-12-06 20:15:00
sr:sport_event:51389017	sr:season:119847	sr:competitor:3014	sr:competitor:2998	\N	\N	not_started	18	sr:venue:5312	2025-01-19 18:00:00
sr:sport_event:51095163	sr:season:118699	sr:competitor:8	sr:competitor:25	0	0	closed	9	sr:venue:1136	2024-10-05 14:00:00
sr:sport_event:51095731	sr:season:118699	sr:competitor:11	sr:competitor:96	\N	\N	not_started	21	sr:venue:2194	2024-12-14 12:30:00
sr:sport_event:51096327	sr:season:118699	sr:competitor:8	sr:competitor:95	\N	\N	not_started	34	sr:venue:1136	2025-02-22 15:00:00
sr:sport_event:51096311	sr:season:118699	sr:competitor:27	sr:competitor:25	\N	\N	not_started	34	sr:venue:852	2025-02-22 12:30:00
sr:sport_event:51095681	sr:season:118699	sr:competitor:72	sr:competitor:29	\N	\N	not_started	20	sr:venue:2178	2024-12-10 19:45:00
sr:sport_event:46655689	sr:season:114317	sr:competitor:3201	sr:competitor:7629	1	1	closed	6	sr:venue:14324	2024-07-20 18:00:00
sr:sport_event:51096393	sr:season:118699	sr:competitor:34	sr:competitor:25	\N	\N	not_started	37	sr:venue:2223	2025-03-12 19:45:00
sr:sport_event:51095417	sr:season:118699	sr:competitor:61	sr:competitor:46	1	3	closed	15	sr:venue:1514	2024-11-09 12:30:00
sr:sport_event:46655807	sr:season:114317	sr:competitor:3203	sr:competitor:3204	1	1	closed	10	sr:venue:4750	2024-08-09 22:00:00
sr:sport_event:51096161	sr:season:118699	sr:competitor:46	sr:competitor:11	\N	\N	not_started	28	sr:venue:631	2025-01-21 19:45:00
sr:sport_event:51096469	sr:season:118699	sr:competitor:12	sr:competitor:96	\N	\N	not_started	40	sr:venue:2547	2025-04-05 14:00:00
sr:sport_event:51095787	sr:season:118699	sr:competitor:34	sr:competitor:95	\N	\N	not_started	22	sr:venue:2223	2024-12-21 15:00:00
sr:sport_event:51095615	sr:season:118699	sr:competitor:24	sr:competitor:1	\N	\N	not_started	18	sr:venue:813	2024-11-30 12:30:00
sr:sport_event:51096035	sr:season:118699	sr:competitor:61	sr:competitor:74	\N	\N	not_started	27	sr:venue:1514	2025-01-18 12:30:00
sr:sport_event:51096183	sr:season:118699	sr:competitor:12	sr:competitor:58	\N	\N	not_started	28	sr:venue:2547	2025-01-22 19:45:00
sr:sport_event:51092181	sr:season:118699	sr:competitor:21	sr:competitor:15	0	2	closed	1	sr:venue:3002	2024-08-09 19:00:00
sr:sport_event:51096581	sr:season:118699	sr:competitor:6	sr:competitor:263	\N	\N	not_started	42	sr:venue:806	2025-04-12 14:00:00
sr:sport_event:51095183	sr:season:118699	sr:competitor:25	sr:competitor:27	1	1	closed	10	sr:venue:2352	2024-10-19 14:00:00
sr:sport_event:51096905	sr:season:118699	sr:competitor:72	sr:competitor:11	\N	\N	not_started	45	sr:venue:2178	2025-04-26 14:00:00
sr:sport_event:51096925	sr:season:118699	sr:competitor:2	sr:competitor:96	\N	\N	not_started	46	sr:venue:638	2025-05-03 14:00:00
sr:sport_event:51095997	sr:season:118699	sr:competitor:263	sr:competitor:11	\N	\N	not_started	26	sr:venue:2221	2025-01-04 15:00:00
sr:sport_event:51095825	sr:season:118699	sr:competitor:46	sr:competitor:41	\N	\N	not_started	23	sr:venue:631	2024-12-26 15:00:00
sr:sport_event:51096275	sr:season:118699	sr:competitor:15	sr:competitor:36	\N	\N	not_started	32	sr:venue:598	2025-02-12 20:00:00
sr:sport_event:51388899	sr:season:119847	sr:competitor:3014	sr:competitor:3010	3	2	closed	11	sr:venue:5312	2024-11-08 20:15:00
sr:sport_event:51095065	sr:season:118699	sr:competitor:72	sr:competitor:95	2	2	closed	8	sr:venue:2178	2024-10-01 18:45:00
sr:sport_event:51096295	sr:season:118699	sr:competitor:95	sr:competitor:2	\N	\N	not_started	33	sr:venue:2366	2025-02-15 12:30:00
sr:sport_event:51095891	sr:season:118699	sr:competitor:27	sr:competitor:34	\N	\N	not_started	24	sr:venue:852	2024-12-29 17:45:00
sr:sport_event:52358925	sr:season:118699	sr:competitor:8	sr:competitor:6	0	0	closed	14	sr:venue:1136	2024-11-07 20:00:00
sr:sport_event:51095783	sr:season:118699	sr:competitor:96	sr:competitor:74	\N	\N	not_started	22	sr:venue:1138	2024-12-21 12:30:00
sr:sport_event:51095809	sr:season:118699	sr:competitor:1	sr:competitor:21	\N	\N	not_started	22	sr:venue:1693	2024-12-21 15:00:00
sr:sport_event:51095421	sr:season:118699	sr:competitor:27	sr:competitor:71	1	1	closed	15	sr:venue:852	2024-11-09 15:00:00
sr:sport_event:51096023	sr:season:118699	sr:competitor:74	sr:competitor:8	\N	\N	not_started	26	sr:venue:1689	2025-01-04 12:30:00
sr:sport_event:51095829	sr:season:118699	sr:competitor:58	sr:competitor:72	\N	\N	not_started	23	sr:venue:2505	2024-12-26 15:00:00
sr:sport_event:51095365	sr:season:118699	sr:competitor:25	sr:competitor:34	1	0	closed	14	sr:venue:2352	2024-11-06 19:45:00
sr:sport_event:51092217	sr:season:118699	sr:competitor:1	sr:competitor:8	1	3	closed	1	sr:venue:1693	2024-08-10 11:30:00
sr:sport_event:51096221	sr:season:118699	sr:competitor:95	sr:competitor:58	\N	\N	not_started	30	sr:venue:2366	2025-02-01 12:30:00
sr:sport_event:51096333	sr:season:118699	sr:competitor:96	sr:competitor:71	\N	\N	not_started	35	sr:venue:1138	2025-03-01 15:00:00
sr:sport_event:51096317	sr:season:118699	sr:competitor:2	sr:competitor:1	\N	\N	not_started	34	sr:venue:638	2025-02-22 15:00:00
sr:sport_event:51096473	sr:season:118699	sr:competitor:8	sr:competitor:41	\N	\N	not_started	40	sr:venue:1136	2025-04-05 14:00:00
sr:sport_event:51095937	sr:season:118699	sr:competitor:96	sr:competitor:36	\N	\N	not_started	25	sr:venue:1138	2025-01-01 17:30:00
sr:sport_event:51094983	sr:season:118699	sr:competitor:15	sr:competitor:24	1	0	closed	4	sr:venue:598	2024-09-01 14:00:00
sr:sport_event:51095945	sr:season:118699	sr:competitor:72	sr:competitor:263	\N	\N	not_started	25	sr:venue:2178	2025-01-01 15:00:00
sr:sport_event:51096193	sr:season:118699	sr:competitor:72	sr:competitor:25	\N	\N	not_started	29	sr:venue:2178	2025-01-25 12:30:00
sr:sport_event:51096323	sr:season:118699	sr:competitor:74	sr:competitor:46	\N	\N	not_started	34	sr:venue:1689	2025-02-22 15:00:00
sr:sport_event:51096325	sr:season:118699	sr:competitor:24	sr:competitor:72	\N	\N	not_started	34	sr:venue:813	2025-02-23 12:00:00
sr:sport_event:51096147	sr:season:118699	sr:competitor:71	sr:competitor:1	\N	\N	not_started	27	sr:venue:660	2025-01-18 12:30:00
sr:sport_event:51096349	sr:season:118699	sr:competitor:12	sr:competitor:41	\N	\N	not_started	35	sr:venue:2547	2025-03-01 15:00:00
sr:sport_event:51096367	sr:season:118699	sr:competitor:15	sr:competitor:21	\N	\N	not_started	36	sr:venue:598	2025-03-08 15:00:00
sr:sport_event:51096197	sr:season:118699	sr:competitor:21	sr:competitor:36	\N	\N	not_started	29	sr:venue:3002	2025-01-25 15:00:00
sr:sport_event:51096887	sr:season:118699	sr:competitor:61	sr:competitor:95	\N	\N	not_started	44	sr:venue:1514	2025-04-21 14:00:00
sr:sport_event:51096935	sr:season:118699	sr:competitor:6	sr:competitor:25	\N	\N	not_started	46	sr:venue:806	2025-05-03 14:00:00
sr:sport_event:51095697	sr:season:118699	sr:competitor:12	sr:competitor:46	\N	\N	not_started	20	sr:venue:2547	2024-12-10 19:45:00
sr:sport_event:51096375	sr:season:118699	sr:competitor:8	sr:competitor:1	\N	\N	not_started	36	sr:venue:1136	2025-03-08 15:00:00
sr:sport_event:51095667	sr:season:118699	sr:competitor:8	sr:competitor:15	\N	\N	not_started	19	sr:venue:1136	2024-12-08 15:00:00
sr:sport_event:51095835	sr:season:118699	sr:competitor:11	sr:competitor:71	\N	\N	not_started	23	sr:venue:2194	2024-12-26 15:00:00
sr:sport_event:46655645	sr:season:114317	sr:competitor:3203	sr:competitor:3216	1	0	closed	4	sr:venue:4750	2024-06-01 23:15:00
sr:sport_event:51096399	sr:season:118699	sr:competitor:24	sr:competitor:74	\N	\N	not_started	37	sr:venue:813	2025-03-12 19:45:00
sr:sport_event:51096387	sr:season:118699	sr:competitor:29	sr:competitor:46	\N	\N	not_started	37	sr:venue:1135	2025-03-11 19:45:00
sr:sport_event:51096849	sr:season:118699	sr:competitor:74	sr:competitor:96	\N	\N	not_started	43	sr:venue:1689	2025-04-18 14:00:00
sr:sport_event:46655687	sr:season:114317	sr:competitor:36842	sr:competitor:3205	1	0	closed	6	sr:venue:15676	2024-07-18 22:00:00
sr:sport_event:51096127	sr:season:118699	sr:competitor:27	sr:competitor:24	\N	\N	not_started	27	sr:venue:852	2025-01-18 15:00:00
sr:sport_event:51096205	sr:season:118699	sr:competitor:41	sr:competitor:71	\N	\N	not_started	29	sr:venue:851	2025-01-25 15:00:00
sr:sport_event:51095573	sr:season:118699	sr:competitor:58	sr:competitor:71	\N	\N	not_started	18	sr:venue:2505	2024-11-30 15:00:00
sr:sport_event:51094947	sr:season:118699	sr:competitor:263	sr:competitor:15	1	1	closed	3	sr:venue:2221	2024-08-24 14:00:00
sr:sport_event:51095689	sr:season:118699	sr:competitor:71	sr:competitor:74	\N	\N	not_started	20	sr:venue:660	2024-12-10 19:45:00
sr:sport_event:51095651	sr:season:118699	sr:competitor:2	sr:competitor:58	\N	\N	not_started	19	sr:venue:638	2024-12-07 15:00:00
sr:sport_event:51096259	sr:season:118699	sr:competitor:11	sr:competitor:1	\N	\N	not_started	32	sr:venue:2194	2025-02-11 19:45:00
sr:sport_event:51094951	sr:season:118699	sr:competitor:1	sr:competitor:71	1	1	closed	3	sr:venue:1693	2024-08-24 11:30:00
sr:sport_event:51095009	sr:season:118699	sr:competitor:24	sr:competitor:11	1	1	closed	5	sr:venue:813	2024-09-14 14:00:00
sr:sport_event:51095031	sr:season:118699	sr:competitor:41	sr:competitor:36	1	0	closed	6	sr:venue:851	2024-09-21 11:30:00
sr:sport_event:51095057	sr:season:118699	sr:competitor:24	sr:competitor:41	2	1	closed	7	sr:venue:813	2024-09-28 14:00:00
sr:sport_event:51095547	sr:season:118699	sr:competitor:24	sr:competitor:58	1	0	closed	17	sr:venue:813	2024-11-26 19:45:00
sr:sport_event:51095795	sr:season:118699	sr:competitor:25	sr:competitor:46	\N	\N	not_started	22	sr:venue:2352	2024-12-21 15:00:00
sr:sport_event:51096585	sr:season:118699	sr:competitor:96	sr:competitor:11	\N	\N	not_started	42	sr:venue:1138	2025-04-12 14:00:00
sr:sport_event:55549269	sr:season:118699	sr:competitor:15	sr:competitor:34	\N	\N	not_started	34	sr:venue:598	2025-02-24 20:00:00
sr:sport_event:51096851	sr:season:118699	sr:competitor:24	sr:competitor:6	\N	\N	not_started	43	sr:venue:813	2025-04-18 14:00:00
sr:sport_event:46655801	sr:season:114317	sr:competitor:3217	sr:competitor:3212	1	0	closed	10	sr:venue:1329	2024-08-10 19:30:00
sr:sport_event:46655753	sr:season:114317	sr:competitor:3203	sr:competitor:6074	1	0	closed	8	sr:venue:4750	2024-07-30 00:00:00
sr:sport_event:46655783	sr:season:114317	sr:competitor:36837	sr:competitor:3219	0	1	closed	9	sr:venue:12712	2024-08-05 23:00:00
sr:sport_event:46655617	sr:season:114317	sr:competitor:3202	sr:competitor:3210	0	0	closed	3	sr:venue:44628	2024-05-25 23:00:00
sr:sport_event:46655785	sr:season:114317	sr:competitor:3208	sr:competitor:36839	3	0	closed	9	sr:venue:1079	2024-08-03 18:00:00
sr:sport_event:46655943	sr:season:114317	sr:competitor:3210	sr:competitor:3215	2	0	closed	15	sr:venue:2388	2024-09-22 20:00:00
sr:sport_event:46655767	sr:season:114317	sr:competitor:3204	sr:competitor:3211	0	0	closed	9	sr:venue:4754	2024-08-04 18:00:00
sr:sport_event:46655795	sr:season:114317	sr:competitor:36842	sr:competitor:3202	1	1	closed	10	sr:venue:12031	2024-08-10 21:45:00
sr:sport_event:46655889	sr:season:114317	sr:competitor:3210	sr:competitor:3206	1	0	closed	13	sr:venue:2388	2024-08-31 21:00:00
sr:sport_event:46655743	sr:season:114317	sr:competitor:3201	sr:competitor:3212	1	1	closed	8	sr:venue:14324	2024-07-27 20:00:00
sr:sport_event:46655699	sr:season:114317	sr:competitor:3203	sr:competitor:191648	2	1	closed	6	sr:venue:15676	2024-07-19 22:00:00
sr:sport_event:46655863	sr:season:114317	sr:competitor:3216	sr:competitor:7629	0	0	closed	12	sr:venue:613	2024-08-24 18:00:00
sr:sport_event:51094961	sr:season:118699	sr:competitor:24	sr:competitor:27	2	1	closed	3	sr:venue:813	2024-08-24 14:00:00
sr:sport_event:46655651	sr:season:114317	sr:competitor:191648	sr:competitor:3211	2	0	closed	5	sr:venue:17150	2024-06-13 18:00:00
sr:sport_event:51095933	sr:season:118699	sr:competitor:61	sr:competitor:11	\N	\N	not_started	25	sr:venue:1514	2025-01-01 15:00:00
sr:sport_event:51095339	sr:season:118699	sr:competitor:95	sr:competitor:74	1	2	closed	13	sr:venue:2366	2024-11-02 12:30:00
sr:sport_event:51095397	sr:season:118699	sr:competitor:46	sr:competitor:29	0	2	closed	14	sr:venue:631	2024-11-06 19:45:00
sr:sport_event:51096253	sr:season:118699	sr:competitor:41	sr:competitor:24	\N	\N	not_started	31	sr:venue:851	2025-02-08 12:30:00
sr:sport_event:51095509	sr:season:118699	sr:competitor:74	sr:competitor:34	3	4	closed	16	sr:venue:1689	2024-11-24 15:00:00
sr:sport_event:51095719	sr:season:118699	sr:competitor:8	sr:competitor:11	\N	\N	not_started	20	sr:venue:1136	2024-12-11 20:00:00
sr:sport_event:46655799	sr:season:114317	sr:competitor:3206	sr:competitor:3209	0	2	closed	10	sr:venue:1007	2024-08-11 23:00:00
sr:sport_event:51095985	sr:season:118699	sr:competitor:58	sr:competitor:27	\N	\N	not_started	26	sr:venue:2505	2025-01-04 15:00:00
sr:sport_event:51096229	sr:season:118699	sr:competitor:74	sr:competitor:11	\N	\N	not_started	30	sr:venue:1689	2025-02-01 15:00:00
sr:sport_event:51096135	sr:season:118699	sr:competitor:72	sr:competitor:21	\N	\N	not_started	27	sr:venue:2178	2025-01-18 15:00:00
sr:sport_event:51096269	sr:season:118699	sr:competitor:74	sr:competitor:12	\N	\N	not_started	32	sr:venue:1689	2025-02-12 19:45:00
sr:sport_event:51096279	sr:season:118699	sr:competitor:8	sr:competitor:46	\N	\N	not_started	32	sr:venue:1136	2025-02-12 20:00:00
sr:sport_event:51096401	sr:season:118699	sr:competitor:46	sr:competitor:61	\N	\N	not_started	38	sr:venue:631	2025-03-15 15:00:00
sr:sport_event:51096307	sr:season:118699	sr:competitor:6	sr:competitor:12	\N	\N	not_started	34	sr:venue:806	2025-02-21 20:00:00
sr:sport_event:51096409	sr:season:118699	sr:competitor:25	sr:competitor:29	\N	\N	not_started	38	sr:venue:2352	2025-03-15 15:00:00
sr:sport_event:51096415	sr:season:118699	sr:competitor:71	sr:competitor:27	\N	\N	not_started	38	sr:venue:660	2025-03-15 15:00:00
sr:sport_event:51096433	sr:season:118699	sr:competitor:96	sr:competitor:72	\N	\N	not_started	39	sr:venue:1138	2025-03-29 15:00:00
sr:sport_event:51096447	sr:season:118699	sr:competitor:41	sr:competitor:25	\N	\N	not_started	39	sr:venue:851	2025-03-29 15:00:00
sr:sport_event:46655643	sr:season:114317	sr:competitor:3211	sr:competitor:7628	3	1	closed	4	sr:venue:1009	2024-06-02 23:15:00
sr:sport_event:51096901	sr:season:118699	sr:competitor:95	sr:competitor:41	\N	\N	not_started	45	sr:venue:2366	2025-04-26 14:00:00
sr:sport_event:51096421	sr:season:118699	sr:competitor:12	sr:competitor:15	\N	\N	not_started	38	sr:venue:2547	2025-03-15 15:00:00
sr:sport_event:51096027	sr:season:118699	sr:competitor:24	sr:competitor:15	\N	\N	not_started	26	sr:venue:813	2025-01-04 15:00:00
sr:sport_event:51096921	sr:season:118699	sr:competitor:41	sr:competitor:1	\N	\N	not_started	46	sr:venue:851	2025-05-03 14:00:00
sr:sport_event:46655735	sr:season:114317	sr:competitor:3219	sr:competitor:3210	1	1	closed	8	sr:venue:634	2024-07-28 18:00:00
sr:sport_event:46655667	sr:season:114317	sr:competitor:3209	sr:competitor:3219	2	1	closed	5	sr:venue:1099	2024-06-13 00:15:00
sr:sport_event:46655837	sr:season:114317	sr:competitor:36837	sr:competitor:65668	0	0	closed	11	sr:venue:12712	2024-08-16 22:00:00
sr:sport_event:46655775	sr:season:114317	sr:competitor:3209	sr:competitor:3201	0	0	closed	9	sr:venue:1099	2024-08-03 22:15:00
sr:sport_event:51095517	sr:season:118699	sr:competitor:6	sr:competitor:11	2	0	closed	17	sr:venue:806	2024-11-26 19:45:00
sr:sport_event:51095779	sr:season:118699	sr:competitor:61	sr:competitor:15	\N	\N	not_started	22	sr:venue:1514	2024-12-21 15:00:00
sr:sport_event:51095925	sr:season:118699	sr:competitor:24	sr:competitor:61	\N	\N	not_started	24	sr:venue:813	2024-12-29 15:00:00
sr:sport_event:51096015	sr:season:118699	sr:competitor:29	sr:competitor:71	\N	\N	not_started	26	sr:venue:1135	2025-01-04 12:30:00
sr:sport_event:51096001	sr:season:118699	sr:competitor:21	sr:competitor:95	\N	\N	not_started	26	sr:venue:3002	2025-01-04 15:00:00
sr:sport_event:51095491	sr:season:118699	sr:competitor:71	sr:competitor:24	2	2	closed	16	sr:venue:660	2024-11-22 20:00:00
sr:sport_event:51095369	sr:season:118699	sr:competitor:95	sr:competitor:96	1	0	closed	14	sr:venue:2366	2024-11-05 19:45:00
sr:sport_event:46655809	sr:season:114317	sr:competitor:3216	sr:competitor:42338	0	0	closed	10	sr:venue:613	2024-08-08 18:00:00
sr:sport_event:46657147	sr:season:114317	sr:competitor:4937	sr:competitor:3211	\N	\N	postponed	21	sr:venue:12033	2024-10-07 00:30:00
sr:sport_event:46655911	sr:season:114317	sr:competitor:3215	sr:competitor:3202	2	1	closed	14	sr:venue:1082	2024-09-14 20:30:00
sr:sport_event:46655821	sr:season:114317	sr:competitor:3204	sr:competitor:3216	3	0	closed	11	sr:venue:4754	2024-08-19 21:45:00
sr:sport_event:46655675	sr:season:114317	sr:competitor:65676	sr:competitor:36837	0	2	closed	6	sr:venue:57376	2024-07-21 20:15:00
sr:sport_event:51095899	sr:season:118699	sr:competitor:263	sr:competitor:1	\N	\N	not_started	24	sr:venue:2221	2024-12-29 12:30:00
sr:sport_event:46655731	sr:season:114317	sr:competitor:65676	sr:competitor:3208	0	2	closed	8	sr:venue:49307	2024-07-29 21:45:00
sr:sport_event:46655917	sr:season:114317	sr:competitor:3216	sr:competitor:3212	3	0	closed	14	sr:venue:613	2024-09-15 23:00:00
sr:sport_event:46655881	sr:season:114317	sr:competitor:3212	sr:competitor:3203	0	0	closed	13	sr:venue:1567	2024-08-31 18:00:00
sr:sport_event:46655633	sr:season:114317	sr:competitor:36842	sr:competitor:3204	0	1	closed	4	sr:venue:12031	2024-06-04 23:00:00
sr:sport_event:46655907	sr:season:114317	sr:competitor:3206	sr:competitor:36837	1	1	closed	14	sr:venue:1007	2024-09-15 18:00:00
sr:sport_event:46655757	sr:season:114317	sr:competitor:7628	sr:competitor:191648	2	1	closed	8	sr:venue:4738	2024-07-29 21:45:00
sr:sport_event:46655831	sr:season:114317	sr:competitor:36833	sr:competitor:3206	2	0	closed	11	sr:venue:12017	2024-08-18 20:00:00
sr:sport_event:46655823	sr:season:114317	sr:competitor:7629	sr:competitor:3203	1	0	closed	11	sr:venue:12021	2024-08-18 23:30:00
sr:sport_event:46655747	sr:season:114317	sr:competitor:3217	sr:competitor:7629	0	1	closed	8	sr:venue:1329	2024-07-27 22:00:00
sr:sport_event:51095539	sr:season:118699	sr:competitor:29	sr:competitor:21	0	0	closed	17	sr:venue:1135	2024-11-26 19:45:00
sr:sport_event:51096179	sr:season:118699	sr:competitor:71	sr:competitor:6	\N	\N	not_started	28	sr:venue:660	2025-01-22 20:00:00
sr:sport_event:46655673	sr:season:114317	sr:competitor:3210	sr:competitor:36837	2	1	closed	5	sr:venue:2388	2024-06-14 22:00:00
sr:sport_event:46655727	sr:season:114317	sr:competitor:3210	sr:competitor:36839	1	1	closed	7	sr:venue:2388	2024-07-24 20:00:00
sr:sport_event:46655797	sr:season:114317	sr:competitor:3201	sr:competitor:36833	0	1	closed	10	sr:venue:14324	2024-08-10 17:30:00
sr:sport_event:51095569	sr:season:118699	sr:competitor:46	sr:competitor:34	\N	\N	not_started	18	sr:venue:631	2024-11-30 13:30:00
sr:sport_event:46655867	sr:season:114317	sr:competitor:191648	sr:competitor:42338	2	1	closed	12	sr:venue:17150	2024-08-24 17:30:00
sr:sport_event:51096355	sr:season:118699	sr:competitor:6	sr:competitor:72	\N	\N	not_started	36	sr:venue:806	2025-03-08 15:00:00
sr:sport_event:51096225	sr:season:118699	sr:competitor:2	sr:competitor:6	\N	\N	not_started	30	sr:venue:638	2025-02-01 15:00:00
sr:sport_event:51096257	sr:season:118699	sr:competitor:58	sr:competitor:29	\N	\N	not_started	32	sr:venue:2505	2025-02-12 19:45:00
sr:sport_event:51095641	sr:season:118699	sr:competitor:25	sr:competitor:11	\N	\N	not_started	19	sr:venue:2352	2024-12-07 15:00:00
sr:sport_event:51096341	sr:season:118699	sr:competitor:25	sr:competitor:58	\N	\N	not_started	35	sr:venue:2352	2025-03-01 15:00:00
sr:sport_event:51095975	sr:season:118699	sr:competitor:8	sr:competitor:21	\N	\N	not_started	25	sr:venue:1136	2025-01-01 15:00:00
sr:sport_event:51096445	sr:season:118699	sr:competitor:29	sr:competitor:1	\N	\N	not_started	39	sr:venue:1135	2025-03-29 15:00:00
sr:sport_event:51096471	sr:season:118699	sr:competitor:74	sr:competitor:27	\N	\N	not_started	40	sr:venue:1689	2025-04-05 14:00:00
sr:sport_event:46655885	sr:season:114317	sr:competitor:36833	sr:competitor:3215	1	0	closed	13	sr:venue:12017	2024-09-01 22:00:00
sr:sport_event:51096475	sr:season:118699	sr:competitor:46	sr:competitor:12	\N	\N	not_started	41	sr:venue:631	2025-04-08 18:45:00
sr:sport_event:51095869	sr:season:118699	sr:competitor:74	sr:competitor:1	\N	\N	not_started	23	sr:venue:1689	2024-12-26 15:00:00
sr:sport_event:51096483	sr:season:118699	sr:competitor:21	sr:competitor:61	\N	\N	not_started	41	sr:venue:3002	2025-04-08 18:45:00
sr:sport_event:51096459	sr:season:118699	sr:competitor:25	sr:competitor:2	\N	\N	not_started	40	sr:venue:2352	2025-04-05 14:00:00
sr:sport_event:51096857	sr:season:118699	sr:competitor:36	sr:competitor:71	\N	\N	not_started	43	sr:venue:743	2025-04-18 14:00:00
sr:sport_event:51096907	sr:season:118699	sr:competitor:96	sr:competitor:27	\N	\N	not_started	45	sr:venue:1138	2025-04-26 14:00:00
sr:sport_event:46655931	sr:season:114317	sr:competitor:7629	sr:competitor:3218	3	0	closed	15	sr:venue:12021	2024-09-22 17:30:00
sr:sport_event:46655829	sr:season:114317	sr:competitor:3209	sr:competitor:3217	1	0	closed	11	sr:venue:1099	2024-08-17 18:30:00
sr:sport_event:46655937	sr:season:114317	sr:competitor:3209	sr:competitor:3216	0	0	closed	15	sr:venue:1099	2024-09-22 17:30:00
sr:sport_event:51095187	sr:season:118699	sr:competitor:95	sr:competitor:8	1	1	closed	10	sr:venue:2366	2024-10-19 11:30:00
sr:sport_event:51095921	sr:season:118699	sr:competitor:74	sr:competitor:72	\N	\N	not_started	24	sr:venue:1689	2024-12-29 15:00:00
sr:sport_event:51096139	sr:season:118699	sr:competitor:25	sr:competitor:96	\N	\N	not_started	27	sr:venue:2352	2025-01-18 12:30:00
sr:sport_event:51096489	sr:season:118699	sr:competitor:24	sr:competitor:96	\N	\N	not_started	41	sr:venue:813	2025-04-08 18:45:00
sr:sport_event:51096249	sr:season:118699	sr:competitor:15	sr:competitor:2	\N	\N	not_started	31	sr:venue:598	2025-02-08 15:00:00
sr:sport_event:51096331	sr:season:118699	sr:competitor:61	sr:competitor:6	\N	\N	not_started	35	sr:venue:1514	2025-03-01 15:00:00
sr:sport_event:46655701	sr:season:114317	sr:competitor:3216	sr:competitor:7628	0	2	closed	6	sr:venue:613	2024-07-18 21:45:00
sr:sport_event:46655749	sr:season:114317	sr:competitor:3215	sr:competitor:3204	2	1	closed	8	sr:venue:12033	2024-07-28 20:15:00
sr:sport_event:46655941	sr:season:114317	sr:competitor:3202	sr:competitor:3211	0	1	closed	15	sr:venue:44628	2024-09-21 19:00:00
sr:sport_event:46655565	sr:season:114317	sr:competitor:3210	sr:competitor:36833	2	0	closed	2	sr:venue:2388	2024-05-19 20:45:00
sr:sport_event:46655629	sr:season:114317	sr:competitor:4937	sr:competitor:3205	2	1	closed	4	sr:venue:12033	2024-06-02 23:15:00
sr:sport_event:46655923	sr:season:114317	sr:competitor:3218	sr:competitor:3204	1	1	closed	14	sr:venue:981	2024-09-13 21:30:00
sr:sport_event:46655791	sr:season:114317	sr:competitor:4937	sr:competitor:36837	2	0	closed	10	sr:venue:12033	2024-08-11 18:00:00
sr:sport_event:46655921	sr:season:114317	sr:competitor:191648	sr:competitor:7629	1	0	closed	14	sr:venue:17150	2024-09-13 18:00:00
sr:sport_event:51095055	sr:season:118699	sr:competitor:74	sr:competitor:58	1	1	closed	7	sr:venue:1689	2024-09-29 14:00:00
sr:sport_event:51095457	sr:season:118699	sr:competitor:41	sr:competitor:11	2	2	closed	15	sr:venue:851	2024-11-09 15:00:00
sr:sport_event:46655649	sr:season:114317	sr:competitor:7628	sr:competitor:3203	1	1	closed	5	sr:venue:4738	2024-06-13 22:00:00
sr:sport_event:46655883	sr:season:114317	sr:competitor:3209	sr:competitor:3211	0	0	closed	13	sr:venue:1099	2024-09-01 20:00:00
sr:sport_event:51095521	sr:season:118699	sr:competitor:96	sr:competitor:12	0	2	closed	17	sr:venue:1138	2024-11-26 19:45:00
sr:sport_event:51096299	sr:season:118699	sr:competitor:1	sr:competitor:27	\N	\N	not_started	33	sr:venue:1693	2025-02-14 20:00:00
sr:sport_event:46655709	sr:season:114317	sr:competitor:6074	sr:competitor:3211	2	1	closed	7	sr:venue:15676	2024-07-24 22:30:00
sr:sport_event:51096227	sr:season:118699	sr:competitor:12	sr:competitor:72	\N	\N	not_started	30	sr:venue:2547	2025-02-01 15:00:00
sr:sport_event:46655789	sr:season:114317	sr:competitor:3219	sr:competitor:3208	2	2	closed	10	sr:venue:634	2024-08-11 20:30:00
sr:sport_event:46655875	sr:season:114317	sr:competitor:3204	sr:competitor:191648	0	0	closed	13	sr:venue:4754	2024-08-31 00:00:00
sr:sport_event:46655803	sr:season:114317	sr:competitor:3215	sr:competitor:3205	0	1	closed	10	sr:venue:1082	2024-08-10 00:00:00
sr:sport_event:46655849	sr:season:114317	sr:competitor:36842	sr:competitor:36837	0	2	closed	12	sr:venue:12031	2024-08-23 21:00:00
sr:sport_event:46655833	sr:season:114317	sr:competitor:3202	sr:competitor:3201	3	2	closed	11	sr:venue:44628	2024-08-18 17:30:00
sr:sport_event:51096425	sr:season:118699	sr:competitor:8	sr:competitor:96	\N	\N	not_started	38	sr:venue:1136	2025-03-15 15:00:00
sr:sport_event:51096347	sr:season:118699	sr:competitor:1	sr:competitor:15	\N	\N	not_started	35	sr:venue:1693	2025-03-01 15:00:00
sr:sport_event:51095765	sr:season:118699	sr:competitor:74	sr:competitor:41	\N	\N	not_started	21	sr:venue:1689	2024-12-14 15:00:00
sr:sport_event:51096255	sr:season:118699	sr:competitor:8	sr:competitor:12	\N	\N	not_started	31	sr:venue:1136	2025-02-08 12:30:00
sr:sport_event:51096385	sr:season:118699	sr:competitor:2	sr:competitor:71	\N	\N	not_started	37	sr:venue:638	2025-03-11 19:45:00
sr:sport_event:46655713	sr:season:114317	sr:competitor:3204	sr:competitor:3217	1	0	closed	7	sr:venue:4754	2024-07-31 21:30:00
sr:sport_event:51096011	sr:season:118699	sr:competitor:12	sr:competitor:25	\N	\N	not_started	26	sr:venue:2547	2025-01-04 15:00:00
sr:sport_event:51096451	sr:season:118699	sr:competitor:46	sr:competitor:36	\N	\N	not_started	40	sr:venue:631	2025-04-05 14:00:00
sr:sport_event:51096917	sr:season:118699	sr:competitor:24	sr:competitor:12	\N	\N	not_started	46	sr:venue:813	2025-05-03 14:00:00
sr:sport_event:51095595	sr:season:118699	sr:competitor:95	sr:competitor:25	\N	\N	not_started	18	sr:venue:2366	2024-11-30 12:30:00
sr:sport_event:51096583	sr:season:118699	sr:competitor:61	sr:competitor:29	\N	\N	not_started	42	sr:venue:1514	2025-04-12 14:00:00
sr:sport_event:51095551	sr:season:118699	sr:competitor:61	sr:competitor:1	0	2	closed	17	sr:venue:1514	2024-11-27 19:45:00
sr:sport_event:51096191	sr:season:118699	sr:competitor:11	sr:competitor:24	\N	\N	not_started	29	sr:venue:2194	2025-01-25 15:00:00
sr:sport_event:51096859	sr:season:118699	sr:competitor:27	sr:competitor:72	\N	\N	not_started	43	sr:venue:852	2025-04-18 14:00:00
sr:sport_event:51096885	sr:season:118699	sr:competitor:96	sr:competitor:21	\N	\N	not_started	44	sr:venue:1138	2025-04-21 14:00:00
sr:sport_event:46655755	sr:season:114317	sr:competitor:3216	sr:competitor:3218	2	0	closed	8	sr:venue:613	2024-07-30 00:00:00
sr:sport_event:46655861	sr:season:114317	sr:competitor:3203	sr:competitor:3205	0	1	closed	12	sr:venue:4750	2024-08-26 21:30:00
sr:sport_event:46656987	sr:season:114317	sr:competitor:65676	sr:competitor:65668	2	1	closed	16	sr:venue:49307	2024-09-29 17:30:00
sr:sport_event:46655725	sr:season:114317	sr:competitor:3202	sr:competitor:3219	3	0	closed	7	sr:venue:44628	2024-07-31 23:30:00
sr:sport_event:46655919	sr:season:114317	sr:competitor:7628	sr:competitor:3205	1	1	closed	14	sr:venue:4738	2024-09-14 23:00:00
sr:sport_event:51096897	sr:season:118699	sr:competitor:1	sr:competitor:6	\N	\N	not_started	45	sr:venue:1693	2025-04-26 14:00:00
sr:sport_event:51096883	sr:season:118699	sr:competitor:34	sr:competitor:29	\N	\N	not_started	44	sr:venue:2223	2025-04-21 14:00:00
sr:sport_event:46655759	sr:season:114317	sr:competitor:191648	sr:competitor:65676	1	0	closed	9	sr:venue:17150	2024-08-05 17:30:00
sr:sport_event:46655925	sr:season:114317	sr:competitor:6074	sr:competitor:42338	1	1	closed	14	sr:venue:15676	2024-09-15 18:00:00
sr:sport_event:46655939	sr:season:114317	sr:competitor:36833	sr:competitor:3203	2	4	closed	15	sr:venue:12017	2024-09-22 22:30:00
sr:sport_event:46655879	sr:season:114317	sr:competitor:3205	sr:competitor:3216	1	0	closed	13	sr:venue:12003	2024-09-02 20:00:00
sr:sport_event:46655741	sr:season:114317	sr:competitor:36842	sr:competitor:3209	1	0	closed	8	sr:venue:15676	2024-07-27 18:00:00
sr:sport_event:46655817	sr:season:114317	sr:competitor:6074	sr:competitor:191648	4	1	closed	11	sr:venue:15676	2024-08-19 21:45:00
sr:sport_event:46655841	sr:season:114317	sr:competitor:36839	sr:competitor:3219	1	0	closed	11	sr:venue:12025	2024-08-20 00:00:00
sr:sport_event:46655569	sr:season:114317	sr:competitor:3208	sr:competitor:3212	1	0	closed	2	sr:venue:1079	2024-05-21 23:00:00
sr:sport_event:46655733	sr:season:114317	sr:competitor:36839	sr:competitor:36837	1	3	closed	8	sr:venue:12025	2024-07-29 19:30:00
sr:sport_event:46655845	sr:season:114317	sr:competitor:4937	sr:competitor:36839	4	1	closed	12	sr:venue:12033	2024-08-24 20:00:00
sr:sport_event:46655877	sr:season:114317	sr:competitor:7629	sr:competitor:7628	0	2	closed	13	sr:venue:12021	2024-09-01 17:30:00
sr:sport_event:46655779	sr:season:114317	sr:competitor:3202	sr:competitor:65668	1	1	closed	9	sr:venue:44628	2024-08-04 20:30:00
sr:sport_event:46655763	sr:season:114317	sr:competitor:6074	sr:competitor:3216	1	0	closed	9	sr:venue:15676	2024-08-03 18:00:00
sr:sport_event:46655893	sr:season:114317	sr:competitor:3208	sr:competitor:36842	4	0	closed	13	sr:venue:1079	2024-08-31 21:00:00
sr:sport_event:46655769	sr:season:114317	sr:competitor:7629	sr:competitor:3215	0	0	closed	9	sr:venue:12021	2024-08-03 23:30:00
sr:sport_event:51096241	sr:season:118699	sr:competitor:72	sr:competitor:71	\N	\N	not_started	31	sr:venue:2178	2025-02-08 15:00:00
sr:sport_event:46655703	sr:season:114317	sr:competitor:7628	sr:competitor:65676	1	1	closed	7	sr:venue:4738	2024-07-26 00:00:00
sr:sport_event:46655851	sr:season:114317	sr:competitor:3201	sr:competitor:3210	2	0	closed	12	sr:venue:14324	2024-08-25 17:30:00
sr:sport_event:46655895	sr:season:114317	sr:competitor:36839	sr:competitor:65668	1	0	closed	13	sr:venue:12025	2024-08-31 18:00:00
sr:sport_event:46655665	sr:season:114317	sr:competitor:3212	sr:competitor:4937	0	2	closed	5	sr:venue:1567	2024-06-14 00:15:00
sr:sport_event:46655897	sr:season:114317	sr:competitor:3219	sr:competitor:4937	1	2	closed	13	sr:venue:634	2024-09-02 00:00:00
sr:sport_event:46655723	sr:season:114317	sr:competitor:36833	sr:competitor:4937	1	0	closed	7	sr:venue:12017	2024-07-26 00:00:00
sr:sport_event:46655811	sr:season:114317	sr:competitor:7628	sr:competitor:6074	0	2	closed	10	sr:venue:4738	2024-08-12 22:00:00
sr:sport_event:46655603	sr:season:114317	sr:competitor:42338	sr:competitor:36842	0	1	closed	3	sr:venue:8975	2024-05-26 20:30:00
sr:sport_event:46655913	sr:season:114317	sr:competitor:3211	sr:competitor:36833	4	1	closed	14	sr:venue:1009	2024-09-14 00:00:00
sr:sport_event:46655935	sr:season:114317	sr:competitor:3212	sr:competitor:7628	1	0	closed	15	sr:venue:1567	2024-09-21 22:00:00
sr:sport_event:46655745	sr:season:114317	sr:competitor:3206	sr:competitor:3205	4	1	closed	8	sr:venue:1007	2024-07-28 18:00:00
sr:sport_event:51095241	sr:season:118699	sr:competitor:46	sr:competitor:8	0	0	closed	11	sr:venue:631	2024-10-23 18:45:00
sr:sport_event:46655915	sr:season:114317	sr:competitor:3203	sr:competitor:3209	1	1	closed	14	sr:venue:4750	2024-09-14 23:00:00
sr:sport_event:46655761	sr:season:114317	sr:competitor:3218	sr:competitor:7628	3	2	closed	9	sr:venue:981	2024-08-04 23:00:00
sr:sport_event:46655705	sr:season:114317	sr:competitor:191648	sr:competitor:3216	2	0	closed	7	sr:venue:17150	2024-07-23 18:00:00
sr:sport_event:46655661	sr:season:114317	sr:competitor:7629	sr:competitor:36842	1	0	closed	5	sr:venue:12021	2024-06-15 21:00:00
sr:sport_event:46655771	sr:season:114317	sr:competitor:3205	sr:competitor:3217	0	1	closed	9	sr:venue:12003	2024-08-05 20:00:00
sr:sport_event:51095911	sr:season:118699	sr:competitor:15	sr:competitor:8	\N	\N	not_started	24	sr:venue:598	2024-12-29 12:30:00
sr:sport_event:46655825	sr:season:114317	sr:competitor:3205	sr:competitor:3211	1	1	closed	11	sr:venue:12003	2024-08-17 20:30:00
sr:sport_event:46655715	sr:season:114317	sr:competitor:7629	sr:competitor:3206	0	0	closed	7	sr:venue:12021	2024-07-24 22:30:00
sr:sport_event:46655873	sr:season:114317	sr:competitor:42338	sr:competitor:3218	0	0	closed	13	sr:venue:8975	2024-08-30 22:00:00
sr:sport_event:46655717	sr:season:114317	sr:competitor:3205	sr:competitor:3201	0	1	closed	7	sr:venue:12003	2024-07-23 21:45:00
sr:sport_event:46655695	sr:season:114317	sr:competitor:3215	sr:competitor:6074	3	0	closed	6	sr:venue:12033	2024-07-20 20:00:00
sr:sport_event:46655793	sr:season:114317	sr:competitor:65668	sr:competitor:3210	1	1	closed	10	sr:venue:69401	2024-08-09 19:30:00
sr:sport_event:46655853	sr:season:114317	sr:competitor:3206	sr:competitor:3202	1	1	closed	12	sr:venue:1007	2024-08-27 00:00:00
sr:sport_event:46655729	sr:season:114317	sr:competitor:36837	sr:competitor:3208	0	2	closed	7	sr:venue:12712	2024-07-25 21:45:00
sr:sport_event:46655805	sr:season:114317	sr:competitor:3211	sr:competitor:7629	1	1	closed	10	sr:venue:1009	2024-08-10 23:30:00
sr:sport_event:46655721	sr:season:114317	sr:competitor:3209	sr:competitor:65668	0	0	closed	7	sr:venue:1099	2024-07-24 00:00:00
sr:sport_event:46655839	sr:season:114317	sr:competitor:3208	sr:competitor:4937	1	0	closed	11	sr:venue:1079	2024-08-17 23:00:00
sr:sport_event:46655947	sr:season:114317	sr:competitor:3208	sr:competitor:3206	2	0	closed	15	sr:venue:1079	2024-09-24 00:00:00
sr:sport_event:46655903	sr:season:114317	sr:competitor:36842	sr:competitor:36839	1	0	closed	14	sr:venue:12031	2024-09-17 00:00:00
sr:sport_event:46655927	sr:season:114317	sr:competitor:42338	sr:competitor:65676	1	3	closed	15	sr:venue:8975	2024-09-23 21:45:00
sr:sport_event:46655819	sr:season:114317	sr:competitor:42338	sr:competitor:7628	0	0	closed	11	sr:venue:8975	2024-08-18 20:00:00
sr:sport_event:46655773	sr:season:114317	sr:competitor:3212	sr:competitor:3206	1	4	closed	9	sr:venue:1567	2024-08-02 23:00:00
sr:sport_event:46655865	sr:season:114317	sr:competitor:7628	sr:competitor:3204	5	1	closed	12	sr:venue:4738	2024-08-24 22:30:00
sr:sport_event:46657021	sr:season:114317	sr:competitor:3212	sr:competitor:3218	2	1	closed	17	sr:venue:1567	2024-10-05 20:30:00
sr:sport_event:46657085	sr:season:114317	sr:competitor:36837	sr:competitor:3216	2	1	closed	19	sr:venue:12712	2024-10-27 18:00:00
sr:sport_event:46655909	sr:season:114317	sr:competitor:3217	sr:competitor:3210	2	2	closed	14	sr:venue:1329	2024-09-15 20:30:00
sr:sport_event:46657035	sr:season:114317	sr:competitor:36839	sr:competitor:3217	2	1	closed	17	sr:venue:12025	2024-10-07 21:45:00
sr:sport_event:46657115	sr:season:114317	sr:competitor:191648	sr:competitor:3210	0	0	closed	20	sr:venue:17150	2024-11-02 18:00:00
sr:sport_event:46657103	sr:season:114317	sr:competitor:3217	sr:competitor:65668	0	1	closed	20	sr:venue:1329	2024-11-01 00:15:00
sr:sport_event:46657011	sr:season:114317	sr:competitor:6074	sr:competitor:7629	1	1	closed	16	sr:venue:15676	2024-09-28 20:30:00
sr:sport_event:46657121	sr:season:114317	sr:competitor:42338	sr:competitor:3209	0	0	closed	20	sr:venue:8975	2024-10-31 22:00:00
sr:sport_event:46656995	sr:season:114317	sr:competitor:3217	sr:competitor:3208	\N	\N	postponed	16	sr:venue:1329	2024-09-29 20:00:00
sr:sport_event:46657125	sr:season:114317	sr:competitor:7629	sr:competitor:3205	0	0	closed	20	sr:venue:12021	2024-11-01 22:45:00
sr:sport_event:46655827	sr:season:114317	sr:competitor:3212	sr:competitor:3215	0	1	closed	11	sr:venue:1567	2024-08-17 00:00:00
sr:sport_event:46657027	sr:season:114317	sr:competitor:3202	sr:competitor:3216	1	0	closed	17	sr:venue:44628	2024-10-07 00:00:00
sr:sport_event:46655691	sr:season:114317	sr:competitor:3206	sr:competitor:3204	0	0	closed	6	sr:venue:1007	2024-07-21 20:15:00
sr:sport_event:46657067	sr:season:114317	sr:competitor:42338	sr:competitor:3205	1	1	closed	18	sr:venue:8975	2024-10-18 20:00:00
sr:sport_event:46655679	sr:season:114317	sr:competitor:36839	sr:competitor:3202	2	2	closed	6	sr:venue:12025	2024-07-21 23:00:00
sr:sport_event:46655681	sr:season:114317	sr:competitor:3219	sr:competitor:36833	1	1	closed	6	sr:venue:634	2024-07-20 22:30:00
sr:sport_event:46657123	sr:season:114317	sr:competitor:3204	sr:competitor:3212	2	0	closed	20	sr:venue:4754	2024-11-02 00:15:00
sr:sport_event:46657037	sr:season:114317	sr:competitor:3219	sr:competitor:3206	1	2	closed	17	sr:venue:634	2024-10-07 21:00:00
sr:sport_event:46657001	sr:season:114317	sr:competitor:3203	sr:competitor:3202	2	0	closed	16	sr:venue:4750	2024-09-28 23:00:00
sr:sport_event:46657007	sr:season:114317	sr:competitor:191648	sr:competitor:3212	3	3	closed	16	sr:venue:17150	2024-09-27 18:00:00
sr:sport_event:46655739	sr:season:114317	sr:competitor:65668	sr:competitor:36833	0	2	closed	8	sr:venue:69401	2024-07-29 18:00:00
sr:sport_event:46655887	sr:season:114317	sr:competitor:3202	sr:competitor:3217	2	1	closed	13	sr:venue:44628	2024-09-01 00:00:00
sr:sport_event:46657041	sr:season:114317	sr:competitor:65668	sr:competitor:36842	1	1	closed	17	sr:venue:69401	2024-10-07 18:00:00
sr:sport_event:46655891	sr:season:114317	sr:competitor:36837	sr:competitor:3201	1	2	closed	13	sr:venue:12712	2024-09-01 17:30:00
sr:sport_event:46657017	sr:season:114317	sr:competitor:7629	sr:competitor:42338	3	1	closed	17	sr:venue:12021	2024-10-05 00:00:00
sr:sport_event:46655899	sr:season:114317	sr:competitor:65676	sr:competitor:4937	2	1	closed	14	sr:venue:49307	2024-09-13 21:30:00
sr:sport_event:54879043	sr:season:114317	sr:competitor:3201	sr:competitor:3206	1	1	closed	21	sr:venue:14324	2024-11-05 21:45:00
sr:sport_event:46657043	sr:season:114317	sr:competitor:65676	sr:competitor:36842	2	0	closed	18	sr:venue:57376	2024-10-18 21:45:00
sr:sport_event:46655871	sr:season:114317	sr:competitor:6074	sr:competitor:65676	1	1	closed	13	sr:venue:15676	2024-09-02 22:00:00
sr:sport_event:46655951	sr:season:114317	sr:competitor:3219	sr:competitor:36842	2	0	closed	15	sr:venue:634	2024-09-24 00:00:00
sr:sport_event:46655949	sr:season:114317	sr:competitor:36839	sr:competitor:3201	0	0	closed	15	sr:venue:12025	2024-09-22 00:15:00
sr:sport_event:51095211	sr:season:118699	sr:competitor:96	sr:competitor:6	1	1	closed	11	sr:venue:1138	2024-10-23 18:45:00
sr:sport_event:46657033	sr:season:114317	sr:competitor:3208	sr:competitor:3215	1	0	closed	17	sr:venue:1079	2024-10-05 18:00:00
sr:sport_event:46657019	sr:season:114317	sr:competitor:3205	sr:competitor:6074	0	1	closed	17	sr:venue:12003	2024-10-05 20:30:00
sr:sport_event:46657039	sr:season:114317	sr:competitor:4937	sr:competitor:3201	2	0	closed	17	sr:venue:12033	2024-10-05 23:00:00
sr:sport_event:46656989	sr:season:114317	sr:competitor:36842	sr:competitor:4937	1	1	closed	16	sr:venue:12031	2024-09-28 00:00:00
sr:sport_event:51389159	sr:season:119847	sr:competitor:3002	sr:competitor:3009	\N	\N	not_started	23	sr:venue:907	2025-02-23 18:00:00
sr:sport_event:51388825	sr:season:119847	sr:competitor:49531	sr:competitor:3013	0	0	closed	7	sr:venue:16520	2024-09-29 14:30:00
sr:sport_event:51389259	sr:season:119847	sr:competitor:3009	sr:competitor:3011	\N	\N	not_started	28	sr:venue:1137	2025-04-06 17:00:00
sr:sport_event:46655815	sr:season:114317	sr:competitor:3218	sr:competitor:65676	1	1	closed	11	sr:venue:981	2024-08-17 18:00:00
sr:sport_event:51389233	sr:season:119847	sr:competitor:2999	sr:competitor:25777	\N	\N	not_started	27	sr:venue:951	2025-03-30 17:00:00
sr:sport_event:51388921	sr:season:119847	sr:competitor:3011	sr:competitor:3036	\N	\N	not_started	13	sr:venue:5318	2024-12-07 18:00:00
sr:sport_event:51388985	sr:season:119847	sr:competitor:3001	sr:competitor:3006	\N	\N	not_started	16	sr:venue:910	2024-12-29 20:30:00
sr:sport_event:46657153	sr:season:114317	sr:competitor:3201	sr:competitor:3206	\N	\N	postponed	21	sr:venue:14324	2024-10-05 21:45:00
sr:sport_event:51388893	sr:season:119847	sr:competitor:36365	sr:competitor:2998	1	1	closed	11	sr:venue:2645	2024-11-09 15:30:00
sr:sport_event:51094963	sr:season:118699	sr:competitor:6	sr:competitor:46	1	1	closed	4	sr:venue:806	2024-08-31 11:30:00
sr:sport_event:51389081	sr:season:119847	sr:competitor:1031053	sr:competitor:3011	\N	\N	not_started	21	sr:venue:8249	2025-02-09 18:00:00
sr:sport_event:51389283	sr:season:119847	sr:competitor:3014	sr:competitor:3036	\N	\N	not_started	29	sr:venue:5312	2025-04-13 17:00:00
sr:sport_event:51388947	sr:season:119847	sr:competitor:3036	sr:competitor:3009	\N	\N	not_started	14	sr:venue:2013	2024-12-16 20:45:00
sr:sport_event:51095061	sr:season:118699	sr:competitor:61	sr:competitor:25	1	0	closed	8	sr:venue:1514	2024-10-01 18:45:00
sr:sport_event:51389355	sr:season:119847	sr:competitor:3013	sr:competitor:3036	\N	\N	not_started	33	sr:venue:1335	2025-05-11 17:00:00
sr:sport_event:46657053	sr:season:114317	sr:competitor:3211	sr:competitor:3208	1	1	closed	18	sr:venue:1009	2024-10-19 00:00:00
sr:sport_event:51389053	sr:season:119847	sr:competitor:3014	sr:competitor:2999	\N	\N	not_started	20	sr:venue:5312	2025-02-02 18:00:00
sr:sport_event:51095147	sr:season:118699	sr:competitor:27	sr:competitor:1	2	0	closed	9	sr:venue:852	2024-10-05 14:00:00
sr:sport_event:51095359	sr:season:118699	sr:competitor:58	sr:competitor:15	1	2	closed	14	sr:venue:2505	2024-11-05 19:45:00
sr:sport_event:51095003	sr:season:118699	sr:competitor:2	sr:competitor:8	0	3	closed	5	sr:venue:638	2024-09-15 14:00:00
sr:sport_event:51095215	sr:season:118699	sr:competitor:34	sr:competitor:24	2	1	closed	11	sr:venue:2223	2024-10-22 18:45:00
sr:sport_event:46657131	sr:season:114317	sr:competitor:3209	sr:competitor:3204	3	0	closed	21	sr:venue:1099	2024-11-06 00:00:00
sr:sport_event:46657113	sr:season:114317	sr:competitor:7628	sr:competitor:36837	0	0	closed	20	sr:venue:4738	2024-11-03 20:00:00
sr:sport_event:51094927	sr:season:118699	sr:competitor:2	sr:competitor:72	0	0	closed	2	sr:venue:638	2024-08-17 11:30:00
sr:sport_event:46657127	sr:season:114317	sr:competitor:3205	sr:competitor:65676	0	0	closed	21	sr:venue:12003	2024-11-05 21:45:00
sr:sport_event:51094953	sr:season:118699	sr:competitor:12	sr:competitor:34	0	2	closed	3	sr:venue:2547	2024-08-23 19:00:00
sr:sport_event:46657129	sr:season:114317	sr:competitor:3212	sr:competitor:7629	2	4	closed	21	sr:venue:1567	2024-11-06 00:00:00
sr:sport_event:46657149	sr:season:114317	sr:competitor:65668	sr:competitor:3215	0	2	closed	21	sr:venue:69401	2024-11-06 19:00:00
sr:sport_event:46657087	sr:season:114317	sr:competitor:3208	sr:competitor:3203	1	1	closed	19	sr:venue:1079	2024-10-27 00:00:00
sr:sport_event:46657061	sr:season:114317	sr:competitor:191648	sr:competitor:36833	2	0	closed	18	sr:venue:17150	2024-10-18 18:00:00
sr:sport_event:51095191	sr:season:118699	sr:competitor:21	sr:competitor:11	1	0	closed	10	sr:venue:3002	2024-10-19 11:30:00
sr:sport_event:46656993	sr:season:114317	sr:competitor:3206	sr:competitor:36839	1	0	closed	16	sr:venue:1007	2024-09-28 20:30:00
sr:sport_event:46657023	sr:season:114317	sr:competitor:3209	sr:competitor:191648	3	1	closed	17	sr:venue:1099	2024-10-06 18:00:00
sr:sport_event:46657111	sr:season:114317	sr:competitor:3216	sr:competitor:3208	1	1	closed	20	sr:venue:613	2024-11-02 01:00:00
sr:sport_event:51095273	sr:season:118699	sr:competitor:263	sr:competitor:36	3	3	closed	12	sr:venue:2221	2024-10-27 15:00:00
sr:sport_event:51095023	sr:season:118699	sr:competitor:21	sr:competitor:46	0	0	closed	6	sr:venue:3002	2024-09-22 11:00:00
sr:sport_event:51096215	sr:season:118699	sr:competitor:34	sr:competitor:61	\N	\N	not_started	30	sr:venue:2223	2025-02-01 15:00:00
sr:sport_event:46657093	sr:season:114317	sr:competitor:4937	sr:competitor:3217	0	0	closed	19	sr:venue:12033	2024-10-26 20:15:00
sr:sport_event:46657107	sr:season:114317	sr:competitor:3211	sr:competitor:3219	3	1	closed	20	sr:venue:1009	2024-11-02 21:00:00
sr:sport_event:46657119	sr:season:114317	sr:competitor:6074	sr:competitor:36833	1	1	closed	20	sr:venue:15676	2024-11-01 00:15:00
sr:sport_event:46657025	sr:season:114317	sr:competitor:36833	sr:competitor:7628	1	2	closed	17	sr:venue:12017	2024-10-08 00:00:00
sr:sport_event:51388855	sr:season:119847	sr:competitor:2995	sr:competitor:3014	0	2	closed	9	sr:venue:14556	2024-10-26 17:00:00
sr:sport_event:51389165	sr:season:119847	sr:competitor:2999	sr:competitor:3013	\N	\N	not_started	23	sr:venue:951	2025-02-23 18:00:00
sr:sport_event:51389263	sr:season:119847	sr:competitor:3010	sr:competitor:3014	\N	\N	not_started	28	sr:venue:2539	2025-04-06 17:00:00
sr:sport_event:46657099	sr:season:114317	sr:competitor:65676	sr:competitor:3201	0	1	closed	20	sr:venue:49307	2024-11-01 22:00:00
sr:sport_event:46657097	sr:season:114317	sr:competitor:36842	sr:competitor:3201	1	0	closed	19	sr:venue:12031	2024-10-27 00:45:00
sr:sport_event:46657005	sr:season:114317	sr:competitor:7628	sr:competitor:3209	\N	\N	postponed	16	sr:venue:4738	2024-09-29 20:00:00
sr:sport_event:51095775	sr:season:118699	sr:competitor:6	sr:competitor:24	\N	\N	not_started	22	sr:venue:806	2024-12-21 15:00:00
sr:sport_event:51095895	sr:season:118699	sr:competitor:36	sr:competitor:6	\N	\N	not_started	24	sr:venue:743	2024-12-29 20:00:00
sr:sport_event:51095655	sr:season:118699	sr:competitor:1	sr:competitor:263	\N	\N	not_started	19	sr:venue:1693	2024-12-07 15:00:00
sr:sport_event:51095981	sr:season:118699	sr:competitor:46	sr:competitor:6	\N	\N	not_started	26	sr:venue:631	2025-01-04 12:30:00
sr:sport_event:51096189	sr:season:118699	sr:competitor:61	sr:competitor:27	\N	\N	not_started	29	sr:venue:1514	2025-01-25 15:00:00
sr:sport_event:51096177	sr:season:118699	sr:competitor:34	sr:competitor:263	\N	\N	not_started	28	sr:venue:2223	2025-01-22 19:45:00
sr:sport_event:50850521	sr:season:118689	sr:competitor:7	sr:competitor:32	\N	\N	not_started	28	sr:venue:10	2025-03-08 15:00:00
sr:sport_event:50850639	sr:season:118689	sr:competitor:30	sr:competitor:37	\N	\N	not_started	34	sr:venue:2443	2025-04-26 14:00:00
sr:sport_event:50850427	sr:season:118689	sr:competitor:60	sr:competitor:44	\N	\N	not_started	24	sr:venue:2990	2025-02-01 15:00:00
sr:sport_event:50850619	sr:season:118689	sr:competitor:7	sr:competitor:60	\N	\N	not_started	33	sr:venue:10	2025-04-19 14:00:00
sr:sport_event:50850341	sr:season:118689	sr:competitor:35	sr:competitor:39	\N	\N	not_started	19	sr:venue:9	2024-12-30 20:00:00
sr:sport_event:50850147	sr:season:118689	sr:competitor:60	sr:competitor:17	2	1	closed	10	sr:venue:2990	2024-11-02 15:00:00
sr:sport_event:50850457	sr:season:118689	sr:competitor:44	sr:competitor:3	\N	\N	not_started	25	sr:venue:579	2025-02-15 15:00:00
sr:sport_event:50850287	sr:season:118689	sr:competitor:40	sr:competitor:17	\N	\N	not_started	17	sr:venue:815	2024-12-21 12:30:00
sr:sport_event:50850053	sr:season:118689	sr:competitor:43	sr:competitor:39	3	1	closed	5	sr:venue:611	2024-09-21 14:00:00
sr:sport_event:50850401	sr:season:118689	sr:competitor:39	sr:competitor:60	\N	\N	not_started	22	sr:venue:765	2025-01-18 12:30:00
sr:sport_event:50850023	sr:season:118689	sr:competitor:14	sr:competitor:3	1	1	closed	3	sr:venue:2230	2024-08-31 14:00:00
sr:sport_event:50850541	sr:season:118689	sr:competitor:48	sr:competitor:37	\N	\N	not_started	29	sr:venue:12	2025-03-15 15:00:00
sr:sport_event:50850179	sr:season:118689	sr:competitor:14	sr:competitor:39	1	3	closed	11	sr:venue:2230	2024-11-10 14:00:00
sr:sport_event:50850687	sr:season:118689	sr:competitor:14	sr:competitor:31	\N	\N	not_started	36	sr:venue:2230	2025-05-10 14:00:00
sr:sport_event:50850545	sr:season:118689	sr:competitor:32	sr:competitor:14	\N	\N	not_started	29	sr:venue:2188	2025-03-15 15:00:00
sr:sport_event:46657279	sr:season:114317	sr:competitor:191648	sr:competitor:65668	\N	\N	not_started	26	sr:venue:17150	2024-12-08 23:00:00
sr:sport_event:46657185	sr:season:114317	sr:competitor:3209	sr:competitor:3205	1	0	closed	23	sr:venue:1099	2024-11-21 22:15:00
sr:sport_event:51096847	sr:season:118699	sr:competitor:29	sr:competitor:12	\N	\N	not_started	43	sr:venue:1135	2025-04-18 14:00:00
sr:sport_event:51095543	sr:season:118699	sr:competitor:41	sr:competitor:8	0	0	closed	17	sr:venue:851	2024-11-26 20:00:00
sr:sport_event:51095245	sr:season:118699	sr:competitor:72	sr:competitor:41	1	2	closed	11	sr:venue:2178	2024-10-23 18:45:00
sr:sport_event:46655847	sr:season:114317	sr:competitor:65668	sr:competitor:3208	0	5	closed	12	sr:venue:12021	2024-08-26 19:00:00
sr:sport_event:51095629	sr:season:118699	sr:competitor:96	sr:competitor:46	\N	\N	not_started	19	sr:venue:1138	2024-12-07 15:00:00
sr:sport_event:46657187	sr:season:114317	sr:competitor:36833	sr:competitor:7629	4	2	closed	23	sr:venue:12017	2024-11-19 00:30:00
sr:sport_event:51096291	sr:season:118699	sr:competitor:36	sr:competitor:24	\N	\N	not_started	33	sr:venue:743	2025-02-15 15:00:00
sr:sport_event:50850121	sr:season:118689	sr:competitor:45	sr:competitor:31	2	3	closed	8	sr:venue:2231	2024-10-19 14:00:00
sr:sport_event:51096365	sr:season:118699	sr:competitor:2	sr:competitor:34	\N	\N	not_started	36	sr:venue:638	2025-03-08 15:00:00
sr:sport_event:51096397	sr:season:118699	sr:competitor:15	sr:competitor:58	\N	\N	not_started	37	sr:venue:598	2025-03-12 19:45:00
sr:sport_event:51096419	sr:season:118699	sr:competitor:1	sr:competitor:34	\N	\N	not_started	38	sr:venue:1693	2025-03-15 15:00:00
sr:sport_event:51096283	sr:season:118699	sr:competitor:61	sr:competitor:58	\N	\N	not_started	33	sr:venue:1514	2025-02-15 12:30:00
sr:sport_event:51096405	sr:season:118699	sr:competitor:11	sr:competitor:41	\N	\N	not_started	38	sr:venue:2194	2025-03-15 15:00:00
sr:sport_event:51096487	sr:season:118699	sr:competitor:29	sr:competitor:72	\N	\N	not_started	41	sr:venue:1135	2025-04-08 18:45:00
sr:sport_event:46657305	sr:season:114317	sr:competitor:3208	sr:competitor:7629	\N	\N	not_started	27	sr:venue:1079	2024-12-15 23:00:00
sr:sport_event:51096903	sr:season:118699	sr:competitor:36	sr:competitor:263	\N	\N	not_started	45	sr:venue:743	2025-04-26 14:00:00
sr:sport_event:51095735	sr:season:118699	sr:competitor:27	sr:competitor:2	\N	\N	not_started	21	sr:venue:852	2024-12-13 20:00:00
sr:sport_event:46657109	sr:season:114317	sr:competitor:3203	sr:competitor:36839	1	2	closed	20	sr:venue:4750	2024-11-02 23:00:00
sr:sport_event:50850195	sr:season:118689	sr:competitor:43	sr:competitor:3	1	4	closed	12	sr:venue:611	2024-11-23 15:00:00
sr:sport_event:51096937	sr:season:118699	sr:competitor:58	sr:competitor:21	\N	\N	not_started	46	sr:venue:2505	2025-05-03 14:00:00
sr:sport_event:46657227	sr:season:114317	sr:competitor:6074	sr:competitor:3208	0	0	closed	24	sr:venue:15676	2024-11-24 22:15:00
sr:sport_event:51095235	sr:season:118699	sr:competitor:29	sr:competitor:58	2	2	closed	11	sr:venue:1135	2024-10-22 18:45:00
sr:sport_event:50850381	sr:season:118689	sr:competitor:38	sr:competitor:60	\N	\N	not_started	21	sr:venue:799	2025-01-14 19:30:00
sr:sport_event:50850587	sr:season:118689	sr:competitor:31	sr:competitor:39	\N	\N	not_started	31	sr:venue:2183	2025-04-05 14:00:00
sr:sport_event:51095753	sr:season:118699	sr:competitor:21	sr:competitor:34	\N	\N	not_started	21	sr:venue:3002	2024-12-14 12:30:00
sr:sport_event:50850133	sr:season:118689	sr:competitor:30	sr:competitor:3	2	2	closed	9	sr:venue:2443	2024-10-26 14:00:00
sr:sport_event:50850709	sr:season:118689	sr:competitor:31	sr:competitor:32	\N	\N	not_started	37	sr:venue:2183	2025-05-18 14:00:00
sr:sport_event:50850061	sr:season:118689	sr:competitor:45	sr:competitor:32	1	1	closed	5	sr:venue:2231	2024-09-21 14:00:00
sr:sport_event:50850101	sr:season:118689	sr:competitor:31	sr:competitor:60	1	0	closed	7	sr:venue:2183	2024-10-05 14:00:00
sr:sport_event:50850119	sr:season:118689	sr:competitor:14	sr:competitor:7	1	0	closed	8	sr:venue:2230	2024-10-21 19:00:00
sr:sport_event:50850155	sr:season:118689	sr:competitor:35	sr:competitor:38	1	1	closed	10	sr:venue:9	2024-11-03 16:30:00
sr:sport_event:50850127	sr:season:118689	sr:competitor:42	sr:competitor:44	2	2	closed	9	sr:venue:624	2024-10-27 16:30:00
sr:sport_event:46657051	sr:season:114317	sr:competitor:3215	sr:competitor:36839	4	3	closed	18	sr:venue:1082	2024-10-19 20:00:00
sr:sport_event:50850033	sr:season:118689	sr:competitor:7	sr:competitor:31	2	2	closed	4	sr:venue:10	2024-09-14 14:00:00
sr:sport_event:50852313	sr:season:118691	sr:competitor:2819	sr:competitor:2818	\N	\N	postponed	12	sr:venue:619	2024-11-02 17:30:00
sr:sport_event:46657069	sr:season:114317	sr:competitor:3204	sr:competitor:7629	0	1	closed	18	sr:venue:4754	2024-10-20 00:15:00
sr:sport_event:50852133	sr:season:118691	sr:competitor:2819	sr:competitor:2821	4	3	closed	3	sr:venue:619	2024-08-26 19:30:00
sr:sport_event:50852171	sr:season:118691	sr:competitor:24264	sr:competitor:2817	1	4	closed	5	sr:venue:11380	2024-09-15 14:15:00
sr:sport_event:50852315	sr:season:118691	sr:competitor:2828	sr:competitor:2829	\N	\N	postponed	12	sr:venue:691	2024-11-02 20:00:00
sr:sport_event:50852439	sr:season:118691	sr:competitor:6577	sr:competitor:2814	\N	\N	not_started	18	sr:venue:974	2024-12-22 17:30:00
sr:sport_event:50852233	sr:season:118691	sr:competitor:2819	sr:competitor:6577	3	1	closed	8	sr:venue:619	2024-09-30 19:00:00
sr:sport_event:50852421	sr:season:118691	sr:competitor:2816	sr:competitor:2818	\N	\N	not_started	18	sr:venue:1045	2024-12-22 20:00:00
sr:sport_event:50852739	sr:season:118691	sr:competitor:2828	sr:competitor:2814	\N	\N	not_started	33	sr:venue:691	2025-04-23 17:00:00
sr:sport_event:50852791	sr:season:118691	sr:competitor:2824	sr:competitor:2821	\N	\N	not_started	36	sr:venue:581	2025-05-14 17:00:00
sr:sport_event:50852773	sr:season:118691	sr:competitor:6577	sr:competitor:2818	\N	\N	not_started	35	sr:venue:974	2025-05-11 17:00:00
sr:sport_event:50852655	sr:season:118691	sr:competitor:2814	sr:competitor:2836	\N	\N	not_started	29	sr:venue:1307	2025-03-30 17:00:00
sr:sport_event:50850029	sr:season:118689	sr:competitor:40	sr:competitor:48	3	2	closed	4	sr:venue:815	2024-09-14 16:30:00
sr:sport_event:50852503	sr:season:118691	sr:competitor:2859	sr:competitor:2833	\N	\N	not_started	22	sr:venue:608	2025-02-02 19:00:00
sr:sport_event:50852277	sr:season:118691	sr:competitor:2828	sr:competitor:6577	2	3	closed	10	sr:venue:691	2024-10-21 19:00:00
sr:sport_event:50852377	sr:season:118691	sr:competitor:2819	sr:competitor:24264	\N	\N	not_started	15	sr:venue:619	2024-12-01 13:00:00
sr:sport_event:50852827	sr:season:118691	sr:competitor:2885	sr:competitor:2820	\N	\N	not_started	38	sr:venue:9311	2025-05-25 17:00:00
sr:sport_event:50852659	sr:season:118691	sr:competitor:2829	sr:competitor:2845	\N	\N	not_started	29	sr:venue:754	2025-03-30 17:00:00
sr:sport_event:50850205	sr:season:118689	sr:competitor:45	sr:competitor:44	2	3	closed	12	sr:venue:2231	2024-11-24 14:00:00
sr:sport_event:50852537	sr:season:118691	sr:competitor:2828	sr:competitor:2845	\N	\N	not_started	23	sr:venue:691	2025-02-09 19:00:00
sr:sport_event:46657091	sr:season:114317	sr:competitor:3219	sr:competitor:3215	2	1	closed	19	sr:venue:634	2024-10-27 20:15:00
sr:sport_event:46657289	sr:season:114317	sr:competitor:7629	sr:competitor:36837	\N	\N	not_started	26	sr:venue:12021	2024-12-08 23:00:00
sr:sport_event:46657243	sr:season:114317	sr:competitor:3202	sr:competitor:3205	\N	\N	not_started	25	sr:venue:44628	2024-12-02 00:30:00
sr:sport_event:46655859	sr:season:114317	sr:competitor:3211	sr:competitor:3212	0	0	closed	12	sr:venue:1009	2024-08-25 23:30:00
sr:sport_event:46657151	sr:season:114317	sr:competitor:36842	sr:competitor:3217	1	1	closed	21	sr:venue:12031	2024-11-05 00:00:00
sr:sport_event:46657195	sr:season:114317	sr:competitor:3208	sr:competitor:3218	0	0	closed	23	sr:venue:1079	2024-11-20 22:15:00
sr:sport_event:46657199	sr:season:114317	sr:competitor:3219	sr:competitor:7628	0	1	closed	23	sr:venue:634	2024-11-18 20:00:00
sr:sport_event:46657201	sr:season:114317	sr:competitor:4937	sr:competitor:3216	1	0	closed	23	sr:venue:2388	2024-11-19 00:30:00
sr:sport_event:46655857	sr:season:114317	sr:competitor:3215	sr:competitor:3209	0	0	closed	12	sr:venue:1082	2024-08-25 20:00:00
sr:sport_event:53764875	sr:season:114317	sr:competitor:7628	sr:competitor:3209	1	1	closed	16	sr:venue:4738	2024-10-01 21:30:00
sr:sport_event:46657165	sr:season:114317	sr:competitor:3216	sr:competitor:3219	1	0	closed	22	sr:venue:613	2024-11-12 00:00:00
sr:sport_event:46657203	sr:season:114317	sr:competitor:65668	sr:competitor:3203	1	1	closed	23	sr:venue:69401	2024-11-21 20:00:00
sr:sport_event:46657267	sr:season:114317	sr:competitor:65676	sr:competitor:3215	\N	\N	not_started	26	sr:venue:49307	2024-12-08 23:00:00
sr:sport_event:46657317	sr:season:114317	sr:competitor:3201	sr:competitor:7628	\N	\N	not_started	27	sr:venue:14324	2024-12-15 23:00:00
sr:sport_event:46657265	sr:season:114317	sr:competitor:3217	sr:competitor:3215	\N	\N	not_started	25	sr:venue:1329	2024-11-30 22:30:00
sr:sport_event:50852095	sr:season:118691	sr:competitor:2821	sr:competitor:2885	2	1	closed	1	sr:venue:697	2024-08-16 17:00:00
sr:sport_event:50852207	sr:season:118691	sr:competitor:2833	sr:competitor:2831	2	1	closed	7	sr:venue:730	2024-09-24 17:00:00
sr:sport_event:51095253	sr:season:118699	sr:competitor:25	sr:competitor:71	1	0	closed	11	sr:venue:2352	2024-10-23 18:45:00
sr:sport_event:51095393	sr:season:118699	sr:competitor:8	sr:competitor:6	\N	\N	postponed	14	sr:venue:1136	2024-11-05 19:45:00
sr:sport_event:50852671	sr:season:118691	sr:competitor:2833	sr:competitor:2836	\N	\N	not_started	30	sr:venue:730	2025-04-06 17:00:00
sr:sport_event:50850035	sr:season:118689	sr:competitor:43	sr:competitor:37	1	1	closed	4	sr:venue:611	2024-09-14 14:00:00
sr:sport_event:50850183	sr:season:118689	sr:competitor:37	sr:competitor:48	0	0	closed	11	sr:venue:18379	2024-11-09 15:00:00
sr:sport_event:50850235	sr:season:118689	sr:competitor:43	sr:competitor:30	\N	\N	not_started	14	sr:venue:611	2024-12-05 19:30:00
sr:sport_event:50850485	sr:season:118689	sr:competitor:32	sr:competitor:33	\N	\N	not_started	26	sr:venue:2188	2025-02-22 15:00:00
sr:sport_event:50850393	sr:season:118689	sr:competitor:48	sr:competitor:33	\N	\N	not_started	22	sr:venue:12	2025-01-19 14:00:00
sr:sport_event:50850451	sr:season:118689	sr:competitor:7	sr:competitor:48	\N	\N	not_started	25	sr:venue:10	2025-02-15 15:00:00
sr:sport_event:50850339	sr:season:118689	sr:competitor:31	sr:competitor:17	\N	\N	not_started	19	sr:venue:2183	2024-12-29 14:30:00
sr:sport_event:50850371	sr:season:118689	sr:competitor:48	sr:competitor:40	\N	\N	not_started	21	sr:venue:12	2025-01-15 19:30:00
sr:sport_event:46657055	sr:season:114317	sr:competitor:3203	sr:competitor:36837	0	1	closed	18	sr:venue:4750	2024-10-19 20:00:00
sr:sport_event:50850547	sr:season:118689	sr:competitor:31	sr:competitor:35	\N	\N	not_started	29	sr:venue:2183	2025-03-15 15:00:00
sr:sport_event:50850167	sr:season:118689	sr:competitor:50	sr:competitor:60	3	2	closed	11	sr:venue:53349	2024-11-09 15:00:00
sr:sport_event:50850041	sr:season:118689	sr:competitor:45	sr:competitor:35	0	3	closed	4	sr:venue:2231	2024-09-14 11:30:00
sr:sport_event:50850515	sr:season:118689	sr:competitor:50	sr:competitor:40	\N	\N	not_started	28	sr:venue:53349	2025-03-08 15:00:00
sr:sport_event:50850305	sr:season:118689	sr:competitor:37	sr:competitor:30	\N	\N	not_started	17	sr:venue:18379	2024-12-21 15:00:00
sr:sport_event:50850361	sr:season:118689	sr:competitor:45	sr:competitor:50	\N	\N	not_started	20	sr:venue:2231	2025-01-04 15:00:00
sr:sport_event:46657117	sr:season:114317	sr:competitor:3218	sr:competitor:3202	1	0	closed	20	sr:venue:981	2024-11-03 22:30:00
sr:sport_event:46657105	sr:season:114317	sr:competitor:3215	sr:competitor:4937	2	0	closed	20	sr:venue:1082	2024-11-03 20:30:00
sr:sport_event:50850363	sr:season:118689	sr:competitor:33	sr:competitor:39	\N	\N	not_started	20	sr:venue:28762	2025-01-04 12:30:00
sr:sport_event:50850479	sr:season:118689	sr:competitor:40	sr:competitor:38	\N	\N	not_started	26	sr:venue:815	2025-02-22 15:00:00
sr:sport_event:50850137	sr:season:118689	sr:competitor:7	sr:competitor:33	1	0	closed	9	sr:venue:10	2024-10-27 14:00:00
sr:sport_event:50850263	sr:season:118689	sr:competitor:33	sr:competitor:38	\N	\N	not_started	15	sr:venue:28762	2024-12-08 16:30:00
sr:sport_event:46657247	sr:season:114317	sr:competitor:36837	sr:competitor:3204	\N	\N	not_started	25	sr:venue:12712	2024-12-02 21:30:00
sr:sport_event:50850181	sr:season:118689	sr:competitor:33	sr:competitor:32	1	2	closed	11	sr:venue:28762	2024-11-10 14:00:00
sr:sport_event:50850279	sr:season:118689	sr:competitor:39	sr:competitor:31	\N	\N	not_started	16	sr:venue:765	2024-12-14 15:00:00
sr:sport_event:50850253	sr:season:118689	sr:competitor:48	sr:competitor:44	\N	\N	not_started	15	sr:venue:12	2024-12-07 12:30:00
sr:sport_event:46657143	sr:season:114317	sr:competitor:36839	sr:competitor:3216	2	1	closed	21	sr:venue:12025	2024-11-07 22:00:00
sr:sport_event:50850411	sr:season:118689	sr:competitor:30	sr:competitor:48	\N	\N	not_started	23	sr:venue:2443	2025-01-25 15:00:00
sr:sport_event:50850323	sr:season:118689	sr:competitor:45	sr:competitor:37	\N	\N	not_started	18	sr:venue:2231	2024-12-26 15:00:00
sr:sport_event:50850535	sr:season:118689	sr:competitor:60	sr:competitor:50	\N	\N	not_started	29	sr:venue:2990	2025-03-15 15:00:00
sr:sport_event:46657189	sr:season:114317	sr:competitor:3202	sr:competitor:3204	1	0	closed	23	sr:venue:44628	2024-11-21 00:30:00
sr:sport_event:50850221	sr:season:118689	sr:competitor:33	sr:competitor:43	\N	\N	not_started	13	sr:venue:28762	2024-12-01 13:30:00
sr:sport_event:50850211	sr:season:118689	sr:competitor:38	sr:competitor:40	\N	\N	not_started	13	sr:venue:799	2024-12-01 13:30:00
sr:sport_event:46657223	sr:season:114317	sr:competitor:191648	sr:competitor:3219	1	1	closed	24	sr:venue:17150	2024-11-24 20:00:00
sr:sport_event:46657245	sr:season:114317	sr:competitor:3210	sr:competitor:7629	\N	\N	not_started	25	sr:venue:2388	2024-12-02 22:45:00
sr:sport_event:46657287	sr:season:114317	sr:competitor:3204	sr:competitor:3208	\N	\N	not_started	26	sr:venue:4754	2024-12-08 23:00:00
sr:sport_event:46657291	sr:season:114317	sr:competitor:3205	sr:competitor:3210	\N	\N	not_started	26	sr:venue:12003	2024-12-08 23:00:00
sr:sport_event:46657315	sr:season:114317	sr:competitor:36842	sr:competitor:191648	\N	\N	not_started	27	sr:venue:12031	2024-12-15 23:00:00
sr:sport_event:51095165	sr:season:118699	sr:competitor:46	sr:competitor:74	1	0	closed	10	sr:venue:631	2024-10-19 14:00:00
sr:sport_event:46657221	sr:season:114317	sr:competitor:7628	sr:competitor:4937	0	0	closed	24	sr:venue:4738	2024-11-23 22:30:00
sr:sport_event:46657211	sr:season:114317	sr:competitor:65676	sr:competitor:3217	0	1	closed	24	sr:venue:49307	2024-11-25 22:00:00
sr:sport_event:46657301	sr:season:114317	sr:competitor:3210	sr:competitor:3212	\N	\N	not_started	27	sr:venue:2388	2024-12-15 23:00:00
sr:sport_event:50850071	sr:season:118689	sr:competitor:50	sr:competitor:37	1	1	closed	6	sr:venue:53349	2024-09-28 14:00:00
sr:sport_event:50850085	sr:season:118689	sr:competitor:3	sr:competitor:44	1	2	closed	6	sr:venue:1272	2024-09-28 16:30:00
sr:sport_event:50850289	sr:season:118689	sr:competitor:50	sr:competitor:14	\N	\N	not_started	17	sr:venue:53349	2024-12-21 15:00:00
sr:sport_event:50850439	sr:season:118689	sr:competitor:35	sr:competitor:7	\N	\N	not_started	24	sr:venue:9	2025-02-01 15:00:00
sr:sport_event:50850357	sr:season:118689	sr:competitor:44	sr:competitor:35	\N	\N	not_started	20	sr:venue:579	2025-01-05 16:30:00
sr:sport_event:53785495	sr:season:114317	sr:competitor:3217	sr:competitor:3208	3	0	closed	16	sr:venue:1329	2024-10-01 23:30:00
sr:sport_event:50850525	sr:season:118689	sr:competitor:35	sr:competitor:42	\N	\N	not_started	28	sr:venue:9	2025-03-08 15:00:00
sr:sport_event:50850389	sr:season:118689	sr:competitor:50	sr:competitor:44	\N	\N	not_started	22	sr:venue:53349	2025-01-18 15:00:00
sr:sport_event:50850593	sr:season:118689	sr:competitor:37	sr:competitor:60	\N	\N	not_started	31	sr:venue:18379	2025-04-05 14:00:00
sr:sport_event:50850557	sr:season:118689	sr:competitor:42	sr:competitor:43	\N	\N	not_started	30	sr:venue:624	2025-04-01 14:00:00
sr:sport_event:50850367	sr:season:118689	sr:competitor:42	sr:competitor:33	\N	\N	not_started	21	sr:venue:624	2025-01-15 20:00:00
sr:sport_event:50850293	sr:season:118689	sr:competitor:48	sr:competitor:38	\N	\N	not_started	17	sr:venue:12	2024-12-22 14:00:00
sr:sport_event:50850177	sr:season:118689	sr:competitor:35	sr:competitor:31	3	0	closed	11	sr:venue:9	2024-11-10 14:00:00
sr:sport_event:50850447	sr:season:118689	sr:competitor:40	sr:competitor:32	\N	\N	not_started	25	sr:venue:815	2025-02-15 15:00:00
sr:sport_event:50850045	sr:season:118689	sr:competitor:3	sr:competitor:39	1	2	closed	4	sr:venue:1272	2024-09-15 15:30:00
sr:sport_event:46657057	sr:season:114317	sr:competitor:3216	sr:competitor:3210	3	0	closed	18	sr:venue:613	2024-10-20 18:00:00
sr:sport_event:50850249	sr:season:118689	sr:competitor:50	sr:competitor:39	\N	\N	not_started	15	sr:venue:53349	2024-12-07 15:00:00
sr:sport_event:50850539	sr:season:118689	sr:competitor:40	sr:competitor:44	\N	\N	not_started	29	sr:venue:815	2025-03-15 15:00:00
sr:sport_event:46657079	sr:season:114317	sr:competitor:36833	sr:competitor:3218	1	0	closed	19	sr:venue:12017	2024-10-28 00:15:00
sr:sport_event:50850355	sr:season:118689	sr:competitor:43	sr:competitor:32	\N	\N	not_started	20	sr:venue:611	2025-01-05 14:00:00
sr:sport_event:50850489	sr:season:118689	sr:competitor:17	sr:competitor:44	\N	\N	not_started	26	sr:venue:606	2025-02-22 15:00:00
sr:sport_event:50850021	sr:season:118689	sr:competitor:39	sr:competitor:33	2	1	closed	3	sr:venue:765	2024-09-01 12:30:00
sr:sport_event:50850123	sr:season:118689	sr:competitor:33	sr:competitor:37	4	1	closed	8	sr:venue:28762	2024-10-19 11:30:00
sr:sport_event:50850267	sr:season:118689	sr:competitor:60	sr:competitor:37	\N	\N	not_started	16	sr:venue:2990	2024-12-16 20:00:00
sr:sport_event:50850487	sr:season:118689	sr:competitor:31	sr:competitor:50	\N	\N	not_started	26	sr:venue:2183	2025-02-22 15:00:00
sr:sport_event:50850413	sr:season:118689	sr:competitor:7	sr:competitor:50	\N	\N	not_started	23	sr:venue:10	2025-01-26 14:00:00
sr:sport_event:46657065	sr:season:114317	sr:competitor:6074	sr:competitor:3212	2	0	closed	18	sr:venue:15676	2024-10-20 22:30:00
sr:sport_event:46657283	sr:season:114317	sr:competitor:6074	sr:competitor:3219	\N	\N	not_started	26	sr:venue:15676	2024-12-08 23:00:00
sr:sport_event:50850063	sr:season:118689	sr:competitor:33	sr:competitor:50	3	1	closed	5	sr:venue:28762	2024-09-21 14:00:00
sr:sport_event:46657135	sr:season:114317	sr:competitor:3202	sr:competitor:6074	4	1	closed	21	sr:venue:44628	2024-11-06 22:30:00
sr:sport_event:50850057	sr:season:118689	sr:competitor:44	sr:competitor:60	3	0	closed	5	sr:venue:579	2024-09-21 14:00:00
sr:sport_event:50850333	sr:season:118689	sr:competitor:48	sr:competitor:14	\N	\N	not_started	19	sr:venue:12	2024-12-29 15:00:00
sr:sport_event:50850459	sr:season:118689	sr:competitor:17	sr:competitor:39	\N	\N	not_started	25	sr:venue:606	2025-02-15 15:00:00
sr:sport_event:50850511	sr:season:118689	sr:competitor:44	sr:competitor:39	\N	\N	not_started	27	sr:venue:579	2025-02-26 20:00:00
sr:sport_event:50850277	sr:season:118689	sr:competitor:17	sr:competitor:35	\N	\N	not_started	16	sr:venue:606	2024-12-15 16:30:00
sr:sport_event:46657083	sr:season:114317	sr:competitor:3210	sr:competitor:7628	1	1	closed	19	sr:venue:2388	2024-10-28 00:15:00
sr:sport_event:46657013	sr:season:114317	sr:competitor:42338	sr:competitor:3204	1	0	closed	16	sr:venue:8975	2024-09-29 22:30:00
sr:sport_event:46657209	sr:season:114317	sr:competitor:3206	sr:competitor:3217	1	1	closed	23	sr:venue:1007	2024-11-20 22:15:00
sr:sport_event:46657163	sr:season:114317	sr:competitor:3203	sr:competitor:4937	3	1	closed	22	sr:venue:15676	2024-11-12 00:00:00
sr:sport_event:50850075	sr:season:118689	sr:competitor:48	sr:competitor:7	2	1	closed	6	sr:venue:12	2024-09-28 14:00:00
sr:sport_event:46657235	sr:season:114317	sr:competitor:3205	sr:competitor:36833	1	0	closed	24	sr:venue:12003	2024-11-24 20:00:00
sr:sport_event:46657157	sr:season:114317	sr:competitor:3217	sr:competitor:3201	0	1	closed	22	sr:venue:1329	2024-11-09 22:00:00
sr:sport_event:46655869	sr:season:114317	sr:competitor:3218	sr:competitor:6074	1	1	closed	12	sr:venue:981	2024-08-25 17:30:00
sr:sport_event:46657253	sr:season:114317	sr:competitor:3219	sr:competitor:3218	\N	\N	not_started	25	sr:venue:634	2024-11-30 22:30:00
sr:sport_event:46657249	sr:season:114317	sr:competitor:3208	sr:competitor:42338	\N	\N	not_started	25	sr:venue:1079	2024-12-01 22:15:00
sr:sport_event:46657311	sr:season:114317	sr:competitor:4937	sr:competitor:6074	\N	\N	not_started	27	sr:venue:12033	2024-12-15 23:00:00
sr:sport_event:50850193	sr:season:118689	sr:competitor:48	sr:competitor:50	0	0	closed	12	sr:venue:12	2024-11-23 15:00:00
sr:sport_event:50850131	sr:season:118689	sr:competitor:50	sr:competitor:32	4	3	closed	9	sr:venue:53349	2024-10-26 14:00:00
sr:sport_event:50850219	sr:season:118689	sr:competitor:14	sr:competitor:32	\N	\N	not_started	13	sr:venue:2230	2024-11-30 15:00:00
sr:sport_event:50850431	sr:season:118689	sr:competitor:50	sr:competitor:33	\N	\N	not_started	24	sr:venue:53349	2025-02-01 15:00:00
sr:sport_event:50850331	sr:season:118689	sr:competitor:7	sr:competitor:45	\N	\N	not_started	19	sr:venue:10	2024-12-29 15:00:00
sr:sport_event:50850043	sr:season:118689	sr:competitor:33	sr:competitor:42	0	1	closed	4	sr:venue:28762	2024-09-15 13:00:00
sr:sport_event:50850307	sr:season:118689	sr:competitor:60	sr:competitor:7	\N	\N	not_started	18	sr:venue:2990	2024-12-26 15:00:00
sr:sport_event:50850443	sr:season:118689	sr:competitor:14	sr:competitor:30	\N	\N	not_started	24	sr:venue:2230	2025-02-01 15:00:00
sr:sport_event:50850377	sr:season:118689	sr:competitor:14	sr:competitor:44	\N	\N	not_started	21	sr:venue:2230	2025-01-14 20:00:00
sr:sport_event:50850009	sr:season:118689	sr:competitor:50	sr:competitor:45	3	1	closed	3	sr:venue:53349	2024-08-31 14:00:00
sr:sport_event:50850497	sr:season:118689	sr:competitor:30	sr:competitor:60	\N	\N	not_started	27	sr:venue:2443	2025-02-25 19:45:00
sr:sport_event:50850099	sr:season:118689	sr:competitor:48	sr:competitor:39	0	0	closed	7	sr:venue:12	2024-10-05 16:30:00
sr:sport_event:50850523	sr:season:118689	sr:competitor:44	sr:competitor:45	\N	\N	not_started	28	sr:venue:579	2025-03-08 15:00:00
sr:sport_event:46657029	sr:season:114317	sr:competitor:3210	sr:competitor:3203	0	0	closed	17	sr:venue:2388	2024-10-06 19:30:00
sr:sport_event:50850309	sr:season:118689	sr:competitor:42	sr:competitor:32	\N	\N	not_started	18	sr:venue:624	2024-12-27 20:15:00
sr:sport_event:50850291	sr:season:118689	sr:competitor:7	sr:competitor:42	\N	\N	not_started	17	sr:venue:10	2024-12-21 17:30:00
sr:sport_event:50850727	sr:season:118689	sr:competitor:14	sr:competitor:38	\N	\N	not_started	38	sr:venue:2230	2025-05-25 15:00:00
sr:sport_event:50850501	sr:season:118689	sr:competitor:33	sr:competitor:17	\N	\N	not_started	27	sr:venue:28762	2025-02-25 19:45:00
sr:sport_event:46657059	sr:season:114317	sr:competitor:7628	sr:competitor:3202	3	0	closed	18	sr:venue:4738	2024-10-19 22:15:00
sr:sport_event:50850621	sr:season:118689	sr:competitor:48	sr:competitor:17	\N	\N	not_started	33	sr:venue:12	2025-04-19 14:00:00
sr:sport_event:50850559	sr:season:118689	sr:competitor:30	sr:competitor:40	\N	\N	not_started	30	sr:venue:2443	2025-04-01 14:00:00
sr:sport_event:50850543	sr:season:118689	sr:competitor:43	sr:competitor:33	\N	\N	not_started	29	sr:venue:611	2025-03-15 15:00:00
sr:sport_event:50850395	sr:season:118689	sr:competitor:32	sr:competitor:17	\N	\N	not_started	22	sr:venue:2188	2025-01-19 16:30:00
sr:sport_event:50850565	sr:season:118689	sr:competitor:38	sr:competitor:33	\N	\N	not_started	30	sr:venue:799	2025-04-02 14:00:00
sr:sport_event:50850207	sr:season:118689	sr:competitor:50	sr:competitor:31	\N	\N	not_started	13	sr:venue:53349	2024-11-30 15:00:00
sr:sport_event:50850017	sr:season:118689	sr:competitor:31	sr:competitor:40	1	2	closed	3	sr:venue:2183	2024-08-31 14:00:00
sr:sport_event:50850677	sr:season:118689	sr:competitor:43	sr:competitor:48	\N	\N	not_started	36	sr:venue:611	2025-05-10 14:00:00
sr:sport_event:50850599	sr:season:118689	sr:competitor:30	sr:competitor:31	\N	\N	not_started	32	sr:venue:2443	2025-04-12 14:00:00
sr:sport_event:50850295	sr:season:118689	sr:competitor:43	sr:competitor:45	\N	\N	not_started	17	sr:venue:611	2024-12-22 14:00:00
sr:sport_event:50850189	sr:season:118689	sr:competitor:42	sr:competitor:14	3	0	closed	12	sr:venue:624	2024-11-23 15:00:00
sr:sport_event:50850625	sr:season:118689	sr:competitor:32	sr:competitor:42	\N	\N	not_started	33	sr:venue:2188	2025-04-19 14:00:00
sr:sport_event:50850423	sr:season:118689	sr:competitor:33	sr:competitor:31	\N	\N	not_started	23	sr:venue:28762	2025-01-26 14:00:00
sr:sport_event:50850369	sr:season:118689	sr:competitor:50	sr:competitor:17	\N	\N	not_started	21	sr:venue:53349	2025-01-14 19:30:00
sr:sport_event:50850241	sr:season:118689	sr:competitor:17	sr:competitor:14	\N	\N	not_started	14	sr:venue:606	2024-12-04 19:30:00
sr:sport_event:50850571	sr:season:118689	sr:competitor:45	sr:competitor:7	\N	\N	not_started	30	sr:venue:2231	2025-04-02 14:00:00
sr:sport_event:50850433	sr:season:118689	sr:competitor:38	sr:competitor:37	\N	\N	not_started	24	sr:venue:799	2025-02-01 15:00:00
sr:sport_event:50850163	sr:season:118689	sr:competitor:33	sr:competitor:40	4	1	closed	10	sr:venue:28762	2024-11-03 14:00:00
sr:sport_event:50850699	sr:season:118689	sr:competitor:50	sr:competitor:43	\N	\N	not_started	37	sr:venue:53349	2025-05-18 14:00:00
sr:sport_event:50850499	sr:season:118689	sr:competitor:14	sr:competitor:42	\N	\N	not_started	27	sr:venue:2230	2025-02-25 19:45:00
sr:sport_event:50850465	sr:season:118689	sr:competitor:37	sr:competitor:50	\N	\N	not_started	25	sr:venue:18379	2025-02-15 15:00:00
sr:sport_event:46657049	sr:season:114317	sr:competitor:3217	sr:competitor:3219	1	1	closed	18	sr:venue:1329	2024-10-20 20:15:00
sr:sport_event:46657095	sr:season:114317	sr:competitor:65668	sr:competitor:3206	1	1	closed	19	sr:venue:69401	2024-10-25 18:00:00
sr:sport_event:46657179	sr:season:114317	sr:competitor:7629	sr:competitor:3209	1	0	closed	22	sr:venue:12021	2024-11-10 00:00:00
sr:sport_event:50850387	sr:season:118689	sr:competitor:42	sr:competitor:40	\N	\N	not_started	22	sr:venue:624	2025-01-18 17:30:00
sr:sport_event:46657213	sr:season:114317	sr:competitor:3215	sr:competitor:3206	\N	\N	not_started	24	sr:venue:1082	2024-12-04 22:00:00
sr:sport_event:54879045	sr:season:114317	sr:competitor:4937	sr:competitor:3211	2	3	closed	21	sr:venue:2388	2024-11-07 00:30:00
sr:sport_event:50852085	sr:season:118691	sr:competitor:2826	sr:competitor:2829	1	1	closed	1	sr:venue:760	2024-08-18 19:30:00
sr:sport_event:50852113	sr:season:118691	sr:competitor:2845	sr:competitor:6577	2	1	closed	2	sr:venue:14888	2024-08-25 17:00:00
sr:sport_event:50850271	sr:season:118689	sr:competitor:30	sr:competitor:7	\N	\N	not_started	16	sr:venue:2443	2024-12-15 14:00:00
sr:sport_event:50850579	sr:season:118689	sr:competitor:7	sr:competitor:30	\N	\N	not_started	31	sr:venue:10	2025-04-05 14:00:00
sr:sport_event:50850425	sr:season:118689	sr:competitor:3	sr:competitor:42	\N	\N	not_started	23	sr:venue:1272	2025-01-25 15:00:00
sr:sport_event:50850573	sr:season:118689	sr:competitor:44	sr:competitor:48	\N	\N	not_started	30	sr:venue:579	2025-04-02 19:00:00
sr:sport_event:50850349	sr:season:118689	sr:competitor:40	sr:competitor:31	\N	\N	not_started	20	sr:venue:815	2025-01-04 15:00:00
sr:sport_event:50850213	sr:season:118689	sr:competitor:7	sr:competitor:39	\N	\N	not_started	13	sr:venue:10	2024-11-30 15:00:00
sr:sport_event:50850645	sr:season:118689	sr:competitor:17	sr:competitor:40	\N	\N	not_started	34	sr:venue:606	2025-04-26 14:00:00
sr:sport_event:50850373	sr:season:118689	sr:competitor:32	sr:competitor:30	\N	\N	not_started	21	sr:venue:2188	2025-01-16 19:30:00
sr:sport_event:50850027	sr:season:118689	sr:competitor:60	sr:competitor:38	0	1	closed	4	sr:venue:2990	2024-09-14 19:00:00
sr:sport_event:50850683	sr:season:118689	sr:competitor:35	sr:competitor:37	\N	\N	not_started	36	sr:venue:9	2025-05-10 14:00:00
sr:sport_event:50850669	sr:season:118689	sr:competitor:31	sr:competitor:45	\N	\N	not_started	35	sr:venue:2183	2025-05-03 14:00:00
sr:sport_event:50850519	sr:season:118689	sr:competitor:38	sr:competitor:31	\N	\N	not_started	28	sr:venue:799	2025-03-08 15:00:00
sr:sport_event:50850105	sr:season:118689	sr:competitor:37	sr:competitor:32	4	1	closed	7	sr:venue:18379	2024-10-05 14:00:00
sr:sport_event:50850415	sr:season:118689	sr:competitor:43	sr:competitor:35	\N	\N	not_started	23	sr:venue:611	2025-01-26 19:00:00
sr:sport_event:50850633	sr:season:118689	sr:competitor:37	sr:competitor:45	\N	\N	not_started	33	sr:venue:18379	2025-04-19 14:00:00
sr:sport_event:50850731	sr:season:118689	sr:competitor:33	sr:competitor:30	\N	\N	not_started	38	sr:venue:28762	2025-05-25 15:00:00
sr:sport_event:46657031	sr:season:114317	sr:competitor:36837	sr:competitor:3211	0	0	closed	17	sr:venue:12712	2024-10-06 22:00:00
sr:sport_event:50852215	sr:season:118691	sr:competitor:6577	sr:competitor:2816	1	1	closed	7	sr:venue:974	2024-09-26 17:00:00
sr:sport_event:46657073	sr:season:114317	sr:competitor:3205	sr:competitor:3204	2	3	closed	19	sr:venue:12003	2024-10-28 22:00:00
sr:sport_event:50850325	sr:season:118689	sr:competitor:3	sr:competitor:35	\N	\N	not_started	18	sr:venue:1272	2024-12-26 17:30:00
sr:sport_event:46657177	sr:season:114317	sr:competitor:3204	sr:competitor:36833	1	0	closed	22	sr:venue:4754	2024-11-09 19:45:00
sr:sport_event:50850215	sr:season:118689	sr:competitor:44	sr:competitor:17	\N	\N	not_started	13	sr:venue:579	2024-12-01 16:00:00
sr:sport_event:50852103	sr:season:118691	sr:competitor:2821	sr:competitor:2828	3	1	closed	2	sr:venue:697	2024-08-23 17:00:00
sr:sport_event:50852409	sr:season:118691	sr:competitor:2814	sr:competitor:2820	\N	\N	not_started	17	sr:venue:1307	2024-12-14 13:00:00
sr:sport_event:50852137	sr:season:118691	sr:competitor:2831	sr:competitor:2845	0	0	closed	3	sr:venue:880	2024-08-28 17:00:00
sr:sport_event:50852301	sr:season:118691	sr:competitor:2825	sr:competitor:2816	1	1	closed	12	sr:venue:751	2024-11-03 20:00:00
sr:sport_event:50852163	sr:season:118691	sr:competitor:2816	sr:competitor:2845	2	0	closed	5	sr:venue:1045	2024-09-13 19:00:00
sr:sport_event:50852329	sr:season:118691	sr:competitor:2831	sr:competitor:2825	1	1	closed	13	sr:venue:880	2024-11-10 17:30:00
sr:sport_event:50852287	sr:season:118691	sr:competitor:2816	sr:competitor:2836	1	0	closed	11	sr:venue:1045	2024-10-27 17:30:00
sr:sport_event:50852793	sr:season:118691	sr:competitor:2831	sr:competitor:24264	\N	\N	not_started	36	sr:venue:880	2025-05-14 17:00:00
sr:sport_event:50852433	sr:season:118691	sr:competitor:2820	sr:competitor:2825	\N	\N	not_started	18	sr:venue:739	2024-12-21 17:30:00
sr:sport_event:50852595	sr:season:118691	sr:competitor:2831	sr:competitor:6577	\N	\N	not_started	26	sr:venue:880	2025-03-02 18:00:00
sr:sport_event:50852527	sr:season:118691	sr:competitor:6577	sr:competitor:2819	\N	\N	not_started	23	sr:venue:974	2025-02-09 19:00:00
sr:sport_event:50850197	sr:season:118689	sr:competitor:32	sr:competitor:35	1	1	closed	12	sr:venue:2188	2024-11-24 16:30:00
sr:sport_event:50850297	sr:season:118689	sr:competitor:32	sr:competitor:39	\N	\N	not_started	17	sr:venue:2188	2024-12-21 15:00:00
sr:sport_event:50852689	sr:season:118691	sr:competitor:2885	sr:competitor:2829	\N	\N	not_started	31	sr:venue:9311	2025-04-13 17:00:00
sr:sport_event:50852629	sr:season:118691	sr:competitor:2845	sr:competitor:2816	\N	\N	not_started	28	sr:venue:14888	2025-03-16 18:00:00
sr:sport_event:50852709	sr:season:118691	sr:competitor:6577	sr:competitor:2836	\N	\N	not_started	32	sr:venue:974	2025-04-20 17:00:00
sr:sport_event:50852505	sr:season:118691	sr:competitor:24264	sr:competitor:6577	\N	\N	not_started	22	sr:venue:11380	2025-02-02 19:00:00
sr:sport_event:50852621	sr:season:118691	sr:competitor:2836	sr:competitor:2817	\N	\N	not_started	28	sr:venue:21414	2025-03-16 18:00:00
sr:sport_event:46657169	sr:season:114317	sr:competitor:191648	sr:competitor:3208	1	1	closed	22	sr:venue:17150	2024-11-11 19:00:00
sr:sport_event:46657229	sr:season:114317	sr:competitor:42338	sr:competitor:36837	1	0	closed	24	sr:venue:8975	2024-11-27 00:15:00
sr:sport_event:46657155	sr:season:114317	sr:competitor:65676	sr:competitor:3206	1	1	closed	22	sr:venue:57376	2024-11-10 19:00:00
sr:sport_event:46657275	sr:season:114317	sr:competitor:3216	sr:competitor:3201	\N	\N	not_started	26	sr:venue:613	2024-12-08 23:00:00
sr:sport_event:46657307	sr:season:114317	sr:competitor:36839	sr:competitor:3204	\N	\N	not_started	27	sr:venue:12025	2024-12-15 23:00:00
sr:sport_event:46657295	sr:season:114317	sr:competitor:3209	sr:competitor:36833	\N	\N	not_started	26	sr:venue:1099	2024-12-08 23:00:00
sr:sport_event:50852173	sr:season:118691	sr:competitor:2833	sr:competitor:2859	1	0	closed	5	sr:venue:730	2024-09-14 16:30:00
sr:sport_event:50852261	sr:season:118691	sr:competitor:2836	sr:competitor:2845	3	1	closed	10	sr:venue:21414	2024-10-20 14:15:00
sr:sport_event:50850467	sr:season:118689	sr:competitor:60	sr:competitor:3	\N	\N	not_started	26	sr:venue:2990	2025-02-22 15:00:00
sr:sport_event:50850153	sr:season:118689	sr:competitor:44	sr:competitor:30	2	1	closed	10	sr:venue:579	2024-11-02 15:00:00
sr:sport_event:50850679	sr:season:118689	sr:competitor:32	sr:competitor:50	\N	\N	not_started	36	sr:venue:2188	2025-05-10 14:00:00
sr:sport_event:46657101	sr:season:114317	sr:competitor:3206	sr:competitor:36842	1	1	closed	20	sr:venue:1007	2024-10-31 22:00:00
sr:sport_event:50850569	sr:season:118689	sr:competitor:39	sr:competitor:50	\N	\N	not_started	30	sr:venue:765	2025-04-02 14:00:00
sr:sport_event:50850409	sr:season:118689	sr:competitor:40	sr:competitor:37	\N	\N	not_started	23	sr:venue:815	2025-01-26 16:30:00
sr:sport_event:50850315	sr:season:118689	sr:competitor:44	sr:competitor:31	\N	\N	not_started	18	sr:venue:579	2024-12-26 20:00:00
sr:sport_event:50850397	sr:season:118689	sr:competitor:31	sr:competitor:43	\N	\N	not_started	22	sr:venue:2183	2025-01-18 15:00:00
sr:sport_event:50852271	sr:season:118691	sr:competitor:2885	sr:competitor:2831	2	3	closed	10	sr:venue:9311	2024-10-18 19:00:00
sr:sport_event:46657047	sr:season:114317	sr:competitor:3206	sr:competitor:4937	3	2	closed	18	sr:venue:1007	2024-10-20 20:15:00
sr:sport_event:50850635	sr:season:118689	sr:competitor:60	sr:competitor:35	\N	\N	not_started	34	sr:venue:2990	2025-04-26 14:00:00
sr:sport_event:50850717	sr:season:118689	sr:competitor:43	sr:competitor:17	\N	\N	not_started	38	sr:venue:611	2025-05-25 15:00:00
sr:sport_event:50850463	sr:season:118689	sr:competitor:33	sr:competitor:35	\N	\N	not_started	25	sr:venue:28762	2025-02-15 15:00:00
sr:sport_event:50850175	sr:season:118689	sr:competitor:44	sr:competitor:40	2	0	closed	11	sr:venue:579	2024-11-09 20:00:00
sr:sport_event:50850533	sr:season:118689	sr:competitor:3	sr:competitor:48	\N	\N	not_started	28	sr:venue:1272	2025-03-08 15:00:00
sr:sport_event:50850577	sr:season:118689	sr:competitor:50	sr:competitor:38	\N	\N	not_started	31	sr:venue:53349	2025-04-05 14:00:00
sr:sport_event:50850269	sr:season:118689	sr:competitor:42	sr:competitor:48	\N	\N	not_started	16	sr:venue:624	2024-12-14 15:00:00
sr:sport_event:50850015	sr:season:118689	sr:competitor:32	sr:competitor:43	1	1	closed	3	sr:venue:2188	2024-08-31 14:00:00
sr:sport_event:50850251	sr:season:118689	sr:competitor:7	sr:competitor:17	\N	\N	not_started	15	sr:venue:10	2024-12-07 15:00:00
sr:sport_event:46657081	sr:season:114317	sr:competitor:3202	sr:competitor:191648	1	1	closed	19	sr:venue:44628	2024-10-27 22:00:00
sr:sport_event:50850319	sr:season:118689	sr:competitor:39	sr:competitor:40	\N	\N	not_started	18	sr:venue:765	2024-12-26 15:00:00
sr:sport_event:50852149	sr:season:118691	sr:competitor:2885	sr:competitor:6577	2	0	closed	4	sr:venue:9311	2024-09-01 15:00:00
sr:sport_event:50852283	sr:season:118691	sr:competitor:2814	sr:competitor:2833	0	2	closed	11	sr:venue:1307	2024-10-25 19:00:00
sr:sport_event:50852369	sr:season:118691	sr:competitor:2818	sr:competitor:2825	\N	\N	not_started	15	sr:venue:2440	2024-12-01 17:30:00
sr:sport_event:50852461	sr:season:118691	sr:competitor:24264	sr:competitor:2833	\N	\N	not_started	20	sr:venue:11380	2025-01-19 19:00:00
sr:sport_event:50852275	sr:season:118691	sr:competitor:2819	sr:competitor:2859	1	1	closed	10	sr:venue:619	2024-10-20 16:30:00
sr:sport_event:50852337	sr:season:118691	sr:competitor:2818	sr:competitor:6577	1	3	closed	13	sr:venue:2440	2024-11-08 20:00:00
sr:sport_event:50852091	sr:season:118691	sr:competitor:2828	sr:competitor:2817	1	2	closed	1	sr:venue:691	2024-08-17 19:30:00
sr:sport_event:50852553	sr:season:118691	sr:competitor:2831	sr:competitor:2833	\N	\N	not_started	24	sr:venue:880	2025-02-16 19:00:00
sr:sport_event:46657161	sr:season:114317	sr:competitor:3211	sr:competitor:65668	3	0	closed	22	sr:venue:1009	2024-11-10 20:15:00
sr:sport_event:50852735	sr:season:118691	sr:competitor:2885	sr:competitor:2824	\N	\N	not_started	33	sr:venue:9311	2025-04-23 17:00:00
sr:sport_event:46657319	sr:season:114317	sr:competitor:3206	sr:competitor:3216	\N	\N	not_started	27	sr:venue:1007	2024-12-15 23:00:00
sr:sport_event:50850111	sr:season:118689	sr:competitor:32	sr:competitor:48	0	2	closed	8	sr:venue:2188	2024-10-19 14:15:00
sr:sport_event:50852519	sr:season:118691	sr:competitor:2817	sr:competitor:2885	\N	\N	not_started	22	sr:venue:714	2025-02-02 19:00:00
sr:sport_event:50852237	sr:season:118691	sr:competitor:2818	sr:competitor:2845	1	1	closed	8	sr:venue:2440	2024-09-28 14:15:00
sr:sport_event:50852583	sr:season:118691	sr:competitor:2816	sr:competitor:2829	\N	\N	not_started	26	sr:venue:1045	2025-03-02 18:00:00
sr:sport_event:50852411	sr:season:118691	sr:competitor:2819	sr:competitor:2816	\N	\N	not_started	17	sr:venue:619	2024-12-15 17:30:00
sr:sport_event:50852681	sr:season:118691	sr:competitor:2825	sr:competitor:2818	\N	\N	not_started	31	sr:venue:751	2025-04-13 17:00:00
sr:sport_event:50852637	sr:season:118691	sr:competitor:6577	sr:competitor:2885	\N	\N	not_started	28	sr:venue:974	2025-03-16 18:00:00
sr:sport_event:50852223	sr:season:118691	sr:competitor:2836	sr:competitor:2829	1	1	closed	8	sr:venue:21414	2024-09-29 19:00:00
sr:sport_event:50852705	sr:season:118691	sr:competitor:2814	sr:competitor:2859	\N	\N	not_started	32	sr:venue:1307	2025-04-20 17:00:00
sr:sport_event:50850437	sr:season:118689	sr:competitor:32	sr:competitor:45	\N	\N	not_started	24	sr:venue:2188	2025-02-01 15:00:00
sr:sport_event:50850239	sr:season:118689	sr:competitor:31	sr:competitor:37	\N	\N	not_started	14	sr:venue:2183	2024-12-03 20:15:00
sr:sport_event:46657239	sr:season:114317	sr:competitor:3209	sr:competitor:65676	\N	\N	not_started	25	sr:venue:1099	2024-12-01 20:00:00
sr:sport_event:50852399	sr:season:118691	sr:competitor:2859	sr:competitor:2814	\N	\N	not_started	16	sr:venue:608	2024-12-09 20:00:00
sr:sport_event:50852121	sr:season:118691	sr:competitor:2825	sr:competitor:2828	1	0	closed	3	sr:venue:751	2024-08-28 17:00:00
sr:sport_event:50852199	sr:season:118691	sr:competitor:2829	sr:competitor:2814	4	1	closed	6	sr:venue:754	2024-09-21 19:00:00
sr:sport_event:50852267	sr:season:118691	sr:competitor:24264	sr:competitor:2824	0	1	closed	10	sr:venue:11380	2024-10-19 16:30:00
sr:sport_event:50850657	sr:season:118689	sr:competitor:40	sr:competitor:43	\N	\N	not_started	35	sr:venue:815	2025-05-03 14:00:00
sr:sport_event:50850129	sr:season:118689	sr:competitor:40	sr:competitor:60	1	1	closed	9	sr:venue:815	2024-10-26 14:00:00
sr:sport_event:46657175	sr:season:114317	sr:competitor:42338	sr:competitor:3202	0	2	closed	22	sr:venue:8975	2024-11-11 00:30:00
sr:sport_event:50850343	sr:season:118689	sr:competitor:33	sr:competitor:3	\N	\N	not_started	19	sr:venue:28762	2024-12-29 15:00:00
sr:sport_event:50850517	sr:season:118689	sr:competitor:30	sr:competitor:43	\N	\N	not_started	28	sr:venue:2443	2025-03-08 15:00:00
sr:sport_event:50850301	sr:season:118689	sr:competitor:35	sr:competitor:60	\N	\N	not_started	17	sr:venue:9	2024-12-22 14:00:00
sr:sport_event:50850601	sr:season:118689	sr:competitor:38	sr:competitor:32	\N	\N	not_started	32	sr:venue:799	2025-04-12 14:00:00
sr:sport_event:50852191	sr:season:118691	sr:competitor:2819	sr:competitor:2817	1	5	closed	6	sr:venue:619	2024-09-22 16:30:00
sr:sport_event:50850383	sr:season:118689	sr:competitor:39	sr:competitor:3	\N	\N	not_started	21	sr:venue:765	2025-01-15 19:30:00
sr:sport_event:50850675	sr:season:118689	sr:competitor:60	sr:competitor:40	\N	\N	not_started	36	sr:venue:2990	2025-05-10 14:00:00
sr:sport_event:50850359	sr:season:118689	sr:competitor:17	sr:competitor:37	\N	\N	not_started	20	sr:venue:606	2025-01-04 15:00:00
sr:sport_event:46657197	sr:season:114317	sr:competitor:36839	sr:competitor:191648	1	1	closed	23	sr:venue:12025	2024-11-18 22:15:00
sr:sport_event:50850695	sr:season:118689	sr:competitor:42	sr:competitor:39	\N	\N	not_started	37	sr:venue:624	2025-05-18 14:00:00
sr:sport_event:50850259	sr:season:118689	sr:competitor:31	sr:competitor:30	\N	\N	not_started	15	sr:venue:2183	2024-12-08 14:00:00
sr:sport_event:50850531	sr:season:118689	sr:competitor:37	sr:competitor:39	\N	\N	not_started	28	sr:venue:18379	2025-03-08 15:00:00
sr:sport_event:50850065	sr:season:118689	sr:competitor:37	sr:competitor:38	0	3	closed	5	sr:venue:18379	2024-09-21 11:30:00
sr:sport_event:50850391	sr:season:118689	sr:competitor:38	sr:competitor:3	\N	\N	not_started	22	sr:venue:799	2025-01-20 20:00:00
sr:sport_event:50850449	sr:season:118689	sr:competitor:30	sr:competitor:38	\N	\N	not_started	25	sr:venue:2443	2025-02-15 15:00:00
sr:sport_event:46657205	sr:season:114317	sr:competitor:36842	sr:competitor:3211	2	1	closed	23	sr:venue:15676	2024-11-22 00:30:00
sr:sport_event:50852081	sr:season:118691	sr:competitor:2825	sr:competitor:2859	1	1	closed	1	sr:venue:751	2024-08-15 17:00:00
sr:sport_event:50852395	sr:season:118691	sr:competitor:2828	sr:competitor:2818	\N	\N	not_started	16	sr:venue:691	2024-12-07 17:30:00
sr:sport_event:50852299	sr:season:118691	sr:competitor:2818	sr:competitor:2885	1	0	closed	11	sr:venue:2440	2024-10-26 14:15:00
sr:sport_event:50850493	sr:season:118689	sr:competitor:45	sr:competitor:30	\N	\N	not_started	26	sr:venue:2231	2025-02-22 15:00:00
sr:sport_event:50852653	sr:season:118691	sr:competitor:2885	sr:competitor:2818	\N	\N	not_started	29	sr:venue:9311	2025-03-30 17:00:00
sr:sport_event:50852701	sr:season:118691	sr:competitor:2817	sr:competitor:2821	\N	\N	not_started	32	sr:venue:714	2025-04-20 17:00:00
sr:sport_event:50852801	sr:season:118691	sr:competitor:2836	sr:competitor:2816	\N	\N	not_started	37	sr:venue:21414	2025-05-18 17:00:00
sr:sport_event:46657215	sr:season:114317	sr:competitor:3211	sr:competitor:3201	\N	\N	not_started	24	sr:venue:1009	2024-12-05 00:00:00
sr:sport_event:46657297	sr:season:114317	sr:competitor:36833	sr:competitor:65676	\N	\N	not_started	27	sr:venue:12017	2024-12-15 23:00:00
sr:sport_event:46657321	sr:season:114317	sr:competitor:3217	sr:competitor:3203	\N	\N	not_started	27	sr:venue:1329	2024-12-15 23:00:00
sr:sport_event:50852711	sr:season:118691	sr:competitor:24264	sr:competitor:2816	\N	\N	not_started	32	sr:venue:11380	2025-04-20 17:00:00
sr:sport_event:50852249	sr:season:118691	sr:competitor:2814	sr:competitor:2826	2	1	closed	9	sr:venue:1307	2024-10-05 12:00:00
sr:sport_event:50852457	sr:season:118691	sr:competitor:2818	sr:competitor:2821	\N	\N	not_started	19	sr:venue:2440	2025-01-12 19:00:00
sr:sport_event:50852539	sr:season:118691	sr:competitor:2824	sr:competitor:2814	\N	\N	not_started	23	sr:venue:581	2025-02-09 19:00:00
sr:sport_event:50852831	sr:season:118691	sr:competitor:2814	sr:competitor:6577	\N	\N	not_started	38	sr:venue:1307	2025-05-25 17:00:00
sr:sport_event:50852755	sr:season:118691	sr:competitor:2818	sr:competitor:2859	\N	\N	not_started	34	sr:venue:2440	2025-05-04 17:00:00
sr:sport_event:50852777	sr:season:118691	sr:competitor:2825	sr:competitor:2885	\N	\N	not_started	35	sr:venue:751	2025-05-11 17:00:00
sr:sport_event:50852373	sr:season:118691	sr:competitor:2824	sr:competitor:2816	\N	\N	not_started	15	sr:venue:581	2024-12-01 20:00:00
sr:sport_event:50852367	sr:season:118691	sr:competitor:2814	sr:competitor:2821	\N	\N	not_started	15	sr:venue:1307	2024-11-30 17:30:00
sr:sport_event:50852285	sr:season:118691	sr:competitor:2826	sr:competitor:2825	0	0	closed	11	sr:venue:760	2024-10-28 20:00:00
sr:sport_event:50850039	sr:season:118689	sr:competitor:17	sr:competitor:50	2	1	closed	4	sr:venue:606	2024-09-14 14:00:00
sr:sport_event:50850203	sr:season:118689	sr:competitor:39	sr:competitor:37	0	2	closed	12	sr:venue:765	2024-11-25 20:00:00
sr:sport_event:50850109	sr:season:118689	sr:competitor:43	sr:competitor:40	1	3	closed	8	sr:venue:611	2024-10-19 14:00:00
sr:sport_event:50852339	sr:season:118691	sr:competitor:2819	sr:competitor:2885	3	0	closed	13	sr:venue:619	2024-11-09 15:15:00
sr:sport_event:50852577	sr:season:118691	sr:competitor:2833	sr:competitor:2826	\N	\N	not_started	25	sr:venue:730	2025-02-23 19:00:00
sr:sport_event:50852115	sr:season:118691	sr:competitor:2814	sr:competitor:2824	0	1	closed	2	sr:venue:1307	2024-08-24 19:30:00
sr:sport_event:50852185	sr:season:118691	sr:competitor:2859	sr:competitor:2845	1	1	closed	6	sr:venue:608	2024-09-22 12:00:00
sr:sport_event:50852495	sr:season:118691	sr:competitor:2818	sr:competitor:24264	\N	\N	not_started	21	sr:venue:2440	2025-01-26 19:00:00
sr:sport_event:50852179	sr:season:118691	sr:competitor:2814	sr:competitor:2885	3	2	closed	5	sr:venue:1307	2024-09-14 14:15:00
sr:sport_event:50850583	sr:season:118689	sr:competitor:43	sr:competitor:44	\N	\N	not_started	31	sr:venue:611	2025-04-05 14:00:00
sr:sport_event:50850233	sr:season:118689	sr:competitor:48	sr:competitor:3	\N	\N	not_started	14	sr:venue:12	2024-12-04 19:30:00
sr:sport_event:50850379	sr:season:118689	sr:competitor:37	sr:competitor:43	\N	\N	not_started	21	sr:venue:18379	2025-01-14 19:30:00
sr:sport_event:50850725	sr:season:118689	sr:competitor:39	sr:competitor:48	\N	\N	not_started	38	sr:venue:765	2025-05-25 15:00:00
sr:sport_event:50850681	sr:season:118689	sr:competitor:44	sr:competitor:42	\N	\N	not_started	36	sr:venue:579	2025-05-10 14:00:00
sr:sport_event:50850527	sr:season:118689	sr:competitor:14	sr:competitor:17	\N	\N	not_started	28	sr:venue:2230	2025-03-08 15:00:00
sr:sport_event:50850563	sr:season:118689	sr:competitor:3	sr:competitor:37	\N	\N	not_started	30	sr:venue:1272	2025-04-01 14:00:00
sr:sport_event:50850135	sr:season:118689	sr:competitor:38	sr:competitor:39	2	1	closed	9	sr:venue:799	2024-10-27 14:00:00
sr:sport_event:50850337	sr:season:118689	sr:competitor:32	sr:competitor:38	\N	\N	not_started	19	sr:venue:2188	2024-12-30 19:45:00
sr:sport_event:50850673	sr:season:118689	sr:competitor:37	sr:competitor:33	\N	\N	not_started	35	sr:venue:18379	2025-05-03 14:00:00
sr:sport_event:46657075	sr:season:114317	sr:competitor:3212	sr:competitor:42338	1	1	closed	19	sr:venue:1567	2024-10-26 20:15:00
sr:sport_event:46657003	sr:season:114317	sr:competitor:3216	sr:competitor:36833	0	0	closed	16	sr:venue:613	2024-09-30 22:00:00
sr:sport_event:50850283	sr:season:118689	sr:competitor:45	sr:competitor:33	\N	\N	not_started	16	sr:venue:2231	2024-12-15 19:00:00
sr:sport_event:46657233	sr:season:114317	sr:competitor:7629	sr:competitor:3202	0	0	closed	24	sr:venue:12021	2024-11-24 00:45:00
sr:sport_event:50850429	sr:season:118689	sr:competitor:42	sr:competitor:17	\N	\N	not_started	24	sr:venue:624	2025-02-01 15:00:00
sr:sport_event:50850605	sr:season:118689	sr:competitor:17	sr:competitor:7	\N	\N	not_started	32	sr:venue:606	2025-04-12 14:00:00
sr:sport_event:50850403	sr:season:118689	sr:competitor:14	sr:competitor:45	\N	\N	not_started	22	sr:venue:2230	2025-01-19 14:00:00
sr:sport_event:50850321	sr:season:118689	sr:competitor:14	sr:competitor:33	\N	\N	not_started	18	sr:venue:2230	2024-12-26 15:00:00
sr:sport_event:50852361	sr:season:118691	sr:competitor:2817	sr:competitor:6577	\N	\N	not_started	15	sr:venue:714	2024-11-30 13:00:00
sr:sport_event:50852189	sr:season:118691	sr:competitor:2818	sr:competitor:2836	1	1	closed	6	sr:venue:2440	2024-09-22 19:00:00
sr:sport_event:50852387	sr:season:118691	sr:competitor:24264	sr:competitor:2829	\N	\N	not_started	16	sr:venue:11380	2024-12-07 20:00:00
sr:sport_event:50852475	sr:season:118691	sr:competitor:2828	sr:competitor:2824	\N	\N	not_started	20	sr:venue:691	2025-01-19 19:00:00
sr:sport_event:50852159	sr:season:118691	sr:competitor:2833	sr:competitor:24264	0	2	closed	4	sr:venue:730	2024-09-01 17:00:00
sr:sport_event:50852639	sr:season:118691	sr:competitor:2826	sr:competitor:2814	\N	\N	not_started	28	sr:venue:760	2025-03-16 18:00:00
sr:sport_event:50852663	sr:season:118691	sr:competitor:2829	sr:competitor:2828	\N	\N	not_started	30	sr:venue:754	2025-04-06 17:00:00
sr:sport_event:50852445	sr:season:118691	sr:competitor:2824	sr:competitor:2819	\N	\N	not_started	19	sr:venue:581	2025-01-12 19:00:00
sr:sport_event:46657225	sr:season:114317	sr:competitor:3218	sr:competitor:36839	0	0	closed	24	sr:venue:981	2024-11-25 00:30:00
sr:sport_event:50852825	sr:season:118691	sr:competitor:2829	sr:competitor:2824	\N	\N	not_started	38	sr:venue:754	2025-05-25 17:00:00
sr:sport_event:50852481	sr:season:118691	sr:competitor:2825	sr:competitor:2845	\N	\N	not_started	21	sr:venue:751	2025-01-26 19:00:00
sr:sport_event:50852307	sr:season:118691	sr:competitor:24264	sr:competitor:2845	4	3	closed	12	sr:venue:11380	2024-11-02 15:15:00
sr:sport_event:50852569	sr:season:118691	sr:competitor:2828	sr:competitor:2836	\N	\N	not_started	25	sr:venue:691	2025-02-23 19:00:00
sr:sport_event:50852725	sr:season:118691	sr:competitor:2817	sr:competitor:2826	\N	\N	not_started	33	sr:venue:714	2025-04-23 17:00:00
sr:sport_event:50852835	sr:season:118691	sr:competitor:2859	sr:competitor:2821	\N	\N	not_started	38	sr:venue:608	2025-05-25 17:00:00
sr:sport_event:50852265	sr:season:118691	sr:competitor:2821	sr:competitor:2829	1	2	closed	10	sr:venue:697	2024-10-19 19:00:00
sr:sport_event:50852673	sr:season:118691	sr:competitor:2826	sr:competitor:2821	\N	\N	not_started	30	sr:venue:760	2025-04-06 17:00:00
sr:sport_event:50852761	sr:season:118691	sr:competitor:2836	sr:competitor:2824	\N	\N	not_started	35	sr:venue:21414	2025-05-11 17:00:00
sr:sport_event:50850107	sr:season:118689	sr:competitor:60	sr:competitor:42	2	0	closed	8	sr:venue:2990	2024-10-19 16:30:00
sr:sport_event:50852805	sr:season:118691	sr:competitor:2821	sr:competitor:2818	\N	\N	not_started	37	sr:venue:697	2025-05-18 17:00:00
sr:sport_event:50850089	sr:season:118689	sr:competitor:40	sr:competitor:35	0	0	closed	7	sr:venue:815	2024-10-06 13:00:00
sr:sport_event:50850491	sr:season:118689	sr:competitor:39	sr:competitor:14	\N	\N	not_started	26	sr:venue:765	2025-02-22 15:00:00
sr:sport_event:46657259	sr:season:114317	sr:competitor:36842	sr:competitor:3216	\N	\N	not_started	25	sr:venue:12031	2024-12-03 00:00:00
sr:sport_event:46657277	sr:season:114317	sr:competitor:7628	sr:competitor:36842	\N	\N	not_started	26	sr:venue:4738	2024-12-08 23:00:00
sr:sport_event:50852345	sr:season:118691	sr:competitor:2820	sr:competitor:2819	2	2	closed	14	sr:venue:739	2024-11-24 13:00:00
sr:sport_event:46657323	sr:season:114317	sr:competitor:3215	sr:competitor:3211	\N	\N	not_started	27	sr:venue:1082	2024-12-15 23:00:00
sr:sport_event:50852111	sr:season:118691	sr:competitor:2885	sr:competitor:2816	0	0	closed	2	sr:venue:9311	2024-08-25 17:15:00
sr:sport_event:50852197	sr:season:118691	sr:competitor:2820	sr:competitor:6577	2	1	closed	6	sr:venue:739	2024-09-21 14:15:00
sr:sport_event:50852455	sr:season:118691	sr:competitor:2831	sr:competitor:2816	\N	\N	not_started	19	sr:venue:880	2025-01-12 19:00:00
sr:sport_event:50850125	sr:season:118689	sr:competitor:3	sr:competitor:17	1	2	closed	8	sr:venue:1272	2024-10-20 13:00:00
sr:sport_event:50850055	sr:season:118689	sr:competitor:31	sr:competitor:48	1	1	closed	5	sr:venue:2183	2024-09-21 14:00:00
sr:sport_event:50850721	sr:season:118689	sr:competitor:44	sr:competitor:7	\N	\N	not_started	38	sr:venue:579	2025-05-25 15:00:00
sr:sport_event:46657071	sr:season:114317	sr:competitor:7629	sr:competitor:65676	0	0	closed	19	sr:venue:12021	2024-10-29 00:00:00
sr:sport_event:46657133	sr:season:114317	sr:competitor:36833	sr:competitor:42338	1	0	closed	21	sr:venue:12017	2024-11-04 22:00:00
sr:sport_event:50850575	sr:season:118689	sr:competitor:40	sr:competitor:14	\N	\N	not_started	31	sr:venue:815	2025-04-05 14:00:00
sr:sport_event:50850647	sr:season:118689	sr:competitor:39	sr:competitor:32	\N	\N	not_started	34	sr:venue:765	2025-04-26 14:00:00
sr:sport_event:50850505	sr:season:118689	sr:competitor:3	sr:competitor:43	\N	\N	not_started	27	sr:venue:1272	2025-02-25 19:45:00
sr:sport_event:50850261	sr:season:118689	sr:competitor:35	sr:competitor:14	\N	\N	not_started	15	sr:venue:9	2024-12-07 17:30:00
sr:sport_event:50850051	sr:season:118689	sr:competitor:7	sr:competitor:35	0	0	closed	5	sr:venue:10	2024-09-21 16:30:00
sr:sport_event:50850257	sr:season:118689	sr:competitor:32	sr:competitor:60	\N	\N	not_started	15	sr:venue:2188	2024-12-08 14:00:00
sr:sport_event:54783977	sr:season:118689	sr:competitor:60	sr:competitor:33	\N	\N	not_started	14	sr:venue:2990	2024-12-05 20:15:00
sr:sport_event:50850611	sr:season:118689	sr:competitor:45	sr:competitor:40	\N	\N	not_started	32	sr:venue:2231	2025-04-12 14:00:00
sr:sport_event:50850551	sr:season:118689	sr:competitor:39	sr:competitor:7	\N	\N	not_started	29	sr:venue:765	2025-03-15 15:00:00
sr:sport_event:50850663	sr:season:118689	sr:competitor:38	sr:competitor:44	\N	\N	not_started	35	sr:venue:799	2025-05-03 14:00:00
sr:sport_event:50852123	sr:season:118691	sr:competitor:2816	sr:competitor:2859	\N	\N	postponed	3	sr:venue:1045	2024-08-28 19:00:00
sr:sport_event:50850405	sr:season:118689	sr:competitor:37	sr:competitor:7	\N	\N	not_started	22	sr:venue:18379	2025-01-18 15:00:00
sr:sport_event:50850317	sr:season:118689	sr:competitor:17	sr:competitor:48	\N	\N	not_started	18	sr:venue:606	2024-12-26 12:30:00
sr:sport_event:50850217	sr:season:118689	sr:competitor:35	sr:competitor:48	\N	\N	not_started	13	sr:venue:9	2024-12-01 13:30:00
sr:sport_event:50850329	sr:season:118689	sr:competitor:50	sr:competitor:42	\N	\N	not_started	19	sr:venue:53349	2025-01-01 17:30:00
sr:sport_event:46657045	sr:season:114317	sr:competitor:3201	sr:competitor:65668	1	0	closed	18	sr:venue:14324	2024-10-20 22:30:00
sr:sport_event:50852225	sr:season:118691	sr:competitor:2821	sr:competitor:24264	1	1	closed	8	sr:venue:697	2024-09-29 12:00:00
sr:sport_event:50852325	sr:season:118691	sr:competitor:2845	sr:competitor:2833	1	0	closed	13	sr:venue:14888	2024-11-09 20:00:00
sr:sport_event:50852213	sr:season:118691	sr:competitor:2821	sr:competitor:2836	0	1	closed	7	sr:venue:697	2024-09-26 19:00:00
sr:sport_event:50852465	sr:season:118691	sr:competitor:2814	sr:competitor:2831	\N	\N	not_started	20	sr:venue:1307	2025-01-19 19:00:00
sr:sport_event:50852263	sr:season:118691	sr:competitor:2817	sr:competitor:2833	5	1	closed	10	sr:venue:714	2024-10-20 19:00:00
sr:sport_event:50852521	sr:season:118691	sr:competitor:2825	sr:competitor:24264	\N	\N	not_started	23	sr:venue:751	2025-02-09 19:00:00
sr:sport_event:50852649	sr:season:118691	sr:competitor:2859	sr:competitor:2819	\N	\N	not_started	29	sr:venue:608	2025-03-30 17:00:00
sr:sport_event:50852401	sr:season:118691	sr:competitor:2836	sr:competitor:2859	\N	\N	not_started	17	sr:venue:21414	2024-12-15 13:00:00
sr:sport_event:50852643	sr:season:118691	sr:competitor:2817	sr:competitor:24264	\N	\N	not_started	29	sr:venue:714	2025-03-30 17:00:00
sr:sport_event:50852599	sr:season:118691	sr:competitor:2819	sr:competitor:2814	\N	\N	not_started	26	sr:venue:619	2025-03-02 18:00:00
sr:sport_event:50852607	sr:season:118691	sr:competitor:2821	sr:competitor:2845	\N	\N	not_started	27	sr:venue:697	2025-03-09 18:00:00
sr:sport_event:50852685	sr:season:118691	sr:competitor:2816	sr:competitor:2819	\N	\N	not_started	31	sr:venue:1045	2025-04-13 17:00:00
sr:sport_event:50852815	sr:season:118691	sr:competitor:2831	sr:competitor:2885	\N	\N	not_started	37	sr:venue:880	2025-05-18 17:00:00
sr:sport_event:50852693	sr:season:118691	sr:competitor:2820	sr:competitor:24264	\N	\N	not_started	31	sr:venue:739	2025-04-13 17:00:00
sr:sport_event:50852731	sr:season:118691	sr:competitor:2859	sr:competitor:2829	\N	\N	not_started	33	sr:venue:608	2025-04-23 17:00:00
sr:sport_event:50852749	sr:season:118691	sr:competitor:2824	sr:competitor:2825	\N	\N	not_started	34	sr:venue:581	2025-05-04 17:00:00
sr:sport_event:46657257	sr:season:114317	sr:competitor:65668	sr:competitor:7628	\N	\N	not_started	25	sr:venue:69401	2024-12-02 20:00:00
sr:sport_event:50849969	sr:season:118689	sr:competitor:32	sr:competitor:44	0	2	closed	1	sr:venue:2188	2024-08-17 11:30:00
sr:sport_event:50850419	sr:season:118689	sr:competitor:17	sr:competitor:38	\N	\N	not_started	23	sr:venue:606	2025-01-25 17:30:00
sr:sport_event:50850483	sr:season:118689	sr:competitor:43	sr:competitor:7	\N	\N	not_started	26	sr:venue:611	2025-02-22 15:00:00
sr:sport_event:46657089	sr:season:114317	sr:competitor:36839	sr:competitor:3211	0	0	closed	19	sr:venue:12025	2024-10-26 00:00:00
sr:sport_event:46655843	sr:season:114317	sr:competitor:65676	sr:competitor:3219	0	0	closed	12	sr:venue:49307	2024-08-26 19:00:00
sr:sport_event:46657263	sr:season:114317	sr:competitor:3206	sr:competitor:3211	\N	\N	not_started	25	sr:venue:1007	2024-11-30 00:00:00
sr:sport_event:50852093	sr:season:118691	sr:competitor:2824	sr:competitor:2818	1	2	closed	1	sr:venue:581	2024-08-18 17:00:00
sr:sport_event:50852177	sr:season:118691	sr:competitor:2824	sr:competitor:2829	0	2	closed	5	sr:venue:581	2024-09-14 19:00:00
sr:sport_event:50852381	sr:season:118691	sr:competitor:2825	sr:competitor:2819	\N	\N	not_started	16	sr:venue:751	2024-12-08 15:15:00
sr:sport_event:50850345	sr:season:118689	sr:competitor:37	sr:competitor:44	\N	\N	not_started	19	sr:venue:18379	2024-12-29 17:15:00
sr:sport_event:50850701	sr:season:118689	sr:competitor:30	sr:competitor:44	\N	\N	not_started	37	sr:venue:2443	2025-05-18 14:00:00
sr:sport_event:50850549	sr:season:118689	sr:competitor:17	sr:competitor:30	\N	\N	not_started	29	sr:venue:606	2025-03-15 15:00:00
sr:sport_event:50850149	sr:season:118689	sr:competitor:43	sr:competitor:50	2	1	closed	10	sr:venue:611	2024-11-04 20:00:00
sr:sport_event:50850143	sr:season:118689	sr:competitor:17	sr:competitor:45	1	0	closed	9	sr:venue:606	2024-10-26 14:00:00
sr:sport_event:50850655	sr:season:118689	sr:competitor:42	sr:competitor:60	\N	\N	not_started	35	sr:venue:624	2025-05-03 14:00:00
sr:sport_event:46657171	sr:season:114317	sr:competitor:3218	sr:competitor:36837	0	0	closed	22	sr:venue:981	2024-11-11 21:45:00
sr:sport_event:50852349	sr:season:118691	sr:competitor:2845	sr:competitor:2829	0	3	closed	14	sr:venue:14888	2024-11-24 17:30:00
sr:sport_event:50850281	sr:season:118689	sr:competitor:14	sr:competitor:40	\N	\N	not_started	16	sr:venue:2230	2024-12-14 17:30:00
sr:sport_event:50850117	sr:season:118689	sr:competitor:39	sr:competitor:30	0	1	closed	8	sr:venue:765	2024-10-19 14:00:00
sr:sport_event:50850729	sr:season:118689	sr:competitor:45	sr:competitor:42	\N	\N	not_started	38	sr:venue:2231	2025-05-25 15:00:00
sr:sport_event:46657193	sr:season:114317	sr:competitor:36837	sr:competitor:6074	1	0	closed	23	sr:venue:12712	2024-11-18 22:15:00
sr:sport_event:50852219	sr:season:118691	sr:competitor:2829	sr:competitor:2885	3	2	closed	7	sr:venue:754	2024-09-24 19:00:00
sr:sport_event:50850659	sr:season:118689	sr:competitor:50	sr:competitor:35	\N	\N	not_started	35	sr:venue:53349	2025-05-03 14:00:00
sr:sport_event:50850231	sr:season:118689	sr:competitor:40	sr:competitor:50	\N	\N	not_started	14	sr:venue:815	2024-12-04 20:15:00
sr:sport_event:50850603	sr:season:118689	sr:competitor:44	sr:competitor:37	\N	\N	not_started	32	sr:venue:579	2025-04-12 14:00:00
sr:sport_event:50850503	sr:season:118689	sr:competitor:37	sr:competitor:31	\N	\N	not_started	27	sr:venue:18379	2025-02-25 19:45:00
sr:sport_event:50850399	sr:season:118689	sr:competitor:35	sr:competitor:30	\N	\N	not_started	22	sr:venue:9	2025-01-19 14:00:00
sr:sport_event:46657181	sr:season:114317	sr:competitor:3205	sr:competitor:3212	1	0	closed	22	sr:venue:12003	2024-11-09 20:00:00
sr:sport_event:46657183	sr:season:114317	sr:competitor:3212	sr:competitor:65676	2	3	closed	23	sr:venue:1567	2024-11-20 20:00:00
sr:sport_event:50850159	sr:season:118689	sr:competitor:14	sr:competitor:37	3	0	closed	10	sr:venue:2230	2024-11-02 15:00:00
sr:sport_event:50852109	sr:season:118691	sr:competitor:2833	sr:competitor:2819	1	2	closed	2	sr:venue:730	2024-08-23 19:30:00
sr:sport_event:50852483	sr:season:118691	sr:competitor:2836	sr:competitor:2819	\N	\N	not_started	21	sr:venue:21414	2025-01-26 19:00:00
sr:sport_event:50852383	sr:season:118691	sr:competitor:2836	sr:competitor:2833	\N	\N	not_started	16	sr:venue:21414	2024-12-08 20:00:00
sr:sport_event:50852469	sr:season:118691	sr:competitor:2845	sr:competitor:2836	\N	\N	not_started	20	sr:venue:14888	2025-01-19 19:00:00
sr:sport_event:50852405	sr:season:118691	sr:competitor:2818	sr:competitor:2829	\N	\N	not_started	17	sr:venue:2440	2024-12-14 20:00:00
sr:sport_event:50852555	sr:season:118691	sr:competitor:2819	sr:competitor:2828	\N	\N	not_started	24	sr:venue:619	2025-02-16 19:00:00
sr:sport_event:50852625	sr:season:118691	sr:competitor:2818	sr:competitor:2824	\N	\N	not_started	28	sr:venue:2440	2025-03-16 18:00:00
sr:sport_event:50850081	sr:season:118689	sr:competitor:39	sr:competitor:17	1	1	closed	6	sr:venue:765	2024-09-28 11:30:00
sr:sport_event:46657303	sr:season:114317	sr:competitor:36837	sr:competitor:3205	\N	\N	not_started	27	sr:venue:12712	2024-12-15 23:00:00
sr:sport_event:50852525	sr:season:118691	sr:competitor:2818	sr:competitor:2831	\N	\N	not_started	23	sr:venue:2440	2025-02-09 19:00:00
sr:sport_event:50852785	sr:season:118691	sr:competitor:2859	sr:competitor:2825	\N	\N	not_started	36	sr:venue:608	2025-05-14 17:00:00
sr:sport_event:50852683	sr:season:118691	sr:competitor:2836	sr:competitor:2831	\N	\N	not_started	31	sr:venue:21414	2025-04-13 17:00:00
sr:sport_event:50852497	sr:season:118691	sr:competitor:2831	sr:competitor:2829	\N	\N	not_started	21	sr:venue:880	2025-01-26 19:00:00
sr:sport_event:50852305	sr:season:118691	sr:competitor:2821	sr:competitor:2859	1	0	closed	12	sr:venue:697	2024-11-04 20:00:00
sr:sport_event:50852717	sr:season:118691	sr:competitor:2833	sr:competitor:2885	\N	\N	not_started	32	sr:venue:730	2025-04-20 17:00:00
sr:sport_event:50852781	sr:season:118691	sr:competitor:2885	sr:competitor:2828	\N	\N	not_started	36	sr:venue:9311	2025-05-14 17:00:00
sr:sport_event:50852823	sr:season:118691	sr:competitor:2816	sr:competitor:2828	\N	\N	not_started	38	sr:venue:1045	2025-05-25 17:00:00
sr:sport_event:50850299	sr:season:118689	sr:competitor:31	sr:competitor:3	\N	\N	not_started	17	sr:venue:2183	2024-12-22 14:00:00
sr:sport_event:50850453	sr:season:118689	sr:competitor:43	sr:competitor:14	\N	\N	not_started	25	sr:venue:611	2025-02-15 15:00:00
sr:sport_event:46657217	sr:season:114317	sr:competitor:3203	sr:competitor:36842	0	2	closed	24	sr:venue:4750	2024-11-26 00:15:00
sr:sport_event:46657219	sr:season:114317	sr:competitor:3216	sr:competitor:65668	0	1	closed	24	sr:venue:613	2024-11-26 00:15:00
sr:sport_event:46657273	sr:season:114317	sr:competitor:3203	sr:competitor:3206	\N	\N	not_started	26	sr:venue:4750	2024-12-08 23:00:00
sr:sport_event:50852181	sr:season:118691	sr:competitor:2825	sr:competitor:2821	3	1	closed	6	sr:venue:751	2024-09-22 14:15:00
sr:sport_event:50852125	sr:season:118691	sr:competitor:24264	sr:competitor:2820	4	0	closed	3	sr:venue:11380	2024-08-29 17:00:00
sr:sport_event:50852175	sr:season:118691	sr:competitor:2818	sr:competitor:2820	3	1	closed	5	sr:venue:2440	2024-09-16 19:00:00
sr:sport_event:50850537	sr:season:118689	sr:competitor:42	sr:competitor:38	\N	\N	not_started	29	sr:venue:624	2025-03-15 15:00:00
sr:sport_event:50850441	sr:season:118689	sr:competitor:39	sr:competitor:43	\N	\N	not_started	24	sr:venue:765	2025-02-01 15:00:00
sr:sport_event:50850353	sr:season:118689	sr:competitor:7	sr:competitor:38	\N	\N	not_started	20	sr:venue:10	2025-01-04 15:00:00
sr:sport_event:50850507	sr:season:118689	sr:competitor:7	sr:competitor:40	\N	\N	not_started	27	sr:venue:10	2025-02-25 20:00:00
sr:sport_event:50850417	sr:season:118689	sr:competitor:44	sr:competitor:32	\N	\N	not_started	23	sr:venue:579	2025-01-25 15:00:00
sr:sport_event:50850591	sr:season:118689	sr:competitor:33	sr:competitor:45	\N	\N	not_started	31	sr:venue:28762	2025-04-05 14:00:00
sr:sport_event:50850513	sr:season:118689	sr:competitor:35	sr:competitor:32	\N	\N	not_started	27	sr:venue:9	2025-02-26 20:00:00
sr:sport_event:50850375	sr:season:118689	sr:competitor:31	sr:competitor:7	\N	\N	not_started	21	sr:venue:2183	2025-01-15 19:30:00
sr:sport_event:50850303	sr:season:118689	sr:competitor:33	sr:competitor:44	\N	\N	not_started	17	sr:venue:28762	2024-12-22 16:30:00
sr:sport_event:50850243	sr:season:118689	sr:competitor:39	sr:competitor:44	\N	\N	not_started	14	sr:venue:765	2024-12-04 19:30:00
sr:sport_event:50850711	sr:season:118689	sr:competitor:17	sr:competitor:60	\N	\N	not_started	37	sr:venue:606	2025-05-18 14:00:00
sr:sport_event:50850067	sr:season:118689	sr:competitor:60	sr:competitor:45	3	1	closed	6	sr:venue:2990	2024-09-30 19:00:00
sr:sport_event:46655855	sr:season:114317	sr:competitor:3217	sr:competitor:36833	1	0	closed	12	sr:venue:1329	2024-08-26 21:30:00
sr:sport_event:50850733	sr:season:118689	sr:competitor:3	sr:competitor:50	\N	\N	not_started	38	sr:venue:1272	2025-05-25 15:00:00
sr:sport_event:46657015	sr:season:114317	sr:competitor:3204	sr:competitor:65676	0	2	closed	17	sr:venue:4754	2024-10-04 22:00:00
sr:sport_event:50850209	sr:season:118689	sr:competitor:30	sr:competitor:45	\N	\N	not_started	13	sr:venue:2443	2024-11-29 20:00:00
sr:sport_event:50850199	sr:season:118689	sr:competitor:31	sr:competitor:38	1	2	closed	12	sr:venue:2183	2024-11-23 12:30:00
sr:sport_event:50850185	sr:season:118689	sr:competitor:3	sr:competitor:45	2	0	closed	11	sr:venue:1272	2024-11-09 15:00:00
sr:sport_event:50850643	sr:season:118689	sr:competitor:44	sr:competitor:33	\N	\N	not_started	34	sr:venue:579	2025-04-26 14:00:00
sr:sport_event:46657173	sr:season:114317	sr:competitor:6074	sr:competitor:3210	0	1	closed	22	sr:venue:15676	2024-11-10 22:15:00
sr:sport_event:50852153	sr:season:118691	sr:competitor:2814	sr:competitor:2818	2	1	closed	4	sr:venue:1307	2024-08-31 17:15:00
sr:sport_event:50852157	sr:season:118691	sr:competitor:2820	sr:competitor:2821	3	2	closed	4	sr:venue:739	2024-09-01 15:00:00
sr:sport_event:50852365	sr:season:118691	sr:competitor:2885	sr:competitor:2845	\N	\N	not_started	15	sr:venue:9311	2024-11-30 15:15:00
sr:sport_event:50852425	sr:season:118691	sr:competitor:2859	sr:competitor:2826	\N	\N	not_started	18	sr:venue:608	2024-12-21 13:00:00
sr:sport_event:50852227	sr:season:118691	sr:competitor:2824	sr:competitor:2828	3	0	closed	8	sr:venue:581	2024-09-28 16:30:00
sr:sport_event:50852119	sr:season:118691	sr:competitor:2820	sr:competitor:2826	1	0	closed	2	sr:venue:739	2024-08-24 15:00:00
sr:sport_event:50852459	sr:season:118691	sr:competitor:6577	sr:competitor:2859	\N	\N	not_started	19	sr:venue:974	2025-01-12 19:00:00
sr:sport_event:50852707	sr:season:118691	sr:competitor:2829	sr:competitor:2825	\N	\N	not_started	32	sr:venue:754	2025-04-20 17:00:00
sr:sport_event:50852453	sr:season:118691	sr:competitor:2826	sr:competitor:2817	\N	\N	not_started	19	sr:venue:760	2024-12-03 18:00:00
sr:sport_event:50852627	sr:season:118691	sr:competitor:2833	sr:competitor:2825	\N	\N	not_started	28	sr:venue:730	2025-03-16 18:00:00
sr:sport_event:50852651	sr:season:118691	sr:competitor:2824	sr:competitor:2831	\N	\N	not_started	29	sr:venue:581	2025-03-30 17:00:00
sr:sport_event:50852549	sr:season:118691	sr:competitor:2814	sr:competitor:2825	\N	\N	not_started	24	sr:venue:1307	2025-02-16 19:00:00
sr:sport_event:50852543	sr:season:118691	sr:competitor:2817	sr:competitor:2818	\N	\N	not_started	24	sr:venue:714	2025-02-16 19:00:00
sr:sport_event:50852413	sr:season:118691	sr:competitor:2833	sr:competitor:2821	\N	\N	not_started	17	sr:venue:730	2024-12-14 17:30:00
sr:sport_event:50850083	sr:season:118689	sr:competitor:14	sr:competitor:43	0	1	closed	6	sr:venue:2230	2024-09-28 14:00:00
sr:sport_event:50852675	sr:season:118691	sr:competitor:2831	sr:competitor:2859	\N	\N	not_started	30	sr:venue:880	2025-04-06 17:00:00
sr:sport_event:50852699	sr:season:118691	sr:competitor:2821	sr:competitor:2814	\N	\N	not_started	31	sr:venue:697	2025-04-13 17:00:00
sr:sport_event:50850335	sr:season:118689	sr:competitor:43	sr:competitor:60	\N	\N	not_started	19	sr:venue:611	2024-12-29 15:00:00
sr:sport_event:50852809	sr:season:118691	sr:competitor:2826	sr:competitor:2859	\N	\N	not_started	37	sr:venue:760	2025-05-18 17:00:00
sr:sport_event:50850555	sr:season:118689	sr:competitor:60	sr:competitor:32	\N	\N	not_started	30	sr:venue:2990	2025-04-01 14:00:00
sr:sport_event:46657009	sr:season:114317	sr:competitor:3218	sr:competitor:3205	0	0	closed	16	sr:venue:981	2024-10-01 00:15:00
sr:sport_event:46657269	sr:season:114317	sr:competitor:3211	sr:competitor:3217	\N	\N	not_started	26	sr:venue:1009	2024-12-08 23:00:00
sr:sport_event:46657293	sr:season:114317	sr:competitor:3212	sr:competitor:3202	\N	\N	not_started	26	sr:venue:1567	2024-12-08 23:00:00
sr:sport_event:46657285	sr:season:114317	sr:competitor:42338	sr:competitor:36839	\N	\N	not_started	26	sr:venue:8975	2024-12-08 23:00:00
sr:sport_event:50852253	sr:season:118691	sr:competitor:2824	sr:competitor:2836	1	1	closed	9	sr:venue:581	2024-10-06 19:00:00
sr:sport_event:50852203	sr:season:118691	sr:competitor:24264	sr:competitor:2818	0	0	closed	7	sr:venue:11380	2024-09-25 17:00:00
sr:sport_event:50852311	sr:season:118691	sr:competitor:2885	sr:competitor:2826	1	0	closed	12	sr:venue:9311	2024-11-01 20:00:00
sr:sport_event:50852513	sr:season:118691	sr:competitor:2814	sr:competitor:2829	\N	\N	not_started	22	sr:venue:1307	2025-02-02 19:00:00
sr:sport_event:50850719	sr:season:118689	sr:competitor:32	sr:competitor:37	\N	\N	not_started	38	sr:venue:2188	2025-05-25 15:00:00
sr:sport_event:50850227	sr:season:118689	sr:competitor:60	sr:competitor:33	\N	\N	postponed	14	sr:venue:2990	2024-12-03 19:45:00
sr:sport_event:50850115	sr:season:118689	sr:competitor:35	sr:competitor:50	2	1	closed	8	sr:venue:9	2024-10-19 14:00:00
sr:sport_event:50850581	sr:season:118689	sr:competitor:48	sr:competitor:42	\N	\N	not_started	31	sr:venue:12	2025-04-05 14:00:00
sr:sport_event:50850407	sr:season:118689	sr:competitor:60	sr:competitor:14	\N	\N	not_started	23	sr:venue:2990	2025-01-25 15:00:00
sr:sport_event:50850435	sr:season:118689	sr:competitor:48	sr:competitor:31	\N	\N	not_started	24	sr:venue:12	2025-02-01 15:00:00
sr:sport_event:46657141	sr:season:114317	sr:competitor:3208	sr:competitor:7628	1	0	closed	21	sr:venue:1079	2024-11-08 00:15:00
sr:sport_event:50850201	sr:season:118689	sr:competitor:17	sr:competitor:33	0	4	closed	12	sr:venue:606	2024-11-23 17:30:00
sr:sport_event:50850285	sr:season:118689	sr:competitor:3	sr:competitor:32	\N	\N	not_started	16	sr:venue:1272	2024-12-14 15:00:00
sr:sport_event:50850567	sr:season:118689	sr:competitor:17	sr:competitor:31	\N	\N	not_started	30	sr:venue:606	2025-04-02 14:00:00
sr:sport_event:50850077	sr:season:118689	sr:competitor:32	sr:competitor:40	2	2	closed	6	sr:venue:2188	2024-09-29 13:00:00
sr:sport_event:50850347	sr:season:118689	sr:competitor:60	sr:competitor:48	\N	\N	not_started	20	sr:venue:2990	2025-01-04 15:00:00
sr:sport_event:50850637	sr:season:118689	sr:competitor:42	sr:competitor:7	\N	\N	not_started	34	sr:venue:624	2025-04-26 14:00:00
sr:sport_event:50850477	sr:season:118689	sr:competitor:42	sr:competitor:37	\N	\N	not_started	26	sr:venue:624	2025-02-22 15:00:00
sr:sport_event:46657167	sr:season:114317	sr:competitor:7628	sr:competitor:36839	0	4	closed	22	sr:venue:4738	2024-11-11 21:45:00
sr:sport_event:50850165	sr:season:118689	sr:competitor:3	sr:competitor:7	2	2	closed	10	sr:venue:1272	2024-11-02 17:30:00
sr:sport_event:50850661	sr:season:118689	sr:competitor:30	sr:competitor:39	\N	\N	not_started	35	sr:venue:2443	2025-05-03 14:00:00
sr:sport_event:50852319	sr:season:118691	sr:competitor:2817	sr:competitor:2814	3	1	closed	12	sr:venue:714	2024-11-03 15:15:00
sr:sport_event:50852309	sr:season:118691	sr:competitor:2820	sr:competitor:2831	1	0	closed	12	sr:venue:739	2024-11-02 13:00:00
sr:sport_event:50852477	sr:season:118691	sr:competitor:2829	sr:competitor:6577	\N	\N	not_started	20	sr:venue:754	2025-01-19 19:00:00
sr:sport_event:50852141	sr:season:118691	sr:competitor:2825	sr:competitor:2836	0	1	closed	4	sr:venue:751	2024-08-31 17:00:00
sr:sport_event:50852515	sr:season:118691	sr:competitor:2816	sr:competitor:2825	\N	\N	not_started	22	sr:venue:1045	2025-02-02 19:00:00
sr:sport_event:50852155	sr:season:118691	sr:competitor:2829	sr:competitor:2816	2	0	closed	4	sr:venue:754	2024-09-01 19:30:00
sr:sport_event:50852715	sr:season:118691	sr:competitor:2819	sr:competitor:2824	\N	\N	not_started	32	sr:venue:619	2025-04-20 17:00:00
sr:sport_event:50852561	sr:season:118691	sr:competitor:2825	sr:competitor:2831	\N	\N	not_started	25	sr:venue:751	2025-02-23 19:00:00
sr:sport_event:50852451	sr:season:118691	sr:competitor:2814	sr:competitor:2845	\N	\N	not_started	19	sr:venue:1307	2025-01-12 19:00:00
sr:sport_event:50852641	sr:season:118691	sr:competitor:2825	sr:competitor:2820	\N	\N	not_started	29	sr:venue:751	2025-03-30 17:00:00
sr:sport_event:46657191	sr:season:114317	sr:competitor:3210	sr:competitor:42338	2	0	closed	23	sr:venue:2388	2024-11-21 22:15:00
sr:sport_event:50852799	sr:season:118691	sr:competitor:2819	sr:competitor:2845	\N	\N	not_started	36	sr:venue:619	2025-05-14 17:00:00
sr:sport_event:46657281	sr:season:114317	sr:competitor:3218	sr:competitor:4937	\N	\N	not_started	26	sr:venue:981	2024-12-08 23:00:00
sr:sport_event:50852741	sr:season:118691	sr:competitor:24264	sr:competitor:2826	\N	\N	not_started	34	sr:venue:11380	2025-05-04 17:00:00
sr:sport_event:50852691	sr:season:118691	sr:competitor:2845	sr:competitor:2817	\N	\N	not_started	31	sr:venue:14888	2025-04-13 17:00:00
sr:sport_event:50852573	sr:season:118691	sr:competitor:2859	sr:competitor:2816	\N	\N	not_started	25	sr:venue:608	2025-02-23 19:00:00
sr:sport_event:55396411	sr:season:118691	sr:competitor:2819	sr:competitor:2818	\N	\N	not_started	12	sr:venue:619	2024-12-18 20:30:00
sr:sport_event:50852251	sr:season:118691	sr:competitor:24264	sr:competitor:2825	2	1	closed	9	sr:venue:11380	2024-10-06 12:00:00
sr:sport_event:50852239	sr:season:118691	sr:competitor:2816	sr:competitor:2814	1	0	closed	8	sr:venue:1045	2024-09-29 16:30:00
sr:sport_event:50852829	sr:season:118691	sr:competitor:2845	sr:competitor:2831	\N	\N	not_started	38	sr:venue:14888	2025-05-25 17:00:00
sr:sport_event:50852087	sr:season:118691	sr:competitor:6577	sr:competitor:2833	2	2	closed	1	sr:venue:974	2024-08-16 19:30:00
sr:sport_event:50850311	sr:season:118689	sr:competitor:30	sr:competitor:50	\N	\N	not_started	18	sr:venue:2443	2024-12-27 19:30:00
sr:sport_event:50850509	sr:season:118689	sr:competitor:38	sr:competitor:45	\N	\N	not_started	27	sr:venue:799	2025-02-26 19:45:00
sr:sport_event:46657237	sr:season:114317	sr:competitor:3212	sr:competitor:3209	2	1	closed	24	sr:venue:1567	2024-11-26 22:00:00
sr:sport_event:46657313	sr:season:114317	sr:competitor:65668	sr:competitor:3218	\N	\N	not_started	27	sr:venue:69401	2024-12-15 23:00:00
sr:sport_event:46656997	sr:season:114317	sr:competitor:3215	sr:competitor:36837	1	1	closed	16	sr:venue:1082	2024-10-01 00:00:00
sr:sport_event:50852131	sr:season:118691	sr:competitor:2818	sr:competitor:2817	1	2	closed	3	sr:venue:2440	2024-08-27 19:30:00
sr:sport_event:50852193	sr:season:118691	sr:competitor:2828	sr:competitor:24264	2	0	closed	6	sr:venue:691	2024-09-21 16:30:00
sr:sport_event:50852391	sr:season:118691	sr:competitor:2845	sr:competitor:2824	\N	\N	not_started	16	sr:venue:14888	2024-12-08 13:00:00
sr:sport_event:50850229	sr:season:118689	sr:competitor:42	sr:competitor:35	\N	\N	not_started	14	sr:venue:624	2024-12-04 20:15:00
sr:sport_event:50868141	sr:season:119799	sr:competitor:2948	sr:competitor:2959	0	2	closed	10	sr:venue:786	2024-10-27 11:15:00
sr:sport_event:50868033	sr:season:119799	sr:competitor:2948	sr:competitor:2955	2	1	closed	4	sr:venue:786	2024-09-01 10:15:00
sr:sport_event:50868137	sr:season:119799	sr:competitor:2952	sr:competitor:2971	6	0	closed	10	sr:venue:726	2024-10-26 16:45:00
sr:sport_event:50868117	sr:season:119799	sr:competitor:2962	sr:competitor:2964	3	0	closed	9	sr:venue:689	2024-10-19 18:00:00
sr:sport_event:50868055	sr:season:119799	sr:competitor:2961	sr:competitor:2956	3	0	closed	5	sr:venue:826	2024-09-15 12:30:00
sr:sport_event:50868101	sr:season:119799	sr:competitor:2952	sr:competitor:2960	2	1	closed	8	sr:venue:726	2024-10-05 18:00:00
sr:sport_event:50850693	sr:season:118689	sr:competitor:3	sr:competitor:30	\N	\N	not_started	36	sr:venue:1272	2025-05-10 14:00:00
sr:sport_event:50850597	sr:season:118689	sr:competitor:42	sr:competitor:50	\N	\N	not_started	32	sr:venue:624	2025-04-12 14:00:00
sr:sport_event:50850641	sr:season:118689	sr:competitor:38	sr:competitor:48	\N	\N	not_started	34	sr:venue:799	2025-04-26 14:00:00
sr:sport_event:50850723	sr:season:118689	sr:competitor:35	sr:competitor:40	\N	\N	not_started	38	sr:venue:9	2025-05-25 15:00:00
sr:sport_event:50868029	sr:season:119799	sr:competitor:2964	sr:competitor:2947	4	0	closed	4	sr:venue:569	2024-08-31 18:00:00
sr:sport_event:50868121	sr:season:119799	sr:competitor:2979	sr:competitor:2959	1	5	closed	9	sr:venue:3293	2024-10-19 19:00:00
sr:sport_event:50852235	sr:season:118691	sr:competitor:2859	sr:competitor:2885	2	0	closed	8	sr:venue:608	2024-09-28 12:00:00
sr:sport_event:50852317	sr:season:118691	sr:competitor:2833	sr:competitor:2824	0	2	closed	12	sr:venue:730	2024-11-03 17:30:00
sr:sport_event:50852117	sr:season:118691	sr:competitor:2817	sr:competitor:2825	2	1	closed	2	sr:venue:714	2024-08-24 17:00:00
sr:sport_event:50852417	sr:season:118691	sr:competitor:2831	sr:competitor:2828	\N	\N	not_started	17	sr:venue:880	2024-12-13 20:00:00
sr:sport_event:50852487	sr:season:118691	sr:competitor:6577	sr:competitor:2820	\N	\N	not_started	21	sr:venue:974	2025-01-26 19:00:00
sr:sport_event:50852479	sr:season:118691	sr:competitor:2816	sr:competitor:2885	\N	\N	not_started	20	sr:venue:1045	2025-01-19 19:00:00
sr:sport_event:50852293	sr:season:118691	sr:competitor:6577	sr:competitor:24264	1	0	closed	11	sr:venue:974	2024-10-26 16:30:00
sr:sport_event:50852579	sr:season:118691	sr:competitor:2824	sr:competitor:2845	\N	\N	not_started	25	sr:venue:581	2025-02-23 19:00:00
sr:sport_event:50852623	sr:season:118691	sr:competitor:24264	sr:competitor:2828	\N	\N	not_started	28	sr:venue:11380	2025-03-16 18:00:00
sr:sport_event:50852169	sr:season:118691	sr:competitor:6577	sr:competitor:2825	2	3	closed	5	sr:venue:974	2024-09-15 16:30:00
sr:sport_event:50850623	sr:season:118689	sr:competitor:43	sr:competitor:38	\N	\N	not_started	33	sr:venue:611	2025-04-19 14:00:00
sr:sport_event:50850595	sr:season:118689	sr:competitor:60	sr:competitor:43	\N	\N	not_started	32	sr:venue:2990	2025-04-12 14:00:00
sr:sport_event:50852727	sr:season:118691	sr:competitor:2816	sr:competitor:2831	\N	\N	not_started	33	sr:venue:1045	2025-04-23 17:00:00
sr:sport_event:50852333	sr:season:118691	sr:competitor:2824	sr:competitor:2817	1	0	closed	13	sr:venue:581	2024-11-10 20:00:00
sr:sport_event:50852687	sr:season:118691	sr:competitor:2859	sr:competitor:6577	\N	\N	not_started	31	sr:venue:608	2025-04-13 17:00:00
sr:sport_event:50852601	sr:season:118691	sr:competitor:2825	sr:competitor:2826	\N	\N	not_started	27	sr:venue:751	2025-03-09 18:00:00
sr:sport_event:50852471	sr:season:118691	sr:competitor:2859	sr:competitor:2817	\N	\N	not_started	20	sr:venue:608	2025-01-19 19:00:00
sr:sport_event:50852645	sr:season:118691	sr:competitor:2816	sr:competitor:2833	\N	\N	not_started	29	sr:venue:1045	2025-03-30 17:00:00
sr:sport_event:50852719	sr:season:118691	sr:competitor:2826	sr:competitor:2845	\N	\N	not_started	32	sr:venue:760	2025-04-20 17:00:00
sr:sport_event:50852759	sr:season:118691	sr:competitor:2833	sr:competitor:2845	\N	\N	not_started	34	sr:venue:730	2025-05-04 17:00:00
sr:sport_event:50852501	sr:season:118691	sr:competitor:2836	sr:competitor:2826	\N	\N	not_started	22	sr:venue:21414	2025-02-02 19:00:00
sr:sport_event:50852633	sr:season:118691	sr:competitor:2820	sr:competitor:2859	\N	\N	not_started	28	sr:venue:739	2025-03-16 18:00:00
sr:sport_event:50852257	sr:season:118691	sr:competitor:6577	sr:competitor:2821	0	1	closed	9	sr:venue:974	2024-10-05 16:30:00
sr:sport_event:50852343	sr:season:118691	sr:competitor:2859	sr:competitor:2831	2	0	closed	14	sr:venue:608	2024-11-22 20:00:00
sr:sport_event:50852443	sr:season:118691	sr:competitor:2836	sr:competitor:2820	\N	\N	not_started	19	sr:venue:21414	2025-01-12 19:00:00
sr:sport_event:50852531	sr:season:118691	sr:competitor:2829	sr:competitor:2836	\N	\N	not_started	23	sr:venue:754	2025-02-09 19:00:00
sr:sport_event:50852779	sr:season:118691	sr:competitor:2845	sr:competitor:2814	\N	\N	not_started	35	sr:venue:14888	2025-05-11 17:00:00
sr:sport_event:50852765	sr:season:118691	sr:competitor:2816	sr:competitor:2820	\N	\N	not_started	35	sr:venue:1045	2025-05-11 17:00:00
sr:sport_event:50852587	sr:season:118691	sr:competitor:2818	sr:competitor:2833	\N	\N	not_started	26	sr:venue:2440	2025-03-02 18:00:00
sr:sport_event:50852551	sr:season:118691	sr:competitor:24264	sr:competitor:2859	\N	\N	not_started	24	sr:venue:11380	2025-02-16 19:00:00
sr:sport_event:50852819	sr:season:118691	sr:competitor:2820	sr:competitor:2814	\N	\N	not_started	37	sr:venue:739	2025-05-18 17:00:00
sr:sport_event:50868087	sr:season:119799	sr:competitor:2971	sr:competitor:2990	1	0	closed	7	sr:venue:18994	2024-09-29 10:15:00
sr:sport_event:50852099	sr:season:118691	sr:competitor:2831	sr:competitor:2814	1	0	closed	1	sr:venue:880	2024-08-19 17:00:00
sr:sport_event:50852423	sr:season:118691	sr:competitor:2821	sr:competitor:2824	\N	\N	not_started	18	sr:venue:697	2024-12-21 15:15:00
sr:sport_event:50868235	sr:season:119799	sr:competitor:2960	sr:competitor:2947	\N	\N	not_started	15	sr:venue:656	2024-12-07 17:45:00
sr:sport_event:50868207	sr:season:119799	sr:competitor:2951	sr:competitor:2961	\N	\N	not_started	14	sr:venue:35438	2024-11-30 17:45:00
sr:sport_event:50868177	sr:season:119799	sr:competitor:2990	sr:competitor:2959	1	4	closed	12	sr:venue:3261	2024-11-10 11:15:00
sr:sport_event:50868079	sr:season:119799	sr:competitor:2955	sr:competitor:2947	1	0	closed	7	sr:venue:584	2024-09-29 12:30:00
sr:sport_event:50868105	sr:season:119799	sr:competitor:2959	sr:competitor:2955	2	1	closed	8	sr:venue:612	2024-10-06 12:30:00
sr:sport_event:50868211	sr:season:119799	sr:competitor:2971	sr:competitor:2960	\N	\N	not_started	14	sr:venue:18994	2024-11-30 20:00:00
sr:sport_event:50868227	sr:season:119799	sr:competitor:2979	sr:competitor:2962	\N	\N	not_started	15	sr:venue:3293	2024-12-07 15:30:00
sr:sport_event:50868083	sr:season:119799	sr:competitor:2960	sr:competitor:2957	1	1	closed	7	sr:venue:656	2024-09-28 19:00:00
sr:sport_event:50868217	sr:season:119799	sr:competitor:2955	sr:competitor:2979	\N	\N	not_started	14	sr:venue:584	2024-12-01 13:30:00
sr:sport_event:50868181	sr:season:119799	sr:competitor:2964	sr:competitor:2979	1	0	closed	12	sr:venue:569	2024-11-10 13:30:00
sr:sport_event:50868269	sr:season:119799	sr:competitor:2956	sr:competitor:2971	\N	\N	not_started	17	sr:venue:685	2024-12-20 19:00:00
sr:sport_event:50868163	sr:season:119799	sr:competitor:2960	sr:competitor:2948	1	4	closed	11	sr:venue:656	2024-11-03 13:30:00
sr:sport_event:50868147	sr:season:119799	sr:competitor:2953	sr:competitor:2961	1	0	closed	10	sr:venue:577	2024-10-27 15:45:00
sr:sport_event:50868145	sr:season:119799	sr:competitor:2955	sr:competitor:2977	5	0	closed	10	sr:venue:584	2024-10-27 13:30:00
sr:sport_event:50850705	sr:season:118689	sr:competitor:7	sr:competitor:3	\N	\N	not_started	37	sr:venue:10	2025-05-18 14:00:00
sr:sport_event:50868023	sr:season:119799	sr:competitor:2961	sr:competitor:2960	1	2	closed	4	sr:venue:826	2024-08-31 19:00:00
sr:sport_event:50850607	sr:season:118689	sr:competitor:39	sr:competitor:35	\N	\N	not_started	32	sr:venue:765	2025-04-12 14:00:00
sr:sport_event:50868043	sr:season:119799	sr:competitor:2951	sr:competitor:2959	2	2	closed	5	sr:venue:35438	2024-09-14 16:45:00
sr:sport_event:50852327	sr:season:118691	sr:competitor:2814	sr:competitor:2828	\N	\N	postponed	13	sr:venue:1307	2024-11-09 17:30:00
sr:sport_event:50852347	sr:season:118691	sr:competitor:6577	sr:competitor:2826	2	3	closed	14	sr:venue:974	2024-11-23 17:30:00
sr:sport_event:50852089	sr:season:118691	sr:competitor:2819	sr:competitor:2836	2	2	closed	1	sr:venue:619	2024-08-19 19:30:00
sr:sport_event:50852363	sr:season:118691	sr:competitor:2826	sr:competitor:2828	\N	\N	not_started	15	sr:venue:760	2024-11-29 20:00:00
sr:sport_event:50852605	sr:season:118691	sr:competitor:2816	sr:competitor:6577	\N	\N	not_started	27	sr:venue:1045	2025-03-09 18:00:00
sr:sport_event:50852563	sr:season:118691	sr:competitor:2821	sr:competitor:2820	\N	\N	not_started	25	sr:venue:697	2025-02-23 19:00:00
sr:sport_event:50852331	sr:season:118691	sr:competitor:2826	sr:competitor:2836	0	1	closed	13	sr:venue:760	2024-11-10 15:15:00
sr:sport_event:50852493	sr:season:118691	sr:competitor:2824	sr:competitor:2859	\N	\N	not_started	21	sr:venue:581	2025-01-26 19:00:00
sr:sport_event:50852429	sr:season:118691	sr:competitor:2829	sr:competitor:2833	\N	\N	not_started	18	sr:venue:754	2024-12-22 15:15:00
sr:sport_event:50852259	sr:season:118691	sr:competitor:2831	sr:competitor:2818	1	2	closed	9	sr:venue:880	2024-10-05 16:30:00
sr:sport_event:50852245	sr:season:118691	sr:competitor:2885	sr:competitor:2817	0	3	closed	9	sr:venue:9311	2024-10-06 14:15:00
sr:sport_event:50852603	sr:season:118691	sr:competitor:2817	sr:competitor:2820	\N	\N	not_started	27	sr:venue:714	2025-03-09 18:00:00
sr:sport_event:50852589	sr:season:118691	sr:competitor:2836	sr:competitor:2825	\N	\N	not_started	26	sr:venue:21414	2025-03-02 18:00:00
sr:sport_event:50852647	sr:season:118691	sr:competitor:2821	sr:competitor:6577	\N	\N	not_started	29	sr:venue:697	2025-03-30 17:00:00
sr:sport_event:50852837	sr:season:118691	sr:competitor:2818	sr:competitor:2826	\N	\N	not_started	38	sr:venue:2440	2025-05-25 17:00:00
sr:sport_event:50852135	sr:season:118691	sr:competitor:2824	sr:competitor:2885	1	2	closed	3	sr:venue:581	2024-08-28 19:30:00
sr:sport_event:50852747	sr:season:118691	sr:competitor:2814	sr:competitor:2816	\N	\N	not_started	34	sr:venue:1307	2025-05-04 17:00:00
sr:sport_event:50852665	sr:season:118691	sr:competitor:6577	sr:competitor:2824	\N	\N	not_started	30	sr:venue:974	2025-04-06 17:00:00
sr:sport_event:50852547	sr:season:118691	sr:competitor:2820	sr:competitor:2829	\N	\N	not_started	24	sr:venue:739	2025-02-16 19:00:00
sr:sport_event:50852811	sr:season:118691	sr:competitor:2824	sr:competitor:24264	\N	\N	not_started	37	sr:venue:581	2025-05-18 17:00:00
sr:sport_event:50850589	sr:season:118689	sr:competitor:35	sr:competitor:17	\N	\N	not_started	31	sr:venue:9	2025-04-05 14:00:00
sr:sport_event:50850689	sr:season:118689	sr:competitor:45	sr:competitor:17	\N	\N	not_started	36	sr:venue:2231	2025-05-10 14:00:00
sr:sport_event:50868095	sr:season:119799	sr:competitor:2947	sr:competitor:2962	1	0	closed	8	sr:venue:2081	2024-10-05 16:45:00
sr:sport_event:50852183	sr:season:118691	sr:competitor:2816	sr:competitor:2826	1	2	closed	6	sr:venue:1045	2024-09-23 19:00:00
sr:sport_event:50852161	sr:season:118691	sr:competitor:2836	sr:competitor:2828	3	0	closed	5	sr:venue:21414	2024-09-15 19:00:00
sr:sport_event:50868183	sr:season:119799	sr:competitor:2950	sr:competitor:2961	1	2	closed	12	sr:venue:615	2024-11-10 15:45:00
sr:sport_event:50868289	sr:season:119799	sr:competitor:2971	sr:competitor:2962	\N	\N	not_started	18	sr:venue:18994	2025-01-11 19:00:00
sr:sport_event:50868301	sr:season:119799	sr:competitor:2947	sr:competitor:2955	\N	\N	not_started	19	sr:venue:2081	2025-01-19 11:15:00
sr:sport_event:50868297	sr:season:119799	sr:competitor:2979	sr:competitor:2951	\N	\N	not_started	19	sr:venue:3293	2025-01-18 20:00:00
sr:sport_event:50868113	sr:season:119799	sr:competitor:2960	sr:competitor:2990	2	2	closed	9	sr:venue:656	2024-10-19 14:30:00
sr:sport_event:50868293	sr:season:119799	sr:competitor:2990	sr:competitor:2977	\N	\N	not_started	19	sr:venue:3261	2025-01-19 13:30:00
sr:sport_event:50868161	sr:season:119799	sr:competitor:2962	sr:competitor:2951	6	0	closed	11	sr:venue:689	2024-11-03 13:30:00
sr:sport_event:50868315	sr:season:119799	sr:competitor:2951	sr:competitor:2964	\N	\N	not_started	20	sr:venue:35438	2025-01-25 19:00:00
sr:sport_event:50868073	sr:season:119799	sr:competitor:2959	sr:competitor:2947	2	0	closed	6	sr:venue:612	2024-09-22 12:30:00
sr:sport_event:50868343	sr:season:119799	sr:competitor:2964	sr:competitor:2957	\N	\N	not_started	21	sr:venue:569	2025-02-01 19:00:00
sr:sport_event:50868251	sr:season:119799	sr:competitor:2947	sr:competitor:2950	\N	\N	not_started	16	sr:venue:2081	2024-12-15 19:00:00
sr:sport_event:50868265	sr:season:119799	sr:competitor:2977	sr:competitor:2951	\N	\N	not_started	17	sr:venue:729	2024-12-21 20:00:00
sr:sport_event:50868037	sr:season:119799	sr:competitor:2971	sr:competitor:2977	3	0	closed	4	sr:venue:18994	2024-09-01 12:30:00
sr:sport_event:50850627	sr:season:118689	sr:competitor:31	sr:competitor:44	\N	\N	not_started	33	sr:venue:2183	2025-04-19 14:00:00
sr:sport_event:50868089	sr:season:119799	sr:competitor:2951	sr:competitor:2979	0	1	closed	7	sr:venue:35438	2024-09-29 12:30:00
sr:sport_event:50868063	sr:season:119799	sr:competitor:2956	sr:competitor:2960	1	2	closed	6	sr:venue:685	2024-09-21 16:45:00
sr:sport_event:50850671	sr:season:118689	sr:competitor:17	sr:competitor:3	\N	\N	not_started	35	sr:venue:606	2025-05-03 14:00:00
sr:sport_event:50850697	sr:season:118689	sr:competitor:40	sr:competitor:33	\N	\N	not_started	37	sr:venue:815	2025-05-18 14:00:00
sr:sport_event:50850609	sr:season:118689	sr:competitor:14	sr:competitor:48	\N	\N	not_started	32	sr:venue:2230	2025-04-12 14:00:00
sr:sport_event:50852357	sr:season:118691	sr:competitor:2836	sr:competitor:2885	2	1	closed	14	sr:venue:21414	2024-11-23 15:15:00
sr:sport_event:50852247	sr:season:118691	sr:competitor:2845	sr:competitor:2828	0	0	closed	9	sr:venue:14888	2024-10-04 19:00:00
sr:sport_event:50852355	sr:season:118691	sr:competitor:2833	sr:competitor:2818	1	0	closed	14	sr:venue:730	2024-11-24 15:15:00
sr:sport_event:50852427	sr:season:118691	sr:competitor:24264	sr:competitor:2831	\N	\N	not_started	18	sr:venue:11380	2024-12-20 20:00:00
sr:sport_event:50852295	sr:season:118691	sr:competitor:2824	sr:competitor:2820	0	2	closed	11	sr:venue:581	2024-10-27 20:00:00
sr:sport_event:50852375	sr:season:118691	sr:competitor:2829	sr:competitor:2859	\N	\N	not_started	15	sr:venue:754	2024-12-01 15:15:00
sr:sport_event:50852535	sr:season:118691	sr:competitor:2821	sr:competitor:2816	\N	\N	not_started	23	sr:venue:697	2025-02-09 19:00:00
sr:sport_event:50852723	sr:season:118691	sr:competitor:2836	sr:competitor:2818	\N	\N	not_started	33	sr:venue:21414	2025-04-23 17:00:00
sr:sport_event:50852667	sr:season:118691	sr:competitor:2845	sr:competitor:2820	\N	\N	not_started	30	sr:venue:14888	2025-04-06 17:00:00
sr:sport_event:50852591	sr:season:118691	sr:competitor:24264	sr:competitor:2821	\N	\N	not_started	26	sr:venue:11380	2025-03-02 18:00:00
sr:sport_event:50852229	sr:season:118691	sr:competitor:2820	sr:competitor:2817	4	2	closed	8	sr:venue:739	2024-09-28 19:00:00
sr:sport_event:50852839	sr:season:118691	sr:competitor:2819	sr:competitor:2833	\N	\N	not_started	38	sr:venue:619	2025-05-25 17:00:00
sr:sport_event:50852323	sr:season:118691	sr:competitor:2859	sr:competitor:24264	0	1	closed	13	sr:venue:608	2024-11-10 17:30:00
sr:sport_event:50852559	sr:season:118691	sr:competitor:2845	sr:competitor:2885	\N	\N	not_started	24	sr:venue:14888	2025-02-16 19:00:00
sr:sport_event:50852107	sr:season:118691	sr:competitor:2829	sr:competitor:2831	3	0	closed	2	sr:venue:754	2024-08-25 15:00:00
sr:sport_event:50852359	sr:season:118691	sr:competitor:24264	sr:competitor:2814	4	1	closed	14	sr:venue:11380	2024-11-23 17:30:00
sr:sport_event:50852813	sr:season:118691	sr:competitor:2833	sr:competitor:2829	\N	\N	not_started	37	sr:venue:730	2025-05-18 17:00:00
sr:sport_event:50852529	sr:season:118691	sr:competitor:2885	sr:competitor:2859	\N	\N	not_started	23	sr:venue:9311	2025-02-09 19:00:00
sr:sport_event:50852767	sr:season:118691	sr:competitor:2821	sr:competitor:2833	\N	\N	not_started	35	sr:venue:697	2025-05-11 17:00:00
sr:sport_event:50852147	sr:season:118691	sr:competitor:2828	sr:competitor:2819	1	1	closed	4	sr:venue:691	2024-08-31 19:30:00
sr:sport_event:50852787	sr:season:118691	sr:competitor:2820	sr:competitor:2836	\N	\N	not_started	36	sr:venue:739	2025-05-14 17:00:00
sr:sport_event:50850461	sr:season:118689	sr:competitor:45	sr:competitor:60	\N	\N	not_started	25	sr:venue:2231	2025-02-15 15:00:00
sr:sport_event:50852575	sr:season:118691	sr:competitor:2829	sr:competitor:24264	\N	\N	not_started	25	sr:venue:754	2025-02-23 19:00:00
sr:sport_event:50852679	sr:season:118691	sr:competitor:2818	sr:competitor:2814	\N	\N	not_started	30	sr:venue:2440	2025-04-06 17:00:00
sr:sport_event:50868065	sr:season:119799	sr:competitor:2979	sr:competitor:2953	1	1	closed	6	sr:venue:3293	2024-09-21 18:00:00
sr:sport_event:50852201	sr:season:118691	sr:competitor:2817	sr:competitor:2859	1	0	closed	7	sr:venue:714	2024-09-25 19:00:00
sr:sport_event:50852167	sr:season:118691	sr:competitor:2826	sr:competitor:2819	1	2	closed	5	sr:venue:760	2024-09-14 12:00:00
sr:sport_event:50868091	sr:season:119799	sr:competitor:2956	sr:competitor:2953	0	2	closed	7	sr:venue:685	2024-09-29 14:45:00
sr:sport_event:50868167	sr:season:119799	sr:competitor:2948	sr:competitor:2977	1	0	closed	12	sr:venue:786	2024-11-08 19:00:00
sr:sport_event:50868133	sr:season:119799	sr:competitor:2957	sr:competitor:2951	1	0	closed	10	sr:venue:2769	2024-10-26 14:30:00
sr:sport_event:50868231	sr:season:119799	sr:competitor:2952	sr:competitor:2955	\N	\N	not_started	15	sr:venue:726	2024-12-06 19:00:00
sr:sport_event:50868097	sr:season:119799	sr:competitor:2990	sr:competitor:2961	0	1	closed	8	sr:venue:3261	2024-10-04 18:00:00
sr:sport_event:50868255	sr:season:119799	sr:competitor:2964	sr:competitor:2952	\N	\N	not_started	16	sr:venue:569	2024-12-14 17:45:00
sr:sport_event:50868195	sr:season:119799	sr:competitor:2962	sr:competitor:2948	1	2	closed	13	sr:venue:689	2024-11-24 11:15:00
sr:sport_event:50868213	sr:season:119799	sr:competitor:2948	sr:competitor:2952	\N	\N	not_started	14	sr:venue:786	2024-12-01 11:15:00
sr:sport_event:50868197	sr:season:119799	sr:competitor:2960	sr:competitor:2950	1	2	closed	13	sr:venue:656	2024-11-24 13:30:00
sr:sport_event:50868233	sr:season:119799	sr:competitor:2956	sr:competitor:2959	\N	\N	not_started	15	sr:venue:685	2024-12-07 19:00:00
sr:sport_event:50868149	sr:season:119799	sr:competitor:2959	sr:competitor:2950	3	2	closed	11	sr:venue:612	2024-11-02 20:00:00
sr:sport_event:50868199	sr:season:119799	sr:competitor:2961	sr:competitor:2947	2	2	closed	13	sr:venue:826	2024-11-24 13:30:00
sr:sport_event:50868241	sr:season:119799	sr:competitor:2955	sr:competitor:2951	\N	\N	not_started	16	sr:venue:584	2024-12-15 13:30:00
sr:sport_event:50868005	sr:season:119799	sr:competitor:2953	sr:competitor:2957	5	0	closed	3	sr:venue:577	2024-09-18 18:00:00
sr:sport_event:50868013	sr:season:119799	sr:competitor:2951	sr:competitor:2950	0	0	closed	3	sr:venue:35438	2024-08-25 10:15:00
sr:sport_event:50850553	sr:season:118689	sr:competitor:45	sr:competitor:3	\N	\N	not_started	29	sr:venue:2231	2025-03-15 15:00:00
sr:sport_event:50850651	sr:season:118689	sr:competitor:45	sr:competitor:43	\N	\N	not_started	34	sr:venue:2231	2025-04-26 14:00:00
sr:sport_event:50850707	sr:season:118689	sr:competitor:48	sr:competitor:45	\N	\N	not_started	37	sr:venue:12	2025-05-18 14:00:00
sr:sport_event:50868081	sr:season:119799	sr:competitor:2962	sr:competitor:2959	1	1	closed	7	sr:venue:689	2024-09-28 16:45:00
sr:sport_event:50868203	sr:season:119799	sr:competitor:2964	sr:competitor:2956	\N	\N	not_started	14	sr:venue:569	2024-11-29 19:00:00
sr:sport_event:50852231	sr:season:118691	sr:competitor:2831	sr:competitor:2826	1	2	closed	8	sr:venue:880	2024-09-27 19:00:00
sr:sport_event:53233387	sr:season:118691	sr:competitor:2816	sr:competitor:2859	2	1	closed	3	sr:venue:1045	2024-09-18 17:00:00
sr:sport_event:50852281	sr:season:118691	sr:competitor:2859	sr:competitor:2828	1	1	closed	11	sr:venue:608	2024-10-27 15:15:00
sr:sport_event:50852415	sr:season:118691	sr:competitor:2826	sr:competitor:24264	\N	\N	not_started	17	sr:venue:760	2024-12-14 15:15:00
sr:sport_event:50852211	sr:season:118691	sr:competitor:2845	sr:competitor:2825	0	2	closed	7	sr:venue:14888	2024-09-19 17:00:00
sr:sport_event:50852335	sr:season:118691	sr:competitor:2829	sr:competitor:2820	4	0	closed	13	sr:venue:754	2024-11-09 13:00:00
sr:sport_event:50852435	sr:season:118691	sr:competitor:2817	sr:competitor:2836	\N	\N	not_started	18	sr:venue:714	2024-12-21 20:00:00
sr:sport_event:50852485	sr:season:118691	sr:competitor:2817	sr:competitor:2828	\N	\N	not_started	21	sr:venue:714	2025-01-26 19:00:00
sr:sport_event:50852499	sr:season:118691	sr:competitor:2833	sr:competitor:2814	\N	\N	not_started	21	sr:venue:730	2025-01-26 19:00:00
sr:sport_event:50852557	sr:season:118691	sr:competitor:2826	sr:competitor:6577	\N	\N	not_started	24	sr:venue:760	2025-02-16 19:00:00
sr:sport_event:50852419	sr:season:118691	sr:competitor:2824	sr:competitor:6577	\N	\N	not_started	17	sr:venue:581	2024-12-15 17:30:00
sr:sport_event:50852533	sr:season:118691	sr:competitor:2833	sr:competitor:2817	\N	\N	not_started	23	sr:venue:730	2025-02-09 19:00:00
sr:sport_event:50852403	sr:season:118691	sr:competitor:2817	sr:competitor:2845	\N	\N	not_started	17	sr:venue:714	2024-12-15 20:00:00
sr:sport_event:50852661	sr:season:118691	sr:competitor:2817	sr:competitor:2816	\N	\N	not_started	30	sr:venue:714	2025-04-06 17:00:00
sr:sport_event:50852635	sr:season:118691	sr:competitor:2819	sr:competitor:2829	\N	\N	not_started	28	sr:venue:619	2025-03-16 18:00:00
sr:sport_event:50852697	sr:season:118691	sr:competitor:2828	sr:competitor:2833	\N	\N	not_started	31	sr:venue:691	2025-04-13 17:00:00
sr:sport_event:50852757	sr:season:118691	sr:competitor:2819	sr:competitor:2820	\N	\N	not_started	34	sr:venue:619	2025-05-04 17:00:00
sr:sport_event:50852751	sr:season:118691	sr:competitor:2831	sr:competitor:2817	\N	\N	not_started	34	sr:venue:880	2025-05-04 17:00:00
sr:sport_event:50852795	sr:season:118691	sr:competitor:2829	sr:competitor:2826	\N	\N	not_started	36	sr:venue:754	2025-05-14 17:00:00
sr:sport_event:50852807	sr:season:118691	sr:competitor:2828	sr:competitor:2825	\N	\N	not_started	37	sr:venue:691	2025-05-18 17:00:00
sr:sport_event:50850585	sr:season:118689	sr:competitor:32	sr:competitor:3	\N	\N	not_started	31	sr:venue:2188	2025-04-05 14:00:00
sr:sport_event:50850631	sr:season:118689	sr:competitor:33	sr:competitor:14	\N	\N	not_started	33	sr:venue:28762	2025-04-19 14:00:00
sr:sport_event:50868077	sr:season:119799	sr:competitor:2977	sr:competitor:2964	2	1	closed	7	sr:venue:729	2024-09-27 18:00:00
sr:sport_event:50868165	sr:season:119799	sr:competitor:2956	sr:competitor:2990	2	0	closed	11	sr:venue:685	2024-11-03 15:45:00
sr:sport_event:50852143	sr:season:118691	sr:competitor:2817	sr:competitor:2831	7	0	closed	4	sr:venue:714	2024-08-31 15:00:00
sr:sport_event:50852127	sr:season:118691	sr:competitor:2826	sr:competitor:2833	0	0	closed	3	sr:venue:760	2024-08-27 17:00:00
sr:sport_event:50852279	sr:season:118691	sr:competitor:2825	sr:competitor:2814	4	1	closed	10	sr:venue:751	2024-10-19 12:00:00
sr:sport_event:50852609	sr:season:118691	sr:competitor:2824	sr:competitor:2833	\N	\N	not_started	27	sr:venue:581	2025-03-09 18:00:00
sr:sport_event:50868253	sr:season:119799	sr:competitor:2971	sr:competitor:2961	\N	\N	not_started	16	sr:venue:18994	2024-12-13 19:00:00
sr:sport_event:50868115	sr:season:119799	sr:competitor:2950	sr:competitor:2952	1	2	closed	9	sr:venue:615	2024-10-19 16:45:00
sr:sport_event:50868245	sr:season:119799	sr:competitor:2959	sr:competitor:2977	\N	\N	not_started	16	sr:venue:612	2024-12-14 20:00:00
sr:sport_event:50868169	sr:season:119799	sr:competitor:2951	sr:competitor:2960	1	0	closed	12	sr:venue:35438	2024-11-09 15:30:00
sr:sport_event:50868283	sr:season:119799	sr:competitor:2957	sr:competitor:2979	\N	\N	not_started	18	sr:venue:2769	2025-01-10 19:00:00
sr:sport_event:50868103	sr:season:119799	sr:competitor:2948	sr:competitor:2956	3	2	closed	8	sr:venue:786	2024-10-05 19:00:00
sr:sport_event:50868209	sr:season:119799	sr:competitor:2959	sr:competitor:2957	\N	\N	not_started	14	sr:venue:612	2024-11-30 19:00:00
sr:sport_event:50868061	sr:season:119799	sr:competitor:2948	sr:competitor:2961	3	2	closed	6	sr:venue:786	2024-09-21 14:30:00
sr:sport_event:50868239	sr:season:119799	sr:competitor:2953	sr:competitor:2990	\N	\N	not_started	16	sr:venue:577	2024-12-15 15:45:00
sr:sport_event:50868193	sr:season:119799	sr:competitor:2957	sr:competitor:2955	1	2	closed	13	sr:venue:2769	2024-11-23 20:00:00
sr:sport_event:50868259	sr:season:119799	sr:competitor:2950	sr:competitor:2955	\N	\N	not_started	17	sr:venue:615	2024-12-21 19:00:00
sr:sport_event:50868155	sr:season:119799	sr:competitor:2953	sr:competitor:2952	3	2	closed	11	sr:venue:577	2024-11-02 17:45:00
sr:sport_event:50868157	sr:season:119799	sr:competitor:2957	sr:competitor:2964	3	0	closed	11	sr:venue:2769	2024-11-02 20:00:00
sr:sport_event:50868215	sr:season:119799	sr:competitor:2950	sr:competitor:2977	\N	\N	not_started	14	sr:venue:615	2024-12-01 13:30:00
sr:sport_event:50850649	sr:season:118689	sr:competitor:14	sr:competitor:50	\N	\N	not_started	34	sr:venue:2230	2025-04-26 14:00:00
sr:sport_event:50850685	sr:season:118689	sr:competitor:39	sr:competitor:38	\N	\N	not_started	36	sr:venue:765	2025-05-10 14:00:00
sr:sport_event:50850713	sr:season:118689	sr:competitor:37	sr:competitor:14	\N	\N	not_started	37	sr:venue:18379	2025-05-18 14:00:00
sr:sport_event:50868049	sr:season:119799	sr:competitor:2952	sr:competitor:2962	2	0	closed	5	sr:venue:726	2024-09-14 14:30:00
sr:sport_event:50852217	sr:season:118691	sr:competitor:2828	sr:competitor:2820	0	0	closed	7	sr:venue:691	2024-09-24 17:00:00
sr:sport_event:50852273	sr:season:118691	sr:competitor:2820	sr:competitor:2816	1	2	closed	10	sr:venue:739	2024-10-19 14:15:00
sr:sport_event:50852431	sr:season:118691	sr:competitor:2845	sr:competitor:2819	\N	\N	not_started	18	sr:venue:14888	2024-12-22 17:30:00
sr:sport_event:50852389	sr:season:118691	sr:competitor:6577	sr:competitor:2831	\N	\N	not_started	16	sr:venue:974	2024-12-07 13:00:00
sr:sport_event:50852351	sr:season:118691	sr:competitor:2821	sr:competitor:2817	2	2	closed	14	sr:venue:697	2024-11-23 20:00:00
sr:sport_event:50852145	sr:season:118691	sr:competitor:2859	sr:competitor:2824	0	0	closed	4	sr:venue:608	2024-09-01 17:15:00
sr:sport_event:50852657	sr:season:118691	sr:competitor:2828	sr:competitor:2826	\N	\N	not_started	29	sr:venue:691	2025-03-30 17:00:00
sr:sport_event:50852567	sr:season:118691	sr:competitor:2885	sr:competitor:2814	\N	\N	not_started	25	sr:venue:9311	2025-02-23 19:00:00
sr:sport_event:50852209	sr:season:118691	sr:competitor:2814	sr:competitor:2819	1	2	closed	7	sr:venue:1307	2024-09-26 17:00:00
sr:sport_event:50852613	sr:season:118691	sr:competitor:2885	sr:competitor:2819	\N	\N	not_started	27	sr:venue:9311	2025-03-09 18:00:00
sr:sport_event:50852447	sr:season:118691	sr:competitor:2833	sr:competitor:2828	\N	\N	not_started	19	sr:venue:730	2025-01-12 19:00:00
sr:sport_event:50852677	sr:season:118691	sr:competitor:24264	sr:competitor:2885	\N	\N	not_started	30	sr:venue:11380	2025-04-06 17:00:00
sr:sport_event:50852511	sr:season:118691	sr:competitor:2845	sr:competitor:2818	\N	\N	not_started	22	sr:venue:14888	2025-02-02 19:00:00
sr:sport_event:50852489	sr:season:118691	sr:competitor:2885	sr:competitor:2821	\N	\N	not_started	21	sr:venue:9311	2025-01-26 19:00:00
sr:sport_event:50852771	sr:season:118691	sr:competitor:2826	sr:competitor:2831	\N	\N	not_started	35	sr:venue:760	2025-05-11 17:00:00
sr:sport_event:50852743	sr:season:118691	sr:competitor:6577	sr:competitor:2828	\N	\N	not_started	34	sr:venue:974	2025-05-04 17:00:00
sr:sport_event:50852745	sr:season:118691	sr:competitor:2885	sr:competitor:2836	\N	\N	not_started	34	sr:venue:9311	2025-05-04 17:00:00
sr:sport_event:50852789	sr:season:118691	sr:competitor:2818	sr:competitor:2816	\N	\N	not_started	36	sr:venue:2440	2025-05-14 17:00:00
sr:sport_event:50850613	sr:season:118689	sr:competitor:3	sr:competitor:33	\N	\N	not_started	32	sr:venue:1272	2025-04-12 14:00:00
sr:sport_event:50868045	sr:season:119799	sr:competitor:2947	sr:competitor:2957	1	0	closed	5	sr:venue:2081	2024-09-14 18:00:00
sr:sport_event:50868285	sr:season:119799	sr:competitor:2977	sr:competitor:2960	\N	\N	not_started	18	sr:venue:729	2025-01-11 15:30:00
sr:sport_event:50868057	sr:season:119799	sr:competitor:2977	sr:competitor:2990	0	0	closed	5	sr:venue:729	2024-09-15 14:45:00
sr:sport_event:50852083	sr:season:118691	sr:competitor:2816	sr:competitor:24264	1	1	closed	1	sr:venue:1045	2024-08-15 19:30:00
sr:sport_event:50852129	sr:season:118691	sr:competitor:6577	sr:competitor:2829	1	1	closed	3	sr:venue:974	2024-08-29 19:30:00
sr:sport_event:50852105	sr:season:118691	sr:competitor:2859	sr:competitor:2818	0	0	closed	2	sr:venue:608	2024-08-24 19:30:00
sr:sport_event:50852593	sr:season:118691	sr:competitor:2845	sr:competitor:2859	\N	\N	not_started	26	sr:venue:14888	2025-03-02 18:00:00
sr:sport_event:50852243	sr:season:118691	sr:competitor:2829	sr:competitor:2819	2	0	closed	9	sr:venue:754	2024-10-05 19:00:00
sr:sport_event:50868261	sr:season:119799	sr:competitor:2948	sr:competitor:2957	\N	\N	not_started	17	sr:venue:786	2024-12-22 13:30:00
sr:sport_event:50868275	sr:season:119799	sr:competitor:2953	sr:competitor:2956	\N	\N	not_started	18	sr:venue:577	2025-01-11 17:45:00
sr:sport_event:50868247	sr:season:119799	sr:competitor:2957	sr:competitor:2956	\N	\N	not_started	16	sr:venue:2769	2024-12-14 19:00:00
sr:sport_event:50868307	sr:season:119799	sr:competitor:2960	sr:competitor:2956	\N	\N	not_started	19	sr:venue:656	2025-01-17 19:00:00
sr:sport_event:50868205	sr:season:119799	sr:competitor:2947	sr:competitor:2990	\N	\N	not_started	14	sr:venue:2081	2024-11-30 15:30:00
sr:sport_event:50868107	sr:season:119799	sr:competitor:2953	sr:competitor:2951	3	1	closed	8	sr:venue:577	2024-10-06 14:45:00
sr:sport_event:50868295	sr:season:119799	sr:competitor:2948	sr:competitor:2950	\N	\N	not_started	19	sr:venue:786	2025-01-18 17:45:00
sr:sport_event:50868071	sr:season:119799	sr:competitor:2990	sr:competitor:2955	0	5	closed	6	sr:venue:3261	2024-09-22 12:30:00
sr:sport_event:50868249	sr:season:119799	sr:competitor:2962	sr:competitor:2960	\N	\N	not_started	16	sr:venue:689	2024-12-15 13:30:00
sr:sport_event:50868229	sr:season:119799	sr:competitor:2977	sr:competitor:2957	\N	\N	not_started	15	sr:venue:729	2024-12-07 20:00:00
sr:sport_event:50868173	sr:season:119799	sr:competitor:2947	sr:competitor:2952	0	3	closed	12	sr:venue:2081	2024-11-09 19:00:00
sr:sport_event:50868125	sr:season:119799	sr:competitor:2951	sr:competitor:2948	0	1	closed	9	sr:venue:35438	2024-10-20 12:30:00
sr:sport_event:50868039	sr:season:119799	sr:competitor:2952	sr:competitor:2979	3	0	closed	4	sr:venue:726	2024-09-01 14:45:00
sr:sport_event:50850703	sr:season:118689	sr:competitor:38	sr:competitor:35	\N	\N	not_started	37	sr:venue:799	2025-05-18 14:00:00
sr:sport_event:50850275	sr:season:118689	sr:competitor:44	sr:competitor:43	\N	\N	not_started	16	sr:venue:579	2024-12-14 15:00:00
sr:sport_event:53185659	sr:season:119799	sr:competitor:2959	sr:competitor:2953	0	2	closed	4	sr:venue:612	2024-10-30 17:00:00
sr:sport_event:50868237	sr:season:119799	sr:competitor:2961	sr:competitor:2964	\N	\N	not_started	15	sr:venue:826	2024-12-08 13:30:00
sr:sport_event:50852187	sr:season:118691	sr:competitor:2885	sr:competitor:2833	2	1	closed	6	sr:venue:9311	2024-09-20 19:00:00
sr:sport_event:50852255	sr:season:118691	sr:competitor:2833	sr:competitor:2816	1	0	closed	9	sr:venue:730	2024-10-06 16:30:00
sr:sport_event:50852289	sr:season:118691	sr:competitor:2829	sr:competitor:2817	0	4	closed	11	sr:venue:754	2024-10-26 19:00:00
sr:sport_event:50852393	sr:season:118691	sr:competitor:2816	sr:competitor:2817	\N	\N	not_started	16	sr:venue:1045	2024-12-07 15:15:00
sr:sport_event:50852151	sr:season:118691	sr:competitor:2845	sr:competitor:2826	0	1	closed	4	sr:venue:14888	2024-08-31 19:30:00
sr:sport_event:50852353	sr:season:118691	sr:competitor:2828	sr:competitor:2816	4	2	closed	14	sr:venue:691	2024-11-23 13:00:00
sr:sport_event:50852473	sr:season:118691	sr:competitor:2819	sr:competitor:2826	\N	\N	not_started	20	sr:venue:619	2025-01-19 19:00:00
sr:sport_event:50852703	sr:season:118691	sr:competitor:2818	sr:competitor:2828	\N	\N	not_started	32	sr:venue:2440	2025-04-20 17:00:00
sr:sport_event:50852695	sr:season:118691	sr:competitor:2824	sr:competitor:2826	\N	\N	not_started	31	sr:venue:581	2025-04-13 17:00:00
sr:sport_event:50852803	sr:season:118691	sr:competitor:2817	sr:competitor:2819	\N	\N	not_started	37	sr:venue:714	2025-05-18 17:00:00
sr:sport_event:50852321	sr:season:118691	sr:competitor:2816	sr:competitor:2821	2	2	closed	13	sr:venue:1045	2024-11-10 13:00:00
sr:sport_event:50852341	sr:season:118691	sr:competitor:2825	sr:competitor:2824	1	0	closed	14	sr:venue:751	2024-11-24 20:00:00
sr:sport_event:50852509	sr:season:118691	sr:competitor:2819	sr:competitor:2831	\N	\N	not_started	22	sr:venue:619	2025-02-02 19:00:00
sr:sport_event:50852763	sr:season:118691	sr:competitor:2817	sr:competitor:2829	\N	\N	not_started	35	sr:venue:714	2025-05-11 17:00:00
sr:sport_event:50852669	sr:season:118691	sr:competitor:2819	sr:competitor:2825	\N	\N	not_started	30	sr:venue:619	2025-04-06 17:00:00
sr:sport_event:50852775	sr:season:118691	sr:competitor:2828	sr:competitor:2859	\N	\N	not_started	35	sr:venue:691	2025-05-11 17:00:00
sr:sport_event:50852101	sr:season:118691	sr:competitor:2836	sr:competitor:24264	3	0	closed	2	sr:venue:21414	2024-08-25 19:30:00
sr:sport_event:50852565	sr:season:118691	sr:competitor:2818	sr:competitor:2819	\N	\N	not_started	25	sr:venue:2440	2025-02-23 19:00:00
sr:sport_event:50852545	sr:season:118691	sr:competitor:2816	sr:competitor:2824	\N	\N	not_started	24	sr:venue:1045	2025-02-16 19:00:00
sr:sport_event:50852833	sr:season:118691	sr:competitor:24264	sr:competitor:2836	\N	\N	not_started	38	sr:venue:11380	2025-05-25 17:00:00
sr:sport_event:50850615	sr:season:118689	sr:competitor:40	sr:competitor:39	\N	\N	not_started	33	sr:venue:815	2025-04-19 14:00:00
sr:sport_event:50868123	sr:season:119799	sr:competitor:2961	sr:competitor:2957	0	0	closed	9	sr:venue:826	2024-10-20 10:15:00
sr:sport_event:50868051	sr:season:119799	sr:competitor:2960	sr:competitor:2979	1	2	closed	5	sr:venue:656	2024-09-15 10:15:00
sr:sport_event:50868175	sr:season:119799	sr:competitor:2956	sr:competitor:2962	0	3	closed	12	sr:venue:685	2024-11-09 20:00:00
sr:sport_event:50852205	sr:season:118691	sr:competitor:2826	sr:competitor:2824	1	0	closed	7	sr:venue:760	2024-09-17 17:00:00
sr:sport_event:50852449	sr:season:118691	sr:competitor:2885	sr:competitor:24264	\N	\N	not_started	19	sr:venue:9311	2025-01-12 19:00:00
sr:sport_event:50852571	sr:season:118691	sr:competitor:6577	sr:competitor:2817	\N	\N	not_started	25	sr:venue:974	2025-02-23 19:00:00
sr:sport_event:50852597	sr:season:118691	sr:competitor:2826	sr:competitor:2885	\N	\N	not_started	26	sr:venue:760	2025-03-02 18:00:00
sr:sport_event:50868317	sr:season:119799	sr:competitor:2955	sr:competitor:2962	\N	\N	not_started	20	sr:venue:584	2025-01-26 19:00:00
sr:sport_event:50868403	sr:season:119799	sr:competitor:2950	sr:competitor:2956	\N	\N	not_started	25	sr:venue:615	2025-03-07 17:00:00
sr:sport_event:50868185	sr:season:119799	sr:competitor:2952	sr:competitor:2951	5	0	closed	13	sr:venue:726	2024-11-23 20:00:00
sr:sport_event:50868353	sr:season:119799	sr:competitor:2948	sr:competitor:2990	\N	\N	not_started	22	sr:venue:786	2025-02-07 17:00:00
sr:sport_event:50868333	sr:season:119799	sr:competitor:2979	sr:competitor:2955	\N	\N	not_started	21	sr:venue:3293	2025-02-02 13:30:00
sr:sport_event:50868395	sr:season:119799	sr:competitor:2977	sr:competitor:2971	\N	\N	not_started	24	sr:venue:729	2025-02-28 17:00:00
sr:sport_event:50868391	sr:season:119799	sr:competitor:2959	sr:competitor:2962	\N	\N	not_started	24	sr:venue:612	2025-02-28 17:00:00
sr:sport_event:50868409	sr:season:119799	sr:competitor:2957	sr:competitor:2977	\N	\N	not_started	25	sr:venue:2769	2025-03-07 17:00:00
sr:sport_event:50868153	sr:season:119799	sr:competitor:2961	sr:competitor:2955	0	1	closed	11	sr:venue:826	2024-11-02 15:30:00
sr:sport_event:50868379	sr:season:119799	sr:competitor:2971	sr:competitor:2964	\N	\N	not_started	23	sr:venue:18994	2025-02-14 17:00:00
sr:sport_event:50868271	sr:season:119799	sr:competitor:2960	sr:competitor:2953	\N	\N	not_started	17	sr:venue:656	2024-12-22 11:15:00
sr:sport_event:50868419	sr:season:119799	sr:competitor:2961	sr:competitor:2948	\N	\N	not_started	25	sr:venue:826	2025-03-07 17:00:00
sr:sport_event:50868243	sr:season:119799	sr:competitor:2948	sr:competitor:2979	\N	\N	not_started	16	sr:venue:786	2024-12-15 11:15:00
sr:sport_event:54013215	sr:season:119799	sr:competitor:2953	sr:competitor:2948	\N	\N	not_started	5	sr:venue:577	2024-12-04 19:00:00
sr:sport_event:50868159	sr:season:119799	sr:competitor:2979	sr:competitor:2971	2	2	closed	11	sr:venue:3293	2024-11-03 11:15:00
sr:sport_event:50868003	sr:season:119799	sr:competitor:2955	sr:competitor:2964	2	0	closed	3	sr:venue:584	2024-09-17 18:00:00
sr:sport_event:50868373	sr:season:119799	sr:competitor:2979	sr:competitor:2960	\N	\N	not_started	23	sr:venue:3293	2025-02-14 17:00:00
sr:sport_event:50868127	sr:season:119799	sr:competitor:2977	sr:competitor:2953	3	4	closed	9	sr:venue:729	2024-10-20 12:30:00
sr:sport_event:50852611	sr:season:118691	sr:competitor:2828	sr:competitor:2831	\N	\N	not_started	27	sr:venue:691	2025-03-09 18:00:00
sr:sport_event:50868359	sr:season:119799	sr:competitor:2977	sr:competitor:2979	\N	\N	not_started	22	sr:venue:729	2025-02-07 17:00:00
sr:sport_event:50868281	sr:season:119799	sr:competitor:2959	sr:competitor:2948	\N	\N	not_started	18	sr:venue:612	2025-01-12 13:30:00
sr:sport_event:50868407	sr:season:119799	sr:competitor:2959	sr:competitor:2951	\N	\N	not_started	25	sr:venue:612	2025-03-07 17:00:00
sr:sport_event:50868303	sr:season:119799	sr:competitor:2971	sr:competitor:2952	\N	\N	not_started	19	sr:venue:18994	2025-01-18 15:30:00
sr:sport_event:50868287	sr:season:119799	sr:competitor:2947	sr:competitor:2964	\N	\N	not_started	18	sr:venue:2081	2025-01-12 15:45:00
sr:sport_event:50868219	sr:season:119799	sr:competitor:2962	sr:competitor:2953	\N	\N	not_started	14	sr:venue:689	2024-12-01 15:45:00
sr:sport_event:50868347	sr:season:119799	sr:competitor:2961	sr:competitor:2950	\N	\N	not_started	21	sr:venue:826	2025-02-02 19:00:00
sr:sport_event:50852797	sr:season:118691	sr:competitor:2833	sr:competitor:6577	\N	\N	not_started	36	sr:venue:730	2025-05-14 17:00:00
sr:sport_event:50868367	sr:season:119799	sr:competitor:2953	sr:competitor:2977	\N	\N	not_started	23	sr:venue:577	2025-02-14 17:00:00
sr:sport_event:50868319	sr:season:119799	sr:competitor:2959	sr:competitor:2990	\N	\N	not_started	20	sr:venue:612	2025-01-25 20:00:00
sr:sport_event:50868337	sr:season:119799	sr:competitor:2947	sr:competitor:2977	\N	\N	not_started	21	sr:venue:2081	2025-01-31 19:00:00
sr:sport_event:50868329	sr:season:119799	sr:competitor:2953	sr:competitor:2959	\N	\N	not_started	21	sr:venue:577	2025-02-02 13:30:00
sr:sport_event:50868135	sr:season:119799	sr:competitor:2947	sr:competitor:2956	4	1	closed	10	sr:venue:2081	2024-10-26 18:00:00
sr:sport_event:50868109	sr:season:119799	sr:competitor:2979	sr:competitor:2977	4	1	closed	8	sr:venue:3293	2024-10-06 10:15:00
sr:sport_event:50852817	sr:season:118691	sr:competitor:6577	sr:competitor:2845	\N	\N	not_started	37	sr:venue:974	2025-05-18 17:00:00
sr:sport_event:50867787	sr:season:119799	sr:competitor:2959	sr:competitor:2961	1	1	closed	1	sr:venue:612	2024-08-10 14:30:00
sr:sport_event:50868075	sr:season:119799	sr:competitor:2957	sr:competitor:2952	1	3	closed	6	sr:venue:2769	2024-09-22 14:45:00
sr:sport_event:50868179	sr:season:119799	sr:competitor:2955	sr:competitor:2953	2	2	closed	12	sr:venue:584	2024-11-10 13:30:00
sr:sport_event:50868385	sr:season:119799	sr:competitor:2990	sr:competitor:2953	\N	\N	not_started	24	sr:venue:3261	2025-02-28 17:00:00
sr:sport_event:50868413	sr:season:119799	sr:competitor:2947	sr:competitor:2960	\N	\N	not_started	25	sr:venue:2081	2025-03-07 17:00:00
sr:sport_event:50868393	sr:season:119799	sr:competitor:2979	sr:competitor:2952	\N	\N	not_started	24	sr:venue:3293	2025-02-28 17:00:00
sr:sport_event:50868375	sr:season:119799	sr:competitor:2962	sr:competitor:2990	\N	\N	not_started	23	sr:venue:689	2025-02-14 17:00:00
sr:sport_event:50868421	sr:season:119799	sr:competitor:2953	sr:competitor:2950	\N	\N	not_started	26	sr:venue:577	2025-03-14 17:00:00
sr:sport_event:50868323	sr:season:119799	sr:competitor:2977	sr:competitor:2948	\N	\N	not_started	20	sr:venue:729	2025-01-24 19:00:00
sr:sport_event:50868397	sr:season:119799	sr:competitor:2956	sr:competitor:2957	\N	\N	not_started	24	sr:venue:685	2025-02-28 17:00:00
sr:sport_event:50868425	sr:season:119799	sr:competitor:2951	sr:competitor:2957	\N	\N	not_started	26	sr:venue:35438	2025-03-14 17:00:00
sr:sport_event:50868371	sr:season:119799	sr:competitor:2955	sr:competitor:2956	\N	\N	not_started	23	sr:venue:584	2025-02-14 17:00:00
sr:sport_event:50868351	sr:season:119799	sr:competitor:2951	sr:competitor:2962	\N	\N	not_started	22	sr:venue:35438	2025-02-07 17:00:00
sr:sport_event:50868427	sr:season:119799	sr:competitor:2955	sr:competitor:2959	\N	\N	not_started	26	sr:venue:584	2025-03-14 17:00:00
sr:sport_event:50868415	sr:season:119799	sr:competitor:2971	sr:competitor:2953	\N	\N	not_started	25	sr:venue:18994	2025-03-07 17:00:00
sr:sport_event:50868291	sr:season:119799	sr:competitor:2952	sr:competitor:2950	\N	\N	not_started	18	sr:venue:726	2025-01-11 20:00:00
sr:sport_event:50868429	sr:season:119799	sr:competitor:2948	sr:competitor:2962	\N	\N	not_started	26	sr:venue:786	2025-03-14 17:00:00
sr:sport_event:50868201	sr:season:119799	sr:competitor:2953	sr:competitor:2971	2	0	closed	13	sr:venue:577	2024-11-24 15:45:00
sr:sport_event:50868171	sr:season:119799	sr:competitor:2971	sr:competitor:2957	3	1	closed	12	sr:venue:18994	2024-11-09 17:45:00
sr:sport_event:50868389	sr:season:119799	sr:competitor:2948	sr:competitor:2947	\N	\N	not_started	24	sr:venue:786	2025-02-28 17:00:00
sr:sport_event:50868225	sr:season:119799	sr:competitor:2951	sr:competitor:2971	\N	\N	not_started	15	sr:venue:35438	2024-12-08 11:15:00
sr:sport_event:50868279	sr:season:119799	sr:competitor:2955	sr:competitor:2961	\N	\N	not_started	18	sr:venue:584	2025-01-12 11:15:00
sr:sport_event:50868187	sr:season:119799	sr:competitor:2979	sr:competitor:2990	3	0	closed	13	sr:venue:3293	2024-11-23 15:30:00
sr:sport_event:50868411	sr:season:119799	sr:competitor:2962	sr:competitor:2979	\N	\N	not_started	25	sr:venue:689	2025-03-07 17:00:00
sr:sport_event:50868381	sr:season:119799	sr:competitor:2952	sr:competitor:2948	\N	\N	not_started	23	sr:venue:726	2025-02-14 17:00:00
sr:sport_event:50868053	sr:season:119799	sr:competitor:2953	sr:competitor:2948	\N	\N	postponed	5	sr:venue:577	2024-09-15 12:30:00
sr:sport_event:50868355	sr:season:119799	sr:competitor:2959	sr:competitor:2960	\N	\N	not_started	22	sr:venue:612	2025-02-07 17:00:00
sr:sport_event:50868417	sr:season:119799	sr:competitor:2952	sr:competitor:2964	\N	\N	not_started	25	sr:venue:726	2025-03-07 17:00:00
sr:sport_event:50868059	sr:season:119799	sr:competitor:2971	sr:competitor:2950	1	2	closed	6	sr:venue:18994	2024-09-20 18:00:00
sr:sport_event:50868339	sr:season:119799	sr:competitor:2971	sr:competitor:2948	\N	\N	not_started	21	sr:venue:18994	2025-02-01 17:45:00
sr:sport_event:50868405	sr:season:119799	sr:competitor:2955	sr:competitor:2990	\N	\N	not_started	25	sr:venue:584	2025-03-07 17:00:00
sr:sport_event:50868387	sr:season:119799	sr:competitor:2951	sr:competitor:2955	\N	\N	not_started	24	sr:venue:35438	2025-02-28 17:00:00
sr:sport_event:50868263	sr:season:119799	sr:competitor:2979	sr:competitor:2947	\N	\N	not_started	17	sr:venue:3293	2024-12-21 15:30:00
sr:sport_event:50868401	sr:season:119799	sr:competitor:2964	sr:competitor:2950	\N	\N	not_started	24	sr:venue:569	2025-02-28 17:00:00
sr:sport_event:50868067	sr:season:119799	sr:competitor:2962	sr:competitor:2977	1	2	closed	6	sr:venue:689	2024-09-21 19:00:00
sr:sport_event:50868131	sr:season:119799	sr:competitor:2990	sr:competitor:2962	1	0	closed	10	sr:venue:3261	2024-10-25 18:00:00
sr:sport_event:50868399	sr:season:119799	sr:competitor:2960	sr:competitor:2961	\N	\N	not_started	24	sr:venue:656	2025-02-28 17:00:00
sr:sport_event:50868129	sr:season:119799	sr:competitor:2971	sr:competitor:2947	1	2	closed	9	sr:venue:18994	2024-10-20 14:45:00
sr:sport_event:50868305	sr:season:119799	sr:competitor:2964	sr:competitor:2953	\N	\N	not_started	19	sr:venue:569	2025-01-19 13:30:00
sr:sport_event:50852821	sr:season:118691	sr:competitor:2825	sr:competitor:2817	\N	\N	not_started	38	sr:venue:751	2025-05-25 17:00:00
sr:sport_event:50852753	sr:season:118691	sr:competitor:2829	sr:competitor:2821	\N	\N	not_started	34	sr:venue:754	2025-05-04 17:00:00
sr:sport_event:50852783	sr:season:118691	sr:competitor:2814	sr:competitor:2817	\N	\N	not_started	36	sr:venue:1307	2025-05-14 17:00:00
sr:sport_event:50868119	sr:season:119799	sr:competitor:2956	sr:competitor:2955	2	2	closed	9	sr:venue:685	2024-10-19 18:00:00
sr:sport_event:50868035	sr:season:119799	sr:competitor:2959	sr:competitor:2953	\N	\N	postponed	4	sr:venue:612	2024-09-01 12:30:00
sr:sport_event:50868335	sr:season:119799	sr:competitor:2962	sr:competitor:2952	\N	\N	not_started	21	sr:venue:689	2025-02-01 20:00:00
sr:sport_event:50868331	sr:season:119799	sr:competitor:2990	sr:competitor:2956	\N	\N	not_started	21	sr:venue:3261	2025-02-02 11:15:00
sr:sport_event:50868257	sr:season:119799	sr:competitor:2990	sr:competitor:2964	\N	\N	not_started	17	sr:venue:3261	2024-12-21 17:45:00
sr:sport_event:50868423	sr:season:119799	sr:competitor:2990	sr:competitor:2947	\N	\N	not_started	26	sr:venue:3261	2025-03-14 17:00:00
sr:sport_event:50850653	sr:season:118689	sr:competitor:3	sr:competitor:31	\N	\N	not_started	34	sr:venue:1272	2025-04-26 14:00:00
sr:sport_event:50850151	sr:season:118689	sr:competitor:32	sr:competitor:31	1	1	closed	10	sr:venue:2188	2024-11-02 15:00:00
sr:sport_event:46657137	sr:season:114317	sr:competitor:3210	sr:competitor:3218	1	2	closed	21	sr:venue:2388	2024-11-07 21:45:00
sr:sport_event:50850691	sr:season:118689	sr:competitor:33	sr:competitor:7	\N	\N	not_started	36	sr:venue:28762	2025-05-10 14:00:00
sr:sport_event:50850617	sr:season:118689	sr:competitor:50	sr:competitor:30	\N	\N	not_started	33	sr:venue:53349	2025-04-19 14:00:00
sr:sport_event:50850223	sr:season:118689	sr:competitor:37	sr:competitor:42	\N	\N	not_started	13	sr:venue:18379	2024-11-30 17:30:00
sr:sport_event:46657139	sr:season:114317	sr:competitor:36837	sr:competitor:191648	0	0	closed	21	sr:venue:12712	2024-11-08 00:00:00
sr:sport_event:50850385	sr:season:118689	sr:competitor:35	sr:competitor:45	\N	\N	not_started	21	sr:venue:9	2025-01-16 20:00:00
sr:sport_event:50850629	sr:season:118689	sr:competitor:35	sr:competitor:3	\N	\N	not_started	33	sr:venue:9	2025-04-19 14:00:00
sr:sport_event:50852269	sr:season:118691	sr:competitor:2826	sr:competitor:2818	1	0	closed	10	sr:venue:760	2024-10-20 12:00:00
sr:sport_event:50850245	sr:season:118689	sr:competitor:45	sr:competitor:38	\N	\N	not_started	14	sr:venue:2231	2024-12-04 19:30:00
sr:sport_event:50850455	sr:season:118689	sr:competitor:31	sr:competitor:42	\N	\N	not_started	25	sr:venue:2183	2025-02-15 15:00:00
sr:sport_event:50850715	sr:season:118689	sr:competitor:60	sr:competitor:31	\N	\N	not_started	38	sr:venue:2990	2025-05-25 15:00:00
sr:sport_event:50850313	sr:season:118689	sr:competitor:38	sr:competitor:43	\N	\N	not_started	18	sr:venue:799	2024-12-26 15:00:00
sr:sport_event:50850247	sr:season:118689	sr:competitor:40	sr:competitor:45	\N	\N	not_started	15	sr:venue:815	2024-12-07 15:00:00
sr:sport_event:50850495	sr:season:118689	sr:competitor:50	sr:competitor:48	\N	\N	not_started	27	sr:venue:53349	2025-02-25 19:45:00
sr:sport_event:50850561	sr:season:118689	sr:competitor:14	sr:competitor:35	\N	\N	not_started	30	sr:venue:2230	2025-04-01 14:00:00
sr:sport_event:46656999	sr:season:114317	sr:competitor:3211	sr:competitor:3210	0	1	closed	16	sr:venue:1009	2024-09-29 21:15:00
sr:sport_event:50850529	sr:season:118689	sr:competitor:33	sr:competitor:60	\N	\N	not_started	28	sr:venue:28762	2025-03-08 15:00:00
sr:sport_event:50852165	sr:season:118691	sr:competitor:2821	sr:competitor:2831	3	1	closed	5	sr:venue:697	2024-09-15 12:00:00
sr:sport_event:50852139	sr:season:118691	sr:competitor:2836	sr:competitor:2814	0	0	closed	3	sr:venue:21414	2024-08-28 19:30:00
sr:sport_event:50852303	sr:season:118691	sr:competitor:2836	sr:competitor:6577	2	0	closed	12	sr:venue:21414	2024-11-03 13:00:00
sr:sport_event:50852617	sr:season:118691	sr:competitor:2859	sr:competitor:2836	\N	\N	not_started	27	sr:venue:608	2025-03-09 18:00:00
sr:sport_event:50852371	sr:season:118691	sr:competitor:2831	sr:competitor:2836	\N	\N	not_started	15	sr:venue:880	2024-11-30 20:00:00
sr:sport_event:50852379	sr:season:118691	sr:competitor:2833	sr:competitor:2820	\N	\N	not_started	15	sr:venue:730	2024-12-02 20:00:00
sr:sport_event:50850047	sr:season:118689	sr:competitor:40	sr:competitor:3	3	1	closed	5	sr:venue:815	2024-09-21 14:00:00
sr:sport_event:50868445	sr:season:119799	sr:competitor:2977	sr:competitor:2955	\N	\N	not_started	27	sr:venue:729	2025-03-29 17:00:00
sr:sport_event:50852721	sr:season:118691	sr:competitor:2825	sr:competitor:6577	\N	\N	not_started	33	sr:venue:751	2025-04-23 17:00:00
sr:sport_event:46657255	sr:season:114317	sr:competitor:4937	sr:competitor:191648	\N	\N	not_started	25	sr:venue:12033	2024-12-01 00:45:00
sr:sport_event:50852581	sr:season:118691	sr:competitor:2817	sr:competitor:2824	\N	\N	not_started	26	sr:venue:714	2025-03-02 18:00:00
sr:sport_event:50852541	sr:season:118691	sr:competitor:2836	sr:competitor:2821	\N	\N	not_started	24	sr:venue:21414	2025-02-16 19:00:00
sr:sport_event:50852441	sr:season:118691	sr:competitor:2825	sr:competitor:2829	\N	\N	not_started	19	sr:venue:751	2024-12-04 20:00:00
sr:sport_event:50852523	sr:season:118691	sr:competitor:2826	sr:competitor:2820	\N	\N	not_started	23	sr:venue:760	2025-02-09 19:00:00
sr:sport_event:50852631	sr:season:118691	sr:competitor:2831	sr:competitor:2821	\N	\N	not_started	28	sr:venue:880	2025-03-16 18:00:00
sr:sport_event:50850351	sr:season:118689	sr:competitor:30	sr:competitor:42	\N	\N	not_started	20	sr:venue:2443	2025-01-04 17:30:00
sr:sport_event:50850421	sr:season:118689	sr:competitor:45	sr:competitor:39	\N	\N	not_started	23	sr:venue:2231	2025-01-25 15:00:00
sr:sport_event:46657231	sr:season:114317	sr:competitor:3204	sr:competitor:3210	2	3	closed	24	sr:venue:4754	2024-11-27 00:15:00
sr:sport_event:46657159	sr:season:114317	sr:competitor:3215	sr:competitor:36842	2	1	closed	22	sr:venue:12033	2024-11-10 22:30:00
sr:sport_event:46657299	sr:season:114317	sr:competitor:3202	sr:competitor:3209	\N	\N	not_started	27	sr:venue:44628	2024-12-15 23:00:00
sr:sport_event:46657309	sr:season:114317	sr:competitor:3219	sr:competitor:42338	\N	\N	not_started	27	sr:venue:634	2024-12-15 23:00:00
sr:sport_event:50852221	sr:season:118691	sr:competitor:2825	sr:competitor:2833	1	1	closed	8	sr:venue:751	2024-09-29 14:15:00
sr:sport_event:50852297	sr:season:118691	sr:competitor:2831	sr:competitor:2819	1	2	closed	11	sr:venue:880	2024-10-26 12:00:00
sr:sport_event:50852463	sr:season:118691	sr:competitor:2820	sr:competitor:2818	\N	\N	not_started	20	sr:venue:739	2025-01-19 19:00:00
sr:sport_event:50852713	sr:season:118691	sr:competitor:2831	sr:competitor:2820	\N	\N	not_started	32	sr:venue:880	2025-04-20 17:00:00
sr:sport_event:50852097	sr:season:118691	sr:competitor:2820	sr:competitor:2845	1	1	closed	1	sr:venue:739	2024-08-17 17:00:00
sr:sport_event:50852195	sr:season:118691	sr:competitor:2831	sr:competitor:2824	0	0	closed	6	sr:venue:880	2024-09-21 12:00:00
sr:sport_event:50852397	sr:season:118691	sr:competitor:2820	sr:competitor:2885	\N	\N	not_started	16	sr:venue:739	2024-12-08 17:30:00
sr:sport_event:51269005	sr:season:118693	sr:competitor:2673	sr:competitor:2542	4	2	closed	5	sr:venue:759	2024-09-27 18:30:00
sr:sport_event:51269125	sr:season:118693	sr:competitor:2556	sr:competitor:2527	1	1	closed	8	sr:venue:2406	2024-10-25 18:30:00
sr:sport_event:51269333	sr:season:118693	sr:competitor:2573	sr:competitor:2569	\N	\N	not_started	18	sr:venue:659	2025-01-18 14:30:00
sr:sport_event:51269057	sr:season:118693	sr:competitor:2547	sr:competitor:2673	2	1	closed	6	sr:venue:578	2024-10-05 13:30:00
sr:sport_event:51268949	sr:season:118693	sr:competitor:2556	sr:competitor:2534	1	2	closed	3	sr:venue:2406	2024-09-15 15:30:00
sr:sport_event:51269289	sr:season:118693	sr:competitor:2538	sr:competitor:2573	\N	\N	not_started	16	sr:venue:61056	2025-01-11 14:30:00
sr:sport_event:51268853	sr:season:118693	sr:competitor:36360	sr:competitor:2542	1	0	closed	1	sr:venue:850	2024-08-24 13:30:00
sr:sport_event:50955927	sr:season:119835	sr:competitor:1662	sr:competitor:1641	\N	\N	not_started	33	sr:venue:46514	2025-05-11 17:00:00
sr:sport_event:50955797	sr:season:119835	sr:competitor:1661	sr:competitor:1646	\N	\N	not_started	26	sr:venue:13184	2025-03-16 17:00:00
sr:sport_event:50955889	sr:season:119835	sr:competitor:1647	sr:competitor:1681	\N	\N	not_started	31	sr:venue:953	2025-04-27 17:00:00
sr:sport_event:50955523	sr:season:119835	sr:competitor:1649	sr:competitor:1678	1	0	closed	11	sr:venue:17406	2024-11-10 19:45:00
sr:sport_event:50852769	sr:season:118691	sr:competitor:24264	sr:competitor:2819	\N	\N	not_started	35	sr:venue:11380	2025-05-11 17:00:00
sr:sport_event:50955611	sr:season:119835	sr:competitor:1653	sr:competitor:1644	\N	\N	not_started	16	sr:venue:831	2024-12-18 20:00:00
sr:sport_event:50955675	sr:season:119835	sr:competitor:1681	sr:competitor:1642	\N	\N	not_started	19	sr:venue:848	2025-01-26 16:00:00
sr:sport_event:50868537	sr:season:119799	sr:competitor:2959	sr:competitor:2952	\N	\N	not_started	32	sr:venue:612	2025-05-09 16:00:00
sr:sport_event:50955395	sr:season:119835	sr:competitor:1646	sr:competitor:1653	0	3	closed	4	sr:venue:767	2024-09-14 17:00:00
sr:sport_event:51268909	sr:season:118693	sr:competitor:2534	sr:competitor:2673	0	0	closed	2	sr:venue:821	2024-08-31 13:30:00
sr:sport_event:50868455	sr:season:119799	sr:competitor:2961	sr:competitor:2990	\N	\N	not_started	27	sr:venue:826	2025-03-29 17:00:00
sr:sport_event:50868579	sr:season:119799	sr:competitor:2964	sr:competitor:2959	\N	\N	not_started	34	sr:venue:569	2025-05-18 12:30:00
sr:sport_event:51269173	sr:season:118693	sr:competitor:2677	sr:competitor:2674	2	3	closed	10	sr:venue:648	2024-11-10 16:30:00
sr:sport_event:50868433	sr:season:119799	sr:competitor:2956	sr:competitor:2952	\N	\N	not_started	26	sr:venue:685	2025-03-14 17:00:00
sr:sport_event:50868483	sr:season:119799	sr:competitor:2947	sr:competitor:2979	\N	\N	not_started	29	sr:venue:2081	2025-04-11 16:00:00
sr:sport_event:50955485	sr:season:119835	sr:competitor:1661	sr:competitor:1653	2	1	closed	9	sr:venue:13184	2024-10-27 16:00:00
sr:sport_event:50955405	sr:season:119835	sr:competitor:1659	sr:competitor:1684	1	1	closed	4	sr:venue:847	2024-09-15 15:00:00
sr:sport_event:51269197	sr:season:118693	sr:competitor:2673	sr:competitor:2538	4	0	closed	11	sr:venue:759	2024-11-23 14:30:00
sr:sport_event:51269511	sr:season:118693	sr:competitor:2542	sr:competitor:2677	\N	\N	not_started	28	sr:venue:738	2025-04-05 13:30:00
sr:sport_event:50955503	sr:season:119835	sr:competitor:1646	sr:competitor:1658	4	0	closed	10	sr:venue:767	2024-11-03 16:00:00
sr:sport_event:50955709	sr:season:119835	sr:competitor:1659	sr:competitor:1642	\N	\N	not_started	21	sr:venue:847	2025-02-09 16:00:00
sr:sport_event:51269381	sr:season:118693	sr:competitor:2524	sr:competitor:2681	\N	\N	not_started	21	sr:venue:816	2025-02-08 14:30:00
sr:sport_event:51269337	sr:season:118693	sr:competitor:2673	sr:competitor:2534	\N	\N	not_started	19	sr:venue:759	2025-01-25 14:30:00
sr:sport_event:51269437	sr:season:118693	sr:competitor:2547	sr:competitor:2573	\N	\N	not_started	24	sr:venue:578	2025-03-01 14:30:00
sr:sport_event:50955661	sr:season:119835	sr:competitor:1684	sr:competitor:1646	\N	\N	not_started	18	sr:venue:19889	2025-01-19 16:00:00
sr:sport_event:51269559	sr:season:118693	sr:competitor:2569	sr:competitor:2673	\N	\N	not_started	31	sr:venue:1089	2025-04-26 13:30:00
sr:sport_event:50955583	sr:season:119835	sr:competitor:1643	sr:competitor:1715	\N	\N	not_started	14	sr:venue:837	2024-12-06 18:00:00
sr:sport_event:51269447	sr:season:118693	sr:competitor:2673	sr:competitor:2600	\N	\N	not_started	25	sr:venue:759	2025-03-08 14:30:00
sr:sport_event:50868357	sr:season:119799	sr:competitor:2957	sr:competitor:2953	\N	\N	not_started	22	sr:venue:2769	2025-02-07 17:00:00
sr:sport_event:50955739	sr:season:119835	sr:competitor:1653	sr:competitor:1647	\N	\N	not_started	22	sr:venue:831	2025-02-16 16:00:00
sr:sport_event:51269427	sr:season:118693	sr:competitor:36360	sr:competitor:2556	\N	\N	not_started	24	sr:venue:850	2025-03-01 14:30:00
sr:sport_event:51269569	sr:season:118693	sr:competitor:36360	sr:competitor:2672	\N	\N	not_started	32	sr:venue:850	2025-05-03 13:30:00
sr:sport_event:50868535	sr:season:119799	sr:competitor:2955	sr:competitor:2948	\N	\N	not_started	32	sr:venue:584	2025-05-09 16:00:00
sr:sport_event:50868497	sr:season:119799	sr:competitor:2950	sr:competitor:2947	\N	\N	not_started	30	sr:venue:615	2025-04-23 16:00:00
sr:sport_event:51269113	sr:season:118693	sr:competitor:5885	sr:competitor:2569	0	0	closed	8	sr:venue:34054	2024-10-27 18:30:00
sr:sport_event:50868541	sr:season:119799	sr:competitor:2971	sr:competitor:2979	\N	\N	not_started	32	sr:venue:18994	2025-05-09 16:00:00
sr:sport_event:51269101	sr:season:118693	sr:competitor:2573	sr:competitor:2547	0	2	closed	7	sr:venue:659	2024-10-20 13:30:00
sr:sport_event:50955831	sr:season:119835	sr:competitor:1641	sr:competitor:1681	\N	\N	not_started	28	sr:venue:839	2025-04-06 17:00:00
sr:sport_event:51269207	sr:season:118693	sr:competitor:2573	sr:competitor:2556	0	3	closed	11	sr:venue:659	2024-11-24 14:30:00
sr:sport_event:51268897	sr:season:118693	sr:competitor:2672	sr:competitor:2538	2	0	closed	2	sr:venue:574	2024-09-01 15:30:00
sr:sport_event:51269095	sr:season:118693	sr:competitor:2556	sr:competitor:36360	0	2	closed	7	sr:venue:2406	2024-10-19 13:30:00
sr:sport_event:51269201	sr:season:118693	sr:competitor:2569	sr:competitor:36360	4	3	closed	11	sr:venue:1089	2024-11-23 14:30:00
sr:sport_event:51269361	sr:season:118693	sr:competitor:5885	sr:competitor:2673	\N	\N	not_started	20	sr:venue:34054	2025-02-01 14:30:00
sr:sport_event:51269275	sr:season:118693	sr:competitor:2524	sr:competitor:2673	\N	\N	not_started	15	sr:venue:816	2024-12-22 16:30:00
sr:sport_event:51269209	sr:season:118693	sr:competitor:36360	sr:competitor:2524	\N	\N	not_started	12	sr:venue:850	2024-11-30 14:30:00
sr:sport_event:51269485	sr:season:118693	sr:competitor:2674	sr:competitor:2677	\N	\N	not_started	27	sr:venue:67707	2025-03-29 14:30:00
sr:sport_event:50955603	sr:season:119835	sr:competitor:1642	sr:competitor:1661	\N	\N	not_started	15	sr:venue:1275	2024-12-15 14:00:00
sr:sport_event:50868555	sr:season:119799	sr:competitor:2959	sr:competitor:2956	\N	\N	not_started	33	sr:venue:612	2025-05-14 18:00:00
sr:sport_event:50955835	sr:season:119835	sr:competitor:1715	sr:competitor:1653	\N	\N	not_started	28	sr:venue:1858	2025-04-06 17:00:00
sr:sport_event:50955539	sr:season:119835	sr:competitor:1644	sr:competitor:1681	3	0	closed	12	sr:venue:843	2024-11-22 20:00:00
sr:sport_event:50955545	sr:season:119835	sr:competitor:1678	sr:competitor:1642	1	0	closed	12	sr:venue:845	2024-11-23 18:00:00
sr:sport_event:50955743	sr:season:119835	sr:competitor:1662	sr:competitor:1681	\N	\N	not_started	23	sr:venue:46514	2025-02-23 16:00:00
sr:sport_event:50868441	sr:season:119799	sr:competitor:2959	sr:competitor:2979	\N	\N	not_started	27	sr:venue:612	2025-03-29 17:00:00
sr:sport_event:50955715	sr:season:119835	sr:competitor:1644	sr:competitor:1653	\N	\N	not_started	21	sr:venue:843	2025-02-09 16:00:00
sr:sport_event:51269639	sr:season:118693	sr:competitor:2527	sr:competitor:2681	2	3	closed	1	sr:venue:788	2024-08-23 18:30:00
sr:sport_event:50868471	sr:season:119799	sr:competitor:2964	sr:competitor:2961	\N	\N	not_started	28	sr:venue:569	2025-04-04 16:00:00
sr:sport_event:50955905	sr:season:119835	sr:competitor:1643	sr:competitor:1641	\N	\N	not_started	32	sr:venue:837	2025-05-04 17:00:00
sr:sport_event:50955377	sr:season:119835	sr:competitor:1643	sr:competitor:1644	1	3	closed	3	sr:venue:837	2024-09-01 18:45:00
sr:sport_event:50955443	sr:season:119835	sr:competitor:1681	sr:competitor:1649	1	2	closed	6	sr:venue:848	2024-09-29 13:00:00
sr:sport_event:50955859	sr:season:119835	sr:competitor:1678	sr:competitor:1715	\N	\N	not_started	29	sr:venue:845	2025-04-13 17:00:00
sr:sport_event:50955651	sr:season:119835	sr:competitor:1643	sr:competitor:1661	\N	\N	not_started	18	sr:venue:837	2025-01-19 16:00:00
sr:sport_event:50955633	sr:season:119835	sr:competitor:1646	sr:competitor:1643	\N	\N	not_started	17	sr:venue:767	2025-01-12 16:00:00
sr:sport_event:50955747	sr:season:119835	sr:competitor:1659	sr:competitor:1715	\N	\N	not_started	23	sr:venue:847	2025-02-23 16:00:00
sr:sport_event:51269391	sr:season:118693	sr:competitor:2677	sr:competitor:2524	\N	\N	not_started	22	sr:venue:648	2025-02-15 14:30:00
sr:sport_event:51269545	sr:season:118693	sr:competitor:2556	sr:competitor:2524	\N	\N	not_started	30	sr:venue:2406	2025-04-19 13:30:00
sr:sport_event:51269319	sr:season:118693	sr:competitor:2677	sr:competitor:2538	\N	\N	not_started	18	sr:venue:648	2025-01-18 14:30:00
sr:sport_event:51269455	sr:season:118693	sr:competitor:2524	sr:competitor:2526	\N	\N	not_started	25	sr:venue:816	2025-03-08 14:30:00
sr:sport_event:51269377	sr:season:118693	sr:competitor:2569	sr:competitor:2547	\N	\N	not_started	21	sr:venue:1089	2025-02-08 14:30:00
sr:sport_event:51269297	sr:season:118693	sr:competitor:2526	sr:competitor:2674	\N	\N	not_started	16	sr:venue:791	2025-01-11 14:30:00
sr:sport_event:51269457	sr:season:118693	sr:competitor:2527	sr:competitor:2556	\N	\N	not_started	25	sr:venue:788	2025-03-08 14:30:00
sr:sport_event:50868435	sr:season:119799	sr:competitor:2964	sr:competitor:2977	\N	\N	not_started	26	sr:venue:569	2025-03-14 17:00:00
sr:sport_event:51269371	sr:season:118693	sr:competitor:2672	sr:competitor:2534	\N	\N	not_started	21	sr:venue:574	2025-02-08 14:30:00
sr:sport_event:51268979	sr:season:118693	sr:competitor:2600	sr:competitor:2556	2	3	closed	4	sr:venue:1655	2024-09-20 18:30:00
sr:sport_event:50955923	sr:season:119835	sr:competitor:1646	sr:competitor:1647	\N	\N	not_started	33	sr:venue:767	2025-05-11 17:00:00
sr:sport_event:51269611	sr:season:118693	sr:competitor:5885	sr:competitor:2534	\N	\N	not_started	34	sr:venue:34054	2025-05-17 13:30:00
sr:sport_event:50868499	sr:season:119799	sr:competitor:2951	sr:competitor:2977	\N	\N	not_started	30	sr:venue:35438	2025-04-23 16:00:00
sr:sport_event:51269535	sr:season:118693	sr:competitor:2673	sr:competitor:2527	\N	\N	not_started	30	sr:venue:759	2025-04-19 13:30:00
sr:sport_event:51269463	sr:season:118693	sr:competitor:36360	sr:competitor:2673	\N	\N	not_started	26	sr:venue:850	2025-03-15 14:30:00
sr:sport_event:51269543	sr:season:118693	sr:competitor:2600	sr:competitor:2674	\N	\N	not_started	30	sr:venue:1655	2025-04-19 13:30:00
sr:sport_event:51269563	sr:season:118693	sr:competitor:2524	sr:competitor:2538	\N	\N	not_started	31	sr:venue:816	2025-04-26 13:30:00
sr:sport_event:51269475	sr:season:118693	sr:competitor:2542	sr:competitor:2674	\N	\N	not_started	26	sr:venue:738	2025-03-15 14:30:00
sr:sport_event:51269473	sr:season:118693	sr:competitor:2547	sr:competitor:2672	\N	\N	not_started	26	sr:venue:578	2025-03-15 14:30:00
sr:sport_event:50955865	sr:season:119835	sr:competitor:1653	sr:competitor:1641	\N	\N	not_started	29	sr:venue:831	2025-04-13 17:00:00
sr:sport_event:50955617	sr:season:119835	sr:competitor:1678	sr:competitor:1682	\N	\N	not_started	16	sr:venue:845	2025-01-05 16:00:00
sr:sport_event:51268983	sr:season:118693	sr:competitor:2547	sr:competitor:2569	2	1	closed	4	sr:venue:578	2024-09-21 13:30:00
sr:sport_event:51269233	sr:season:118693	sr:competitor:2674	sr:competitor:2600	\N	\N	not_started	13	sr:venue:67707	2024-12-07 14:30:00
sr:sport_event:51268941	sr:season:118693	sr:competitor:2600	sr:competitor:2526	3	1	closed	3	sr:venue:1655	2024-09-15 13:30:00
sr:sport_event:51269353	sr:season:118693	sr:competitor:2681	sr:competitor:2569	\N	\N	not_started	20	sr:venue:593	2025-02-01 14:30:00
sr:sport_event:51269459	sr:season:118693	sr:competitor:2573	sr:competitor:2677	\N	\N	not_started	25	sr:venue:659	2025-03-08 14:30:00
sr:sport_event:51269145	sr:season:118693	sr:competitor:2672	sr:competitor:2547	3	0	closed	9	sr:venue:574	2024-11-02 14:30:00
sr:sport_event:51269489	sr:season:118693	sr:competitor:2538	sr:competitor:2547	\N	\N	not_started	27	sr:venue:61056	2025-03-29 14:30:00
sr:sport_event:51269137	sr:season:118693	sr:competitor:2526	sr:competitor:2524	0	0	closed	8	sr:venue:791	2024-10-26 13:30:00
sr:sport_event:50955597	sr:season:119835	sr:competitor:1682	sr:competitor:1653	\N	\N	not_started	15	sr:venue:1871	2024-12-14 20:00:00
sr:sport_event:50955469	sr:season:119835	sr:competitor:1681	sr:competitor:1684	1	1	closed	8	sr:venue:848	2024-10-20 15:00:00
sr:sport_event:50868507	sr:season:119799	sr:competitor:2956	sr:competitor:2948	\N	\N	not_started	30	sr:venue:685	2025-04-23 16:00:00
sr:sport_event:50868551	sr:season:119799	sr:competitor:2955	sr:competitor:2950	\N	\N	not_started	33	sr:venue:584	2025-05-14 18:00:00
sr:sport_event:50955949	sr:season:119835	sr:competitor:1678	sr:competitor:1681	\N	\N	not_started	34	sr:venue:845	2025-05-18 17:00:00
sr:sport_event:50955383	sr:season:119835	sr:competitor:1642	sr:competitor:1647	1	3	closed	3	sr:venue:1275	2024-08-31 17:00:00
sr:sport_event:50955433	sr:season:119835	sr:competitor:1644	sr:competitor:1658	3	1	closed	6	sr:venue:843	2024-09-27 19:00:00
sr:sport_event:50955781	sr:season:119835	sr:competitor:1647	sr:competitor:1659	\N	\N	not_started	25	sr:venue:953	2025-03-09 17:00:00
sr:sport_event:50868581	sr:season:119799	sr:competitor:2960	sr:competitor:2952	\N	\N	not_started	34	sr:venue:656	2025-05-18 12:30:00
sr:sport_event:50955827	sr:season:119835	sr:competitor:1643	sr:competitor:1648	\N	\N	not_started	27	sr:venue:837	2025-03-30 17:00:00
sr:sport_event:50955631	sr:season:119835	sr:competitor:1647	sr:competitor:1653	\N	\N	not_started	17	sr:venue:953	2025-01-12 16:00:00
sr:sport_event:50955919	sr:season:119835	sr:competitor:1646	sr:competitor:1662	\N	\N	not_started	32	sr:venue:767	2025-05-04 17:00:00
sr:sport_event:50955801	sr:season:119835	sr:competitor:1715	sr:competitor:1682	\N	\N	not_started	26	sr:venue:1858	2025-03-16 17:00:00
sr:sport_event:50955721	sr:season:119835	sr:competitor:1661	sr:competitor:1648	\N	\N	not_started	21	sr:venue:13184	2025-02-09 16:00:00
sr:sport_event:50955677	sr:season:119835	sr:competitor:1662	sr:competitor:1715	\N	\N	not_started	19	sr:venue:46514	2025-01-26 16:00:00
sr:sport_event:50955713	sr:season:119835	sr:competitor:1678	sr:competitor:1658	\N	\N	not_started	21	sr:venue:845	2025-02-09 16:00:00
sr:sport_event:50955551	sr:season:119835	sr:competitor:1653	sr:competitor:1715	3	2	closed	12	sr:venue:831	2024-11-22 18:00:00
sr:sport_event:51773663	sr:season:118693	sr:competitor:2524	sr:competitor:2672	2	3	closed	1	sr:venue:816	2024-08-25 13:30:00
sr:sport_event:50955537	sr:season:119835	sr:competitor:1684	sr:competitor:1644	2	4	closed	11	sr:venue:19889	2024-11-09 20:00:00
sr:sport_event:50955693	sr:season:119835	sr:competitor:1643	sr:competitor:1678	\N	\N	not_started	20	sr:venue:837	2025-02-02 16:00:00
sr:sport_event:50955751	sr:season:119835	sr:competitor:1678	sr:competitor:1684	\N	\N	not_started	23	sr:venue:845	2025-02-23 16:00:00
sr:sport_event:51268991	sr:season:118693	sr:competitor:2526	sr:competitor:36360	0	0	closed	4	sr:venue:791	2024-09-22 17:30:00
sr:sport_event:50955357	sr:season:119835	sr:competitor:1658	sr:competitor:1649	3	0	closed	1	sr:venue:844	2024-08-18 18:45:00
sr:sport_event:50955491	sr:season:119835	sr:competitor:1649	sr:competitor:1646	2	2	closed	9	sr:venue:17406	2024-10-27 14:00:00
sr:sport_event:51269565	sr:season:118693	sr:competitor:2542	sr:competitor:2547	\N	\N	not_started	31	sr:venue:738	2025-04-26 13:30:00
sr:sport_event:51269387	sr:season:118693	sr:competitor:2573	sr:competitor:2542	\N	\N	not_started	21	sr:venue:659	2025-02-08 14:30:00
sr:sport_event:51269583	sr:season:118693	sr:competitor:2547	sr:competitor:2534	\N	\N	not_started	32	sr:venue:578	2025-05-03 13:30:00
sr:sport_event:50955649	sr:season:119835	sr:competitor:1648	sr:competitor:1644	\N	\N	not_started	18	sr:venue:835	2025-01-19 16:00:00
sr:sport_event:51269609	sr:season:118693	sr:competitor:2569	sr:competitor:2672	\N	\N	not_started	34	sr:venue:1089	2025-05-17 13:30:00
sr:sport_event:51269247	sr:season:118693	sr:competitor:2673	sr:competitor:2569	\N	\N	not_started	14	sr:venue:759	2024-12-15 16:30:00
sr:sport_event:51269597	sr:season:118693	sr:competitor:2524	sr:competitor:2569	\N	\N	not_started	33	sr:venue:816	2025-05-10 13:30:00
sr:sport_event:50868465	sr:season:119799	sr:competitor:2955	sr:competitor:2957	\N	\N	not_started	28	sr:venue:584	2025-04-04 16:00:00
sr:sport_event:51269087	sr:season:118693	sr:competitor:2538	sr:competitor:2600	3	1	closed	7	sr:venue:61056	2024-10-19 13:30:00
sr:sport_event:51269281	sr:season:118693	sr:competitor:36360	sr:competitor:2534	\N	\N	not_started	16	sr:venue:850	2025-01-12 14:30:00
sr:sport_event:51269615	sr:season:118693	sr:competitor:2600	sr:competitor:2547	\N	\N	not_started	34	sr:venue:1655	2025-05-17 13:30:00
sr:sport_event:50868485	sr:season:119799	sr:competitor:2971	sr:competitor:2955	\N	\N	not_started	29	sr:venue:18994	2025-04-11 16:00:00
sr:sport_event:51269295	sr:season:118693	sr:competitor:2527	sr:competitor:2672	\N	\N	not_started	16	sr:venue:788	2025-01-11 17:30:00
sr:sport_event:50955727	sr:season:119835	sr:competitor:1642	sr:competitor:1649	\N	\N	not_started	22	sr:venue:1275	2025-02-16 16:00:00
sr:sport_event:50955441	sr:season:119835	sr:competitor:1662	sr:competitor:1643	0	3	closed	6	sr:venue:46514	2024-09-28 17:00:00
sr:sport_event:50955663	sr:season:119835	sr:competitor:1658	sr:competitor:1715	\N	\N	not_started	18	sr:venue:844	2025-01-19 16:00:00
sr:sport_event:50955573	sr:season:119835	sr:competitor:1649	sr:competitor:1661	\N	\N	not_started	13	sr:venue:17406	2024-12-01 16:00:00
sr:sport_event:51269083	sr:season:118693	sr:competitor:2569	sr:competitor:2542	3	1	closed	7	sr:venue:1089	2024-10-19 13:30:00
sr:sport_event:51269325	sr:season:118693	sr:competitor:5885	sr:competitor:2526	\N	\N	not_started	18	sr:venue:34054	2025-01-18 14:30:00
sr:sport_event:51269133	sr:season:118693	sr:competitor:2542	sr:competitor:2672	0	5	closed	8	sr:venue:738	2024-10-27 14:30:00
sr:sport_event:51269287	sr:season:118693	sr:competitor:5885	sr:competitor:2547	\N	\N	not_started	16	sr:venue:34054	2025-01-11 14:30:00
sr:sport_event:51269481	sr:season:118693	sr:competitor:2672	sr:competitor:2526	\N	\N	not_started	27	sr:venue:574	2025-03-29 14:30:00
sr:sport_event:51269425	sr:season:118693	sr:competitor:2677	sr:competitor:2672	\N	\N	not_started	24	sr:venue:648	2025-03-01 14:30:00
sr:sport_event:50955885	sr:season:119835	sr:competitor:1662	sr:competitor:1653	\N	\N	not_started	31	sr:venue:46514	2025-04-27 17:00:00
sr:sport_event:50868457	sr:season:119799	sr:competitor:2953	sr:competitor:2947	\N	\N	not_started	28	sr:venue:577	2025-04-04 16:00:00
sr:sport_event:50955845	sr:season:119835	sr:competitor:1682	sr:competitor:1659	\N	\N	not_started	28	sr:venue:1871	2025-04-06 17:00:00
sr:sport_event:50955679	sr:season:119835	sr:competitor:1646	sr:competitor:1678	\N	\N	not_started	19	sr:venue:767	2025-01-26 16:00:00
sr:sport_event:50955757	sr:season:119835	sr:competitor:1649	sr:competitor:1644	\N	\N	not_started	23	sr:venue:17406	2025-02-23 16:00:00
sr:sport_event:50868515	sr:season:119799	sr:competitor:2979	sr:competitor:2950	\N	\N	not_started	31	sr:venue:3293	2025-05-02 16:00:00
sr:sport_event:50955671	sr:season:119835	sr:competitor:1647	sr:competitor:1649	\N	\N	not_started	19	sr:venue:953	2025-01-26 16:00:00
sr:sport_event:50955935	sr:season:119835	sr:competitor:1642	sr:competitor:1644	\N	\N	not_started	33	sr:venue:1275	2025-05-11 17:00:00
sr:sport_event:50955867	sr:season:119835	sr:competitor:1678	sr:competitor:1649	\N	\N	not_started	30	sr:venue:845	2025-04-20 17:00:00
sr:sport_event:50955445	sr:season:119835	sr:competitor:1653	sr:competitor:1642	2	1	closed	6	sr:venue:831	2024-09-28 19:00:00
sr:sport_event:50955605	sr:season:119835	sr:competitor:1715	sr:competitor:1647	\N	\N	not_started	15	sr:venue:1858	2024-12-15 16:00:00
sr:sport_event:51268945	sr:season:118693	sr:competitor:2524	sr:competitor:2674	1	2	closed	3	sr:venue:816	2024-09-14 13:30:00
sr:sport_event:51268999	sr:season:118693	sr:competitor:36360	sr:competitor:2600	4	0	closed	5	sr:venue:850	2024-09-28 13:30:00
sr:sport_event:50868447	sr:season:119799	sr:competitor:2962	sr:competitor:2950	\N	\N	not_started	27	sr:venue:689	2025-03-29 17:00:00
sr:sport_event:50868477	sr:season:119799	sr:competitor:2957	sr:competitor:2959	\N	\N	not_started	29	sr:venue:2769	2025-04-11 16:00:00
sr:sport_event:50955789	sr:season:119835	sr:competitor:1643	sr:competitor:1642	\N	\N	not_started	25	sr:venue:837	2025-03-09 17:00:00
sr:sport_event:50868519	sr:season:119799	sr:competitor:2962	sr:competitor:2961	\N	\N	not_started	31	sr:venue:689	2025-05-02 16:00:00
sr:sport_event:50955415	sr:season:119835	sr:competitor:1661	sr:competitor:1678	8	0	closed	5	sr:venue:13184	2024-09-20 18:45:00
sr:sport_event:50868569	sr:season:119799	sr:competitor:2957	sr:competitor:2948	\N	\N	not_started	34	sr:venue:2769	2025-05-18 12:30:00
sr:sport_event:51269357	sr:season:118693	sr:competitor:2672	sr:competitor:2573	\N	\N	not_started	20	sr:venue:574	2025-02-01 14:30:00
sr:sport_event:50868487	sr:season:119799	sr:competitor:2952	sr:competitor:2990	\N	\N	not_started	29	sr:venue:726	2025-04-11 16:00:00
sr:sport_event:50955393	sr:season:119835	sr:competitor:1681	sr:competitor:1641	1	3	closed	3	sr:venue:848	2024-08-31 19:00:00
sr:sport_event:50955565	sr:season:119835	sr:competitor:1715	sr:competitor:1659	\N	\N	not_started	13	sr:venue:1858	2024-11-30 18:00:00
sr:sport_event:51269553	sr:season:118693	sr:competitor:2677	sr:competitor:5885	\N	\N	not_started	31	sr:venue:648	2025-04-26 13:30:00
sr:sport_event:51269621	sr:season:118693	sr:competitor:2526	sr:competitor:2542	\N	\N	not_started	34	sr:venue:791	2025-05-17 13:30:00
sr:sport_event:51269405	sr:season:118693	sr:competitor:2526	sr:competitor:2538	\N	\N	not_started	22	sr:venue:791	2025-02-15 14:30:00
sr:sport_event:50955561	sr:season:119835	sr:competitor:1662	sr:competitor:1684	\N	\N	not_started	13	sr:venue:46514	2024-12-01 16:00:00
sr:sport_event:51269375	sr:season:118693	sr:competitor:2673	sr:competitor:2677	\N	\N	not_started	21	sr:venue:759	2025-02-08 14:30:00
sr:sport_event:51269577	sr:season:118693	sr:competitor:2600	sr:competitor:2573	\N	\N	not_started	32	sr:venue:1655	2025-05-03 13:30:00
sr:sport_event:50868365	sr:season:119799	sr:competitor:2964	sr:competitor:2955	\N	\N	not_started	22	sr:venue:569	2025-02-07 17:00:00
sr:sport_event:50868443	sr:season:119799	sr:competitor:2957	sr:competitor:2960	\N	\N	not_started	27	sr:venue:2769	2025-03-29 17:00:00
sr:sport_event:50868549	sr:season:119799	sr:competitor:2951	sr:competitor:2953	\N	\N	not_started	33	sr:venue:35438	2025-05-14 18:00:00
sr:sport_event:51269243	sr:season:118693	sr:competitor:2573	sr:competitor:36360	\N	\N	not_started	13	sr:venue:659	2024-12-07 14:30:00
sr:sport_event:51269193	sr:season:118693	sr:competitor:2677	sr:competitor:2542	2	0	closed	11	sr:venue:648	2024-11-23 14:30:00
sr:sport_event:50955833	sr:season:119835	sr:competitor:1661	sr:competitor:1647	\N	\N	not_started	28	sr:venue:13184	2025-04-06 17:00:00
sr:sport_event:50955775	sr:season:119835	sr:competitor:1684	sr:competitor:1681	\N	\N	not_started	24	sr:venue:19889	2025-03-02 17:00:00
sr:sport_event:50955771	sr:season:119835	sr:competitor:1646	sr:competitor:1659	\N	\N	not_started	24	sr:venue:767	2025-03-02 17:00:00
sr:sport_event:50955877	sr:season:119835	sr:competitor:1641	sr:competitor:1642	\N	\N	not_started	30	sr:venue:839	2025-04-20 17:00:00
sr:sport_event:50955817	sr:season:119835	sr:competitor:1662	sr:competitor:1647	\N	\N	not_started	27	sr:venue:46514	2025-03-30 17:00:00
sr:sport_event:51269587	sr:season:118693	sr:competitor:2681	sr:competitor:2673	\N	\N	not_started	33	sr:venue:593	2025-05-10 13:30:00
sr:sport_event:51269097	sr:season:118693	sr:competitor:2527	sr:competitor:5885	3	2	closed	7	sr:venue:788	2024-10-19 13:30:00
sr:sport_event:51269267	sr:season:118693	sr:competitor:2672	sr:competitor:36360	\N	\N	not_started	15	sr:venue:574	2024-12-20 19:30:00
sr:sport_event:51269079	sr:season:118693	sr:competitor:2673	sr:competitor:2526	2	1	closed	7	sr:venue:759	2024-10-18 18:30:00
sr:sport_event:51269177	sr:season:118693	sr:competitor:5885	sr:competitor:2524	1	3	closed	10	sr:venue:34054	2024-11-10 18:30:00
sr:sport_event:51269117	sr:season:118693	sr:competitor:2534	sr:competitor:2681	2	2	closed	8	sr:venue:821	2024-10-26 16:30:00
sr:sport_event:51269219	sr:season:118693	sr:competitor:2600	sr:competitor:2542	\N	\N	not_started	12	sr:venue:1655	2024-11-30 14:30:00
sr:sport_event:50955409	sr:season:119835	sr:competitor:1641	sr:competitor:1661	2	0	closed	4	sr:venue:839	2024-09-14 15:00:00
sr:sport_event:51268871	sr:season:118693	sr:competitor:2600	sr:competitor:2534	2	2	closed	1	sr:venue:1655	2024-08-24 13:30:00
sr:sport_event:50868559	sr:season:119799	sr:competitor:2962	sr:competitor:2947	\N	\N	not_started	33	sr:venue:689	2025-05-14 18:00:00
sr:sport_event:50868533	sr:season:119799	sr:competitor:2950	sr:competitor:2951	\N	\N	not_started	32	sr:venue:615	2025-05-09 16:00:00
sr:sport_event:50868481	sr:season:119799	sr:competitor:2962	sr:competitor:2956	\N	\N	not_started	29	sr:venue:689	2025-04-11 16:00:00
sr:sport_event:50955423	sr:season:119835	sr:competitor:1642	sr:competitor:1646	3	2	closed	5	sr:venue:1275	2024-09-22 15:00:00
sr:sport_event:51269323	sr:season:118693	sr:competitor:2674	sr:competitor:2673	\N	\N	not_started	18	sr:venue:67707	2025-01-17 19:30:00
sr:sport_event:51269421	sr:season:118693	sr:competitor:2527	sr:competitor:2600	\N	\N	not_started	23	sr:venue:788	2025-02-22 14:30:00
sr:sport_event:51269449	sr:season:118693	sr:competitor:2674	sr:competitor:2547	\N	\N	not_started	25	sr:venue:67707	2025-03-08 14:30:00
sr:sport_event:51268895	sr:season:118693	sr:competitor:2677	sr:competitor:2556	3	3	closed	2	sr:venue:648	2024-08-31 13:30:00
sr:sport_event:51269593	sr:season:118693	sr:competitor:2674	sr:competitor:2526	\N	\N	not_started	33	sr:venue:67707	2025-05-10 13:30:00
sr:sport_event:50868495	sr:season:119799	sr:competitor:2990	sr:competitor:2979	\N	\N	not_started	30	sr:venue:3261	2025-04-23 16:00:00
sr:sport_event:51269547	sr:season:118693	sr:competitor:2547	sr:competitor:2677	\N	\N	not_started	30	sr:venue:578	2025-04-19 13:30:00
sr:sport_event:51269495	sr:season:118693	sr:competitor:2573	sr:competitor:2534	\N	\N	not_started	27	sr:venue:659	2025-03-29 14:30:00
sr:sport_event:51269519	sr:season:118693	sr:competitor:2672	sr:competitor:2673	\N	\N	not_started	29	sr:venue:574	2025-04-12 13:30:00
sr:sport_event:51269217	sr:season:118693	sr:competitor:2538	sr:competitor:2527	\N	\N	not_started	12	sr:venue:61056	2024-11-30 14:30:00
sr:sport_event:51269321	sr:season:118693	sr:competitor:2672	sr:competitor:2524	\N	\N	not_started	18	sr:venue:574	2025-01-18 14:30:00
sr:sport_event:51269355	sr:season:118693	sr:competitor:2677	sr:competitor:2527	\N	\N	not_started	20	sr:venue:648	2025-02-01 14:30:00
sr:sport_event:51269183	sr:season:118693	sr:competitor:2556	sr:competitor:2673	3	1	closed	10	sr:venue:2406	2024-11-09 14:30:00
sr:sport_event:51269429	sr:season:118693	sr:competitor:2674	sr:competitor:2681	\N	\N	not_started	24	sr:venue:67707	2025-03-01 14:30:00
sr:sport_event:51269227	sr:season:118693	sr:competitor:2681	sr:competitor:2526	\N	\N	not_started	13	sr:venue:593	2024-12-07 14:30:00
sr:sport_event:51269423	sr:season:118693	sr:competitor:2573	sr:competitor:2681	\N	\N	not_started	23	sr:venue:659	2025-02-22 14:30:00
sr:sport_event:51269235	sr:season:118693	sr:competitor:2569	sr:competitor:2538	\N	\N	not_started	13	sr:venue:1089	2024-12-08 16:30:00
sr:sport_event:50868451	sr:season:119799	sr:competitor:2971	sr:competitor:2956	\N	\N	not_started	27	sr:venue:18994	2025-03-29 17:00:00
sr:sport_event:51269401	sr:season:118693	sr:competitor:2547	sr:competitor:2527	\N	\N	not_started	22	sr:venue:578	2025-02-15 14:30:00
sr:sport_event:51269527	sr:season:118693	sr:competitor:2527	sr:competitor:2538	\N	\N	not_started	29	sr:venue:788	2025-04-12 13:30:00
sr:sport_event:50955435	sr:season:119835	sr:competitor:1646	sr:competitor:1715	3	0	closed	6	sr:venue:767	2024-09-27 17:00:00
sr:sport_event:51269529	sr:season:118693	sr:competitor:2542	sr:competitor:2600	\N	\N	not_started	29	sr:venue:738	2025-04-12 13:30:00
sr:sport_event:51269261	sr:season:118693	sr:competitor:2526	sr:competitor:2534	\N	\N	not_started	14	sr:venue:791	2024-12-14 17:30:00
sr:sport_event:51269403	sr:season:118693	sr:competitor:2542	sr:competitor:2673	\N	\N	not_started	22	sr:venue:738	2025-02-15 14:30:00
sr:sport_event:51269573	sr:season:118693	sr:competitor:5885	sr:competitor:2542	\N	\N	not_started	32	sr:venue:34054	2025-05-03 13:30:00
sr:sport_event:50868463	sr:season:119799	sr:competitor:2951	sr:competitor:2952	\N	\N	not_started	28	sr:venue:35438	2025-04-04 16:00:00
sr:sport_event:51268891	sr:season:118693	sr:competitor:2681	sr:competitor:36360	2	3	closed	2	sr:venue:593	2024-08-31 16:30:00
sr:sport_event:51269013	sr:season:118693	sr:competitor:2538	sr:competitor:2526	0	3	closed	5	sr:venue:61056	2024-09-28 13:30:00
sr:sport_event:50868513	sr:season:119799	sr:competitor:2948	sr:competitor:2953	\N	\N	not_started	31	sr:venue:786	2025-05-02 16:00:00
sr:sport_event:51269367	sr:season:118693	sr:competitor:2542	sr:competitor:2538	\N	\N	not_started	20	sr:venue:738	2025-02-01 14:30:00
sr:sport_event:51269471	sr:season:118693	sr:competitor:2556	sr:competitor:2538	\N	\N	not_started	26	sr:venue:2406	2025-03-15 14:30:00
sr:sport_event:51269497	sr:season:118693	sr:competitor:36360	sr:competitor:2569	\N	\N	not_started	28	sr:venue:850	2025-04-05 13:30:00
sr:sport_event:51268937	sr:season:118693	sr:competitor:2538	sr:competitor:2542	2	1	closed	3	sr:venue:61056	2024-09-14 13:30:00
sr:sport_event:50868531	sr:season:119799	sr:competitor:2990	sr:competitor:2960	\N	\N	not_started	32	sr:venue:3261	2025-05-09 16:00:00
sr:sport_event:51269185	sr:season:118693	sr:competitor:2547	sr:competitor:2538	0	0	closed	10	sr:venue:578	2024-11-08 19:30:00
sr:sport_event:51268961	sr:season:118693	sr:competitor:2681	sr:competitor:2524	4	3	closed	4	sr:venue:593	2024-09-22 13:30:00
sr:sport_event:51269153	sr:season:118693	sr:competitor:2674	sr:competitor:2542	7	2	closed	9	sr:venue:67707	2024-11-02 14:30:00
sr:sport_event:51268957	sr:season:118693	sr:competitor:2573	sr:competitor:2672	1	6	closed	3	sr:venue:659	2024-09-14 16:30:00
sr:sport_event:51269349	sr:season:118693	sr:competitor:2527	sr:competitor:2542	\N	\N	not_started	19	sr:venue:788	2025-01-25 17:30:00
sr:sport_event:51269273	sr:season:118693	sr:competitor:2534	sr:competitor:2547	\N	\N	not_started	15	sr:venue:821	2024-12-21 14:30:00
sr:sport_event:50868521	sr:season:119799	sr:competitor:2947	sr:competitor:2971	\N	\N	not_started	31	sr:venue:2081	2025-05-02 16:00:00
sr:sport_event:51268865	sr:season:118693	sr:competitor:2538	sr:competitor:2677	3	1	closed	1	sr:venue:61056	2024-08-24 13:30:00
sr:sport_event:50955447	sr:season:119835	sr:competitor:1684	sr:competitor:1682	1	3	closed	6	sr:venue:19889	2024-09-29 15:00:00
sr:sport_event:50868511	sr:season:119799	sr:competitor:2951	sr:competitor:2956	\N	\N	not_started	31	sr:venue:35438	2025-05-02 16:00:00
sr:sport_event:50955437	sr:season:119835	sr:competitor:1648	sr:competitor:1661	0	0	closed	6	sr:venue:835	2024-09-28 15:00:00
sr:sport_event:50868553	sr:season:119799	sr:competitor:2948	sr:competitor:2960	\N	\N	not_started	33	sr:venue:786	2025-05-14 18:00:00
sr:sport_event:50868561	sr:season:119799	sr:competitor:2952	sr:competitor:2977	\N	\N	not_started	33	sr:venue:726	2025-05-14 18:00:00
sr:sport_event:50955399	sr:season:119835	sr:competitor:1648	sr:competitor:1649	0	0	closed	4	sr:venue:835	2024-09-15 18:45:00
sr:sport_event:51269443	sr:season:118693	sr:competitor:2681	sr:competitor:2534	\N	\N	not_started	25	sr:venue:593	2025-03-08 14:30:00
sr:sport_event:50955397	sr:season:119835	sr:competitor:1658	sr:competitor:1642	3	0	closed	4	sr:venue:844	2024-09-15 13:00:00
sr:sport_event:51269251	sr:season:118693	sr:competitor:2538	sr:competitor:2524	\N	\N	not_started	14	sr:venue:61056	2024-12-13 19:30:00
sr:sport_event:51269069	sr:season:118693	sr:competitor:2681	sr:competitor:2674	2	1	closed	7	sr:venue:593	2024-10-19 13:30:00
sr:sport_event:51269195	sr:season:118693	sr:competitor:2672	sr:competitor:2600	3	0	closed	11	sr:venue:574	2024-11-22 19:30:00
sr:sport_event:50955407	sr:season:119835	sr:competitor:1678	sr:competitor:1643	1	0	closed	4	sr:venue:845	2024-09-13 18:45:00
sr:sport_event:51268879	sr:season:118693	sr:competitor:2556	sr:competitor:2547	1	1	closed	1	sr:venue:2406	2024-08-24 13:30:00
sr:sport_event:51269521	sr:season:118693	sr:competitor:2674	sr:competitor:5885	\N	\N	not_started	29	sr:venue:67707	2025-04-12 13:30:00
sr:sport_event:51269439	sr:season:118693	sr:competitor:2542	sr:competitor:2569	\N	\N	not_started	24	sr:venue:738	2025-03-01 14:30:00
sr:sport_event:51269121	sr:season:118693	sr:competitor:2600	sr:competitor:2673	2	1	closed	8	sr:venue:1655	2024-10-26 13:30:00
sr:sport_event:51269369	sr:season:118693	sr:competitor:2526	sr:competitor:2600	\N	\N	not_started	20	sr:venue:791	2025-02-01 14:30:00
sr:sport_event:51269285	sr:season:118693	sr:competitor:2569	sr:competitor:2524	\N	\N	not_started	16	sr:venue:1089	2025-01-11 14:30:00
sr:sport_event:51269613	sr:season:118693	sr:competitor:2538	sr:competitor:2674	\N	\N	not_started	34	sr:venue:61056	2025-05-17 13:30:00
sr:sport_event:51269555	sr:season:118693	sr:competitor:2672	sr:competitor:2556	\N	\N	not_started	31	sr:venue:574	2025-04-26 13:30:00
sr:sport_event:51269479	sr:season:118693	sr:competitor:2681	sr:competitor:2542	\N	\N	not_started	27	sr:venue:593	2025-03-29 14:30:00
sr:sport_event:51269299	sr:season:118693	sr:competitor:2681	sr:competitor:2556	\N	\N	not_started	17	sr:venue:593	2025-01-14 19:30:00
sr:sport_event:51269601	sr:season:118693	sr:competitor:2542	sr:competitor:2556	\N	\N	not_started	33	sr:venue:738	2025-05-10 13:30:00
sr:sport_event:51269487	sr:season:118693	sr:competitor:2569	sr:competitor:2600	\N	\N	not_started	27	sr:venue:1089	2025-03-29 14:30:00
sr:sport_event:51269579	sr:season:118693	sr:competitor:2556	sr:competitor:2674	\N	\N	not_started	32	sr:venue:2406	2025-05-03 13:30:00
sr:sport_event:51269581	sr:season:118693	sr:competitor:2527	sr:competitor:2569	\N	\N	not_started	32	sr:venue:788	2025-05-03 13:30:00
sr:sport_event:51269619	sr:season:118693	sr:competitor:2527	sr:competitor:2524	\N	\N	not_started	34	sr:venue:788	2025-05-17 13:30:00
sr:sport_event:51269465	sr:season:118693	sr:competitor:5885	sr:competitor:2573	\N	\N	not_started	26	sr:venue:34054	2025-03-15 14:30:00
sr:sport_event:50868437	sr:season:119799	sr:competitor:2960	sr:competitor:2971	\N	\N	not_started	26	sr:venue:656	2025-03-14 17:00:00
sr:sport_event:50868449	sr:season:119799	sr:competitor:2947	sr:competitor:2951	\N	\N	not_started	27	sr:venue:2081	2025-03-29 17:00:00
sr:sport_event:51269499	sr:season:118693	sr:competitor:5885	sr:competitor:2681	\N	\N	not_started	28	sr:venue:34054	2025-04-05 13:30:00
sr:sport_event:51269259	sr:season:118693	sr:competitor:2547	sr:competitor:2542	\N	\N	not_started	14	sr:venue:578	2024-12-14 14:30:00
sr:sport_event:51269037	sr:season:118693	sr:competitor:2677	sr:competitor:2569	1	1	closed	6	sr:venue:648	2024-10-06 17:30:00
sr:sport_event:50868503	sr:season:119799	sr:competitor:2959	sr:competitor:2971	\N	\N	not_started	30	sr:venue:612	2025-04-23 16:00:00
sr:sport_event:50868505	sr:season:119799	sr:competitor:2957	sr:competitor:2961	\N	\N	not_started	30	sr:venue:2769	2025-04-23 16:00:00
sr:sport_event:51268921	sr:season:118693	sr:competitor:2573	sr:competitor:2524	0	2	closed	2	sr:venue:659	2024-08-31 13:30:00
sr:sport_event:51269509	sr:season:118693	sr:competitor:2547	sr:competitor:2524	\N	\N	not_started	28	sr:venue:578	2025-04-05 13:30:00
sr:sport_event:50868543	sr:season:119799	sr:competitor:2956	sr:competitor:2964	\N	\N	not_started	32	sr:venue:685	2025-05-09 16:00:00
sr:sport_event:51269073	sr:season:118693	sr:competitor:2672	sr:competitor:2677	4	0	closed	7	sr:venue:574	2024-10-19 16:30:00
sr:sport_event:51269189	sr:season:118693	sr:competitor:2526	sr:competitor:2672	0	1	closed	10	sr:venue:791	2024-11-09 14:30:00
sr:sport_event:51269053	sr:season:118693	sr:competitor:2600	sr:competitor:2527	2	1	closed	6	sr:venue:1655	2024-10-04 18:30:00
sr:sport_event:51269191	sr:season:118693	sr:competitor:2681	sr:competitor:5885	5	2	closed	11	sr:venue:593	2024-11-23 14:30:00
sr:sport_event:51269141	sr:season:118693	sr:competitor:2681	sr:competitor:2677	0	0	closed	9	sr:venue:593	2024-11-01 19:30:00
sr:sport_event:51269335	sr:season:118693	sr:competitor:36360	sr:competitor:2681	\N	\N	not_started	19	sr:venue:850	2025-01-25 14:30:00
sr:sport_event:51269225	sr:season:118693	sr:competitor:2526	sr:competitor:2573	\N	\N	not_started	12	sr:venue:791	2024-11-29 19:30:00
sr:sport_event:50868493	sr:season:119799	sr:competitor:2953	sr:competitor:2960	\N	\N	not_started	30	sr:venue:577	2025-04-23 16:00:00
sr:sport_event:50955429	sr:season:119835	sr:competitor:1653	sr:competitor:1662	3	1	closed	5	sr:venue:831	2024-09-22 13:00:00
sr:sport_event:50868571	sr:season:119799	sr:competitor:2977	sr:competitor:2962	\N	\N	not_started	34	sr:venue:729	2025-05-18 12:30:00
sr:sport_event:50868547	sr:season:119799	sr:competitor:2990	sr:competitor:2957	\N	\N	not_started	33	sr:venue:3261	2025-05-14 18:00:00
sr:sport_event:50955411	sr:season:119835	sr:competitor:1644	sr:competitor:1715	3	1	closed	4	sr:venue:843	2024-09-14 19:00:00
sr:sport_event:50955463	sr:season:119835	sr:competitor:1659	sr:competitor:1648	2	2	closed	7	sr:venue:847	2024-10-06 15:00:00
sr:sport_event:51269203	sr:season:118693	sr:competitor:2524	sr:competitor:2547	1	0	closed	11	sr:venue:816	2024-11-23 14:30:00
sr:sport_event:51269329	sr:season:118693	sr:competitor:2547	sr:competitor:2556	\N	\N	not_started	18	sr:venue:578	2025-01-19 14:30:00
sr:sport_event:51269397	sr:season:118693	sr:competitor:2534	sr:competitor:2569	\N	\N	not_started	22	sr:venue:821	2025-02-15 14:30:00
sr:sport_event:51268901	sr:season:118693	sr:competitor:2674	sr:competitor:2569	3	1	closed	2	sr:venue:67707	2024-08-31 13:30:00
sr:sport_event:51269477	sr:season:118693	sr:competitor:2526	sr:competitor:2569	\N	\N	not_started	26	sr:venue:791	2025-03-15 14:30:00
sr:sport_event:51269557	sr:season:118693	sr:competitor:2674	sr:competitor:36360	\N	\N	not_started	31	sr:venue:67707	2025-04-26 13:30:00
sr:sport_event:51269515	sr:season:118693	sr:competitor:2681	sr:competitor:2547	\N	\N	not_started	29	sr:venue:593	2025-04-12 13:30:00
sr:sport_event:51268975	sr:season:118693	sr:competitor:2534	sr:competitor:2672	0	5	closed	4	sr:venue:821	2024-09-21 13:30:00
sr:sport_event:51269501	sr:season:118693	sr:competitor:2534	sr:competitor:2674	\N	\N	not_started	28	sr:venue:821	2025-04-05 13:30:00
sr:sport_event:50868453	sr:season:119799	sr:competitor:2952	sr:competitor:2953	\N	\N	not_started	27	sr:venue:726	2025-03-29 17:00:00
sr:sport_event:51269241	sr:season:118693	sr:competitor:2542	sr:competitor:2534	\N	\N	not_started	13	sr:venue:738	2024-12-07 14:30:00
sr:sport_event:51268925	sr:season:118693	sr:competitor:36360	sr:competitor:2547	0	0	closed	3	sr:venue:850	2024-09-14 13:30:00
sr:sport_event:51269249	sr:season:118693	sr:competitor:5885	sr:competitor:2677	\N	\N	not_started	14	sr:venue:34054	2024-12-15 14:30:00
sr:sport_event:51269433	sr:season:118693	sr:competitor:2534	sr:competitor:2524	\N	\N	not_started	24	sr:venue:821	2025-03-01 14:30:00
sr:sport_event:50868469	sr:season:119799	sr:competitor:2956	sr:competitor:2977	\N	\N	not_started	28	sr:venue:685	2025-04-04 16:00:00
sr:sport_event:51268987	sr:season:118693	sr:competitor:2542	sr:competitor:2573	2	2	closed	4	sr:venue:738	2024-09-21 13:30:00
sr:sport_event:51269533	sr:season:118693	sr:competitor:36360	sr:competitor:2573	\N	\N	not_started	30	sr:venue:850	2025-04-19 13:30:00
sr:sport_event:51269343	sr:season:118693	sr:competitor:2600	sr:competitor:5885	\N	\N	not_started	19	sr:venue:1655	2025-01-25 14:30:00
sr:sport_event:50868545	sr:season:119799	sr:competitor:2961	sr:competitor:2977	\N	\N	not_started	32	sr:venue:826	2025-05-09 16:00:00
sr:sport_event:50868517	sr:season:119799	sr:competitor:2977	sr:competitor:2959	\N	\N	not_started	31	sr:venue:729	2025-05-02 16:00:00
sr:sport_event:51269551	sr:season:118693	sr:competitor:2681	sr:competitor:2600	\N	\N	not_started	31	sr:venue:593	2025-04-26 13:30:00
sr:sport_event:51269467	sr:season:118693	sr:competitor:2534	sr:competitor:2527	\N	\N	not_started	26	sr:venue:821	2025-03-15 14:30:00
sr:sport_event:51269413	sr:season:118693	sr:competitor:2569	sr:competitor:2677	\N	\N	not_started	23	sr:venue:1089	2025-02-22 14:30:00
sr:sport_event:50868563	sr:season:119799	sr:competitor:2961	sr:competitor:2971	\N	\N	not_started	33	sr:venue:826	2025-05-14 18:00:00
sr:sport_event:51269283	sr:season:118693	sr:competitor:2673	sr:competitor:2681	\N	\N	not_started	16	sr:venue:759	2025-01-10 19:30:00
sr:sport_event:51269589	sr:season:118693	sr:competitor:2677	sr:competitor:2600	\N	\N	not_started	33	sr:venue:648	2025-05-10 13:30:00
sr:sport_event:51269373	sr:season:118693	sr:competitor:36360	sr:competitor:2526	\N	\N	not_started	21	sr:venue:850	2025-02-08 14:30:00
sr:sport_event:51268883	sr:season:118693	sr:competitor:2526	sr:competitor:5885	0	2	closed	1	sr:venue:791	2024-08-25 15:30:00
sr:sport_event:51269033	sr:season:118693	sr:competitor:2681	sr:competitor:2573	2	2	closed	6	sr:venue:593	2024-10-05 13:30:00
sr:sport_event:51269395	sr:season:118693	sr:competitor:5885	sr:competitor:2556	\N	\N	not_started	22	sr:venue:34054	2025-02-15 14:30:00
sr:sport_event:51269435	sr:season:118693	sr:competitor:2600	sr:competitor:2538	\N	\N	not_started	24	sr:venue:1655	2025-03-01 14:30:00
sr:sport_event:51269599	sr:season:118693	sr:competitor:2547	sr:competitor:5885	\N	\N	not_started	33	sr:venue:578	2025-05-10 13:30:00
sr:sport_event:51269199	sr:season:118693	sr:competitor:2674	sr:competitor:2534	1	0	closed	11	sr:venue:67707	2024-11-23 17:30:00
sr:sport_event:51269165	sr:season:118693	sr:competitor:2524	sr:competitor:2600	1	1	closed	9	sr:venue:816	2024-11-02 14:30:00
sr:sport_event:51269265	sr:season:118693	sr:competitor:2677	sr:competitor:2526	\N	\N	not_started	15	sr:venue:648	2024-12-21 14:30:00
sr:sport_event:51268969	sr:season:118693	sr:competitor:2674	sr:competitor:2527	2	0	closed	4	sr:venue:67707	2024-09-21 16:30:00
sr:sport_event:51269205	sr:season:118693	sr:competitor:2527	sr:competitor:2526	2	0	closed	11	sr:venue:788	2024-11-24 16:30:00
sr:sport_event:51269339	sr:season:118693	sr:competitor:2569	sr:competitor:2674	\N	\N	not_started	19	sr:venue:1089	2025-01-26 14:30:00
sr:sport_event:50955427	sr:season:119835	sr:competitor:1658	sr:competitor:1648	1	1	closed	5	sr:venue:844	2024-09-21 17:00:00
sr:sport_event:50868539	sr:season:119799	sr:competitor:2957	sr:competitor:2947	\N	\N	not_started	32	sr:venue:2769	2025-05-09 16:00:00
sr:sport_event:50868573	sr:season:119799	sr:competitor:2947	sr:competitor:2961	\N	\N	not_started	34	sr:venue:2081	2025-05-18 12:30:00
sr:sport_event:50868575	sr:season:119799	sr:competitor:2971	sr:competitor:2951	\N	\N	not_started	34	sr:venue:18994	2025-05-18 12:30:00
sr:sport_event:51269469	sr:season:118693	sr:competitor:2600	sr:competitor:2524	\N	\N	not_started	26	sr:venue:1655	2025-03-15 14:30:00
sr:sport_event:51269045	sr:season:118693	sr:competitor:5885	sr:competitor:36360	0	1	closed	6	sr:venue:34054	2024-10-06 13:30:00
sr:sport_event:51269379	sr:season:118693	sr:competitor:2538	sr:competitor:5885	\N	\N	not_started	21	sr:venue:61056	2025-02-08 14:30:00
sr:sport_event:50955389	sr:season:119835	sr:competitor:1662	sr:competitor:1646	3	1	closed	3	sr:venue:46514	2024-09-01 15:00:00
sr:sport_event:51269315	sr:season:118693	sr:competitor:2573	sr:competitor:2673	\N	\N	not_started	17	sr:venue:659	2025-01-14 17:30:00
sr:sport_event:50868461	sr:season:119799	sr:competitor:2950	sr:competitor:2959	\N	\N	not_started	28	sr:venue:615	2025-04-04 16:00:00
sr:sport_event:51269179	sr:season:118693	sr:competitor:2534	sr:competitor:2573	2	1	closed	10	sr:venue:821	2024-11-09 14:30:00
sr:sport_event:51269109	sr:season:118693	sr:competitor:36360	sr:competitor:2538	3	1	closed	8	sr:venue:850	2024-10-26 13:30:00
sr:sport_event:51269061	sr:season:118693	sr:competitor:2542	sr:competitor:2524	1	3	closed	6	sr:venue:738	2024-10-05 13:30:00
sr:sport_event:51269331	sr:season:118693	sr:competitor:2542	sr:competitor:36360	\N	\N	not_started	18	sr:venue:738	2025-01-18 14:30:00
sr:sport_event:51269363	sr:season:118693	sr:competitor:2534	sr:competitor:2556	\N	\N	not_started	20	sr:venue:821	2025-02-01 14:30:00
sr:sport_event:51269245	sr:season:118693	sr:competitor:36360	sr:competitor:2674	\N	\N	not_started	14	sr:venue:850	2024-12-15 18:30:00
sr:sport_event:51269507	sr:season:118693	sr:competitor:2556	sr:competitor:2573	\N	\N	not_started	28	sr:venue:2406	2025-04-05 13:30:00
sr:sport_event:51268857	sr:season:118693	sr:competitor:2673	sr:competitor:2674	2	0	closed	1	sr:venue:759	2024-08-24 16:30:00
sr:sport_event:51269211	sr:season:118693	sr:competitor:2673	sr:competitor:2672	\N	\N	not_started	12	sr:venue:759	2024-11-30 17:30:00
sr:sport_event:51269451	sr:season:118693	sr:competitor:2569	sr:competitor:5885	\N	\N	not_started	25	sr:venue:1089	2025-03-08 14:30:00
sr:sport_event:51269491	sr:season:118693	sr:competitor:2524	sr:competitor:5885	\N	\N	not_started	27	sr:venue:816	2025-03-29 14:30:00
sr:sport_event:51269327	sr:season:118693	sr:competitor:2534	sr:competitor:2600	\N	\N	not_started	18	sr:venue:821	2025-01-19 16:30:00
sr:sport_event:51269419	sr:season:118693	sr:competitor:2556	sr:competitor:2526	\N	\N	not_started	23	sr:venue:2406	2025-02-22 14:30:00
sr:sport_event:51269541	sr:season:118693	sr:competitor:2538	sr:competitor:2569	\N	\N	not_started	30	sr:venue:61056	2025-04-19 13:30:00
sr:sport_event:51269277	sr:season:118693	sr:competitor:2542	sr:competitor:5885	\N	\N	not_started	15	sr:venue:738	2024-12-22 14:30:00
sr:sport_event:51269537	sr:season:118693	sr:competitor:5885	sr:competitor:2672	\N	\N	not_started	30	sr:venue:34054	2025-04-19 13:30:00
sr:sport_event:51269517	sr:season:118693	sr:competitor:2677	sr:competitor:2534	\N	\N	not_started	29	sr:venue:648	2025-04-12 13:30:00
sr:sport_event:51269575	sr:season:118693	sr:competitor:2538	sr:competitor:2681	\N	\N	not_started	32	sr:venue:61056	2025-05-03 13:30:00
sr:sport_event:51269307	sr:season:118693	sr:competitor:2534	sr:competitor:5885	\N	\N	not_started	17	sr:venue:821	2025-01-15 19:30:00
sr:sport_event:51269605	sr:season:118693	sr:competitor:36360	sr:competitor:2677	\N	\N	not_started	34	sr:venue:850	2025-05-17 13:30:00
sr:sport_event:51269607	sr:season:118693	sr:competitor:2673	sr:competitor:2573	\N	\N	not_started	34	sr:venue:759	2025-05-17 13:30:00
sr:sport_event:50868479	sr:season:119799	sr:competitor:2977	sr:competitor:2950	\N	\N	not_started	29	sr:venue:729	2025-04-11 16:00:00
sr:sport_event:50868489	sr:season:119799	sr:competitor:2960	sr:competitor:2964	\N	\N	not_started	29	sr:venue:656	2025-04-11 16:00:00
sr:sport_event:51269409	sr:season:118693	sr:competitor:36360	sr:competitor:5885	\N	\N	not_started	23	sr:venue:850	2025-02-22 14:30:00
sr:sport_event:51268965	sr:season:118693	sr:competitor:2677	sr:competitor:2673	5	1	closed	4	sr:venue:648	2024-09-22 15:30:00
sr:sport_event:50868523	sr:season:119799	sr:competitor:2952	sr:competitor:2957	\N	\N	not_started	31	sr:venue:726	2025-05-02 16:00:00
sr:sport_event:50868529	sr:season:119799	sr:competitor:2953	sr:competitor:2962	\N	\N	not_started	32	sr:venue:577	2025-05-09 16:00:00
sr:sport_event:50868557	sr:season:119799	sr:competitor:2979	sr:competitor:2964	\N	\N	not_started	33	sr:venue:3293	2025-05-14 18:00:00
sr:sport_event:51268913	sr:season:118693	sr:competitor:2547	sr:competitor:2526	1	0	closed	2	sr:venue:578	2024-08-30 18:30:00
sr:sport_event:51269129	sr:season:118693	sr:competitor:2547	sr:competitor:2674	1	1	closed	8	sr:venue:578	2024-10-27 16:30:00
sr:sport_event:51269021	sr:season:118693	sr:competitor:2556	sr:competitor:5885	0	2	closed	5	sr:venue:2406	2024-09-28 13:30:00
sr:sport_event:51269049	sr:season:118693	sr:competitor:2534	sr:competitor:2538	0	1	closed	6	sr:venue:821	2024-10-05 13:30:00
sr:sport_event:51269169	sr:season:118693	sr:competitor:2527	sr:competitor:2534	4	1	closed	9	sr:venue:788	2024-11-03 16:30:00
sr:sport_event:51269347	sr:season:118693	sr:competitor:2556	sr:competitor:2677	\N	\N	not_started	19	sr:venue:2406	2025-01-25 14:30:00
sr:sport_event:51269105	sr:season:118693	sr:competitor:2677	sr:competitor:2573	2	1	closed	8	sr:venue:648	2024-10-26 13:30:00
sr:sport_event:51269255	sr:season:118693	sr:competitor:2556	sr:competitor:2672	\N	\N	not_started	14	sr:venue:2406	2024-12-14 14:30:00
sr:sport_event:51269041	sr:season:118693	sr:competitor:2674	sr:competitor:2672	3	3	closed	6	sr:venue:67707	2024-10-06 15:30:00
sr:sport_event:50868567	sr:season:119799	sr:competitor:2950	sr:competitor:2990	\N	\N	not_started	34	sr:venue:615	2025-05-18 12:30:00
sr:sport_event:50955387	sr:season:119835	sr:competitor:1653	sr:competitor:1648	1	1	closed	3	sr:venue:831	2024-09-01 13:00:00
sr:sport_event:51269161	sr:season:118693	sr:competitor:2538	sr:competitor:2556	0	0	closed	9	sr:venue:61056	2024-11-03 14:30:00
sr:sport_event:51269157	sr:season:118693	sr:competitor:2569	sr:competitor:2526	0	2	closed	9	sr:venue:1089	2024-11-02 14:30:00
sr:sport_event:51269531	sr:season:118693	sr:competitor:2573	sr:competitor:2526	\N	\N	not_started	29	sr:venue:659	2025-04-12 13:30:00
sr:sport_event:51268861	sr:season:118693	sr:competitor:2569	sr:competitor:2573	3	2	closed	1	sr:venue:1089	2024-08-24 13:30:00
sr:sport_event:51269383	sr:season:118693	sr:competitor:2556	sr:competitor:2600	\N	\N	not_started	21	sr:venue:2406	2025-02-08 14:30:00
sr:sport_event:51269539	sr:season:118693	sr:competitor:2534	sr:competitor:2542	\N	\N	not_started	30	sr:venue:821	2025-04-19 13:30:00
sr:sport_event:51269441	sr:season:118693	sr:competitor:2526	sr:competitor:2673	\N	\N	not_started	24	sr:venue:791	2025-03-01 14:30:00
sr:sport_event:51269269	sr:season:118693	sr:competitor:2674	sr:competitor:2556	\N	\N	not_started	15	sr:venue:67707	2024-12-21 14:30:00
sr:sport_event:51269213	sr:season:118693	sr:competitor:5885	sr:competitor:2674	\N	\N	not_started	12	sr:venue:34054	2024-12-01 16:30:00
sr:sport_event:51269617	sr:season:118693	sr:competitor:2556	sr:competitor:2681	\N	\N	not_started	34	sr:venue:2406	2025-05-17 13:30:00
sr:sport_event:51269263	sr:season:118693	sr:competitor:2681	sr:competitor:2538	\N	\N	not_started	15	sr:venue:593	2024-12-21 17:30:00
sr:sport_event:51269461	sr:season:118693	sr:competitor:2677	sr:competitor:2681	\N	\N	not_started	26	sr:venue:648	2025-03-15 14:30:00
sr:sport_event:51269483	sr:season:118693	sr:competitor:2673	sr:competitor:2556	\N	\N	not_started	27	sr:venue:759	2025-03-29 14:30:00
sr:sport_event:51269385	sr:season:118693	sr:competitor:2527	sr:competitor:2674	\N	\N	not_started	21	sr:venue:788	2025-02-08 14:30:00
sr:sport_event:51269303	sr:season:118693	sr:competitor:2672	sr:competitor:2569	\N	\N	not_started	17	sr:venue:574	2025-01-15 19:30:00
sr:sport_event:51269591	sr:season:118693	sr:competitor:2672	sr:competitor:2527	\N	\N	not_started	33	sr:venue:574	2025-05-10 13:30:00
sr:sport_event:50868525	sr:season:119799	sr:competitor:2964	sr:competitor:2990	\N	\N	not_started	31	sr:venue:569	2025-05-02 16:00:00
sr:sport_event:51269317	sr:season:118693	sr:competitor:2681	sr:competitor:2527	\N	\N	not_started	18	sr:venue:593	2025-01-18 17:30:00
sr:sport_event:51269065	sr:season:118693	sr:competitor:2526	sr:competitor:2556	0	3	closed	6	sr:venue:791	2024-10-05 16:30:00
sr:sport_event:51269595	sr:season:118693	sr:competitor:2534	sr:competitor:36360	\N	\N	not_started	33	sr:venue:821	2025-05-10 13:30:00
sr:sport_event:51269603	sr:season:118693	sr:competitor:2573	sr:competitor:2538	\N	\N	not_started	33	sr:venue:659	2025-05-10 13:30:00
sr:sport_event:50868475	sr:season:119799	sr:competitor:2948	sr:competitor:2951	\N	\N	not_started	29	sr:venue:786	2025-04-11 16:00:00
sr:sport_event:51269293	sr:season:118693	sr:competitor:2556	sr:competitor:2542	\N	\N	not_started	16	sr:venue:2406	2025-01-11 14:30:00
sr:sport_event:51269029	sr:season:118693	sr:competitor:2573	sr:competitor:2674	2	4	closed	5	sr:venue:659	2024-09-29 13:30:00
sr:sport_event:51269365	sr:season:118693	sr:competitor:2547	sr:competitor:36360	\N	\N	not_started	20	sr:venue:578	2025-02-01 14:30:00
sr:sport_event:51269175	sr:season:118693	sr:competitor:36360	sr:competitor:2527	0	0	closed	10	sr:venue:850	2024-11-09 17:30:00
sr:sport_event:50868565	sr:season:119799	sr:competitor:2953	sr:competitor:2955	\N	\N	not_started	34	sr:venue:577	2025-05-18 12:30:00
sr:sport_event:51269393	sr:season:118693	sr:competitor:2674	sr:competitor:2573	\N	\N	not_started	22	sr:venue:67707	2025-02-15 14:30:00
sr:sport_event:51269229	sr:season:118693	sr:competitor:2677	sr:competitor:2547	\N	\N	not_started	13	sr:venue:648	2024-12-06 19:30:00
sr:sport_event:51269345	sr:season:118693	sr:competitor:2524	sr:competitor:2573	\N	\N	not_started	19	sr:venue:816	2025-01-24 19:30:00
sr:sport_event:51269453	sr:season:118693	sr:competitor:2538	sr:competitor:36360	\N	\N	not_started	25	sr:venue:61056	2025-03-08 14:30:00
sr:sport_event:51269221	sr:season:118693	sr:competitor:2556	sr:competitor:2569	\N	\N	not_started	12	sr:venue:2406	2024-12-01 14:30:00
sr:sport_event:51268917	sr:season:118693	sr:competitor:2542	sr:competitor:2527	0	2	closed	2	sr:venue:738	2024-08-31 13:30:00
sr:sport_event:51268953	sr:season:118693	sr:competitor:2527	sr:competitor:2677	1	3	closed	3	sr:venue:788	2024-09-14 13:30:00
sr:sport_event:51268933	sr:season:118693	sr:competitor:2569	sr:competitor:2681	1	4	closed	3	sr:venue:1089	2024-09-14 13:30:00
sr:sport_event:51269389	sr:season:118693	sr:competitor:2681	sr:competitor:2672	\N	\N	not_started	22	sr:venue:593	2025-02-15 14:30:00
sr:sport_event:51269341	sr:season:118693	sr:competitor:2538	sr:competitor:2672	\N	\N	not_started	19	sr:venue:61056	2025-01-25 14:30:00
sr:sport_event:51269417	sr:season:118693	sr:competitor:2524	sr:competitor:2542	\N	\N	not_started	23	sr:venue:816	2025-02-22 14:30:00
sr:sport_event:51269493	sr:season:118693	sr:competitor:2527	sr:competitor:36360	\N	\N	not_started	27	sr:venue:788	2025-03-29 14:30:00
sr:sport_event:51269567	sr:season:118693	sr:competitor:2573	sr:competitor:2527	\N	\N	not_started	31	sr:venue:659	2025-04-26 13:30:00
sr:sport_event:51269505	sr:season:118693	sr:competitor:2600	sr:competitor:2672	\N	\N	not_started	28	sr:venue:1655	2025-04-05 13:30:00
sr:sport_event:51269523	sr:season:118693	sr:competitor:2569	sr:competitor:2556	\N	\N	not_started	29	sr:venue:1089	2025-04-12 13:30:00
sr:sport_event:50955901	sr:season:119835	sr:competitor:1649	sr:competitor:1658	\N	\N	not_started	31	sr:venue:17406	2025-04-27 17:00:00
sr:sport_event:50955453	sr:season:119835	sr:competitor:1643	sr:competitor:1681	2	1	closed	7	sr:venue:837	2024-10-05 17:00:00
sr:sport_event:51269585	sr:season:118693	sr:competitor:2526	sr:competitor:2677	\N	\N	not_started	32	sr:venue:791	2025-05-03 13:30:00
sr:sport_event:50955465	sr:season:119835	sr:competitor:1682	sr:competitor:1642	4	2	closed	7	sr:venue:1871	2024-10-06 15:00:00
sr:sport_event:50955639	sr:season:119835	sr:competitor:1642	sr:competitor:1684	\N	\N	not_started	17	sr:venue:1275	2025-01-12 16:00:00
sr:sport_event:50955761	sr:season:119835	sr:competitor:1641	sr:competitor:1647	\N	\N	not_started	24	sr:venue:839	2025-03-02 17:00:00
sr:sport_event:51269561	sr:season:118693	sr:competitor:2534	sr:competitor:2526	\N	\N	not_started	31	sr:venue:821	2025-04-26 13:30:00
sr:sport_event:50955511	sr:season:119835	sr:competitor:1647	sr:competitor:1641	1	2	closed	10	sr:venue:953	2024-11-03 19:45:00
sr:sport_event:51269311	sr:season:118693	sr:competitor:2547	sr:competitor:2600	\N	\N	not_started	17	sr:venue:578	2025-01-15 19:30:00
sr:sport_event:51269309	sr:season:118693	sr:competitor:2524	sr:competitor:2527	\N	\N	not_started	17	sr:venue:816	2025-01-14 19:30:00
sr:sport_event:50955841	sr:season:119835	sr:competitor:1648	sr:competitor:1678	\N	\N	not_started	28	sr:venue:835	2025-04-06 17:00:00
sr:sport_event:50955873	sr:season:119835	sr:competitor:1643	sr:competitor:1646	\N	\N	not_started	30	sr:venue:837	2025-04-20 17:00:00
sr:sport_event:50955559	sr:season:119835	sr:competitor:1658	sr:competitor:1678	\N	\N	not_started	13	sr:venue:844	2024-11-30 16:00:00
sr:sport_event:50955623	sr:season:119835	sr:competitor:1641	sr:competitor:1662	\N	\N	not_started	16	sr:venue:839	2025-01-05 16:00:00
sr:sport_event:50955799	sr:season:119835	sr:competitor:1642	sr:competitor:1678	\N	\N	not_started	26	sr:venue:1275	2025-03-16 17:00:00
sr:sport_event:50955893	sr:season:119835	sr:competitor:1648	sr:competitor:1646	\N	\N	not_started	31	sr:venue:835	2025-04-27 17:00:00
sr:sport_event:50955413	sr:season:119835	sr:competitor:1649	sr:competitor:1641	2	3	closed	5	sr:venue:17406	2024-09-22 18:45:00
sr:sport_event:50955951	sr:season:119835	sr:competitor:1643	sr:competitor:1682	\N	\N	not_started	34	sr:venue:837	2025-05-18 17:00:00
sr:sport_event:50955489	sr:season:119835	sr:competitor:1641	sr:competitor:1644	0	3	closed	9	sr:venue:839	2024-10-27 19:45:00
sr:sport_event:50955385	sr:season:119835	sr:competitor:1684	sr:competitor:1661	1	4	closed	3	sr:venue:19889	2024-09-01 15:00:00
sr:sport_event:50955699	sr:season:119835	sr:competitor:1681	sr:competitor:1661	\N	\N	not_started	20	sr:venue:848	2025-02-02 16:00:00
sr:sport_event:51269407	sr:season:118693	sr:competitor:2672	sr:competitor:2674	\N	\N	not_started	23	sr:venue:574	2025-02-22 14:30:00
sr:sport_event:50955879	sr:season:119835	sr:competitor:1682	sr:competitor:1681	\N	\N	not_started	30	sr:venue:1871	2025-04-20 17:00:00
sr:sport_event:50955711	sr:season:119835	sr:competitor:1643	sr:competitor:1662	\N	\N	not_started	21	sr:venue:837	2025-02-09 16:00:00
sr:sport_event:50955937	sr:season:119835	sr:competitor:1681	sr:competitor:1648	\N	\N	not_started	33	sr:venue:848	2025-05-11 17:00:00
sr:sport_event:50955563	sr:season:119835	sr:competitor:1681	sr:competitor:1646	\N	\N	not_started	13	sr:venue:848	2024-12-01 16:00:00
sr:sport_event:50955479	sr:season:119835	sr:competitor:1678	sr:competitor:1648	0	2	closed	8	sr:venue:845	2024-10-19 17:00:00
sr:sport_event:50955657	sr:season:119835	sr:competitor:1642	sr:competitor:1653	\N	\N	not_started	18	sr:venue:1275	2025-01-19 16:00:00
sr:sport_event:50955665	sr:season:119835	sr:competitor:1659	sr:competitor:1643	\N	\N	not_started	19	sr:venue:847	2025-01-26 16:00:00
sr:sport_event:50955703	sr:season:119835	sr:competitor:1653	sr:competitor:1646	\N	\N	not_started	20	sr:venue:831	2025-02-02 16:00:00
sr:sport_event:50955549	sr:season:119835	sr:competitor:1647	sr:competitor:1662	0	2	closed	12	sr:venue:953	2024-11-24 16:00:00
sr:sport_event:50955735	sr:season:119835	sr:competitor:1682	sr:competitor:1684	\N	\N	not_started	22	sr:venue:1871	2025-02-16 16:00:00
sr:sport_event:50955769	sr:season:119835	sr:competitor:1648	sr:competitor:1662	\N	\N	not_started	24	sr:venue:835	2025-03-02 17:00:00
sr:sport_event:50955449	sr:season:119835	sr:competitor:1649	sr:competitor:1647	2	0	closed	7	sr:venue:17406	2024-10-06 13:00:00
sr:sport_event:50955451	sr:season:119835	sr:competitor:1661	sr:competitor:1644	1	1	closed	7	sr:venue:13184	2024-10-06 18:45:00
sr:sport_event:50955457	sr:season:119835	sr:competitor:1715	sr:competitor:1662	2	0	closed	7	sr:venue:1858	2024-10-06 15:00:00
sr:sport_event:50955645	sr:season:119835	sr:competitor:1658	sr:competitor:1641	\N	\N	not_started	17	sr:venue:844	2025-01-12 16:00:00
sr:sport_event:50955773	sr:season:119835	sr:competitor:1653	sr:competitor:1682	\N	\N	not_started	24	sr:venue:831	2025-03-02 17:00:00
sr:sport_event:50955495	sr:season:119835	sr:competitor:1659	sr:competitor:1647	3	1	closed	9	sr:venue:847	2024-10-27 16:00:00
sr:sport_event:50955517	sr:season:119835	sr:competitor:1715	sr:competitor:1661	0	1	closed	10	sr:venue:1858	2024-11-02 18:00:00
sr:sport_event:50955621	sr:season:119835	sr:competitor:1643	sr:competitor:1647	\N	\N	not_started	16	sr:venue:837	2025-01-05 16:00:00
sr:sport_event:50955625	sr:season:119835	sr:competitor:1659	sr:competitor:1646	\N	\N	not_started	16	sr:venue:847	2025-01-05 16:00:00
sr:sport_event:50955629	sr:season:119835	sr:competitor:1681	sr:competitor:1659	\N	\N	not_started	17	sr:venue:848	2025-01-12 16:00:00
sr:sport_event:50955731	sr:season:119835	sr:competitor:1715	sr:competitor:1646	\N	\N	not_started	22	sr:venue:1858	2025-02-16 16:00:00
sr:sport_event:50955741	sr:season:119835	sr:competitor:1658	sr:competitor:1682	\N	\N	not_started	23	sr:venue:844	2025-02-23 16:00:00
sr:sport_event:50955635	sr:season:119835	sr:competitor:1682	sr:competitor:1661	\N	\N	not_started	17	sr:venue:1871	2025-01-12 16:00:00
sr:sport_event:50955811	sr:season:119835	sr:competitor:1684	sr:competitor:1653	\N	\N	not_started	26	sr:venue:19889	2025-03-16 17:00:00
sr:sport_event:50955793	sr:season:119835	sr:competitor:1641	sr:competitor:1648	\N	\N	not_started	25	sr:venue:839	2025-03-09 17:00:00
sr:sport_event:50955459	sr:season:119835	sr:competitor:1641	sr:competitor:1684	1	1	closed	7	sr:venue:839	2024-10-04 18:45:00
sr:sport_event:50955615	sr:season:119835	sr:competitor:1648	sr:competitor:1681	\N	\N	not_started	16	sr:venue:835	2025-01-05 16:00:00
sr:sport_event:50955719	sr:season:119835	sr:competitor:1684	sr:competitor:1641	\N	\N	not_started	21	sr:venue:19889	2025-02-09 16:00:00
sr:sport_event:50955947	sr:season:119835	sr:competitor:1661	sr:competitor:1715	\N	\N	not_started	34	sr:venue:13184	2025-05-18 17:00:00
sr:sport_event:50955543	sr:season:119835	sr:competitor:1661	sr:competitor:1659	2	1	closed	12	sr:venue:13184	2024-11-24 19:45:00
sr:sport_event:50955783	sr:season:119835	sr:competitor:1681	sr:competitor:1653	\N	\N	not_started	25	sr:venue:848	2025-03-09 17:00:00
sr:sport_event:50955725	sr:season:119835	sr:competitor:1641	sr:competitor:1678	\N	\N	not_started	22	sr:venue:839	2025-02-16 16:00:00
sr:sport_event:50955863	sr:season:119835	sr:competitor:1648	sr:competitor:1682	\N	\N	not_started	29	sr:venue:835	2025-04-13 17:00:00
sr:sport_event:50955847	sr:season:119835	sr:competitor:1658	sr:competitor:1646	\N	\N	not_started	28	sr:venue:844	2025-04-06 17:00:00
sr:sport_event:50955689	sr:season:119835	sr:competitor:1715	sr:competitor:1644	\N	\N	not_started	20	sr:venue:1858	2025-02-02 16:00:00
sr:sport_event:50955589	sr:season:119835	sr:competitor:1647	sr:competitor:1658	\N	\N	not_started	14	sr:venue:953	2024-12-08 16:00:00
sr:sport_event:50955891	sr:season:119835	sr:competitor:1642	sr:competitor:1682	\N	\N	not_started	31	sr:venue:1275	2025-04-27 17:00:00
sr:sport_event:50955815	sr:season:119835	sr:competitor:1646	sr:competitor:1642	\N	\N	not_started	27	sr:venue:767	2025-03-30 17:00:00
sr:sport_event:50955855	sr:season:119835	sr:competitor:1647	sr:competitor:1644	\N	\N	not_started	29	sr:venue:953	2025-04-13 17:00:00
sr:sport_event:50955887	sr:season:119835	sr:competitor:1659	sr:competitor:1678	\N	\N	not_started	31	sr:venue:847	2025-04-27 17:00:00
sr:sport_event:50955697	sr:season:119835	sr:competitor:1684	sr:competitor:1662	\N	\N	not_started	20	sr:venue:19889	2025-02-02 16:00:00
sr:sport_event:50955547	sr:season:119835	sr:competitor:1643	sr:competitor:1658	1	0	closed	12	sr:venue:837	2024-11-24 14:00:00
sr:sport_event:50955881	sr:season:119835	sr:competitor:1653	sr:competitor:1659	\N	\N	not_started	30	sr:venue:831	2025-04-20 17:00:00
sr:sport_event:50955921	sr:season:119835	sr:competitor:1682	sr:competitor:1678	\N	\N	not_started	33	sr:venue:1871	2025-05-11 17:00:00
sr:sport_event:50955787	sr:season:119835	sr:competitor:1715	sr:competitor:1684	\N	\N	not_started	25	sr:venue:1858	2025-03-09 17:00:00
sr:sport_event:50955687	sr:season:119835	sr:competitor:1641	sr:competitor:1649	\N	\N	not_started	20	sr:venue:839	2025-02-02 16:00:00
sr:sport_event:50955903	sr:season:119835	sr:competitor:1649	sr:competitor:1648	\N	\N	not_started	32	sr:venue:17406	2025-05-04 17:00:00
sr:sport_event:50955821	sr:season:119835	sr:competitor:1681	sr:competitor:1715	\N	\N	not_started	27	sr:venue:848	2025-03-30 17:00:00
sr:sport_event:50955767	sr:season:119835	sr:competitor:1678	sr:competitor:1661	\N	\N	not_started	24	sr:venue:845	2025-03-02 17:00:00
sr:sport_event:50955557	sr:season:119835	sr:competitor:1682	sr:competitor:1648	\N	\N	not_started	13	sr:venue:1871	2024-11-29 19:45:00
sr:sport_event:50955869	sr:season:119835	sr:competitor:1661	sr:competitor:1684	\N	\N	not_started	30	sr:venue:13184	2025-04-20 17:00:00
sr:sport_event:50955569	sr:season:119835	sr:competitor:1644	sr:competitor:1647	\N	\N	not_started	13	sr:venue:843	2024-11-30 20:00:00
sr:sport_event:50955945	sr:season:119835	sr:competitor:1649	sr:competitor:1684	\N	\N	not_started	34	sr:venue:17406	2025-05-18 17:00:00
sr:sport_event:50955497	sr:season:119835	sr:competitor:1658	sr:competitor:1662	1	0	closed	9	sr:venue:844	2024-10-25 18:45:00
sr:sport_event:50955955	sr:season:119835	sr:competitor:1647	sr:competitor:1642	\N	\N	not_started	34	sr:venue:953	2025-05-18 17:00:00
sr:sport_event:50955591	sr:season:119835	sr:competitor:1653	sr:competitor:1681	\N	\N	not_started	14	sr:venue:831	2024-12-07 16:00:00
sr:sport_event:50955809	sr:season:119835	sr:competitor:1647	sr:competitor:1643	\N	\N	not_started	26	sr:venue:953	2025-03-16 17:00:00
sr:sport_event:50955755	sr:season:119835	sr:competitor:1661	sr:competitor:1642	\N	\N	not_started	23	sr:venue:13184	2025-02-23 16:00:00
sr:sport_event:50955707	sr:season:119835	sr:competitor:1647	sr:competitor:1715	\N	\N	not_started	21	sr:venue:953	2025-02-09 16:00:00
sr:sport_event:50955717	sr:season:119835	sr:competitor:1649	sr:competitor:1682	\N	\N	not_started	21	sr:venue:17406	2025-02-09 16:00:00
sr:sport_event:50955733	sr:season:119835	sr:competitor:1658	sr:competitor:1643	\N	\N	not_started	22	sr:venue:844	2025-02-16 16:00:00
sr:sport_event:50955819	sr:season:119835	sr:competitor:1659	sr:competitor:1649	\N	\N	not_started	27	sr:venue:847	2025-03-30 17:00:00
sr:sport_event:50955785	sr:season:119835	sr:competitor:1661	sr:competitor:1649	\N	\N	not_started	25	sr:venue:13184	2025-03-09 17:00:00
sr:sport_event:50955461	sr:season:119835	sr:competitor:1658	sr:competitor:1653	1	2	closed	7	sr:venue:844	2024-10-05 19:00:00
sr:sport_event:50955587	sr:season:119835	sr:competitor:1659	sr:competitor:1682	\N	\N	not_started	14	sr:venue:847	2024-12-08 16:00:00
sr:sport_event:50955643	sr:season:119835	sr:competitor:1644	sr:competitor:1678	\N	\N	not_started	17	sr:venue:843	2025-01-12 16:00:00
sr:sport_event:50955871	sr:season:119835	sr:competitor:1715	sr:competitor:1648	\N	\N	not_started	30	sr:venue:1858	2025-04-20 17:00:00
sr:sport_event:50955795	sr:season:119835	sr:competitor:1644	sr:competitor:1641	\N	\N	not_started	26	sr:venue:843	2025-03-16 17:00:00
sr:sport_event:50955861	sr:season:119835	sr:competitor:1684	sr:competitor:1642	\N	\N	not_started	29	sr:venue:19889	2025-04-13 17:00:00
sr:sport_event:50955681	sr:season:119835	sr:competitor:1648	sr:competitor:1684	\N	\N	not_started	19	sr:venue:835	2025-01-26 16:00:00
sr:sport_event:50955595	sr:season:119835	sr:competitor:1662	sr:competitor:1659	\N	\N	not_started	15	sr:venue:46514	2024-12-15 16:00:00
sr:sport_event:50955593	sr:season:119835	sr:competitor:1658	sr:competitor:1684	\N	\N	not_started	15	sr:venue:844	2024-12-15 16:00:00
sr:sport_event:50955907	sr:season:119835	sr:competitor:1661	sr:competitor:1682	\N	\N	not_started	32	sr:venue:13184	2025-05-04 17:00:00
sr:sport_event:50955837	sr:season:119835	sr:competitor:1642	sr:competitor:1662	\N	\N	not_started	28	sr:venue:1275	2025-04-06 17:00:00
sr:sport_event:50955915	sr:season:119835	sr:competitor:1681	sr:competitor:1658	\N	\N	not_started	32	sr:venue:848	2025-05-04 17:00:00
sr:sport_event:50955599	sr:season:119835	sr:competitor:1646	sr:competitor:1648	\N	\N	not_started	15	sr:venue:767	2024-12-14 18:00:00
sr:sport_event:50955683	sr:season:119835	sr:competitor:1644	sr:competitor:1682	\N	\N	not_started	19	sr:venue:843	2025-01-26 16:00:00
sr:sport_event:50955823	sr:season:119835	sr:competitor:1678	sr:competitor:1644	\N	\N	not_started	27	sr:venue:845	2025-03-30 17:00:00
sr:sport_event:50955825	sr:season:119835	sr:competitor:1682	sr:competitor:1641	\N	\N	not_started	27	sr:venue:1871	2025-03-30 17:00:00
sr:sport_event:50955553	sr:season:119835	sr:competitor:1646	sr:competitor:1684	1	0	closed	12	sr:venue:767	2024-11-24 16:00:00
sr:sport_event:50955857	sr:season:119835	sr:competitor:1659	sr:competitor:1661	\N	\N	not_started	29	sr:venue:847	2025-04-13 17:00:00
sr:sport_event:50955529	sr:season:119835	sr:competitor:1659	sr:competitor:1653	1	3	closed	11	sr:venue:847	2024-11-09 16:00:00
sr:sport_event:50955749	sr:season:119835	sr:competitor:1647	sr:competitor:1648	\N	\N	not_started	23	sr:venue:953	2025-02-23 16:00:00
sr:sport_event:50955527	sr:season:119835	sr:competitor:1662	sr:competitor:1682	0	3	closed	11	sr:venue:46514	2024-11-10 16:00:00
sr:sport_event:50955533	sr:season:119835	sr:competitor:1658	sr:competitor:1681	0	2	closed	11	sr:venue:844	2024-11-10 16:00:00
sr:sport_event:50955883	sr:season:119835	sr:competitor:1658	sr:competitor:1647	\N	\N	not_started	30	sr:venue:844	2025-04-20 17:00:00
sr:sport_event:50955759	sr:season:119835	sr:competitor:1644	sr:competitor:1643	\N	\N	not_started	24	sr:venue:843	2025-03-02 17:00:00
sr:sport_event:50955647	sr:season:119835	sr:competitor:1641	sr:competitor:1659	\N	\N	not_started	18	sr:venue:839	2025-01-19 16:00:00
sr:sport_event:50955541	sr:season:119835	sr:competitor:1648	sr:competitor:1641	1	3	closed	12	sr:venue:835	2024-11-23 16:00:00
sr:sport_event:50955535	sr:season:119835	sr:competitor:1661	sr:competitor:1643	2	2	closed	11	sr:venue:13184	2024-11-10 14:00:00
sr:sport_event:50955763	sr:season:119835	sr:competitor:1649	sr:competitor:1715	\N	\N	not_started	24	sr:venue:17406	2025-03-02 17:00:00
sr:sport_event:50955609	sr:season:119835	sr:competitor:1644	sr:competitor:1649	\N	\N	not_started	15	sr:venue:843	2024-12-15 19:45:00
sr:sport_event:50955899	sr:season:119835	sr:competitor:1641	sr:competitor:1715	\N	\N	not_started	31	sr:venue:839	2025-04-27 17:00:00
sr:sport_event:50955509	sr:season:119835	sr:competitor:1662	sr:competitor:1642	1	0	closed	10	sr:venue:46514	2024-11-03 16:00:00
sr:sport_event:50955673	sr:season:119835	sr:competitor:1653	sr:competitor:1658	\N	\N	not_started	19	sr:venue:831	2025-01-26 16:00:00
sr:sport_event:50955685	sr:season:119835	sr:competitor:1661	sr:competitor:1641	\N	\N	not_started	19	sr:venue:13184	2025-01-26 16:00:00
sr:sport_event:50955695	sr:season:119835	sr:competitor:1682	sr:competitor:1647	\N	\N	not_started	20	sr:venue:1871	2025-02-02 16:00:00
sr:sport_event:50955913	sr:season:119835	sr:competitor:1647	sr:competitor:1684	\N	\N	not_started	32	sr:venue:953	2025-05-04 17:00:00
sr:sport_event:50955917	sr:season:119835	sr:competitor:1659	sr:competitor:1644	\N	\N	not_started	32	sr:venue:847	2025-05-04 17:00:00
sr:sport_event:51269257	sr:season:118693	sr:competitor:2527	sr:competitor:2573	\N	\N	not_started	14	sr:venue:788	2024-12-14 14:30:00
sr:sport_event:51269351	sr:season:118693	sr:competitor:2526	sr:competitor:2547	\N	\N	not_started	19	sr:venue:791	2025-01-26 16:30:00
sr:sport_event:51269313	sr:season:118693	sr:competitor:2542	sr:competitor:2526	\N	\N	not_started	17	sr:venue:738	2025-01-15 17:30:00
sr:sport_event:51269445	sr:season:118693	sr:competitor:2672	sr:competitor:2542	\N	\N	not_started	25	sr:venue:574	2025-03-08 14:30:00
sr:sport_event:51269359	sr:season:118693	sr:competitor:2674	sr:competitor:2524	\N	\N	not_started	20	sr:venue:67707	2025-02-01 14:30:00
sr:sport_event:51269513	sr:season:118693	sr:competitor:2526	sr:competitor:2527	\N	\N	not_started	28	sr:venue:791	2025-04-05 13:30:00
sr:sport_event:50955777	sr:season:119835	sr:competitor:1662	sr:competitor:1678	\N	\N	not_started	25	sr:venue:46514	2025-03-09 17:00:00
sr:sport_event:50955839	sr:season:119835	sr:competitor:1649	sr:competitor:1643	\N	\N	not_started	28	sr:venue:17406	2025-04-06 17:00:00
sr:sport_event:50868527	sr:season:119799	sr:competitor:2960	sr:competitor:2955	\N	\N	not_started	31	sr:venue:656	2025-05-02 16:00:00
sr:sport_event:50955607	sr:season:119835	sr:competitor:1641	sr:competitor:1643	\N	\N	not_started	15	sr:venue:839	2024-12-14 16:00:00
sr:sport_event:50955577	sr:season:119835	sr:competitor:1646	sr:competitor:1644	\N	\N	not_started	14	sr:venue:767	2024-12-06 20:00:00
sr:sport_event:50955701	sr:season:119835	sr:competitor:1658	sr:competitor:1659	\N	\N	not_started	20	sr:venue:844	2025-02-02 16:00:00
sr:sport_event:50955521	sr:season:119835	sr:competitor:1641	sr:competitor:1646	1	3	closed	11	sr:venue:839	2024-11-08 19:45:00
sr:sport_event:50955805	sr:season:119835	sr:competitor:1648	sr:competitor:1658	\N	\N	not_started	26	sr:venue:835	2025-03-16 17:00:00
sr:sport_event:50955745	sr:season:119835	sr:competitor:1643	sr:competitor:1653	\N	\N	not_started	23	sr:venue:837	2025-02-23 16:00:00
sr:sport_event:50955499	sr:season:119835	sr:competitor:1684	sr:competitor:1678	4	2	closed	9	sr:venue:19889	2024-10-26 15:00:00
sr:sport_event:50955943	sr:season:119835	sr:competitor:1641	sr:competitor:1658	\N	\N	not_started	34	sr:venue:839	2025-05-18 17:00:00
sr:sport_event:50955417	sr:season:119835	sr:competitor:1682	sr:competitor:1644	1	1	closed	5	sr:venue:1871	2024-09-21 19:00:00
sr:sport_event:50955909	sr:season:119835	sr:competitor:1715	sr:competitor:1642	\N	\N	not_started	32	sr:venue:1858	2025-05-04 17:00:00
sr:sport_event:50955585	sr:season:119835	sr:competitor:1648	sr:competitor:1642	\N	\N	not_started	14	sr:venue:835	2024-12-08 14:00:00
sr:sport_event:50955481	sr:season:119835	sr:competitor:1715	sr:competitor:1658	1	1	closed	8	sr:venue:1858	2024-10-19 15:00:00
sr:sport_event:50955829	sr:season:119835	sr:competitor:1653	sr:competitor:1661	\N	\N	not_started	27	sr:venue:831	2025-03-30 17:00:00
sr:sport_event:50955619	sr:season:119835	sr:competitor:1684	sr:competitor:1715	\N	\N	not_started	16	sr:venue:19889	2025-01-05 16:00:00
sr:sport_event:50955929	sr:season:119835	sr:competitor:1658	sr:competitor:1661	\N	\N	not_started	33	sr:venue:844	2025-05-11 17:00:00
sr:sport_event:51269149	sr:season:118693	sr:competitor:2673	sr:competitor:36360	2	1	closed	9	sr:venue:759	2024-11-02 17:30:00
sr:sport_event:50955519	sr:season:119835	sr:competitor:1644	sr:competitor:1648	1	0	closed	10	sr:venue:843	2024-11-02 16:00:00
sr:sport_event:50955637	sr:season:119835	sr:competitor:1662	sr:competitor:1648	\N	\N	not_started	17	sr:venue:46514	2025-01-12 16:00:00
sr:sport_event:51269503	sr:season:118693	sr:competitor:2538	sr:competitor:2673	\N	\N	not_started	28	sr:venue:61056	2025-04-05 13:30:00
sr:sport_event:51269525	sr:season:118693	sr:competitor:2524	sr:competitor:36360	\N	\N	not_started	29	sr:venue:816	2025-04-12 13:30:00
sr:sport_event:51269571	sr:season:118693	sr:competitor:2673	sr:competitor:2524	\N	\N	not_started	32	sr:venue:759	2025-05-03 13:30:00
sr:sport_event:50868467	sr:season:119799	sr:competitor:2979	sr:competitor:2948	\N	\N	not_started	28	sr:venue:3293	2025-04-04 16:00:00
sr:sport_event:51269411	sr:season:118693	sr:competitor:2673	sr:competitor:2547	\N	\N	not_started	23	sr:venue:759	2025-02-22 14:30:00
sr:sport_event:50955555	sr:season:119835	sr:competitor:1682	sr:competitor:1649	1	1	closed	12	sr:venue:1871	2024-11-23 20:00:00
sr:sport_event:51269091	sr:season:118693	sr:competitor:2524	sr:competitor:2534	2	4	closed	7	sr:venue:816	2024-10-20 15:30:00
sr:sport_event:50868501	sr:season:119799	sr:competitor:2955	sr:competitor:2952	\N	\N	not_started	30	sr:venue:584	2025-04-23 16:00:00
sr:sport_event:51269399	sr:season:118693	sr:competitor:2600	sr:competitor:36360	\N	\N	not_started	22	sr:venue:1655	2025-02-15 14:30:00
sr:sport_event:51268905	sr:season:118693	sr:competitor:5885	sr:competitor:2600	4	0	closed	2	sr:venue:34054	2024-09-01 13:30:00
sr:sport_event:51269253	sr:season:118693	sr:competitor:2600	sr:competitor:2681	\N	\N	not_started	14	sr:venue:1655	2024-12-14 14:30:00
sr:sport_event:51269009	sr:season:118693	sr:competitor:2569	sr:competitor:2534	3	4	closed	5	sr:venue:1089	2024-09-29 15:30:00
sr:sport_event:50955641	sr:season:119835	sr:competitor:1715	sr:competitor:1649	\N	\N	not_started	17	sr:venue:1858	2025-01-12 16:00:00
sr:sport_event:50868491	sr:season:119799	sr:competitor:2961	sr:competitor:2953	\N	\N	not_started	29	sr:venue:826	2025-04-11 16:00:00
sr:sport_event:50955765	sr:season:119835	sr:competitor:1642	sr:competitor:1658	\N	\N	not_started	24	sr:venue:1275	2025-03-02 17:00:00
sr:sport_event:50955813	sr:season:119835	sr:competitor:1684	sr:competitor:1658	\N	\N	not_started	27	sr:venue:19889	2025-03-30 17:00:00
sr:sport_event:50955939	sr:season:119835	sr:competitor:1715	sr:competitor:1643	\N	\N	not_started	33	sr:venue:1858	2025-05-11 17:00:00
sr:sport_event:51269181	sr:season:118693	sr:competitor:2600	sr:competitor:2569	0	0	closed	10	sr:venue:1655	2024-11-10 14:30:00
sr:sport_event:50955723	sr:season:119835	sr:competitor:1681	sr:competitor:1644	\N	\N	not_started	22	sr:venue:848	2025-02-16 16:00:00
sr:sport_event:50955729	sr:season:119835	sr:competitor:1648	sr:competitor:1659	\N	\N	not_started	22	sr:venue:835	2025-02-16 16:00:00
sr:sport_event:51388797	sr:season:119847	sr:competitor:3009	sr:competitor:3002	0	3	closed	6	sr:venue:1137	2024-09-21 17:00:00
sr:sport_event:50955851	sr:season:119835	sr:competitor:1662	sr:competitor:1658	\N	\N	not_started	29	sr:venue:46514	2025-04-13 17:00:00
sr:sport_event:50955791	sr:season:119835	sr:competitor:1658	sr:competitor:1644	\N	\N	not_started	25	sr:venue:844	2025-03-09 17:00:00
sr:sport_event:51388799	sr:season:119847	sr:competitor:2995	sr:competitor:3006	0	3	closed	6	sr:venue:14556	2024-09-23 19:15:00
sr:sport_event:51388755	sr:season:119847	sr:competitor:49531	sr:competitor:2995	1	0	closed	3	sr:venue:16520	2024-08-24 19:30:00
sr:sport_event:50955579	sr:season:119835	sr:competitor:1678	sr:competitor:1641	\N	\N	not_started	14	sr:venue:845	2024-12-08 19:45:00
sr:sport_event:51388785	sr:season:119847	sr:competitor:4500	sr:competitor:3013	1	0	closed	5	sr:venue:5326	2024-09-15 17:00:00
sr:sport_event:51388733	sr:season:119847	sr:competitor:3014	sr:competitor:25777	3	1	closed	2	sr:venue:5312	2024-08-18 14:30:00
sr:sport_event:51388779	sr:season:119847	sr:competitor:2999	sr:competitor:3009	0	2	closed	5	sr:venue:951	2024-09-15 19:30:00
sr:sport_event:51388809	sr:season:119847	sr:competitor:3014	sr:competitor:49531	0	0	closed	6	sr:venue:5312	2024-09-21 19:30:00
sr:sport_event:51388735	sr:season:119847	sr:competitor:3009	sr:competitor:4500	1	0	closed	2	sr:venue:1137	2024-08-18 17:00:00
sr:sport_event:51388753	sr:season:119847	sr:competitor:1031053	sr:competitor:3009	1	0	closed	3	sr:venue:8249	2024-08-25 19:30:00
sr:sport_event:51388827	sr:season:119847	sr:competitor:1031053	sr:competitor:2998	0	0	closed	7	sr:venue:8249	2024-09-30 19:15:00
sr:sport_event:51388889	sr:season:119847	sr:competitor:2999	sr:competitor:3001	2	4	closed	11	sr:venue:951	2024-11-10 18:45:00
sr:sport_event:50955875	sr:season:119835	sr:competitor:1644	sr:competitor:1662	\N	\N	not_started	30	sr:venue:843	2025-04-20 17:00:00
sr:sport_event:50955897	sr:season:119835	sr:competitor:1644	sr:competitor:1661	\N	\N	not_started	31	sr:venue:843	2025-04-27 17:00:00
sr:sport_event:51388751	sr:season:119847	sr:competitor:2998	sr:competitor:3001	0	5	closed	3	sr:venue:12069	2024-08-23 19:15:00
sr:sport_event:50955753	sr:season:119835	sr:competitor:1646	sr:competitor:1641	\N	\N	not_started	23	sr:venue:767	2025-02-23 16:00:00
sr:sport_event:51388837	sr:season:119847	sr:competitor:3009	sr:competitor:2995	2	2	closed	8	sr:venue:1137	2024-10-06 14:30:00
sr:sport_event:51383363	sr:season:119847	sr:competitor:3001	sr:competitor:3036	3	1	closed	1	sr:venue:910	2024-08-09 19:15:00
sr:sport_event:50955655	sr:season:119835	sr:competitor:1678	sr:competitor:1647	\N	\N	not_started	18	sr:venue:845	2025-01-19 16:00:00
sr:sport_event:50955627	sr:season:119835	sr:competitor:1661	sr:competitor:1658	\N	\N	not_started	16	sr:venue:13184	2025-01-05 16:00:00
sr:sport_event:50955959	sr:season:119835	sr:competitor:1644	sr:competitor:1646	\N	\N	not_started	34	sr:venue:843	2025-05-18 17:00:00
sr:sport_event:51388795	sr:season:119847	sr:competitor:3011	sr:competitor:744135	1	0	closed	6	sr:venue:5318	2024-09-21 14:30:00
sr:sport_event:51388857	sr:season:119847	sr:competitor:36365	sr:competitor:3013	1	0	closed	9	sr:venue:2645	2024-10-25 17:45:00
sr:sport_event:51383377	sr:season:119847	sr:competitor:4500	sr:competitor:3011	1	4	closed	1	sr:venue:5326	2024-08-11 14:30:00
sr:sport_event:51388723	sr:season:119847	sr:competitor:3011	sr:competitor:3002	0	2	closed	2	sr:venue:5318	2024-08-16 16:00:00
sr:sport_event:51388865	sr:season:119847	sr:competitor:4500	sr:competitor:25777	4	1	closed	9	sr:venue:5326	2024-10-26 14:30:00
sr:sport_event:51383357	sr:season:119847	sr:competitor:49531	sr:competitor:3006	2	0	closed	1	sr:venue:16520	2024-08-11 17:00:00
sr:sport_event:51388853	sr:season:119847	sr:competitor:2999	sr:competitor:2998	2	0	closed	9	sr:venue:951	2024-10-27 15:30:00
sr:sport_event:51388851	sr:season:119847	sr:competitor:3006	sr:competitor:3036	5	0	closed	9	sr:venue:902	2024-10-27 18:00:00
sr:sport_event:51388863	sr:season:119847	sr:competitor:1031053	sr:competitor:3002	0	5	closed	9	sr:venue:8249	2024-10-28 20:15:00
sr:sport_event:51388757	sr:season:119847	sr:competitor:36365	sr:competitor:3011	0	2	closed	3	sr:venue:43626	2024-08-24 14:30:00
sr:sport_event:51269237	sr:season:118693	sr:competitor:2524	sr:competitor:2556	\N	\N	not_started	13	sr:venue:816	2024-12-08 14:30:00
sr:sport_event:51269271	sr:season:118693	sr:competitor:2569	sr:competitor:2527	\N	\N	not_started	15	sr:venue:1089	2024-12-21 14:30:00
sr:sport_event:51095959	sr:season:118699	sr:competitor:2	sr:competitor:74	\N	\N	not_started	25	sr:venue:638	2025-01-01 15:00:00
sr:sport_event:50867793	sr:season:119799	sr:competitor:2952	sr:competitor:2956	5	1	closed	1	sr:venue:726	2024-08-10 19:00:00
sr:sport_event:50868439	sr:season:119799	sr:competitor:2948	sr:competitor:2964	\N	\N	not_started	27	sr:venue:786	2025-03-29 17:00:00
sr:sport_event:50868143	sr:season:119799	sr:competitor:2950	sr:competitor:2979	2	2	closed	10	sr:venue:615	2024-10-27 19:00:00
sr:sport_event:50868509	sr:season:119799	sr:competitor:2964	sr:competitor:2962	\N	\N	not_started	30	sr:venue:569	2025-04-23 16:00:00
sr:sport_event:50852517	sr:season:118691	sr:competitor:2828	sr:competitor:2821	\N	\N	not_started	22	sr:venue:691	2025-02-02 19:00:00
sr:sport_event:50849967	sr:season:118689	sr:competitor:35	sr:competitor:43	1	0	closed	1	sr:venue:9	2024-08-16 19:00:00
sr:sport_event:50850013	sr:season:118689	sr:competitor:48	sr:competitor:60	2	3	closed	3	sr:venue:12	2024-08-31 14:00:00
sr:sport_event:50850327	sr:season:118689	sr:competitor:40	sr:competitor:30	\N	\N	not_started	19	sr:venue:815	2024-12-30 19:45:00
sr:sport_event:51388937	sr:season:119847	sr:competitor:36365	sr:competitor:1031053	\N	\N	not_started	13	sr:venue:43626	2024-12-08 18:00:00
sr:sport_event:51389227	sr:season:119847	sr:competitor:3010	sr:competitor:3011	\N	\N	not_started	26	sr:venue:2539	2025-03-16 18:00:00
sr:sport_event:50955363	sr:season:119835	sr:competitor:1647	sr:competitor:1646	2	0	closed	2	sr:venue:953	2024-08-25 15:00:00
sr:sport_event:50955421	sr:season:119835	sr:competitor:1684	sr:competitor:1647	1	1	closed	5	sr:venue:19889	2024-09-22 15:00:00
sr:sport_event:50955515	sr:season:119835	sr:competitor:1678	sr:competitor:1659	2	0	closed	10	sr:venue:845	2024-11-02 20:00:00
sr:sport_event:50955941	sr:season:119835	sr:competitor:1653	sr:competitor:1649	\N	\N	not_started	33	sr:venue:831	2025-05-11 17:00:00
sr:sport_event:46655737	sr:season:114317	sr:competitor:4937	sr:competitor:3202	0	0	closed	8	sr:venue:2388	2024-07-28 23:30:00
sr:sport_event:50850007	sr:season:118689	sr:competitor:42	sr:competitor:30	1	1	closed	3	sr:venue:624	2024-08-31 11:30:00
sr:sport_event:51388931	sr:season:119847	sr:competitor:3014	sr:competitor:3001	\N	\N	not_started	13	sr:venue:5312	2024-12-05 20:15:00
sr:sport_event:51388747	sr:season:119847	sr:competitor:25777	sr:competitor:3013	1	0	closed	3	sr:venue:8289	2024-08-25 14:30:00
sr:sport_event:51388761	sr:season:119847	sr:competitor:2995	sr:competitor:4500	0	0	closed	4	sr:venue:14556	2024-08-31 17:00:00
sr:sport_event:51389045	sr:season:119847	sr:competitor:1031053	sr:competitor:3010	\N	\N	not_started	19	sr:venue:8249	2025-01-26 18:00:00
sr:sport_event:51388917	sr:season:119847	sr:competitor:3036	sr:competitor:3014	\N	\N	not_started	12	sr:venue:2013	2024-11-30 15:30:00
sr:sport_event:50955365	sr:season:119835	sr:competitor:1678	sr:competitor:1662	0	2	closed	2	sr:venue:845	2024-08-24 19:00:00
sr:sport_event:50955957	sr:season:119835	sr:competitor:1648	sr:competitor:1653	\N	\N	not_started	34	sr:venue:835	2025-05-18 17:00:00
sr:sport_event:46655545	sr:season:114317	sr:competitor:3218	sr:competitor:36842	0	2	closed	1	sr:venue:981	2024-05-12 20:45:00
sr:sport_event:46655639	sr:season:114317	sr:competitor:3217	sr:competitor:3218	1	1	closed	4	sr:venue:1329	2024-06-02 21:00:00
sr:sport_event:50867989	sr:season:119799	sr:competitor:2955	sr:competitor:2960	1	1	closed	2	sr:venue:584	2024-08-17 16:45:00
sr:sport_event:50868139	sr:season:119799	sr:competitor:2964	sr:competitor:2960	2	0	closed	10	sr:venue:569	2024-10-26 19:00:00
sr:sport_event:50868311	sr:season:119799	sr:competitor:2953	sr:competitor:2979	\N	\N	not_started	20	sr:venue:577	2025-01-26 15:45:00
sr:sport_event:50867791	sr:season:119799	sr:competitor:2948	sr:competitor:2971	1	0	closed	1	sr:venue:786	2024-08-11 12:30:00
sr:sport_event:50868021	sr:season:119799	sr:competitor:2979	sr:competitor:2956	2	0	closed	3	sr:venue:3293	2024-08-25 14:45:00
sr:sport_event:50868267	sr:season:119799	sr:competitor:2952	sr:competitor:2959	\N	\N	not_started	17	sr:venue:726	2024-12-22 13:30:00
sr:sport_event:50852615	sr:season:118691	sr:competitor:2814	sr:competitor:24264	\N	\N	not_started	27	sr:venue:1307	2025-03-09 18:00:00
sr:sport_event:50868309	sr:season:119799	sr:competitor:2961	sr:competitor:2959	\N	\N	not_started	19	sr:venue:826	2025-01-18 19:00:00
sr:sport_event:50852619	sr:season:118691	sr:competitor:2829	sr:competitor:2818	\N	\N	not_started	27	sr:venue:754	2025-03-09 18:00:00
sr:sport_event:50849985	sr:season:118689	sr:competitor:31	sr:competitor:33	1	1	closed	1	sr:venue:2183	2024-08-19 19:00:00
sr:sport_event:50850103	sr:season:118689	sr:competitor:17	sr:competitor:43	3	2	closed	7	sr:venue:606	2024-10-05 14:00:00
sr:sport_event:50850031	sr:season:118689	sr:competitor:30	sr:competitor:32	0	0	closed	4	sr:venue:2443	2024-09-14 14:00:00
sr:sport_event:50850095	sr:season:118689	sr:competitor:38	sr:competitor:14	1	1	closed	7	sr:venue:799	2024-10-06 13:00:00
sr:sport_event:50850255	sr:season:118689	sr:competitor:43	sr:competitor:42	\N	\N	not_started	15	sr:venue:611	2024-12-08 14:00:00
sr:sport_event:51389087	sr:season:119847	sr:competitor:3001	sr:competitor:25777	\N	\N	not_started	22	sr:venue:910	2025-02-16 18:00:00
sr:sport_event:51388759	sr:season:119847	sr:competitor:3011	sr:competitor:1031053	2	1	closed	4	sr:venue:5318	2024-08-31 14:30:00
sr:sport_event:51388911	sr:season:119847	sr:competitor:3013	sr:competitor:2995	\N	\N	not_started	12	sr:venue:1335	2024-11-30 18:00:00
sr:sport_event:50868361	sr:season:119799	sr:competitor:2952	sr:competitor:2961	\N	\N	not_started	22	sr:venue:726	2025-02-07 17:00:00
sr:sport_event:50868327	sr:season:119799	sr:competitor:2956	sr:competitor:2961	\N	\N	not_started	20	sr:venue:685	2025-01-26 13:30:00
sr:sport_event:50955425	sr:season:119835	sr:competitor:1643	sr:competitor:1659	3	3	closed	5	sr:venue:837	2024-09-21 15:00:00
sr:sport_event:50955381	sr:season:119835	sr:competitor:1715	sr:competitor:1678	4	0	closed	3	sr:venue:1858	2024-08-31 15:00:00
sr:sport_event:50955531	sr:season:119835	sr:competitor:1648	sr:competitor:1647	3	2	closed	11	sr:venue:835	2024-11-09 18:00:00
sr:sport_event:50955843	sr:season:119835	sr:competitor:1644	sr:competitor:1684	\N	\N	not_started	28	sr:venue:843	2025-04-06 17:00:00
sr:sport_event:46657251	sr:season:114317	sr:competitor:36839	sr:competitor:6074	\N	\N	not_started	25	sr:venue:12025	2024-12-01 00:45:00
sr:sport_event:51268973	sr:season:118693	sr:competitor:5885	sr:competitor:2538	0	3	closed	4	sr:venue:34054	2024-09-21 13:30:00
sr:sport_event:51269431	sr:season:118693	sr:competitor:5885	sr:competitor:2527	\N	\N	not_started	24	sr:venue:34054	2025-03-01 14:30:00
sr:sport_event:50868577	sr:season:119799	sr:competitor:2956	sr:competitor:2979	\N	\N	not_started	34	sr:venue:685	2025-05-18 12:30:00
sr:sport_event:51096911	sr:season:118699	sr:competitor:46	sr:competitor:24	\N	\N	not_started	45	sr:venue:631	2025-04-26 14:00:00
sr:sport_event:50850191	sr:season:118689	sr:competitor:40	sr:competitor:7	2	2	closed	12	sr:venue:815	2024-11-23 15:00:00
sr:sport_event:51388905	sr:season:119847	sr:competitor:3009	sr:competitor:3010	\N	\N	not_started	12	sr:venue:1137	2024-12-02 18:45:00
sr:sport_event:51388729	sr:season:119847	sr:competitor:744135	sr:competitor:49531	0	3	closed	2	sr:venue:53523	2024-08-19 19:15:00
sr:sport_event:51388941	sr:season:119847	sr:competitor:25777	sr:competitor:3011	\N	\N	not_started	14	sr:venue:8289	2024-12-15 15:30:00
sr:sport_event:50955351	sr:season:119835	sr:competitor:1682	sr:competitor:1643	0	2	closed	1	sr:venue:1871	2024-08-17 17:00:00
sr:sport_event:50955379	sr:season:119835	sr:competitor:1649	sr:competitor:1659	4	3	closed	3	sr:venue:17406	2024-08-30 18:45:00
sr:sport_event:50955473	sr:season:119835	sr:competitor:1647	sr:competitor:1661	1	1	closed	8	sr:venue:953	2024-10-20 15:00:00
sr:sport_event:46655595	sr:season:114317	sr:competitor:7628	sr:competitor:3215	0	4	closed	3	sr:venue:4738	2024-05-24 22:00:00
sr:sport_event:46655781	sr:season:114317	sr:competitor:3210	sr:competitor:4937	1	1	closed	9	sr:venue:2388	2024-08-03 20:15:00
sr:sport_event:46655567	sr:season:114317	sr:competitor:36837	sr:competitor:3209	0	0	closed	2	sr:venue:12712	2024-05-19 18:30:00
sr:sport_event:46657241	sr:season:114317	sr:competitor:36833	sr:competitor:3212	\N	\N	not_started	25	sr:venue:12017	2024-12-03 01:00:00
sr:sport_event:51269231	sr:season:118693	sr:competitor:2672	sr:competitor:5885	\N	\N	not_started	13	sr:venue:574	2024-12-07 14:30:00
sr:sport_event:51269305	sr:season:118693	sr:competitor:2674	sr:competitor:2538	\N	\N	not_started	17	sr:venue:67707	2025-01-14 19:30:00
sr:sport_event:51269549	sr:season:118693	sr:competitor:2526	sr:competitor:2681	\N	\N	not_started	30	sr:venue:791	2025-04-19 13:30:00
sr:sport_event:51095963	sr:season:118699	sr:competitor:1	sr:competitor:24	\N	\N	not_started	25	sr:venue:1693	2025-01-01 12:30:00
sr:sport_event:51096233	sr:season:118699	sr:competitor:58	sr:competitor:74	\N	\N	not_started	31	sr:venue:2505	2025-02-09 12:00:00
sr:sport_event:50867795	sr:season:119799	sr:competitor:2960	sr:competitor:2977	0	0	closed	1	sr:venue:656	2024-08-11 10:15:00
sr:sport_event:50868009	sr:season:119799	sr:competitor:2990	sr:competitor:2952	1	7	closed	3	sr:venue:3261	2024-08-24 18:00:00
sr:sport_event:50868093	sr:season:119799	sr:competitor:2950	sr:competitor:2948	1	2	closed	7	sr:venue:615	2024-09-29 18:00:00
sr:sport_event:50852437	sr:season:118691	sr:competitor:2828	sr:competitor:2885	\N	\N	not_started	18	sr:venue:691	2024-12-22 13:00:00
sr:sport_event:50849983	sr:season:118689	sr:competitor:38	sr:competitor:17	0	2	closed	1	sr:venue:799	2024-08-18 15:30:00
sr:sport_event:50850037	sr:season:118689	sr:competitor:44	sr:competitor:14	0	1	closed	4	sr:venue:579	2024-09-14 14:00:00
sr:sport_event:46655693	sr:season:114317	sr:competitor:3217	sr:competitor:42338	4	2	closed	6	sr:venue:1329	2024-07-20 00:00:00
sr:sport_event:46655697	sr:season:114317	sr:competitor:3211	sr:competitor:3218	2	2	closed	6	sr:venue:1009	2024-07-21 18:00:00
sr:sport_event:46655901	sr:season:114317	sr:competitor:65668	sr:competitor:3219	0	1	closed	14	sr:venue:69401	2024-09-16 18:00:00
sr:sport_event:51269017	sr:season:118693	sr:competitor:2524	sr:competitor:2677	2	2	closed	5	sr:venue:816	2024-09-28 13:30:00
sr:sport_event:51095663	sr:season:118699	sr:competitor:41	sr:competitor:29	\N	\N	not_started	19	sr:venue:851	2024-12-07 12:30:00
sr:sport_event:50867995	sr:season:119799	sr:competitor:2977	sr:competitor:2952	1	3	closed	2	sr:venue:729	2024-08-18 10:15:00
sr:sport_event:50868041	sr:season:119799	sr:competitor:2955	sr:competitor:2971	1	1	closed	5	sr:venue:584	2024-09-14 14:30:00
sr:sport_event:50849973	sr:season:118689	sr:competitor:48	sr:competitor:30	0	3	closed	1	sr:venue:12	2024-08-17 14:00:00
sr:sport_event:50850157	sr:season:118689	sr:competitor:39	sr:competitor:42	1	0	closed	10	sr:venue:765	2024-11-02 12:30:00
sr:sport_event:50850049	sr:season:118689	sr:competitor:30	sr:competitor:14	2	2	closed	5	sr:venue:2443	2024-09-22 13:00:00
sr:sport_event:51389021	sr:season:119847	sr:competitor:3006	sr:competitor:49531	\N	\N	not_started	18	sr:venue:902	2025-01-19 18:00:00
sr:sport_event:51388741	sr:season:119847	sr:competitor:3006	sr:competitor:744135	1	0	closed	3	sr:venue:902	2024-08-24 19:30:00
sr:sport_event:51388801	sr:season:119847	sr:competitor:3013	sr:competitor:2999	0	3	closed	6	sr:venue:1335	2024-09-20 19:15:00
sr:sport_event:51388945	sr:season:119847	sr:competitor:1031053	sr:competitor:3006	\N	\N	not_started	14	sr:venue:8249	2024-12-15 18:00:00
sr:sport_event:50955343	sr:season:119835	sr:competitor:1642	sr:competitor:1659	1	1	closed	1	sr:venue:1275	2024-08-18 15:00:00
sr:sport_event:50955419	sr:season:119835	sr:competitor:1715	sr:competitor:1681	2	0	closed	5	sr:venue:1858	2024-09-22 15:00:00
sr:sport_event:50955493	sr:season:119835	sr:competitor:1642	sr:competitor:1681	0	3	closed	9	sr:venue:1275	2024-10-27 16:00:00
sr:sport_event:46655613	sr:season:114317	sr:competitor:3209	sr:competitor:3208	1	1	closed	3	sr:venue:1099	2024-05-26 23:00:00
sr:sport_event:51388737	sr:season:119847	sr:competitor:3036	sr:competitor:2998	1	0	closed	2	sr:venue:2013	2024-08-17 14:30:00
sr:sport_event:51389369	sr:season:119847	sr:competitor:2998	sr:competitor:3011	\N	\N	not_started	34	sr:venue:12069	2025-05-17 17:00:00
sr:sport_event:51388897	sr:season:119847	sr:competitor:49531	sr:competitor:25777	0	0	closed	11	sr:venue:16520	2024-11-09 18:00:00
sr:sport_event:50955375	sr:season:119835	sr:competitor:1641	sr:competitor:1682	2	2	closed	2	sr:venue:839	2024-08-25 18:45:00
sr:sport_event:50955853	sr:season:119835	sr:competitor:1646	sr:competitor:1649	\N	\N	not_started	29	sr:venue:767	2025-04-13 17:00:00
sr:sport_event:50955439	sr:season:119835	sr:competitor:1647	sr:competitor:1678	2	2	closed	6	sr:venue:953	2024-09-29 15:00:00
sr:sport_event:50955613	sr:season:119835	sr:competitor:1649	sr:competitor:1642	\N	\N	not_started	16	sr:venue:17406	2025-01-05 16:00:00
sr:sport_event:46655573	sr:season:114317	sr:competitor:3219	sr:competitor:7629	1	1	closed	2	sr:venue:634	2024-05-19 20:45:00
sr:sport_event:46655635	sr:season:114317	sr:competitor:3201	sr:competitor:42338	0	1	closed	4	sr:venue:14324	2024-06-03 22:00:00
sr:sport_event:46655707	sr:season:114317	sr:competitor:3218	sr:competitor:3203	3	2	closed	7	sr:venue:981	2024-07-25 21:45:00
sr:sport_event:51095637	sr:season:118699	sr:competitor:72	sr:competitor:74	\N	\N	not_started	19	sr:venue:2178	2024-12-07 15:00:00
sr:sport_event:51096289	sr:season:118699	sr:competitor:72	sr:competitor:15	\N	\N	not_started	33	sr:venue:2178	2025-02-15 15:00:00
sr:sport_event:51096019	sr:season:118699	sr:competitor:41	sr:competitor:2	\N	\N	not_started	26	sr:venue:851	2025-01-05 15:00:00
sr:sport_event:50867991	sr:season:119799	sr:competitor:2950	sr:competitor:2962	1	0	closed	2	sr:venue:615	2024-08-17 18:00:00
sr:sport_event:50868069	sr:season:119799	sr:competitor:2964	sr:competitor:2951	2	1	closed	6	sr:venue:569	2024-09-22 10:15:00
sr:sport_event:50852407	sr:season:118691	sr:competitor:2885	sr:competitor:2825	\N	\N	not_started	17	sr:venue:9311	2024-12-15 15:15:00
sr:sport_event:50852729	sr:season:118691	sr:competitor:2821	sr:competitor:2819	\N	\N	not_started	33	sr:venue:697	2025-04-23 17:00:00
sr:sport_event:50850087	sr:season:118689	sr:competitor:42	sr:competitor:45	3	1	closed	7	sr:venue:624	2024-10-05 14:00:00
sr:sport_event:50849981	sr:season:118689	sr:competitor:50	sr:competitor:7	2	1	closed	1	sr:venue:53349	2024-08-18 13:00:00
sr:sport_event:50850237	sr:season:118689	sr:competitor:32	sr:competitor:7	\N	\N	not_started	14	sr:venue:2188	2024-12-03 19:30:00
sr:sport_event:50850169	sr:season:118689	sr:competitor:30	sr:competitor:17	2	1	closed	11	sr:venue:2443	2024-11-09 17:30:00
sr:sport_event:51269239	sr:season:118693	sr:competitor:2527	sr:competitor:2673	\N	\N	not_started	13	sr:venue:788	2024-12-07 17:30:00
sr:sport_event:51269291	sr:season:118693	sr:competitor:2600	sr:competitor:2677	\N	\N	not_started	16	sr:venue:1655	2025-01-12 16:30:00
sr:sport_event:51095685	sr:season:118699	sr:competitor:25	sr:competitor:15	\N	\N	not_started	20	sr:venue:2352	2024-12-11 19:45:00
sr:sport_event:51095855	sr:season:118699	sr:competitor:21	sr:competitor:96	\N	\N	not_started	23	sr:venue:3002	2024-12-26 15:00:00
sr:sport_event:50867797	sr:season:119799	sr:competitor:2990	sr:competitor:2950	0	1	closed	1	sr:venue:3261	2024-08-10 18:00:00
sr:sport_event:50868085	sr:season:119799	sr:competitor:2961	sr:competitor:2952	0	2	closed	7	sr:venue:826	2024-09-28 14:30:00
sr:sport_event:50868313	sr:season:119799	sr:competitor:2950	sr:competitor:2960	\N	\N	not_started	20	sr:venue:615	2025-01-26 13:30:00
sr:sport_event:50850097	sr:season:118689	sr:competitor:7	sr:competitor:44	0	1	closed	7	sr:venue:10	2024-10-05 11:30:00
sr:sport_event:50849999	sr:season:118689	sr:competitor:17	sr:competitor:32	4	1	closed	2	sr:venue:606	2024-08-24 14:00:00
sr:sport_event:51388913	sr:season:119847	sr:competitor:3002	sr:competitor:36365	\N	\N	not_started	12	sr:venue:907	2024-12-02 20:45:00
sr:sport_event:51389019	sr:season:119847	sr:competitor:3013	sr:competitor:1031053	\N	\N	not_started	18	sr:venue:1335	2025-01-19 18:00:00
sr:sport_event:50955353	sr:season:119835	sr:competitor:1646	sr:competitor:1661	2	1	closed	1	sr:venue:767	2024-08-18 13:00:00
sr:sport_event:50955601	sr:season:119835	sr:competitor:1681	sr:competitor:1678	\N	\N	not_started	15	sr:venue:848	2024-12-13 19:45:00
sr:sport_event:50955895	sr:season:119835	sr:competitor:1684	sr:competitor:1643	\N	\N	not_started	31	sr:venue:19889	2025-04-27 17:00:00
sr:sport_event:50955483	sr:season:119835	sr:competitor:1644	sr:competitor:1659	4	2	closed	8	sr:venue:843	2024-10-19 19:00:00
sr:sport_event:46655813	sr:season:114317	sr:competitor:191648	sr:competitor:3218	3	1	closed	10	sr:venue:17150	2024-08-09 18:00:00
sr:sport_event:46657261	sr:season:114317	sr:competitor:3201	sr:competitor:3203	\N	\N	not_started	25	sr:venue:14324	2024-11-29 22:00:00
sr:sport_event:51269025	sr:season:118693	sr:competitor:2527	sr:competitor:2547	1	0	closed	5	sr:venue:788	2024-09-28 13:30:00
sr:sport_event:46655571	sr:season:114317	sr:competitor:36839	sr:competitor:3205	1	1	closed	2	sr:venue:12025	2024-05-18 23:00:00
sr:sport_event:46655777	sr:season:114317	sr:competitor:36833	sr:competitor:36842	2	1	closed	9	sr:venue:12017	2024-08-04 23:00:00
sr:sport_event:51269415	sr:season:118693	sr:competitor:2538	sr:competitor:2534	\N	\N	not_started	23	sr:venue:61056	2025-02-22 14:30:00
sr:sport_event:51095249	sr:season:118699	sr:competitor:36	sr:competitor:15	1	0	closed	11	sr:venue:743	2024-10-23 19:00:00
sr:sport_event:51095373	sr:season:118699	sr:competitor:71	sr:competitor:2	1	0	closed	14	sr:venue:660	2024-11-05 20:00:00
sr:sport_event:51095317	sr:season:118699	sr:competitor:96	sr:competitor:2	1	1	closed	13	sr:venue:1138	2024-11-02 15:00:00
sr:sport_event:51096223	sr:season:118699	sr:competitor:71	sr:competitor:8	\N	\N	not_started	30	sr:venue:660	2025-02-01 12:30:00
sr:sport_event:51096379	sr:season:118699	sr:competitor:61	sr:competitor:72	\N	\N	not_started	37	sr:venue:1514	2025-03-11 19:45:00
sr:sport_event:50868015	sr:season:119799	sr:competitor:2977	sr:competitor:2961	1	1	closed	3	sr:venue:729	2024-08-25 12:30:00
sr:sport_event:50868325	sr:season:119799	sr:competitor:2952	sr:competitor:2947	\N	\N	not_started	20	sr:venue:726	2025-01-25 17:45:00
sr:sport_event:50868383	sr:season:119799	sr:competitor:2961	sr:competitor:2951	\N	\N	not_started	23	sr:venue:826	2025-02-14 17:00:00
sr:sport_event:50868221	sr:season:119799	sr:competitor:2990	sr:competitor:2948	\N	\N	not_started	15	sr:venue:3261	2024-12-08 15:45:00
sr:sport_event:50849993	sr:season:118689	sr:competitor:7	sr:competitor:37	0	2	closed	2	sr:venue:10	2024-08-24 14:00:00
sr:sport_event:50850113	sr:season:118689	sr:competitor:44	sr:competitor:38	2	1	closed	8	sr:venue:579	2024-10-20 15:30:00
sr:sport_event:51388957	sr:season:119847	sr:competitor:3011	sr:competitor:2999	\N	\N	not_started	15	sr:venue:5318	2024-12-22 18:00:00
sr:sport_event:50955403	sr:season:119835	sr:competitor:1681	sr:competitor:1662	2	0	closed	4	sr:venue:848	2024-09-15 15:00:00
sr:sport_event:50955367	sr:season:119835	sr:competitor:1643	sr:competitor:1684	2	0	closed	2	sr:venue:837	2024-08-24 17:00:00
sr:sport_event:50955737	sr:season:119835	sr:competitor:1662	sr:competitor:1661	\N	\N	not_started	22	sr:venue:46514	2025-02-16 16:00:00
sr:sport_event:50955477	sr:season:119835	sr:competitor:1653	sr:competitor:1643	0	0	closed	8	sr:venue:831	2024-10-18 18:45:00
sr:sport_event:46655685	sr:season:114317	sr:competitor:65668	sr:competitor:3212	0	1	closed	6	sr:venue:12021	2024-07-19 18:00:00
sr:sport_event:51095329	sr:season:118699	sr:competitor:36	sr:competitor:11	0	3	closed	13	sr:venue:743	2024-11-02 15:00:00
sr:sport_event:51096861	sr:season:118699	sr:competitor:11	sr:competitor:8	\N	\N	not_started	43	sr:venue:2194	2025-04-18 14:00:00
sr:sport_event:50868001	sr:season:119799	sr:competitor:2947	sr:competitor:2953	2	1	closed	2	sr:venue:2081	2024-08-18 14:45:00
sr:sport_event:50852585	sr:season:118691	sr:competitor:2820	sr:competitor:2828	\N	\N	not_started	26	sr:venue:739	2025-03-02 18:00:00
sr:sport_event:50850069	sr:season:118689	sr:competitor:42	sr:competitor:31	4	2	closed	6	sr:venue:624	2024-09-28 14:00:00
sr:sport_event:50850079	sr:season:118689	sr:competitor:35	sr:competitor:33	0	3	closed	6	sr:venue:9	2024-09-29 15:30:00
sr:sport_event:50850273	sr:season:118689	sr:competitor:38	sr:competitor:50	\N	\N	not_started	16	sr:venue:799	2024-12-15 19:00:00
sr:sport_event:50850011	sr:season:118689	sr:competitor:38	sr:competitor:7	1	1	closed	3	sr:venue:799	2024-09-01 12:30:00
sr:sport_event:51388929	sr:season:119847	sr:competitor:3010	sr:competitor:3013	\N	\N	not_started	13	sr:venue:2539	2024-12-07 15:30:00
sr:sport_event:50955345	sr:season:119835	sr:competitor:1684	sr:competitor:1648	0	1	closed	1	sr:venue:19889	2024-08-18 15:00:00
sr:sport_event:50955487	sr:season:119835	sr:competitor:1648	sr:competitor:1643	0	2	closed	9	sr:venue:835	2024-10-26 19:00:00
sr:sport_event:50955467	sr:season:119835	sr:competitor:1646	sr:competitor:1682	2	1	closed	8	sr:venue:767	2024-10-20 15:00:00
sr:sport_event:46655655	sr:season:114317	sr:competitor:6074	sr:competitor:3217	1	1	closed	5	sr:venue:15676	2024-06-12 20:00:00
sr:sport_event:46657063	sr:season:114317	sr:competitor:3218	sr:competitor:3209	0	2	closed	18	sr:venue:981	2024-10-18 22:15:00
sr:sport_event:51269171	sr:season:118693	sr:competitor:2573	sr:competitor:5885	1	0	closed	9	sr:venue:659	2024-11-02 14:30:00
sr:sport_event:51269215	sr:season:118693	sr:competitor:2534	sr:competitor:2677	\N	\N	not_started	12	sr:venue:821	2024-11-30 14:30:00
sr:sport_event:51269301	sr:season:118693	sr:competitor:2677	sr:competitor:36360	\N	\N	not_started	17	sr:venue:648	2025-01-15 19:30:00
sr:sport_event:50868027	sr:season:119799	sr:competitor:2957	sr:competitor:2962	0	3	closed	4	sr:venue:2769	2024-08-31 16:45:00
sr:sport_event:50868273	sr:season:119799	sr:competitor:2961	sr:competitor:2962	\N	\N	not_started	17	sr:venue:826	2024-12-22 15:45:00
sr:sport_event:50868431	sr:season:119799	sr:competitor:2979	sr:competitor:2961	\N	\N	not_started	26	sr:venue:3293	2025-03-14 17:00:00
sr:sport_event:50852733	sr:season:118691	sr:competitor:2820	sr:competitor:2833	\N	\N	not_started	33	sr:venue:739	2025-04-23 17:00:00
sr:sport_event:50849991	sr:season:118689	sr:competitor:30	sr:competitor:35	2	1	closed	2	sr:venue:2443	2024-08-24 11:30:00
sr:sport_event:50850139	sr:season:118689	sr:competitor:48	sr:competitor:43	1	1	closed	9	sr:venue:12	2024-10-26 16:30:00
sr:sport_event:50850093	sr:season:118689	sr:competitor:30	sr:competitor:33	3	2	closed	7	sr:venue:2443	2024-10-06 15:30:00
sr:sport_event:51388959	sr:season:119847	sr:competitor:3006	sr:competitor:4500	\N	\N	not_started	15	sr:venue:902	2024-12-23 18:45:00
sr:sport_event:50955371	sr:season:119835	sr:competitor:1648	sr:competitor:1715	2	0	closed	2	sr:venue:835	2024-08-25 13:00:00
sr:sport_event:50955571	sr:season:119835	sr:competitor:1641	sr:competitor:1653	\N	\N	not_started	13	sr:venue:839	2024-12-01 19:45:00
sr:sport_event:50955911	sr:season:119835	sr:competitor:1678	sr:competitor:1653	\N	\N	not_started	32	sr:venue:845	2025-05-04 17:00:00
sr:sport_event:50955455	sr:season:119835	sr:competitor:1678	sr:competitor:1646	3	1	closed	7	sr:venue:845	2024-10-05 15:00:00
sr:sport_event:46655647	sr:season:114317	sr:competitor:3216	sr:competitor:65676	2	1	closed	5	sr:venue:613	2024-06-12 22:00:00
sr:sport_event:46655787	sr:season:114317	sr:competitor:65676	sr:competitor:36839	2	0	closed	10	sr:venue:49307	2024-08-11 18:00:00
sr:sport_event:51095453	sr:season:118699	sr:competitor:29	sr:competitor:25	1	1	closed	15	sr:venue:1135	2024-11-09 12:30:00
sr:sport_event:50867799	sr:season:119799	sr:competitor:2979	sr:competitor:2957	0	2	closed	1	sr:venue:3293	2024-08-11 12:30:00
sr:sport_event:50868019	sr:season:119799	sr:competitor:2960	sr:competitor:2959	1	1	closed	3	sr:venue:656	2024-08-25 12:30:00
sr:sport_event:50852507	sr:season:118691	sr:competitor:2820	sr:competitor:2824	\N	\N	not_started	22	sr:venue:739	2025-02-02 19:00:00
sr:sport_event:50849977	sr:season:118689	sr:competitor:14	sr:competitor:60	1	1	closed	1	sr:venue:2230	2024-08-17 14:00:00
sr:sport_event:50850025	sr:season:118689	sr:competitor:37	sr:competitor:17	1	3	closed	3	sr:venue:18379	2024-08-31 16:30:00
sr:sport_event:50850445	sr:season:118689	sr:competitor:3	sr:competitor:40	\N	\N	not_started	24	sr:venue:1272	2025-02-01 15:00:00
sr:sport_event:50850173	sr:season:118689	sr:competitor:7	sr:competitor:43	0	2	closed	11	sr:venue:10	2024-11-09 15:00:00
sr:sport_event:50850265	sr:season:118689	sr:competitor:37	sr:competitor:3	\N	\N	not_started	15	sr:venue:18379	2024-12-09 20:00:00
sr:sport_event:51389057	sr:season:119847	sr:competitor:3010	sr:competitor:4500	\N	\N	not_started	20	sr:venue:2539	2025-02-02 18:00:00
sr:sport_event:51389077	sr:season:119847	sr:competitor:2998	sr:competitor:3013	\N	\N	not_started	21	sr:venue:12069	2025-02-09 18:00:00
sr:sport_event:50955349	sr:season:119835	sr:competitor:1653	sr:competitor:1678	1	0	closed	1	sr:venue:831	2024-08-17 19:00:00
sr:sport_event:50955653	sr:season:119835	sr:competitor:1649	sr:competitor:1681	\N	\N	not_started	18	sr:venue:17406	2025-01-19 16:00:00
sr:sport_event:50955431	sr:season:119835	sr:competitor:1659	sr:competitor:1641	1	0	closed	6	sr:venue:847	2024-09-29 18:45:00
sr:sport_event:50955501	sr:season:119835	sr:competitor:1682	sr:competitor:1715	1	2	closed	9	sr:venue:1871	2024-10-26 17:00:00
sr:sport_event:46655615	sr:season:114317	sr:competitor:36833	sr:competitor:36837	1	1	closed	3	sr:venue:12017	2024-05-28 00:00:00
sr:sport_event:46655929	sr:season:114317	sr:competitor:3204	sr:competitor:6074	3	1	closed	15	sr:venue:4754	2024-09-20 23:00:00
sr:sport_event:51269279	sr:season:118693	sr:competitor:2573	sr:competitor:2600	\N	\N	not_started	15	sr:venue:659	2024-12-21 14:30:00
sr:sport_event:51095139	sr:season:118699	sr:competitor:29	sr:competitor:2	6	1	closed	8	sr:venue:1135	2024-10-02 18:45:00
sr:sport_event:51095861	sr:season:118699	sr:competitor:15	sr:competitor:6	\N	\N	not_started	23	sr:venue:598	2024-12-26 15:00:00
sr:sport_event:50867987	sr:season:119799	sr:competitor:2964	sr:competitor:2948	1	1	closed	2	sr:venue:569	2024-08-17 14:30:00
sr:sport_event:50867999	sr:season:119799	sr:competitor:2961	sr:competitor:2979	2	0	closed	2	sr:venue:826	2024-08-18 12:30:00
sr:sport_event:50868047	sr:season:119799	sr:competitor:2950	sr:competitor:2964	9	1	closed	5	sr:venue:615	2024-09-14 19:00:00
sr:sport_event:50868111	sr:season:119799	sr:competitor:2957	sr:competitor:2950	1	0	closed	8	sr:venue:2769	2024-10-06 18:00:00
sr:sport_event:50868321	sr:season:119799	sr:competitor:2957	sr:competitor:2971	\N	\N	not_started	20	sr:venue:2769	2025-01-26 11:15:00
sr:sport_event:50852491	sr:season:118691	sr:competitor:2826	sr:competitor:2816	\N	\N	not_started	21	sr:venue:760	2025-01-26 19:00:00
sr:sport_event:50868459	sr:season:119799	sr:competitor:2990	sr:competitor:2971	\N	\N	not_started	28	sr:venue:3261	2025-04-04 16:00:00
sr:sport_event:55608041	sr:season:118691	sr:competitor:2814	sr:competitor:2828	\N	\N	not_started	13	sr:venue:1307	2024-12-18 20:30:00
sr:sport_event:50850001	sr:season:118689	sr:competitor:45	sr:competitor:14	0	1	closed	2	sr:venue:2231	2024-08-24 14:00:00
sr:sport_event:50850019	sr:season:118689	sr:competitor:35	sr:competitor:44	0	3	closed	3	sr:venue:9	2024-09-01 15:00:00
sr:sport_event:50850365	sr:season:118689	sr:competitor:3	sr:competitor:14	\N	\N	not_started	20	sr:venue:1272	2025-01-06 20:00:00
sr:sport_event:51388773	sr:season:119847	sr:competitor:3013	sr:competitor:2998	2	0	closed	4	sr:venue:1335	2024-09-01 14:30:00
sr:sport_event:51389247	sr:season:119847	sr:competitor:744135	sr:competitor:3001	\N	\N	not_started	27	sr:venue:53523	2025-03-30 17:00:00
sr:sport_event:50955369	sr:season:119835	sr:competitor:1661	sr:competitor:1681	1	1	closed	2	sr:venue:13184	2024-08-25 15:00:00
sr:sport_event:50955505	sr:season:119835	sr:competitor:1681	sr:competitor:1682	1	0	closed	10	sr:venue:848	2024-11-03 14:00:00
sr:sport_event:50955803	sr:season:119835	sr:competitor:1649	sr:competitor:1662	\N	\N	not_started	26	sr:venue:17406	2025-03-16 17:00:00
sr:sport_event:46655641	sr:season:114317	sr:competitor:3215	sr:competitor:191648	1	0	closed	4	sr:venue:12033	2024-06-01 21:00:00
sr:sport_event:50867789	sr:season:119799	sr:competitor:2962	sr:competitor:2955	1	2	closed	1	sr:venue:689	2024-08-10 16:45:00
sr:sport_event:50868011	sr:season:119799	sr:competitor:2947	sr:competitor:2948	1	2	closed	3	sr:venue:2081	2024-08-24 19:00:00
sr:sport_event:50868299	sr:season:119799	sr:competitor:2962	sr:competitor:2957	\N	\N	not_started	19	sr:venue:689	2025-01-19 15:45:00
sr:sport_event:50868369	sr:season:119799	sr:competitor:2950	sr:competitor:2957	\N	\N	not_started	23	sr:venue:615	2025-02-14 17:00:00
sr:sport_event:50868377	sr:season:119799	sr:competitor:2947	sr:competitor:2959	\N	\N	not_started	23	sr:venue:2081	2025-02-14 17:00:00
sr:sport_event:50850059	sr:season:118689	sr:competitor:17	sr:competitor:42	2	2	closed	5	sr:venue:606	2024-09-22 15:30:00
sr:sport_event:50849997	sr:season:118689	sr:competitor:44	sr:competitor:50	2	0	closed	2	sr:venue:579	2024-08-25 15:30:00
sr:sport_event:50955341	sr:season:119835	sr:competitor:1715	sr:competitor:1641	1	5	closed	1	sr:venue:1858	2024-08-17 15:00:00
sr:sport_event:50955361	sr:season:119835	sr:competitor:1659	sr:competitor:1658	3	1	closed	2	sr:venue:847	2024-08-25 15:00:00
sr:sport_event:50955401	sr:season:119835	sr:competitor:1647	sr:competitor:1682	1	2	closed	4	sr:venue:953	2024-09-15 15:00:00
sr:sport_event:50955567	sr:season:119835	sr:competitor:1642	sr:competitor:1643	\N	\N	not_started	13	sr:venue:1275	2024-12-01 14:00:00
sr:sport_event:50955705	sr:season:119835	sr:competitor:1646	sr:competitor:1681	\N	\N	not_started	21	sr:venue:767	2025-02-09 16:00:00
sr:sport_event:46657207	sr:season:114317	sr:competitor:3201	sr:competitor:3215	1	2	closed	23	sr:venue:14324	2024-11-17 20:30:00
sr:sport_event:51268995	sr:season:118693	sr:competitor:2672	sr:competitor:2681	1	1	closed	5	sr:venue:574	2024-09-28 16:30:00
sr:sport_event:50868007	sr:season:119799	sr:competitor:2962	sr:competitor:2971	1	0	closed	3	sr:venue:689	2024-08-24 16:45:00
sr:sport_event:50868191	sr:season:119799	sr:competitor:2977	sr:competitor:2956	2	2	closed	13	sr:venue:729	2024-11-23 17:45:00
sr:sport_event:50868349	sr:season:119799	sr:competitor:2950	sr:competitor:2971	\N	\N	not_started	22	sr:venue:615	2025-02-07 17:00:00
sr:sport_event:50868277	sr:season:119799	sr:competitor:2951	sr:competitor:2990	\N	\N	not_started	18	sr:venue:35438	2025-01-12 13:30:00
sr:sport_event:50868363	sr:season:119799	sr:competitor:2956	sr:competitor:2947	\N	\N	not_started	22	sr:venue:685	2025-02-07 17:00:00
sr:sport_event:50849987	sr:season:118689	sr:competitor:60	sr:competitor:39	1	1	closed	2	sr:venue:2990	2024-08-25 13:00:00
sr:sport_event:50849989	sr:season:118689	sr:competitor:40	sr:competitor:42	0	2	closed	2	sr:venue:815	2024-08-24 16:30:00
sr:sport_event:50850145	sr:season:118689	sr:competitor:37	sr:competitor:35	2	1	closed	9	sr:venue:18379	2024-10-27 14:00:00
sr:sport_event:50849975	sr:season:118689	sr:competitor:39	sr:competitor:45	1	0	closed	1	sr:venue:765	2024-08-17 14:00:00
sr:sport_event:50955359	sr:season:119835	sr:competitor:1644	sr:competitor:1642	6	0	closed	2	sr:venue:843	2024-08-23 18:45:00
sr:sport_event:46655557	sr:season:114317	sr:competitor:3212	sr:competitor:36837	2	0	closed	1	sr:venue:1567	2024-05-11 00:15:00
sr:sport_event:46655765	sr:season:114317	sr:competitor:42338	sr:competitor:3203	0	0	closed	9	sr:venue:8975	2024-08-04 18:00:00
sr:sport_event:51096267	sr:season:118699	sr:competitor:2	sr:competitor:61	\N	\N	not_started	32	sr:venue:638	2025-02-11 19:45:00
sr:sport_event:51096899	sr:season:118699	sr:competitor:21	sr:competitor:71	\N	\N	not_started	45	sr:venue:3002	2025-04-26 14:00:00
sr:sport_event:50867985	sr:season:119799	sr:competitor:2957	sr:competitor:2990	3	0	closed	2	sr:venue:2769	2024-08-16 18:00:00
sr:sport_event:50867997	sr:season:119799	sr:competitor:2971	sr:competitor:2959	1	5	closed	2	sr:venue:18994	2024-08-18 12:30:00
sr:sport_event:50868473	sr:season:119799	sr:competitor:2960	sr:competitor:2962	\N	\N	not_started	28	sr:venue:656	2025-04-04 16:00:00
sr:sport_event:50868099	sr:season:119799	sr:competitor:2964	sr:competitor:2971	1	1	closed	8	sr:venue:569	2024-10-06 12:30:00
sr:sport_event:50868189	sr:season:119799	sr:competitor:2959	sr:competitor:2964	3	0	closed	13	sr:venue:612	2024-11-23 17:45:00
sr:sport_event:50868223	sr:season:119799	sr:competitor:2950	sr:competitor:2953	\N	\N	not_started	15	sr:venue:615	2024-12-08 13:30:00
sr:sport_event:50849971	sr:season:118689	sr:competitor:42	sr:competitor:3	2	0	closed	1	sr:venue:624	2024-08-17 14:00:00
sr:sport_event:50850005	sr:season:118689	sr:competitor:3	sr:competitor:38	2	6	closed	2	sr:venue:1272	2024-08-25 13:00:00
sr:sport_event:50850141	sr:season:118689	sr:competitor:31	sr:competitor:14	1	3	closed	9	sr:venue:2183	2024-10-25 19:00:00
sr:sport_event:50955355	sr:season:119835	sr:competitor:1662	sr:competitor:1644	1	4	closed	1	sr:venue:46514	2024-08-16 18:45:00
sr:sport_event:50955659	sr:season:119835	sr:competitor:1682	sr:competitor:1662	\N	\N	not_started	18	sr:venue:1871	2025-01-19 16:00:00
sr:sport_event:50955471	sr:season:119835	sr:competitor:1662	sr:competitor:1649	0	4	closed	8	sr:venue:46514	2024-10-20 13:00:00
sr:sport_event:46655627	sr:season:114317	sr:competitor:3219	sr:competitor:3212	2	0	closed	4	sr:venue:634	2024-06-04 23:00:00
sr:sport_event:46655711	sr:season:114317	sr:competitor:42338	sr:competitor:3215	1	0	closed	7	sr:venue:8975	2024-07-24 20:15:00
sr:sport_event:46656991	sr:season:114317	sr:competitor:3201	sr:competitor:3219	2	1	closed	16	sr:venue:14324	2024-09-28 18:00:00
sr:sport_event:46657145	sr:season:114317	sr:competitor:3219	sr:competitor:3203	1	1	closed	21	sr:venue:634	2024-11-06 20:00:00
sr:sport_event:46655905	sr:season:114317	sr:competitor:3201	sr:competitor:3208	0	1	closed	14	sr:venue:14324	2024-09-14 18:00:00
sr:sport_event:46655953	sr:season:114317	sr:competitor:4937	sr:competitor:65668	0	1	closed	15	sr:venue:12033	2024-09-21 22:00:00
sr:sport_event:51268929	sr:season:118693	sr:competitor:2673	sr:competitor:5885	4	2	closed	3	sr:venue:759	2024-09-13 18:30:00
sr:sport_event:50867783	sr:season:119799	sr:competitor:2951	sr:competitor:2947	4	1	closed	1	sr:venue:35438	2024-08-09 18:00:00
sr:sport_event:50867801	sr:season:119799	sr:competitor:2953	sr:competitor:2964	1	0	closed	1	sr:venue:577	2024-08-11 14:45:00
sr:sport_event:50868025	sr:season:119799	sr:competitor:2956	sr:competitor:2950	0	3	closed	4	sr:venue:685	2024-08-30 18:00:00
sr:sport_event:50868345	sr:season:119799	sr:competitor:2960	sr:competitor:2951	\N	\N	not_started	21	sr:venue:656	2025-02-02 15:45:00
sr:sport_event:50852291	sr:season:118691	sr:competitor:2845	sr:competitor:2821	3	0	closed	11	sr:venue:14888	2024-10-27 13:00:00
sr:sport_event:50850003	sr:season:118689	sr:competitor:33	sr:competitor:48	4	0	closed	2	sr:venue:28762	2024-08-24 14:00:00
sr:sport_event:50850091	sr:season:118689	sr:competitor:50	sr:competitor:3	5	3	closed	7	sr:venue:53349	2024-10-05 14:00:00
sr:sport_event:50849979	sr:season:118689	sr:competitor:37	sr:competitor:40	1	2	closed	1	sr:venue:18379	2024-08-17 16:30:00
sr:sport_event:50850161	sr:season:118689	sr:competitor:45	sr:competitor:48	1	0	closed	10	sr:venue:2231	2024-11-02 15:00:00
sr:sport_event:50955347	sr:season:119835	sr:competitor:1681	sr:competitor:1647	0	0	closed	1	sr:venue:848	2024-08-18 15:00:00
sr:sport_event:50955507	sr:season:119835	sr:competitor:1653	sr:competitor:1684	0	1	closed	10	sr:venue:831	2024-11-01 18:00:00
sr:sport_event:50955581	sr:season:119835	sr:competitor:1684	sr:competitor:1649	\N	\N	not_started	14	sr:venue:19889	2024-12-07 20:00:00
sr:sport_event:50955391	sr:season:119835	sr:competitor:1682	sr:competitor:1658	2	1	closed	3	sr:venue:1871	2024-09-01 15:00:00
sr:sport_event:50955691	sr:season:119835	sr:competitor:1642	sr:competitor:1648	\N	\N	not_started	20	sr:venue:1275	2025-02-02 16:00:00
sr:sport_event:46655933	sr:season:114317	sr:competitor:3205	sr:competitor:191648	0	0	closed	15	sr:venue:12003	2024-09-20 20:30:00
sr:sport_event:46655945	sr:season:114317	sr:competitor:36837	sr:competitor:3217	1	0	closed	15	sr:venue:12712	2024-09-22 22:30:00
sr:sport_event:51269187	sr:season:118693	sr:competitor:2542	sr:competitor:2681	1	1	closed	10	sr:venue:738	2024-11-09 14:30:00
sr:sport_event:51095865	sr:season:118699	sr:competitor:29	sr:competitor:34	\N	\N	not_started	23	sr:venue:1135	2024-12-26 20:00:00
sr:sport_event:50849995	sr:season:118689	sr:competitor:43	sr:competitor:31	2	1	closed	2	sr:venue:611	2024-08-24 14:00:00
sr:sport_event:51383361	sr:season:119847	sr:competitor:36365	sr:competitor:2995	0	1	closed	1	sr:venue:43626	2024-08-10 17:00:00
sr:sport_event:50852385	sr:season:118691	sr:competitor:2821	sr:competitor:2826	\N	\N	not_started	16	sr:venue:697	2024-12-06 20:00:00
sr:sport_event:50850187	sr:season:118689	sr:competitor:60	sr:competitor:30	1	2	closed	12	sr:venue:2990	2024-11-23 15:00:00
sr:sport_event:51388807	sr:season:119847	sr:competitor:3036	sr:competitor:4500	2	2	closed	6	sr:venue:2013	2024-09-21 14:30:00
sr:sport_event:51388725	sr:season:119847	sr:competitor:3006	sr:competitor:36365	3	0	closed	2	sr:venue:902	2024-08-17 19:30:00
sr:sport_event:46657077	sr:season:114317	sr:competitor:3209	sr:competitor:6074	1	1	closed	19	sr:venue:1099	2024-10-26 22:30:00
sr:sport_event:51096863	sr:season:118699	sr:competitor:58	sr:competitor:41	\N	\N	not_started	43	sr:venue:2505	2025-04-18 14:00:00
sr:sport_event:50850225	sr:season:118689	sr:competitor:3	sr:competitor:60	\N	\N	not_started	13	sr:venue:1272	2024-11-30 15:00:00
sr:sport_event:51388731	sr:season:119847	sr:competitor:3013	sr:competitor:3001	1	6	closed	2	sr:venue:1335	2024-08-17 17:00:00
sr:sport_event:51388739	sr:season:119847	sr:competitor:3010	sr:competitor:1031053	4	2	closed	2	sr:venue:2539	2024-08-16 19:15:00
sr:sport_event:51383355	sr:season:119847	sr:competitor:1031053	sr:competitor:3013	1	1	closed	1	sr:venue:8249	2024-08-10 14:30:00
sr:sport_event:51389183	sr:season:119847	sr:competitor:3001	sr:competitor:4500	\N	\N	not_started	24	sr:venue:910	2025-03-02 18:00:00
sr:sport_event:51388791	sr:season:119847	sr:competitor:744135	sr:competitor:2995	2	2	closed	5	sr:venue:53523	2024-09-16 19:15:00
sr:sport_event:50955513	sr:season:119835	sr:competitor:1643	sr:competitor:1649	1	1	closed	10	sr:venue:837	2024-11-01 20:00:00
sr:sport_event:51096303	sr:season:118699	sr:competitor:29	sr:competitor:74	\N	\N	not_started	33	sr:venue:1135	2025-02-15 15:00:00
sr:sport_event:51096247	sr:season:118699	sr:competitor:1	sr:competitor:46	\N	\N	not_started	31	sr:venue:1693	2025-02-08 12:30:00
sr:sport_event:51383373	sr:season:119847	sr:competitor:3002	sr:competitor:3010	3	0	closed	1	sr:venue:907	2024-08-10 19:30:00
sr:sport_event:51096281	sr:season:118699	sr:competitor:46	sr:competitor:71	\N	\N	not_started	33	sr:venue:631	2025-02-15 15:00:00
sr:sport_event:50955953	sr:season:119835	sr:competitor:1659	sr:competitor:1662	\N	\N	not_started	34	sr:venue:847	2025-05-18 17:00:00
sr:sport_event:50955475	sr:season:119835	sr:competitor:1642	sr:competitor:1641	0	5	closed	8	sr:venue:1275	2024-10-20 18:45:00
sr:sport_event:46655551	sr:season:114317	sr:competitor:3204	sr:competitor:3219	1	0	closed	1	sr:venue:4754	2024-05-14 00:00:00
sr:sport_event:46655835	sr:season:114317	sr:competitor:3210	sr:competitor:36842	2	1	closed	11	sr:venue:2388	2024-08-17 23:00:00
sr:sport_event:51269223	sr:season:118693	sr:competitor:2547	sr:competitor:2681	\N	\N	not_started	12	sr:venue:578	2024-11-30 14:30:00
sr:sport_event:51095059	sr:season:118699	sr:competitor:6	sr:competitor:71	1	0	closed	8	sr:venue:806	2024-10-01 18:45:00
sr:sport_event:51096207	sr:season:118699	sr:competitor:8	sr:competitor:2	\N	\N	not_started	29	sr:venue:1136	2025-01-25 15:00:00
sr:sport_event:50868031	sr:season:119799	sr:competitor:2990	sr:competitor:2951	1	1	closed	4	sr:venue:3261	2024-08-31 14:30:00
sr:sport_event:50867993	sr:season:119799	sr:competitor:2956	sr:competitor:2951	1	2	closed	2	sr:venue:685	2024-08-17 19:00:00
sr:sport_event:50868151	sr:season:119799	sr:competitor:2977	sr:competitor:2947	2	0	closed	11	sr:venue:729	2024-11-02 17:45:00
sr:sport_event:50852467	sr:season:118691	sr:competitor:2821	sr:competitor:2825	\N	\N	not_started	20	sr:venue:697	2025-01-19 19:00:00
sr:sport_event:50852737	sr:season:118691	sr:competitor:2845	sr:competitor:24264	\N	\N	not_started	33	sr:venue:14888	2025-04-23 17:00:00
sr:sport_event:50850481	sr:season:118689	sr:competitor:48	sr:competitor:35	\N	\N	not_started	26	sr:venue:12	2025-02-22 15:00:00
sr:sport_event:50850171	sr:season:118689	sr:competitor:38	sr:competitor:42	1	1	closed	11	sr:venue:799	2024-11-10 16:30:00
sr:sport_event:51388871	sr:season:119847	sr:competitor:1031053	sr:competitor:49531	2	3	closed	10	sr:venue:8249	2024-11-03 15:30:00
sr:sport_event:51388953	sr:season:119847	sr:competitor:3002	sr:competitor:744135	\N	\N	not_started	14	sr:venue:907	2024-12-16 20:15:00
sr:sport_event:50955373	sr:season:119835	sr:competitor:1649	sr:competitor:1653	0	2	closed	2	sr:venue:17406	2024-08-24 15:00:00
sr:sport_event:50955575	sr:season:119835	sr:competitor:1661	sr:competitor:1662	\N	\N	not_started	14	sr:venue:13184	2024-12-07 18:00:00
sr:sport_event:50955849	sr:season:119835	sr:competitor:1681	sr:competitor:1643	\N	\N	not_started	29	sr:venue:848	2025-04-13 17:00:00
\.


--
-- Data for Name: Player; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Player" (id, name, "teamId", "position", country, number) FROM stdin;
sr:player:42898	Oliveira, Nelson	sr:competitor:3009	forward	PRT	7
sr:player:26056	Marcano, Ivan	sr:competitor:3002	defender	ESP	5
sr:player:116372	Ramos, Claudio	sr:competitor:3002	goalkeeper	PRT	14
sr:player:280835	Grujic, Marko	sr:competitor:3002	midfielder	SRB	8
sr:player:335033	Wendell	sr:competitor:3002	defender	BRA	18
sr:player:552170	Samuel	sr:competitor:3002	goalkeeper	BRA	94
sr:player:819464	Navarro, Fran	sr:competitor:3002	midfielder	ESP	21
sr:player:936350	Costa, Diogo	sr:competitor:3002	goalkeeper	PRT	99
sr:player:1013263	Galeno, Wenderson	sr:competitor:3002	forward	BRA	13
sr:player:1047625	Djalo, Tiago	sr:competitor:3002	defender	PRT	3
sr:player:1047919	Franco, Andre	sr:competitor:3002	midfielder	PRT	20
sr:player:1060885	Jaime, Ivan	sr:competitor:3002	midfielder	ESP	17
sr:player:1067262	Eustaquio, Stephen	sr:competitor:3002	midfielder	CAN	6
sr:player:1089770	Namaso, Danny	sr:competitor:3002	forward	ENG	19
sr:player:1138137	Pepe	sr:competitor:3002	forward	BRA	11
sr:player:1300288	Mario, Joao	sr:competitor:3002	defender	PRT	23
sr:player:1300574	Vieira, Fabio	sr:competitor:3002	midfielder	PRT	10
sr:player:1300594	Borges, Goncalo	sr:competitor:3002	forward	PRT	70
sr:player:1359536	Sanusi, Zaidu	sr:competitor:3002	defender	NGA	12
sr:player:1360408	Perez, Nehuen	sr:competitor:3002	defender	ARG	24
sr:player:1404161	Moura, Francisco	sr:competitor:3002	defender	PRT	74
sr:player:1561958	Ze Pedro	sr:competitor:3002	defender	PRT	97
sr:player:1600852	Gonzalez, Nicolas	sr:competitor:3002	midfielder	ESP	16
sr:player:2069995	Varela, Alan	sr:competitor:3002	midfielder	ARG	22
sr:player:2074539	Otavio	sr:competitor:3002	defender	BRA	4
sr:player:138895	Varela, Bruno	sr:competitor:3009	goalkeeper	CPV	14
sr:player:155985	Charles	sr:competitor:3009	goalkeeper	BRA	27
sr:player:252095	Silva, Tiago	sr:competitor:3009	midfielder	PRT	10
sr:player:252819	Gaspar, Bruno	sr:competitor:3009	defender	AGO	76
sr:player:775079	Fernandes, Jorge	sr:competitor:3009	defender	PRT	44
sr:player:789703	Samu	sr:competitor:3009	midfielder	PRT	20
sr:player:935124	Borevkovic, Toni	sr:competitor:3009	defender	HRV	24
sr:player:936380	Valente Santos, Nuno	sr:competitor:3009	midfielder	PRT	77
sr:player:977229	Villanueva, Mikel	sr:competitor:3009	defender	VEN	3
sr:player:1067538	Mendes, Joao	sr:competitor:3009	midfielder	PRT	17
sr:player:1546059	Ramirez, Jesus .	sr:competitor:3009	forward	VEN	9
sr:player:1883256	Ribeiro, Tomas	sr:competitor:3009	defender	PRT	4
sr:player:1996601	Handel, Tomas	sr:competitor:3009	midfielder	PRT	8
sr:player:2019599	Silva, Gustavo	sr:competitor:3009	midfielder	BRA	71
sr:player:2042807	Arcanjo	sr:competitor:3009	midfielder	CPV	18
sr:player:2065877	Silva, Manu	sr:competitor:3009	midfielder	PRT	6
sr:player:2144598	Bica, Jose	sr:competitor:3009	forward	PRT	79
sr:player:2194352	Maga	sr:competitor:3009	defender	PRT	2
sr:player:2199852	Carlos, Ze	sr:competitor:3009	midfielder	PRT	28
sr:player:2199960	Mendes, Joao	sr:competitor:3009	defender	PRT	13
sr:player:2268489	Sousa Cruz, Marco	sr:competitor:3009	midfielder	PRT	5
sr:player:2281225	Joao Oliveira	sr:competitor:3009	goalkeeper	PRT	\N
sr:player:6562	Moutinho, Joao	sr:competitor:2999	midfielder	PRT	8
sr:player:97012	Bruma	sr:competitor:2999	forward	PRT	7
sr:player:106751	Oliveira, Paulo	sr:competitor:2999	defender	PRT	15
sr:player:2132896	Andre Lopes	sr:competitor:3002	defender	PRT	57
sr:player:2199956	Sousa, Vasco	sr:competitor:3002	midfielder	PRT	15
sr:player:2263049	Bras, Gabriel	sr:competitor:3002	defender	PRT	73
sr:player:2285505	Kaio	sr:competitor:3009	forward	BRA	11
sr:player:2263053	Fernandes, Martim	sr:competitor:3002	defender	PRT	52
sr:player:2399961	Oliveira Baio, Alberto	sr:competitor:3009	defender	PRT	22
sr:player:2570457	Gui	sr:competitor:3009	goalkeeper	PRT	91
sr:player:2870277	Rivas Viondi, Oscar	sr:competitor:3009	defender	ESP	15
sr:player:314380	Horta, Ricardo	sr:competitor:2999	forward	PRT	21
sr:player:2447167	Gul, Deniz	sr:competitor:3002	forward	SWE	27
sr:player:344159	Sa, Tiago	sr:competitor:2999	goalkeeper	PRT	12
sr:player:357730	Ribeiro, Yuri	sr:competitor:2999	defender	PRT	25
sr:player:547242	Marin, Adrian	sr:competitor:2999	defender	ESP	19
sr:player:603946	Matheus	sr:competitor:2999	goalkeeper	BRA	1
sr:player:2539187	Mora, Rodrigo	sr:competitor:3002	forward	PRT	86
sr:player:2610713	Santos, Goncalo	sr:competitor:3002	forward	PRT	49
sr:player:775699	Horta, Andre	sr:competitor:2999	midfielder	PRT	10
sr:player:936580	Guitane, Rafik	sr:competitor:2999	midfielder	FRA	27
sr:player:947246	Carvalho, Vitor	sr:competitor:2999	midfielder	BRA	6
sr:player:1095736	Niakate, Sikou	sr:competitor:2999	defender	MLI	4
sr:player:1115749	Gomez, Victor	sr:competitor:2999	defender	ESP	2
sr:player:2639269	Omorodion, Samuel	sr:competitor:3002	forward	ESP	9
sr:player:2725470	Caicedo Ramos, Bryan Mateo	sr:competitor:3002	forward	COL	87
sr:player:1417739	Bambu, Robson	sr:competitor:2999	defender	BRA	3
sr:player:1425213	Ferreira, Joao	sr:competitor:2999	defender	PRT	13
sr:player:1503743	Hornicek, Lukas	sr:competitor:2999	goalkeeper	CZE	91
sr:player:1795386	Zalazar, Rodrigo	sr:competitor:2999	midfielder	URY	16
sr:player:1886668	Arrey-Mbi, Bright	sr:competitor:2999	defender	DEU	26
sr:player:1990943	El Ouazzani, Amine	sr:competitor:2999	forward	MAR	9
sr:player:2114366	Barros Goncalves, Jose Pedro	sr:competitor:2999	defender	PRT	73
sr:player:2144106	Gharbi, Ismael	sr:competitor:2999	forward	FRA	20
sr:player:2153016	Fernandez, Roberto	sr:competitor:2999	forward	ESP	90
sr:player:2195940	Fernandes, Roger	sr:competitor:2999	forward	PRT	11
sr:player:2202944	Martinez, Gabri	sr:competitor:2999	forward	ESP	77
sr:player:2211412	Gorby, Jean-Baptiste	sr:competitor:2999	midfielder	FRA	29
sr:player:2418933	Marques, Joao	sr:competitor:2999	forward	PRT	33
sr:player:2599865	Helguera, Thiago	sr:competitor:2999	midfielder	URY	22
sr:player:2691430	Chissumba Rodrigues, Francisco Edgar	sr:competitor:2999	defender	PRT	55
sr:player:2692088	Noro, Jonatas	sr:competitor:2999	defender	PRT	53
sr:player:2739505	Vasconcelos	sr:competitor:2999	midfielder	PRT	80
sr:player:115584	Agra, Salvador	sr:competitor:2995	forward	PRT	7
sr:player:143584	Ferreira, Filipe	sr:competitor:2995	defender	PRT	20
sr:player:158269	Cesar	sr:competitor:2995	goalkeeper	BRA	1
sr:player:158597	Perez, Sebastian	sr:competitor:2995	midfielder	COL	24
sr:player:758334	Vukotic, Ilija	sr:competitor:2995	midfielder	MNE	18
sr:player:981797	Bozenik, Robert	sr:competitor:2995	forward	SVK	9
sr:player:1016765	Abascal, Rodrigo	sr:competitor:2995	defender	URY	26
sr:player:1248590	Namora, Manuel	sr:competitor:2995	forward	PRT	17
sr:player:1248720	Reisinho	sr:competitor:2995	midfielder	PRT	10
sr:player:1272740	Alhassan, Abdullahi Ibrahim	sr:competitor:2995	midfielder	NGA	2
sr:player:1561944	Camara, Ibrahima	sr:competitor:2995	midfielder	GIN	2
sr:player:1839802	Goncalves, Joao	sr:competitor:2995	goalkeeper	PRT	99
sr:player:2194072	Silva, Joel	sr:competitor:2995	midfielder	PRT	16
sr:player:2202934	Bruno, Onyemaechi	sr:competitor:2995	midfielder	NGA	70
sr:player:2219652	Maduereira, Guito	sr:competitor:2995	defender	PRT	22
sr:player:2409033	Gomes, Pedro	sr:competitor:2995	defender	PRT	15
sr:player:2412065	Dabo, Augusto	sr:competitor:2995	defender	PRT	25
sr:player:2611933	Tiago Machado	sr:competitor:2995	forward	PRT	23
sr:player:2628471	Ribeiro, Marco	sr:competitor:2995	midfielder	PRT	88
sr:player:2649027	Llorente, Diego	sr:competitor:2995	forward	DOM	74
sr:player:2658113	Cardoso de Almeida, Goncalo Miguel	sr:competitor:2995	defender	PRT	35
sr:player:2662907	Pires, Luis	sr:competitor:2995	goalkeeper	BRA	12
sr:player:2696064	Sousa, Tome	sr:competitor:2995	goalkeeper	PRT	76
sr:player:2814769	Barros, Joao	sr:competitor:2995	forward	PRT	71
sr:player:2837349	Marques, Alexandre	sr:competitor:2995	defender	PRT	73
sr:player:2837351	Tomas	sr:competitor:2995	defender	PRT	75
sr:player:2846855	Sambu	sr:competitor:2995	forward	PRT	82
sr:player:2865059	Ferreira, Leo	sr:competitor:2995	defender	PRT	85
sr:player:45686	Guilavogui, Josuha	sr:competitor:34	defender	FRA	23
sr:player:123689	Darlow, Karl	sr:competitor:34	goalkeeper	WAL	26
sr:player:162417	Cairns, Alex	sr:competitor:34	goalkeeper	ENG	21
sr:player:190853	Rothwell, Joe	sr:competitor:34	midfielder	ENG	8
sr:player:204336	Bamford, Patrick	sr:competitor:34	forward	ENG	9
sr:player:16589	Howson, Jonny	sr:competitor:36	midfielder	ENG	16
sr:player:102624	Ayling, Luke	sr:competitor:36	defender	ENG	12
sr:player:136375	Lenihan, Darragh	sr:competitor:36	defender	IRL	26
sr:player:298226	Dieng, Seny	sr:competitor:36	goalkeeper	SEN	1
sr:player:305314	Smith, Tommy	sr:competitor:36	defender	ENG	2
sr:player:376394	Clarke, Matt	sr:competitor:36	defender	ENG	5
sr:player:548194	Fry, Dael	sr:competitor:36	defender	ENG	6
sr:player:772923	McGree, Riley	sr:competitor:36	midfielder	AUS	8
sr:player:864152	Glover, Tom	sr:competitor:36	goalkeeper	AUS	23
sr:player:867574	Edmundson, George	sr:competitor:36	defender	ENG	25
sr:player:919526	Barlaser, Daniel	sr:competitor:36	midfielder	ENG	4
sr:player:1026223	Latte Lath, Emmanuel	sr:competitor:36	forward	CIV	9
sr:player:1098164	Dijksteel, Anfernee	sr:competitor:36	defender	SUR	15
sr:player:254713	Byram, Sam	sr:competitor:34	defender	ENG	25
sr:player:355520	James, Daniel	sr:competitor:34	forward	WAL	7
sr:player:772795	Tanaka, Ao	sr:competitor:34	midfielder	JPN	22
sr:player:819504	Wober, Maximilian	sr:competitor:34	defender	AUT	39
sr:player:936696	Solomon, Manor	sr:competitor:34	midfielder	ISR	14
sr:player:948750	Rodon, Joe	sr:competitor:34	defender	WAL	6
sr:player:974231	Ampadu, Ethan	sr:competitor:34	defender	WAL	4
sr:player:978125	Struijk, Pascal	sr:competitor:34	defender	NLD	5
sr:player:1058433	Piroe, Joel	sr:competitor:34	forward	NLD	10
sr:player:1065580	Gruev, Ilia	sr:competitor:34	midfielder	BGR	44
sr:player:1137501	Firpo, Junior	sr:competitor:34	defender	DOM	3
sr:player:1297422	Ramazani, Largie	sr:competitor:34	forward	BEL	17
sr:player:1322902	Meslier, Illan	sr:competitor:34	goalkeeper	FRA	1
sr:player:1398657	Aaronson, Brenden	sr:competitor:34	midfielder	USA	11
sr:player:1423711	Bogle, Jayden	sr:competitor:34	defender	ENG	2
sr:player:1244580	Engel, Lukas	sr:competitor:36	defender	DNK	27
sr:player:1298512	Bangura, Alex	sr:competitor:36	defender	NLD	24
sr:player:1372312	Burgzorg, Delano	sr:competitor:36	forward	NLD	10
sr:player:1564534	Gelhardt, Joe	sr:competitor:34	forward	ENG	30
sr:player:1830502	Schmidt, Isaac	sr:competitor:34	midfielder	CHE	33
sr:player:1949774	Gnonto, Degnand Wilfried	sr:competitor:34	forward	ITA	29
sr:player:1381765	Borges, Neto	sr:competitor:36	defender	BRA	30
sr:player:1564158	Forss, Marcus	sr:competitor:36	forward	FIN	21
sr:player:1978891	Hackney, Hayden	sr:competitor:36	midfielder	ENG	7
sr:player:1982755	Gilbert, Alexander	sr:competitor:36	forward	IRL	14
sr:player:1990983	Brynn, Sol	sr:competitor:36	goalkeeper	ENG	31
sr:player:1993053	Morris, Aidan	sr:competitor:36	midfielder	USA	18
sr:player:59751	Fernandes, Ruben	sr:competitor:3010	defender	PRT	26
sr:player:110767	Buatu, Jonathan	sr:competitor:3010	defender	AGO	39
sr:player:137982	Sa, Josue	sr:competitor:3010	defender	PRT	23
sr:player:138899	Teixeira, Joao	sr:competitor:3010	midfielder	PRT	18
sr:player:772791	Fujimoto, Kanya	sr:competitor:3010	midfielder	JPN	10
sr:player:918988	Sithole, Sphephelo	sr:competitor:3010	midfielder	ZAF	15
sr:player:935058	Mboula, Jordi	sr:competitor:3010	forward	ESP	77
sr:player:960834	Caue, Vinicius	sr:competitor:3010	forward	BRA	20
sr:player:1089574	Gordic, Milos	sr:competitor:3010	goalkeeper	SRB	51
sr:player:1297972	Correia, Felix	sr:competitor:3010	forward	PRT	71
sr:player:1425229	Cruz, Sandro	sr:competitor:3010	defender	AGO	57
sr:player:1573708	Andrew	sr:competitor:3010	goalkeeper	BRA	42
sr:player:1660471	Ze Carlos	sr:competitor:3010	forward	PRT	2
sr:player:1672025	Kazu	sr:competitor:3010	defender	BRA	88
sr:player:1713141	Castillo, Jesus	sr:competitor:3010	midfielder	PER	6
sr:player:1860794	Araujo, Brian	sr:competitor:3010	goalkeeper	PRT	99
sr:player:1884840	Caseres, Facundo	sr:competitor:3010	midfielder	ARG	5
sr:player:1955576	Gbane, Roman Mory Diaman	sr:competitor:3010	midfielder	CIV	24
sr:player:1971153	Chabrol, Tidjany	sr:competitor:3010	midfielder	FRA	7
sr:player:1971155	Mawesi, Jonathan Mutombo	sr:competitor:3010	defender	FRA	45
sr:player:2104508	de Olvieira Guimaraes Dias, Vinicius	sr:competitor:3010	goalkeeper	BRA	1
sr:player:2121874	Pablo	sr:competitor:3010	forward	BRA	90
sr:player:2125604	Elimbi Gilbert, Marvin	sr:competitor:3010	defender	FRA	4
sr:player:2202186	Aguirre, Jorge	sr:competitor:3010	forward	ESP	9
sr:player:2269315	Garcia Gonzalez, Santiago	sr:competitor:3010	midfielder	ESP	19
sr:player:2327109	Fernandez Cozar, Marcos	sr:competitor:3010	defender	ESP	\N
sr:player:2415449	Collado, Diego	sr:competitor:3010	forward	ESP	11
sr:player:2837415	Pinto, Joao	sr:competitor:3010	forward	PRT	13
sr:player:2837417	Beleza, Guilherme	sr:competitor:3010	midfielder	PRT	16
sr:player:2842763	Henrique da Silva Ventura, Carlos	sr:competitor:3010	defender	BRA	14
sr:player:21164	Ogbonna, Angelo	sr:competitor:24	defender	ITA	21
sr:player:27014	Sissoko, Moussa	sr:competitor:24	midfielder	FRA	17
sr:player:94743	Bond, Jonathan	sr:competitor:24	goalkeeper	ENG	23
sr:player:122663	Ince, Tom	sr:competitor:24	midfielder	ENG	7
sr:player:288019	Bachmann, Daniel	sr:competitor:24	goalkeeper	AUT	1
sr:player:319847	Sema, Ken	sr:competitor:24	forward	SWE	12
sr:player:843757	Bayo, Vakoun Issouf	sr:competitor:24	forward	CIV	19
sr:player:871148	Sierralta, Francisco	sr:competitor:24	defender	CHL	3
sr:player:934794	Chakvetadze, Giorgi	sr:competitor:24	midfielder	GEO	8
sr:player:1054339	Porteous, Ryan	sr:competitor:24	defender	SCO	5
sr:player:1383223	Kayembe, Edo	sr:competitor:24	midfielder	COD	39
sr:player:1415017	Larouci, Yasser	sr:competitor:24	defender	DZA	37
sr:player:1477408	Morris, James	sr:competitor:24	forward	ENG	22
sr:player:1648610	Louza, Imran	sr:competitor:24	midfielder	MAR	10
sr:player:1653567	Pollock, Matthew	sr:competitor:24	defender	ENG	6
sr:player:1737571	Ebosele, Festy	sr:competitor:24	midfielder	IRL	36
sr:player:1850368	Dele-Bashiru, Tom	sr:competitor:24	midfielder	NGA	24
sr:player:1938550	Baah, Kwadwo	sr:competitor:24	forward	ENG	34
sr:player:1948334	Dwomoh, Pierre	sr:competitor:24	midfielder	BEL	14
sr:player:1996049	Ngakia, Jeremy	sr:competitor:24	defender	ENG	2
sr:player:2125616	Keben, Kevin	sr:competitor:24	defender	CMR	4
sr:player:2155654	Jebbison, Daniel	sr:competitor:24	forward	ENG	18
sr:player:2242615	Tikvic, Antonio	sr:competitor:24	defender	HRV	15
sr:player:2438257	Vata, Rocco	sr:competitor:24	midfielder	IRL	11
sr:player:2534703	Andrews, Ryan	sr:competitor:24	defender	ENG	45
sr:player:2614631	Almeida Brandao da Silva, Kayky Henrique	sr:competitor:24	defender	BRA	\N
sr:player:2718592	Doumbia, Mamadou	sr:competitor:24	forward	MLI	20
sr:player:2798465	Ramirez-Espain, Leo	sr:competitor:24	midfielder	ENG	52
sr:player:2826621	Dempsey, Jesse	sr:competitor:24	defender	IRL	\N
sr:player:2840853	Marriott, Alfie Simon Rodney	sr:competitor:24	goalkeeper	ENG	41
sr:player:26910	Fielding, Frank	sr:competitor:29	goalkeeper	ENG	34
sr:player:68501	Stevens, Enda	sr:competitor:29	defender	IRL	3
sr:player:2784009	Chigozie, Christian	sr:competitor:72	midfielder	NGA	40
sr:player:2839261	Francis Clarke, Aidan	sr:competitor:72	defender	ENG	39
sr:player:2883169	Benagr, Benedict	sr:competitor:72	defender	ENG	41
sr:player:94665	Bonham, Jack	sr:competitor:29	goalkeeper	IRL	13
sr:player:115432	Gibson, Ben	sr:competitor:29	defender	ENG	23
sr:player:190857	Pearson, Ben	sr:competitor:29	midfielder	ENG	4
sr:player:302676	Rose, Michael	sr:competitor:29	defender	SCO	5
sr:player:362704	Gallagher, Sam	sr:competitor:29	forward	ENG	20
sr:player:364470	Thompson, Jordan	sr:competitor:29	midfielder	NIR	15
sr:player:792037	Gooch, Lynden	sr:competitor:29	midfielder	USA	2
sr:player:936314	Ennis, Niall	sr:competitor:29	forward	ENG	14
sr:player:1005263	Vidigal, Andre	sr:competitor:29	forward	PRT	7
sr:player:1083850	Wilmot, Ben	sr:competitor:29	defender	ENG	16
sr:player:1098966	Johansson, Viktor	sr:competitor:29	goalkeeper	SWE	1
sr:player:1298466	Burger, Wouter	sr:competitor:29	midfielder	NLD	6
sr:player:1629064	Manhoef, Million	sr:competitor:29	forward	NLD	42
sr:player:1952162	Moran, Andy	sr:competitor:29	midfielder	IRL	24
sr:player:1978433	Seko, Tatsuki	sr:competitor:29	midfielder	JPN	12
sr:player:107264	Mika	sr:competitor:3014	goalkeeper	PRT	16
sr:player:156318	Marcelo	sr:competitor:3014	defender	BRA	44
sr:player:345843	Secco, Caio	sr:competitor:3014	goalkeeper	BRA	22
sr:player:584116	Ponck	sr:competitor:3014	defender	CPV	14
sr:player:1013331	Martins, Bernardo	sr:competitor:3014	midfielder	PRT	20
sr:player:1057507	Frimpong	sr:competitor:3014	defender	PRT	23
sr:player:1059983	Schettine, Guilherme	sr:competitor:3014	forward	BRA	95
sr:player:1239936	Gabrielzinho	sr:competitor:3014	forward	BRA	77
sr:player:1248164	Ofori, Lawrence	sr:competitor:3014	midfielder	GHA	80
sr:player:1323020	Alan	sr:competitor:3014	midfielder	BRA	11
sr:player:1637380	Antonisse, Jeremy	sr:competitor:3014	midfielder	CUW	10
sr:player:1640732	Maracas	sr:competitor:3014	defender	BRA	26
sr:player:1747229	Kewin	sr:competitor:3014	goalkeeper	BRA	40
sr:player:1832354	Ismael	sr:competitor:3014	midfielder	PRT	6
sr:player:1836322	Tavares, Sidnei	sr:competitor:3014	midfielder	PRT	5
sr:player:1979865	Madson	sr:competitor:3014	forward	BRA	31
sr:player:2029707	Fabiano	sr:competitor:3014	defender	BRA	2
sr:player:2093140	Infande Tchuda da Silva, Hernani	sr:competitor:3014	forward	GNB	28
sr:player:2150166	Buta, Leonardo	sr:competitor:3014	defender	PRT	15
sr:player:2239889	Batista, Gilberto	sr:competitor:3014	midfielder	PRT	66
sr:player:2240499	Costa Santos, Pedro Miguel	sr:competitor:3014	midfielder	PRT	21
sr:player:2260231	Asue, Luis	sr:competitor:3014	midfielder	GNQ	9
sr:player:2281901	Pinto, Dinis	sr:competitor:3014	defender	PRT	76
sr:player:2757923	Rebelo, Miguel Fernandes	sr:competitor:3014	midfielder	PRT	45
sr:player:2819617	Liberato, Guilherme	sr:competitor:3014	midfielder	BRA	28
sr:player:37961	Hutchinson, Shaun	sr:competitor:25	defender	ENG	4
sr:player:59130	Bradshaw, Tom	sr:competitor:25	forward	WAL	9
sr:player:111398	Leonard, Ryan	sr:competitor:25	midfielder	ENG	18
sr:player:164285	Wallace, Murray	sr:competitor:25	defender	SCO	3
sr:player:205028	Bryan, Joe	sr:competitor:25	defender	SCO	15
sr:player:240256	Watmore, Duncan	sr:competitor:25	forward	ENG	19
sr:player:287013	Roberts, Liam	sr:competitor:25	goalkeeper	ENG	13
sr:player:287897	Saville, George	sr:competitor:25	midfielder	NIR	23
sr:player:358220	Cooper, Jake	sr:competitor:25	defender	ENG	5
sr:player:361712	De Norre, Casper	sr:competitor:25	defender	BEL	24
sr:player:803408	Honeyman, George	sr:competitor:25	midfielder	ENG	39
sr:player:869048	Wintle, Ryan	sr:competitor:25	midfielder	ENG	14
sr:player:978191	Tanganga, Japhet	sr:competitor:25	defender	ENG	6
sr:player:1246232	McNamara, Danny	sr:competitor:25	defender	IRL	2
sr:player:1249412	Harding, Wesley	sr:competitor:25	defender	JAM	45
sr:player:1354938	Langstaff, Macaulay	sr:competitor:25	forward	ENG	17
sr:player:1701043	Jensen, Lukas	sr:competitor:25	goalkeeper	DNK	1
sr:player:1736091	Mitchell, Billy	sr:competitor:25	midfielder	ENG	8
sr:player:2030007	Emakhu, Aidomo	sr:competitor:25	forward	IRL	22
sr:player:2078099	Azeez, Femi	sr:competitor:25	midfielder	ENG	11
sr:player:2136726	Coburn, Josh	sr:competitor:25	forward	ENG	21
sr:player:2276797	Scanlon, Calum	sr:competitor:25	defender	ENG	33
sr:player:2358581	Ivanovic, Mihailo	sr:competitor:25	forward	SRB	26
sr:player:2426375	Major, Adam	sr:competitor:25	forward	ENG	12
sr:player:2438273	Kelly, Daniel	sr:competitor:25	midfielder	SCO	16
sr:player:2530513	Esse, Romain	sr:competitor:25	midfielder	ENG	25
sr:player:2792867	Smith, Kyle	sr:competitor:25	defender	ENG	37
sr:player:2837167	Massey, Alfie	sr:competitor:25	midfielder	ENG	44
sr:player:18154	Krul, Tim	sr:competitor:72	goalkeeper	NLD	23
sr:player:31585	Moses, Victor	sr:competitor:72	midfielder	NGA	7
sr:player:45959	Kaminski, Thomas	sr:competitor:72	goalkeeper	BEL	24
sr:player:137789	Shea, James	sr:competitor:72	goalkeeper	ENG	1
sr:player:140487	Woodrow, Cauley	sr:competitor:72	forward	ENG	10
sr:player:150477	Clark, Jordan	sr:competitor:72	midfielder	ENG	18
sr:player:197848	Lockyer, Tom	sr:competitor:72	defender	WAL	4
sr:player:248643	Mpanzu, Pelly Ruddock	sr:competitor:72	midfielder	COD	17
sr:player:358222	Morris, Carlton	sr:competitor:72	forward	ENG	9
sr:player:369674	Bell, Amari’i	sr:competitor:72	defender	JAM	3
sr:player:372342	Burke, Reece	sr:competitor:72	defender	ENG	16
sr:player:556904	Nakamba, Marvelous	sr:competitor:72	midfielder	ZWE	13
sr:player:867056	Walsh, Liam	sr:competitor:72	midfielder	ENG	20
sr:player:929734	Andersen, Mads	sr:competitor:72	defender	DNK	5
sr:player:934232	Chong, Tahith	sr:competitor:72	forward	CUW	14
sr:player:1057181	McGuinness, Mark	sr:competitor:72	defender	IRL	6
sr:player:1071118	Brown, Jacob	sr:competitor:72	forward	SCO	19
sr:player:1248086	Baptiste, Shandon	sr:competitor:72	midfielder	GRD	26
sr:player:1275834	Hashioka, Daiki	sr:competitor:72	defender	JPN	27
sr:player:1300630	Krauss, Tom	sr:competitor:72	midfielder	DEU	8
sr:player:1396731	Adebayo, Elijah	sr:competitor:72	forward	ENG	11
sr:player:1421743	Holmes, Tom	sr:competitor:72	defender	ENG	29
sr:player:1564326	Doughty, Alfie	sr:competitor:72	midfielder	ENG	45
sr:player:1643588	Mengi, Teden	sr:competitor:72	defender	ENG	15
sr:player:2291951	Taylor, Joe	sr:competitor:72	forward	WAL	25
sr:player:2337435	Horlick, Jameson	sr:competitor:72	goalkeeper	ENG	31
sr:player:2415827	Nelson, Zack	sr:competitor:72	midfielder	ENG	37
sr:player:2518833	Walters, Reuell	sr:competitor:72	defender	ENG	2
sr:player:2555295	Johnson, Joseph	sr:competitor:72	defender	ENG	38
sr:player:30027	Di Maria, Angel	sr:competitor:3006	forward	ARG	11
sr:player:74915	Otamendi, Nicolas	sr:competitor:3006	defender	ARG	30
sr:player:139229	Meite, Soualiho	sr:competitor:3006	midfielder	FRA	23
sr:player:228364	Aursnes, Fredrik	sr:competitor:3006	midfielder	NOR	8
sr:player:318967	Sanches, Renato	sr:competitor:3006	midfielder	PRT	85
sr:player:755704	Pavlidis, Vangelis	sr:competitor:3006	forward	GRC	14
sr:player:936366	Luis, Florentino	sr:competitor:3006	midfielder	PRT	61
sr:player:978173	Beste, Jan-Niklas	sr:competitor:3006	midfielder	DEU	37
sr:player:1045121	Akturkoglu, Kerem	sr:competitor:3006	forward	TUR	17
sr:player:1046581	Bah, Alexander	sr:competitor:3006	defender	DNK	6
sr:player:1089296	Martins, Leandro	sr:competitor:3006	midfielder	LUX	18
sr:player:1298462	Kokcu, Orkun	sr:competitor:3006	midfielder	TUR	10
sr:player:1299468	Trubin, Anatoliy	sr:competitor:3006	goalkeeper	UKR	1
sr:player:1360540	Cabral, Arthur	sr:competitor:3006	forward	BRA	9
sr:player:1417699	Rollheiser, Benjamin	sr:competitor:3006	forward	ARG	32
sr:player:1425231	Gouveia, Tiago	sr:competitor:3006	forward	PRT	47
sr:player:1644514	Soares, Samuel	sr:competitor:3006	goalkeeper	PRT	24
sr:player:1644520	Araujo, Tomas	sr:competitor:3006	defender	PRT	44
sr:player:1832252	Amdouni, Zeki	sr:competitor:3006	forward	CHE	7
sr:player:1869664	Kabore, Issa	sr:competitor:3006	defender	BFA	28
sr:player:1984703	Bajrami, Adrian	sr:competitor:3006	defender	ALB	81
sr:player:1987393	Silva, Antonio	sr:competitor:3006	defender	PRT	4
sr:player:2044393	Schjelderup, Andreas	sr:competitor:3006	forward	NOR	21
sr:player:2230174	Fernandez, Alvaro	sr:competitor:3006	defender	ESP	3
sr:player:2264527	Gomes, Andre Nogueira	sr:competitor:3006	goalkeeper	PRT	75
sr:player:2286873	Marques, Gustavo	sr:competitor:3006	defender	BRA	76
sr:player:2329171	Prestianni, Gianluca	sr:competitor:3006	forward	ARG	25
sr:player:2337807	Prioste, Diogo	sr:competitor:3006	midfielder	PRT	86
sr:player:2481587	Rego, Joao	sr:competitor:3006	forward	PRT	84
sr:player:2837259	Leandro	sr:competitor:3006	defender	PRT	71
sr:player:44739	Gomes, Vitor	sr:competitor:3036	midfielder	PRT	8
sr:player:129617	Santos, Aderllan	sr:competitor:3036	defender	BRA	33
sr:player:159679	Hassan, Ahmed	sr:competitor:3036	forward	EGY	22
sr:player:233370	Novais, Joao	sr:competitor:3036	midfielder	PRT	6
sr:player:40671	Bartley, Kyle	sr:competitor:8	defender	ENG	5
sr:player:190863	Swift, John	sr:competitor:8	midfielder	ENG	10
sr:player:190865	Cole, Devante	sr:competitor:8	forward	ENG	44
sr:player:191386	McNair, Paddy	sr:competitor:8	defender	NIR	21
sr:player:231646	Wallace, Jed	sr:competitor:8	midfielder	ENG	7
sr:player:307274	Ajayi, Semi	sr:competitor:8	defender	NGA	6
sr:player:351498	Mowatt, Alex	sr:competitor:8	midfielder	ENG	27
sr:player:553412	Wildsmith, Joe	sr:competitor:8	goalkeeper	ENG	23
sr:player:609596	Grant, Karlan	sr:competitor:8	forward	ENG	18
sr:player:781544	Holgate, Mason	sr:competitor:8	defender	JAM	3
sr:player:790671	Furlong, Darnell	sr:competitor:8	defender	ENG	2
sr:player:841311	Palmer, Alex	sr:competitor:8	goalkeeper	ENG	1
sr:player:919112	Diakite, Ousmane	sr:competitor:8	midfielder	MLI	17
sr:player:934554	Molumby, Jayson	sr:competitor:8	midfielder	IRL	8
sr:player:943470	Johnston, Mikey	sr:competitor:8	forward	IRL	22
sr:player:990941	Racic, Uros	sr:competitor:8	midfielder	SRB	20
sr:player:991143	Styles, Callum	sr:competitor:8	midfielder	HUN	4
sr:player:309296	Graca, Joao	sr:competitor:3036	midfielder	PRT	21
sr:player:374560	Amine	sr:competitor:3036	midfielder	FRA	10
sr:player:857936	Jhonatan	sr:competitor:3036	goalkeeper	BRA	18
sr:player:937890	Vroussay, Marios	sr:competitor:3036	midfielder	GRC	17
sr:player:937950	Pantalon, Renato	sr:competitor:3036	defender	HRV	42
sr:player:1029455	Diangana, Grady	sr:competitor:8	midfielder	COD	11
sr:player:1058163	Maja, Josh	sr:competitor:8	forward	NGA	9
sr:player:1060801	Heggem, Torbjorn Lysaker	sr:competitor:8	defender	NOR	14
sr:player:1094846	Frabotta, Gianluca	sr:competitor:8	defender	ITA	24
sr:player:1995575	Dike, Daryl	sr:competitor:8	forward	USA	12
sr:player:1996067	Cann, Ted	sr:competitor:8	goalkeeper	ENG	30
sr:player:2208774	Fellows, Tom	sr:competitor:8	midfielder	ENG	31
sr:player:2227838	Dobbin, Lewis	sr:competitor:8	forward	ENG	19
sr:player:2659579	Whitwell, Harry	sr:competitor:8	midfielder	ENG	34
sr:player:2660283	Mfuamba, Kevin	sr:competitor:8	midfielder	ENG	38
sr:player:2762723	Hall, Reece Daniel	sr:competitor:8	defender	ENG	39
sr:player:2840803	Dauda Amihere, Idrissa	sr:competitor:8	defender	ITA	35
sr:player:2840805	Deeming, Cole	sr:competitor:8	midfielder	ENG	33
sr:player:2840807	Diomande, Muhamed	sr:competitor:8	defender	ITA	36
sr:player:2840811	Nelson, Deago	sr:competitor:8	defender	ENG	40
sr:player:1055947	Ribeiro Tome Tavares Bondoso, Francisco Miguel	sr:competitor:3036	forward	PRT	19
sr:player:1089758	Panzo, Jonathan	sr:competitor:3036	defender	ENG	2
sr:player:1249404	Richards, Omar	sr:competitor:3036	defender	ENG	98
sr:player:2840815	Richards, Matt	sr:competitor:8	midfielder	ENG	41
sr:player:2840817	Sule, Eseosa	sr:competitor:8	forward	NGA	43
sr:player:1341036	Pohlmann, Ole	sr:competitor:3036	midfielder	DEU	80
sr:player:1395079	William, Patrick	sr:competitor:3036	defender	BRA	4
sr:player:1720530	Miszta, Cezary	sr:competitor:3036	goalkeeper	POL	1
sr:player:1987387	Tome, Joao	sr:competitor:3036	defender	PRT	20
sr:player:1987413	Neto, Martim	sr:competitor:3036	midfielder	PRT	76
sr:player:17740	Nani	sr:competitor:744135	midfielder	PRT	17
sr:player:41651	Lopes, Miguel	sr:competitor:744135	defender	PRT	13
sr:player:59772	Lima, Ruben	sr:competitor:744135	defender	PRT	28
sr:player:158255	Ruiz, Alan	sr:competitor:744135	midfielder	ARG	10
sr:player:329079	Brigido, Bruno	sr:competitor:744135	goalkeeper	BRA	30
sr:player:357734	Ferro	sr:competitor:744135	defender	PRT	4
sr:player:846327	Pinho, Rodrigo	sr:competitor:744135	forward	BRA	9
sr:player:1013609	Cabral, Jovane	sr:competitor:744135	forward	CPV	97
sr:player:1050259	Valente Moreira, Paulo Daniel	sr:competitor:744135	midfielder	PRT	19
sr:player:1057265	Drame, Issiar	sr:competitor:744135	defender	FRA	5
sr:player:1070908	Cissokho, Till	sr:competitor:744135	defender	FRA	3
sr:player:1397359	Kikas	sr:competitor:744135	forward	PRT	98
sr:player:1418925	Cordeiro, Leo	sr:competitor:744135	midfielder	BRA	22
sr:player:1602966	Meixedo, Francisco	sr:competitor:744135	goalkeeper	PRT	1
sr:player:1632090	Alosio	sr:competitor:744135	midfielder	BRA	6
sr:player:1938636	Nilton	sr:competitor:744135	defender	PRT	25
sr:player:1957243	Cabral, Daniel	sr:competitor:744135	midfielder	BRA	8
sr:player:1975149	Melo Veiga, Danilo Filipe	sr:competitor:744135	defender	PRT	77
sr:player:2091257	Bucca, Leonel	sr:competitor:744135	midfielder	ARG	26
sr:player:2129608	Gudzulic, Marko	sr:competitor:744135	goalkeeper	SRB	93
sr:player:2194744	Ferreira, Tiago	sr:competitor:744135	midfielder	PRT	88
sr:player:2201942	Jesus, Igor	sr:competitor:744135	midfielder	BRA	6
sr:player:2201944	Andre	sr:competitor:744135	forward	BRA	7
sr:player:2239921	Travassos, Diogo	sr:competitor:744135	defender	PRT	2
sr:player:2284329	Mazhar, Bilal	sr:competitor:744135	forward	EGY	99
sr:player:2335189	Petterson	sr:competitor:744135	forward	BRA	37
sr:player:2344705	Mina, Juan	sr:competitor:744135	defender	COL	\N
sr:player:2407831	Montoia, Guilherme Manuel Serrao	sr:competitor:744135	defender	PRT	\N
sr:player:2647729	Keliano, Manuel	sr:competitor:744135	midfielder	AGO	42
sr:player:2763667	Tiago Gabriel	sr:competitor:744135	defender	PRT	44
sr:player:2822031	Carvalho, Daniel Gaudencio	sr:competitor:744135	midfielder	PRT	\N
sr:player:2837597	Carvalho, Euri	sr:competitor:744135	defender	PRT	31
sr:player:2837599	Tunguliadi, Georgiy	sr:competitor:744135	defender	RUS	23
sr:player:2837827	Caio	sr:competitor:744135	forward	BRA	38
sr:player:2847525	Manu	sr:competitor:744135	forward	AGO	81
sr:player:16807	Hamer, Ben	sr:competitor:12	goalkeeper	ENG	26
sr:player:45682	Bannan, Barry	sr:competitor:12	midfielder	SCO	10
sr:player:98450	Chalobah, Nathaniel	sr:competitor:12	midfielder	ENG	4
sr:player:104857	Palmer, Liam	sr:competitor:12	defender	SCO	2
sr:player:112761	Smith, Michael	sr:competitor:12	forward	ENG	24
sr:player:180527	Ihiekwe, Michael	sr:competitor:12	defender	ENG	20
sr:player:222188	Johnson, Marvin	sr:competitor:12	midfielder	ENG	18
sr:player:250211	Paterson, Callum	sr:competitor:12	forward	SCO	13
sr:player:257433	Lowe, Jamal	sr:competitor:12	forward	JAM	9
sr:player:340621	Windass, Josh	sr:competitor:12	midfielder	ENG	11
sr:player:355154	Lowe, Max	sr:competitor:12	defender	ENG	3
sr:player:544812	Iorfa, Dominic	sr:competitor:12	defender	ENG	6
sr:player:755782	Ingelsson, Svante	sr:competitor:12	midfielder	SWE	8
sr:player:775069	Ugbo, Ike	sr:competitor:12	forward	CAN	12
sr:player:936562	Valery, Yan	sr:competitor:12	defender	TUN	27
sr:player:1009317	Famewo, Akin	sr:competitor:12	defender	ENG	23
sr:player:1252210	Valentín, Pol	sr:competitor:12	defender	ESP	14
sr:player:1297388	Bernard, Di'Shon	sr:competitor:12	defender	JAM	5
sr:player:1383981	Kobacki, Olaf	sr:competitor:12	midfielder	POL	19
sr:player:1720442	Musaba, Anthony	sr:competitor:12	forward	NLD	45
sr:player:1977325	Gassama, Djeidi	sr:competitor:12	midfielder	FRA	41
sr:player:2229702	Charles, Shea	sr:competitor:12	midfielder	NIR	44
sr:player:2264241	McNiell, Charlie	sr:competitor:12	forward	ENG	17
sr:player:2490947	Charles, Pierce	sr:competitor:12	goalkeeper	NIR	47
sr:player:2496287	Shipston, Rio	sr:competitor:12	midfielder	ENG	31
sr:player:2496289	Cadamarteri, Bailey Tye	sr:competitor:12	forward	JAM	42
sr:player:2541799	Beadle, James	sr:competitor:12	goalkeeper	ENG	1
sr:player:2555299	Fusire, Sean	sr:competitor:12	midfielder	ENG	30
sr:player:2762241	Hall, Jack	sr:competitor:12	goalkeeper	ENG	46
sr:player:2762243	Reed, Sam	sr:competitor:12	defender	ENG	39
sr:player:2765637	Maltby, Mackenzie	sr:competitor:12	defender	ENG	36
sr:player:2841245	Otegbayo, Gabriel	sr:competitor:12	defender	IRL	33
sr:player:2841247	Onukwuli, Favour	sr:competitor:12	midfielder	ENG	25
sr:player:2886083	Barret, Killian	sr:competitor:12	goalkeeper	ENG	34
sr:player:1060003	Caseres, Santiago	sr:competitor:3208	midfielder	ARG	35
sr:player:1103085	Guidara, Tomas	sr:competitor:3208	defender	ARG	24
sr:player:1406559	Pineiro, Rodrigo	sr:competitor:3208	forward	URY	17
sr:player:1559076	Pellegrini, Matias	sr:competitor:3208	midfielder	ARG	11
sr:player:1860830	Lagos, Agustin	sr:competitor:3208	defender	ARG	14
sr:player:1871380	Fernandez, Damian	sr:competitor:3208	defender	ARG	34
sr:player:1954516	Garcia, Joaquin	sr:competitor:3208	defender	ARG	4
sr:player:2090575	Marchiori, Tomas	sr:competitor:3208	goalkeeper	ARG	1
sr:player:2101868	Gomez, Emmanuel	sr:competitor:3208	goalkeeper	ARG	3
sr:player:2101870	Pernicone, Patricio Ezequiel	sr:competitor:3208	defender	ARG	23
sr:player:2138656	Rodriguez, Randall	sr:competitor:3208	goalkeeper	URY	12
sr:player:2142958	Quiros, Aaron	sr:competitor:3208	defender	ARG	6
sr:player:42892	Mangala, Eliaquim	sr:competitor:4500	defender	FRA	5
sr:player:93796	Robles, Joel	sr:competitor:4500	goalkeeper	ESP	27
sr:player:134729	Simoes, Fabricio	sr:competitor:4500	forward	BRA	98
sr:player:138891	Costa, Helder	sr:competitor:4500	midfielder	AGO	11
sr:player:344179	Xeka	sr:competitor:4500	midfielder	PRT	88
sr:player:548044	Carvalho, Joao	sr:competitor:4500	midfielder	PRT	12
sr:player:548046	Amaral, Pedro	sr:competitor:4500	defender	PRT	24
sr:player:979097	Holsgrove, Jordan William	sr:competitor:4500	midfielder	SCO	10
sr:player:1050257	Alvaro, Pedro	sr:competitor:4500	defender	PRT	23
sr:player:1050271	Costa, Goncalo	sr:competitor:4500	defender	PRT	18
sr:player:1057649	Orellana, Jandro	sr:competitor:4500	midfielder	ESP	6
sr:player:1322826	Chamorro, Kevin	sr:competitor:4500	goalkeeper	CRI	1
sr:player:1418193	Marques, Alejandro	sr:competitor:4500	forward	VEN	9
sr:player:1428493	Begraoui, Yanis	sr:competitor:4500	forward	MAR	14
sr:player:1546621	Bacher, Felix	sr:competitor:4500	defender	AUT	25
sr:player:1557141	Feltes, Volnei	sr:competitor:4500	defender	BRA	5
sr:player:1634228	Salazar, Israel	sr:competitor:4500	forward	ESP	92
sr:player:1748419	Zanocelo, Vinicius	sr:competitor:4500	midfielder	BRA	7
sr:player:2057377	Costa, Michel	sr:competitor:4500	midfielder	BRA	8
sr:player:2070897	Boma, Kevin	sr:competitor:4500	defender	TGO	44
sr:player:2112362	Parra Artal, Raul	sr:competitor:4500	defender	ESP	2
sr:player:2156398	Ferreira Lacximicant, Andre Filipe	sr:competitor:4500	forward	PRT	19
sr:player:2527101	Pina, Wagner	sr:competitor:4500	defender	PRT	20
sr:player:2659913	Carvalho, Pedro	sr:competitor:4500	midfielder	PRT	22
sr:player:2719862	Foe Ondoa, Manga	sr:competitor:4500	midfielder	FRA	26
sr:player:2730544	Sierra, Ismael	sr:competitor:4500	defender	ESP	3
sr:player:2782573	Garcia Andrade, Fabricio	sr:competitor:4500	forward	CPV	17
sr:player:2830769	Dias, Diogo	sr:competitor:4500	goalkeeper	PRT	81
sr:player:20804	Eastwood, Simon	sr:competitor:95	goalkeeper	ENG	13
sr:player:36466	Phillips, Matt	sr:competitor:95	midfielder	SCO	10
sr:player:42690	Bennett, Joe	sr:competitor:95	defender	ENG	12
sr:player:98439	McEachran, Josh	sr:competitor:95	midfielder	ENG	6
sr:player:136108	Ingram, Matt	sr:competitor:95	goalkeeper	ENG	21
sr:player:254849	Vaulks, Will	sr:competitor:95	midfielder	WAL	4
sr:player:255391	Long, Sam	sr:competitor:95	defender	ENG	2
sr:player:329431	Leigh, Greg	sr:competitor:95	defender	JAM	22
sr:player:361788	Ter Avest, Hidde	sr:competitor:95	defender	NLD	24
sr:player:372522	Brannagan, Cameron	sr:competitor:95	midfielder	ENG	8
sr:player:758404	Harris, Mark	sr:competitor:95	forward	WAL	9
sr:player:902442	Placheta, Przemyslaw	sr:competitor:95	midfielder	POL	7
sr:player:922758	Edwards, Kyle	sr:competitor:95	midfielder	ENG	29
sr:player:936110	Cumming, Jamie	sr:competitor:95	goalkeeper	ENG	1
sr:player:1012667	Dale, Owen	sr:competitor:95	midfielder	ENG	17
sr:player:1055165	Moore, Elliott	sr:competitor:95	defender	ENG	5
sr:player:1157408	Dembele, Siriki	sr:competitor:95	midfielder	SCO	23
sr:player:1275332	Thorniley, Jordan	sr:competitor:95	defender	ENG	34
sr:player:1555671	Sibley, Louie	sr:competitor:95	midfielder	ENG	14
sr:player:1566938	Rodrigues, Ruben da Rocha	sr:competitor:95	midfielder	PRT	20
sr:player:1577490	Brown, Ciaron	sr:competitor:95	defender	NIR	3
sr:player:1645496	Kioso, Peter	sr:competitor:95	defender	COD	30
sr:player:1718926	El Mizouni, Idris	sr:competitor:95	midfielder	TUN	15
sr:player:1868554	Goodhram, Tyler	sr:competitor:95	midfielder	ENG	19
sr:player:1939870	Scarlett, Dane	sr:competitor:95	forward	ENG	44
sr:player:1939990	Woltman, Max	sr:competitor:95	midfielder	ENG	27
sr:player:1987269	Nelson, Ben	sr:competitor:95	defender	ENG	16
sr:player:2321533	Gomez, Diego	sr:competitor:3208	defender	ARG	31
sr:player:2329127	Ordonez, Christian Nahuel	sr:competitor:3208	midfielder	ARG	32
sr:player:2329181	Fernandez, Thiago Cruz	sr:competitor:3208	midfielder	ARG	27
sr:player:2329225	Roldan, Leonel David	sr:competitor:3208	defender	ARG	19
sr:player:2329233	Garzon, Lautaro Miguel Angel	sr:competitor:3208	goalkeeper	ARG	42
sr:player:2717364	Carrizo, Maher	sr:competitor:3208	forward	ARG	28
sr:player:2762249	Montoro, Alvaro	sr:competitor:3208	midfielder	ARG	36
sr:player:2772811	Sarco, Alejo	sr:competitor:3208	forward	ARG	30
sr:player:2829207	Bussio, Felipe	sr:competitor:3208	midfielder	ARG	45
sr:player:2829209	Gordon, Jano	sr:competitor:3208	defender	ARG	21
sr:player:2829211	Silveor, Thiago	sr:competitor:3208	defender	ARG	40
sr:player:2829213	Porcel, Maximiliano	sr:competitor:3208	midfielder	ARG	46
sr:player:2834897	Andrada, -	sr:competitor:3208	defender	ARG	43
sr:player:2837901	Bosch, Benjamin	sr:competitor:3208	forward	ARG	47
sr:player:2859239	Montoro, Francisco	sr:competitor:3208	forward	ARG	48
sr:player:2114254	Currie, Jack	sr:competitor:95	defender	ENG	26
sr:player:2202876	Goodwin, Will	sr:competitor:95	forward	ENG	25
sr:player:2253979	Golding, James	sr:competitor:95	defender	ENG	35
sr:player:2292499	Ebiowei, Malcolm	sr:competitor:95	forward	ENG	11
sr:player:2371441	Ferdinan, Marselino	sr:competitor:95	midfielder	IDN	28
sr:player:47451	Fernandez, Gustavo Martin	sr:competitor:191648	forward	ARG	17
sr:player:147948	MacEachen, Emilio	sr:competitor:191648	defender	URY	\N
sr:player:275789	Celiz, Milton Aaron	sr:competitor:191648	forward	ARG	8
sr:player:579378	Pereira, Guillermo Fabian	sr:competitor:191648	midfielder	ARG	16
sr:player:802418	Paz, Cristian Ignacio	sr:competitor:191648	defender	ARG	22
sr:player:141012	Rocha, Luis	sr:competitor:3011	defender	PRT	13
sr:player:254815	Venancio, Frederico	sr:competitor:3011	defender	PRT	21
sr:player:332773	Mehring, Andres	sr:competitor:3011	goalkeeper	ARG	94
sr:player:775713	Ramos, Guilherme	sr:competitor:3011	defender	PRT	27
sr:player:918766	Batista, Gabriel	sr:competitor:3011	goalkeeper	BRA	1
sr:player:937758	Calila, Diogo	sr:competitor:3011	defender	PRT	2
sr:player:1058047	Pereira Soares Almeida, Bruno Filipe	sr:competitor:3011	forward	PRT	19
sr:player:1248368	Soares de Almeida, Lucas	sr:competitor:3011	defender	BRA	42
sr:player:1343812	Alisson Safira	sr:competitor:3011	forward	BRA	9
sr:player:1548153	Ferreira, Pedro	sr:competitor:3011	midfielder	PRT	8
sr:player:1728563	Lopes, Vinicius	sr:competitor:3011	forward	BRA	70
sr:player:1743021	Daniel	sr:competitor:3011	midfielder	BRA	41
sr:player:1830936	Adriano	sr:competitor:3011	midfielder	BRA	6
sr:player:1831972	MT	sr:competitor:3011	midfielder	BRA	32
sr:player:1873920	Ricardinho	sr:competitor:3011	midfielder	PRT	10
sr:player:2057947	Gabriel Silva	sr:competitor:3011	defender	BRA	11
sr:player:2199872	Pena de Lima, Sidney Alexssander	sr:competitor:3011	defender	BRA	23
sr:player:2232676	Pereira de Souza, Matheus	sr:competitor:3011	defender	BRA	3
sr:player:2275333	Habraao	sr:competitor:3011	defender	BRA	28
sr:player:2357551	Klismahn	sr:competitor:3011	midfielder	BRA	77
sr:player:2375171	Garcia, Ary Eduardo	sr:competitor:3011	defender	BRA	\N
sr:player:2411159	Lobo Araujo, Sergio Miguel	sr:competitor:3011	midfielder	PRT	35
sr:player:2484049	Junior, Helio Miguel	sr:competitor:3011	goalkeeper	BRA	12
sr:player:2527073	Costa, Joao	sr:competitor:3011	forward	PRT	17
sr:player:2596351	Denivys	sr:competitor:3011	goalkeeper	BRA	31
sr:player:2647083	Silva de Moraes, Luis Eduardo	sr:competitor:3011	defender	BRA	\N
sr:player:27028	Barnes, Ashley	sr:competitor:263	forward	ENG	10
sr:player:55570	Duffy, Shane	sr:competitor:263	defender	IRL	4
sr:player:75756	McLean, Kenny	sr:competitor:263	midfielder	SCO	23
sr:player:95791	Hanley, Grant	sr:competitor:263	defender	SCO	5
sr:player:137017	Hernandez, Onel	sr:competitor:263	midfielder	DEU	25
sr:player:144297	Long, George	sr:competitor:263	goalkeeper	ENG	12
sr:player:186809	Marcondes, Emiliano	sr:competitor:263	forward	DNK	11
sr:player:227946	Gunn, Angus	sr:competitor:263	goalkeeper	SCO	1
sr:player:583450	Stacey, Jack	sr:competitor:263	defender	ENG	3
sr:player:775475	Fassnacht, Christian	sr:competitor:263	midfielder	CHE	16
sr:player:980943	Lungi Sorensen, Jakob	sr:competitor:263	midfielder	DNK	19
sr:player:1134269	Sargent, Josh	sr:competitor:263	forward	USA	9
sr:player:1246186	Mair, Archie	sr:competitor:263	goalkeeper	SCO	37
sr:player:1702631	Ben Slimane, Anis	sr:competitor:263	midfielder	\N	20
sr:player:1833974	Barden, Daniel	sr:competitor:263	goalkeeper	WAL	37
sr:player:1856650	Chrisene, Benjamin	sr:competitor:263	defender	ENG	14
sr:player:1860048	Sainz, Borja	sr:competitor:263	midfielder	ESP	7
sr:player:1868738	Cordoba, Jose	sr:competitor:263	defender	PAN	33
sr:player:1987223	Crnac, Ante	sr:competitor:263	forward	HRV	17
sr:player:1997967	Nunez, Marcelino	sr:competitor:263	midfielder	CHL	26
sr:player:2103940	Gibbs, Liam	sr:competitor:263	midfielder	ENG	8
sr:player:2113892	Gordon, Kaide	sr:competitor:263	forward	ENG	21
sr:player:2125176	Amankwah, Forson	sr:competitor:263	forward	GHA	18
sr:player:2186628	Doyle, Callum	sr:competitor:263	defender	ENG	6
sr:player:2276231	Tomkinson, Jonathan	sr:competitor:263	defender	USA	45
sr:player:2327245	Springett, Tony	sr:competitor:263	midfielder	IRL	42
sr:player:2395335	Schwartau, Oscar	sr:competitor:263	forward	DNK	29
sr:player:2423719	Forsyth, Gabriel	sr:competitor:263	midfielder	SCO	41
sr:player:2480881	Hills, Brad	sr:competitor:263	defender	ENG	40
sr:player:2547545	Warner, Jaden	sr:competitor:263	defender	ENG	50
sr:player:2652951	Mahovo, Lucien	sr:competitor:263	defender	ENG	47
sr:player:2657779	Fisher, Kellen	sr:competitor:263	defender	ENG	35
sr:player:2731884	Myles, Elliot Josh	sr:competitor:263	midfielder	WAL	44
sr:player:76383	Torren, Miguel	sr:competitor:3204	defender	ARG	2
sr:player:249383	Corvalan, Claudio	sr:competitor:3204	defender	ARG	3
sr:player:347744	Orsini, Nicolas	sr:competitor:3204	forward	ARG	33
sr:player:358618	Cardozo, Thiago	sr:competitor:3204	goalkeeper	URY	25
sr:player:368422	Balboa, Adrian	sr:competitor:3204	forward	URY	77
sr:player:802550	Gamba, Lucas Emanuel	sr:competitor:3204	forward	ARG	18
sr:player:846627	Pitton, Mauro	sr:competitor:3204	midfielder	ARG	28
sr:player:860554	Pitton, Bruno	sr:competitor:3204	defender	ARG	14
sr:player:1133285	Pardo, Franco	sr:competitor:3204	defender	ARG	34
sr:player:1693081	Campisi, Nicolas	sr:competitor:3204	goalkeeper	ARG	1
sr:player:2004517	Gerometta, Francisco	sr:competitor:3204	defender	ARG	22
sr:player:2005161	Banega, Tiago	sr:competitor:3204	midfielder	ARG	19
sr:player:2025589	Roldan, Enzo	sr:competitor:3204	midfielder	ARG	10
sr:player:2100598	Tanda, Patricio	sr:competitor:3204	midfielder	ARG	15
sr:player:2191594	Simon Rivero	sr:competitor:3204	midfielder	ARG	20
sr:player:2300285	Del Blanco, Mateo	sr:competitor:3204	midfielder	ARG	11
sr:player:2312427	Paz, Andres Nicolas	sr:competitor:3204	defender	ARG	32
sr:player:2384489	Meuli, Lucas	sr:competitor:3204	goalkeeper	ARG	40
sr:player:2401883	Luduena, Juan Pablo	sr:competitor:3204	defender	ARG	26
sr:player:2548621	Morales, Javier	sr:competitor:3204	forward	ARG	9
sr:player:2549327	Domina, Jeronimo	sr:competitor:3204	forward	ARG	30
sr:player:9668	Batista, Ricardo	sr:competitor:36365	goalkeeper	PRT	33
sr:player:27622	Fonte, Jose	sr:competitor:36365	defender	PRT	6
sr:player:94826	Zolotic, Nermin	sr:competitor:36365	defender	BIH	19
sr:player:125039	Geraldes, Andre	sr:competitor:36365	defender	PRT	18
sr:player:157023	Cassiano	sr:competitor:36365	forward	BRA	90
sr:player:810338	Sequeira, Patrick	sr:competitor:36365	goalkeeper	CRI	1
sr:player:904318	Dias, Tiago	sr:competitor:36365	defender	PRT	11
sr:player:936176	Livolant, Jeremy	sr:competitor:36365	forward	FRA	29
sr:player:937728	Azevedo, Daniel	sr:competitor:36365	goalkeeper	PRT	22
sr:player:1033439	Larrazabal, Gaizka	sr:competitor:36365	defender	ESP	72
sr:player:1047647	Moreira, Nuno	sr:competitor:36365	forward	PRT	7
sr:player:1068282	Kraev, Andrian	sr:competitor:36365	midfielder	BGR	89
sr:player:1245264	Tchamba, Duplexe	sr:competitor:36365	defender	CMR	2
sr:player:1248592	Silva, Kiki	sr:competitor:36365	forward	PRT	20
sr:player:1299434	Joao Goulart	sr:competitor:36365	defender	PRT	4
sr:player:1418645	Sousa, Miguel	sr:competitor:36365	midfielder	PRT	14
sr:player:1479740	Brito, Rafael	sr:competitor:36365	midfielder	PRT	17
sr:player:1479796	Pereira, Henrique	sr:competitor:36365	forward	PRT	52
sr:player:1626518	Obeng, Samuel	sr:competitor:36365	forward	GHA	77
sr:player:1658825	Lelo, Leonardo	sr:competitor:36365	defender	PRT	5
sr:player:1957223	Mukendi, Beni	sr:competitor:36365	midfielder	AGO	16
sr:player:1996163	Kluivert, Ruben	sr:competitor:36365	defender	NLD	3
sr:player:2045053	Mendes Vicente, Claudio	sr:competitor:36365	forward	ESP	99
sr:player:2070747	Blanco Juncal, Raul	sr:competitor:36365	midfielder	ESP	10
sr:player:2072117	Pablo	sr:competitor:36365	midfielder	BRA	80
sr:player:2098184	Svensson, Max	sr:competitor:36365	forward	ESP	9
sr:player:2133062	Segovia, Telasco	sr:competitor:36365	midfielder	VEN	8
sr:player:2411881	Monteiro, Isaac	sr:competitor:36365	defender	PRT	44
sr:player:2658117	De Ceita, Samuel Bras	sr:competitor:36365	forward	PRT	37
sr:player:2762417	Benaissa-Yahia, Fahem	sr:competitor:36365	defender	FRA	12
sr:player:123208	Galvao, Joao Pedro	sr:competitor:96	midfielder	ITA	12
sr:player:352246	Palmer, Kasey	sr:competitor:96	midfielder	JAM	45
sr:player:359236	Bedia, Chris	sr:competitor:96	forward	CIV	9
sr:player:612518	Mehlem, Marvin	sr:competitor:96	midfielder	DEU	8
sr:player:841089	Sinik, Dogukan	sr:competitor:96	midfielder	TUR	11
sr:player:936050	Racioppi, Anthony	sr:competitor:96	goalkeeper	CHE	31
sr:player:936514	Omur, Abdulkadir	sr:competitor:96	midfielder	TUR	10
sr:player:941938	Coyle, Lewie	sr:competitor:96	defender	ENG	2
sr:player:1103809	Alzate, Steven	sr:competitor:96	midfielder	COL	19
sr:player:1244538	McLoughlin, Sean	sr:competitor:96	defender	IRL	6
sr:player:1244740	Jones, Alfie	sr:competitor:96	defender	ENG	5
sr:player:1298520	Millar, Liam	sr:competitor:96	forward	CAN	7
sr:player:1379121	Slater, Regan	sr:competitor:96	midfielder	ENG	27
sr:player:1548155	Pandur, Ivor	sr:competitor:96	goalkeeper	HRV	1
sr:player:1557294	Giles, Ryan	sr:competitor:96	midfielder	ENG	3
sr:player:1930386	Longman, Ryan	sr:competitor:96	forward	ENG	16
sr:player:1939850	Lo-Tutala, Thimothee	sr:competitor:96	goalkeeper	FRA	32
sr:player:1949672	Burns, Finley	sr:competitor:96	defender	ENG	17
sr:player:1951198	Simons, Xavier	sr:competitor:96	midfielder	ENG	18
sr:player:2013329	Smith, Andy	sr:competitor:96	defender	ENG	26
sr:player:2058151	Drameh, Cody	sr:competitor:96	defender	ENG	23
sr:player:2065661	Jacobs, Matty	sr:competitor:96	defender	ENG	29
sr:player:2065671	Cartwright, Harvey	sr:competitor:96	goalkeeper	ENG	\N
sr:player:2127382	Vaughan, Harry	sr:competitor:96	midfielder	IRL	14
sr:player:2186020	Rushworth, Carl	sr:competitor:96	goalkeeper	ENG	22
sr:player:2201964	Jarvis, Will	sr:competitor:96	forward	ENG	36
sr:player:2228164	Zambrano, Oscar	sr:competitor:96	midfielder	ECU	25
sr:player:2252385	Burstow, Mason	sr:competitor:96	defender	ENG	48
sr:player:2305933	Puerta, Gustavo	sr:competitor:96	midfielder	COL	20
sr:player:1982757	Cannon, Thomas	sr:competitor:29	forward	IRL	9
sr:player:1991869	Bocat, Eric Junior	sr:competitor:29	defender	FRA	17
sr:player:2107144	Tchamadeu, Junior	sr:competitor:29	defender	CMR	22
sr:player:2327243	Kamara, Abu	sr:competitor:96	forward	ENG	44
sr:player:2346635	Sellars-Fleming, Tyrell	sr:competitor:96	midfielder	ENG	41
sr:player:2281075	Koumas, Lewis	sr:competitor:29	midfielder	WAL	11
sr:player:2284353	Phillips, Ashley	sr:competitor:29	defender	ENG	26
sr:player:2285043	Tezgel, Emre	sr:competitor:29	forward	ENG	37
sr:player:2320405	Lipsiuc, Darius	sr:competitor:29	midfielder	IRL	50
sr:player:2411073	Hughes, Charlie	sr:competitor:96	defender	ENG	4
sr:player:2531827	Belloumi, Mohamed	sr:competitor:96	forward	DZA	33
sr:player:2610631	Ashbee, Stanley	sr:competitor:96	defender	IRL	43
sr:player:2695926	Coyle, Rocco	sr:competitor:96	midfielder	ENG	2
sr:player:2758379	Tinsdale, Nathan	sr:competitor:96	midfielder	ENG	47
sr:player:2481561	Joon-ho, Bae	sr:competitor:29	midfielder	KOR	10
sr:player:2657781	Sidibe, Souleymane	sr:competitor:29	midfielder	ENG	30
sr:player:2700326	Dixon, Jaden	sr:competitor:29	defender	ENG	41
sr:player:2702804	Gromek, Wiktor Artur	sr:competitor:29	midfielder	POL	\N
sr:player:2834201	Morris, Scott	sr:competitor:29	goalkeeper	NZL	41
sr:player:2837165	Anderson, Freddie	sr:competitor:29	defender	ENG	43
sr:player:2848429	Smith, William	sr:competitor:29	midfielder	ENG	46
sr:player:2850269	Jeffers, Keke	sr:competitor:29	forward	ENG	48
sr:player:44684	Aurelio, Joao	sr:competitor:3013	defender	PRT	2
sr:player:128360	Sousa, Dyego	sr:competitor:3013	forward	PRT	89
sr:player:167857	Sousa, Andre	sr:competitor:3013	midfielder	PRT	18
sr:player:231764	Serrao Garces, Joao Tiago	sr:competitor:3013	midfielder	PRT	20
sr:player:318943	Macedo, Ruben	sr:competitor:3013	forward	PRT	7
sr:player:329103	Martins Guimaraes, Daniel	sr:competitor:3013	goalkeeper	BRA	13
sr:player:343619	Costa, Bruno	sr:competitor:3013	midfielder	PRT	8
sr:player:344181	Mendes Gomes, Jose Manuel	sr:competitor:3013	defender	PRT	5
sr:player:918690	Santos, Leo	sr:competitor:3013	defender	BRA	34
sr:player:964611	de Franca, Lucas Oliveira	sr:competitor:3013	goalkeeper	BRA	37
sr:player:1081990	Penha, Daniel	sr:competitor:3013	midfielder	BRA	17
sr:player:1248252	Ulisses	sr:competitor:3013	defender	BRA	4
sr:player:1300434	Baeza, Miguel	sr:competitor:3013	midfielder	ESP	19
sr:player:1382075	Thomas, Nigel	sr:competitor:3013	forward	CUW	11
sr:player:1418871	Esteves, Luis	sr:competitor:3013	midfielder	PRT	10
sr:player:1434067	Teodora da Silva, Luiz Eduardo	sr:competitor:3013	forward	BRA	99
sr:player:1479640	Appiah, Arvin	sr:competitor:3013	forward	ENG	70
sr:player:1722918	Santos, Gabriel	sr:competitor:3013	midfielder	BRA	77
sr:player:1728130	Rodrigues dos Reis, Tiago	sr:competitor:3013	forward	BRA	72
sr:player:1957257	Garcia	sr:competitor:3013	defender	BRA	22
sr:player:2059981	Teixeira da Encarnacao, Rui Filipe	sr:competitor:3013	goalkeeper	PRT	1
sr:player:2065569	Butzke, Adrian	sr:competitor:3013	forward	ESP	9
sr:player:2144114	Sequeira, Douglas	sr:competitor:3013	midfielder	CRI	43
sr:player:2162510	Cesar	sr:competitor:3013	goalkeeper	BRA	\N
sr:player:2170314	Dias, Matheus	sr:competitor:3013	midfielder	BRA	88
sr:player:2178254	Ze Vitor	sr:competitor:3013	defender	BRA	38
sr:player:2194354	Freitas, Afonso	sr:competitor:3013	defender	PRT	25
sr:player:2344939	Labidi, Chiheb	sr:competitor:3013	midfielder	TUN	15
sr:player:2373797	Isaac	sr:competitor:3013	forward	BRA	23
sr:player:2410265	Graca	sr:competitor:3013	defender	PRT	25
sr:player:2410267	Goncalves, Francisco	sr:competitor:3013	defender	PRT	33
sr:player:2410275	Martim	sr:competitor:3013	forward	PRT	30
sr:player:2552233	Almeida, Lucas	sr:competitor:3013	defender	BRA	14
sr:player:2659737	Djibril Soumare, Elhadji	sr:competitor:3013	midfielder	SEN	27
sr:player:2740661	Sousa, Andre	sr:competitor:3013	defender	PRT	18
sr:player:145182	Wells, Nahki	sr:competitor:58	forward	BMU	21
sr:player:215032	Naismith, Kal	sr:competitor:58	forward	SCO	4
sr:player:351496	Cornick, Harry	sr:competitor:58	forward	ENG	27
sr:player:355468	Thomas, Lewis	sr:competitor:58	goalkeeper	WAL	32
sr:player:360388	O'Leary, Max	sr:competitor:58	goalkeeper	IRL	1
sr:player:560196	Sykes, Mark	sr:competitor:58	midfielder	IRL	17
sr:player:754602	Dickie, Rob	sr:competitor:58	defender	ENG	16
sr:player:755274	McCrorie, Ross	sr:competitor:58	defender	SCO	2
sr:player:784501	Williams, Joe	sr:competitor:58	midfielder	ENG	8
sr:player:950460	Vyner, Zak	sr:competitor:58	defender	ENG	14
sr:player:958236	McGuane, Marcus	sr:competitor:58	midfielder	ENG	29
sr:player:988181	Twine, Scott	sr:competitor:58	midfielder	ENG	10
sr:player:1297368	Tanner, George	sr:competitor:58	defender	ENG	19
sr:player:1327488	Bird, Max	sr:competitor:58	midfielder	ENG	6
sr:player:1336428	Knight, Jason	sr:competitor:58	midfielder	IRL	12
sr:player:1340348	Bajic, Stefan	sr:competitor:58	goalkeeper	FRA	23
sr:player:1353904	Pring, Cameron	sr:competitor:58	defender	ENG	3
sr:player:1613590	Armstrong, Sinclair	sr:competitor:58	forward	IRL	30
sr:player:1710389	McNally, Luke	sr:competitor:58	defender	IRL	15
sr:player:1724636	Roberts, Haydon	sr:competitor:58	defender	ENG	24
sr:player:1831148	Atkinson, Robert	sr:competitor:58	defender	ENG	5
sr:player:1988121	Clarke, Omar Taylor	sr:competitor:58	midfielder	WAL	38
sr:player:2083961	Mehmeti, Anis	sr:competitor:58	midfielder	ALB	11
sr:player:2106898	Bell, Sam	sr:competitor:58	forward	ENG	20
sr:player:2187444	Mayulu, Fally	sr:competitor:58	forward	FRA	9
sr:player:2247615	Benarous, Ayman	sr:competitor:58	midfielder	ENG	18
sr:player:2317029	Hirakawa, Yu	sr:competitor:58	midfielder	JPN	7
sr:player:2404623	Araoye, Raphael Damilola	sr:competitor:58	defender	ENG	28
sr:player:2439767	Earthy, George	sr:competitor:58	midfielder	ENG	40
sr:player:2495265	Morrison, Elijah	sr:competitor:58	midfielder	ENG	31
sr:player:2687105	Nelson, Raekwon	sr:competitor:58	forward	ENG	30
sr:player:2709192	James, Joseph	sr:competitor:58	defender	ENG	34
sr:player:2713084	Backwell, Tommy	sr:competitor:58	midfielder	ENG	37
sr:player:2738075	Meerholz, Jed	sr:competitor:58	midfielder	ENG	36
sr:player:2837181	Pecover, Leo	sr:competitor:58	\N	\N	35
sr:player:2879917	Campbell-Slowey, Josh	sr:competitor:58	defender	ENG	33
sr:player:2892425	Phillips, Billy	sr:competitor:58	forward	ENG	39
sr:player:249397	Centurion, Ricardo	sr:competitor:3208	forward	ARG	33
sr:player:257475	Pizzini, Francisco	sr:competitor:3208	forward	ARG	20
sr:player:339115	Santos, Michael	sr:competitor:3208	forward	URY	7
sr:player:340455	Aquino, Claudio	sr:competitor:3208	midfielder	ARG	22
sr:player:358914	Mammana, Emanuel	sr:competitor:3208	defender	ARG	2
sr:player:365862	Gomez, Elias	sr:competitor:3208	defender	ARG	3
sr:player:802520	Romero, Braian	sr:competitor:3208	forward	ARG	9
sr:player:847265	Elias, Jalil	sr:competitor:3208	midfielder	SYR	5
sr:player:954954	Bouzat, Agustin	sr:competitor:3208	forward	ARG	26
sr:player:15497	Ochoa, Guillermo	sr:competitor:1031053	goalkeeper	MEX	13
sr:player:44685	Nene	sr:competitor:1031053	forward	BRA	18
sr:player:58826	Teixeira, Jorge	sr:competitor:1031053	defender	PRT	5
sr:player:61123	Trigueira, Pedro	sr:competitor:1031053	goalkeeper	PRT	88
sr:player:101973	Djeras	sr:competitor:1031053	forward	CPV	29
sr:player:156025	Piazon, Lucas	sr:competitor:1031053	forward	BRA	14
sr:player:156569	Aburjania, Giorgi	sr:competitor:1031053	midfielder	GEO	8
sr:player:170131	Silva, Luis	sr:competitor:1031053	midfielder	PRT	7
sr:player:268407	Lucca, Jonatan	sr:competitor:1031053	midfielder	BRA	47
sr:player:287695	Veiga, Eric	sr:competitor:1031053	midfielder	LUX	27
sr:player:308104	Junior	sr:competitor:1031053	defender	PRT	\N
sr:player:324345	Kiki	sr:competitor:1031053	defender	PRT	24
sr:player:357750	Sambu, Idrisa	sr:competitor:1031053	defender	PRT	\N
sr:player:775077	Fernando Fonseca	sr:competitor:1031053	defender	PRT	2
sr:player:907914	Grau, Jaume	sr:competitor:1031053	midfielder	ESP	15
sr:player:1058087	Assuncao, Gustavo	sr:competitor:1031053	midfielder	BRA	12
sr:player:1233948	Jose Ricardo	sr:competitor:1031053	defender	BRA	98
sr:player:1644522	Rodrigues, Rafael	sr:competitor:1031053	defender	PRT	3
sr:player:1658035	Lopes, Vasco	sr:competitor:1031053	forward	CPV	10
sr:player:1704445	Mena, Yair	sr:competitor:1031053	forward	COL	16
sr:player:1746801	Simao	sr:competitor:1031053	goalkeeper	BRA	93
sr:player:1957443	Mercado, John	sr:competitor:1031053	forward	ECU	17
sr:player:1987441	Mendonca, Gustavo	sr:competitor:1031053	midfielder	PRT	23
sr:player:2026551	Devenish, Cristian	sr:competitor:1031053	defender	COL	42
sr:player:2059831	Roux, Baptiste	sr:competitor:1031053	defender	FRA	6
sr:player:2148962	Granada, Samuel	sr:competitor:1031053	forward	BRA	70
sr:player:2198608	Akinsola, Tunde	sr:competitor:1031053	forward	NGA	11
sr:player:2261535	Rodriguez, Ignacio	sr:competitor:1031053	defender	URY	4
sr:player:2265089	Ribeiro, Rodrigo	sr:competitor:1031053	forward	PRT	20
sr:player:2410269	Clayton	sr:competitor:1031053	defender	BRA	40
sr:player:2411877	Leo	sr:competitor:1031053	defender	BRA	22
sr:player:2411883	Freitas, Thiago	sr:competitor:1031053	defender	BRA	3
sr:player:2439633	Kamate, Issiaka	sr:competitor:1031053	midfielder	FRA	9
sr:player:2466257	Moura, Lucas	sr:competitor:1031053	goalkeeper	PRT	1
sr:player:2675865	Barbosa da Silva, Carlos Daniel	sr:competitor:1031053	forward	BRA	77
sr:player:72806	Edwards, Joe	sr:competitor:71	defender	ENG	8
sr:player:73951	Gray, Andre	sr:competitor:71	forward	JAM	19
sr:player:87507	Palsson, Victor	sr:competitor:71	defender	ISL	44
sr:player:103117	Forshaw, Adam	sr:competitor:71	midfielder	ENG	27
sr:player:190841	Houghton, Jordan	sr:competitor:71	defender	ENG	4
sr:player:198030	Galloway, Brendan	sr:competitor:71	defender	ZWE	22
sr:player:359402	Marosi, Marko	sr:competitor:71	goalkeeper	SVK	25
sr:player:370458	Pleguezuelo, Julio	sr:competitor:71	defender	ESP	5
sr:player:547376	Hardie, Ryan	sr:competitor:71	forward	SCO	9
sr:player:606142	Hazard, Conor	sr:competitor:71	goalkeeper	NIR	21
sr:player:937340	Grimshaw, Daniel	sr:competitor:71	goalkeeper	ENG	31
sr:player:1033199	Bundu, Mustapha	sr:competitor:71	forward	SLE	15
sr:player:1089764	Gibson, Lewis	sr:competitor:71	defender	ENG	17
sr:player:1299390	Ogbeta, Nathanael	sr:competitor:71	defender	ENG	3
sr:player:1392219	Obafemi, Michael	sr:competitor:71	forward	IRL	14
sr:player:1473696	Mumba, Bali	sr:competitor:71	midfielder	ENG	2
sr:player:1614642	Tijani, Muhamed	sr:competitor:71	forward	NGA	26
sr:player:1639452	Szucs, Kornel	sr:competitor:71	defender	HUN	6
sr:player:1712521	Hajal, Rami	sr:competitor:71	midfielder	SWE	28
sr:player:1835844	Randell, Adam	sr:competitor:71	midfielder	ENG	20
sr:player:1836318	Wright, Callum	sr:competitor:71	midfielder	ENG	11
sr:player:1838736	Sorinola, Matthew	sr:competitor:71	defender	ENG	29
sr:player:1855368	Whittaker, Morgan	sr:competitor:71	forward	ENG	10
sr:player:2244201	Jenkins-Davies, William	sr:competitor:71	midfielder	ENG	32
sr:player:2269345	Gyabi, Darko	sr:competitor:71	midfielder	ENG	18
sr:player:2269975	Issaka, Frederick	sr:competitor:71	forward	WAL	35
sr:player:2269979	Roberts, Caleb	sr:competitor:71	midfielder	ENG	34
sr:player:2342609	Cissoko, Ibrahim	sr:competitor:71	midfielder	NLD	7
sr:player:2610781	Hatch, Joseph	sr:competitor:71	forward	WAL	38
sr:player:2765633	Matthews, Jack	sr:competitor:71	defender	ENG	37
sr:player:2825701	Holman, Daniel	sr:competitor:71	goalkeeper	ENG	49
sr:player:2872239	Azaz, Finn	sr:competitor:71	midfielder	ENG	39
sr:player:2575743	Mosqueira, Joaquin	sr:competitor:3204	midfielder	ARG	5
sr:player:2650651	Profini, Rafael	sr:competitor:3204	midfielder	ARG	24
sr:player:2652389	Vargas, Lautaro	sr:competitor:3204	defender	ARG	35
sr:player:2665873	Verde	sr:competitor:3204	midfielder	ARG	31
sr:player:2759995	Fascendini, Valentin	sr:competitor:3204	defender	ARG	13
sr:player:2802057	Pumpido, Francisco	sr:competitor:3204	midfielder	MEX	36
sr:player:122710	Casco, Milton	sr:competitor:3211	defender	ARG	20
sr:player:158241	Pezzella, German	sr:competitor:3211	defender	ARG	6
sr:player:158259	Gonzalez Pirez, Leandro	sr:competitor:3211	defender	ARG	14
sr:player:220315	Lanzini, Manuel	sr:competitor:3211	midfielder	ARG	10
sr:player:221140	Armani, Franco	sr:competitor:3211	goalkeeper	ARG	1
sr:player:252313	Funes Mori, Ramiro	sr:competitor:3211	defender	ARG	3
sr:player:295159	Kranevitter, Matias	sr:competitor:3211	midfielder	ARG	5
sr:player:54672	Simao, David	sr:competitor:25777	midfielder	PRT	5
sr:player:61174	Moreira, Pedro	sr:competitor:25777	midfielder	PRT	20
sr:player:161431	Galovic, Nino	sr:competitor:25777	defender	HRV	44
sr:player:190171	Rodrigues, Ivo	sr:competitor:25777	forward	PRT	7
sr:player:328455	Popovic, Boris	sr:competitor:25777	defender	SRB	13
sr:player:330677	Jason	sr:competitor:25777	forward	ESP	10
sr:player:358544	Thiago	sr:competitor:25777	goalkeeper	BRA	12
sr:player:816572	Loum, Mamadou	sr:competitor:25777	midfielder	SEN	31
sr:player:913928	Busquets, Oriol	sr:competitor:25777	midfielder	ESP	14
sr:player:918772	Sylla, Morlaye	sr:competitor:25777	midfielder	GIN	2
sr:player:936524	Yalcin, Guven	sr:competitor:25777	forward	TUR	50
sr:player:948304	Esgaio, Tiago	sr:competitor:25777	midfielder	PRT	28
sr:player:986267	Kouassi, Eboue	sr:competitor:25777	midfielder	CIV	8
sr:player:1091230	Pinto, Alex	sr:competitor:25777	defender	PRT	78
sr:player:1239244	Mantl, Nico	sr:competitor:25777	goalkeeper	DEU	58
sr:player:1323012	Weverson	sr:competitor:25777	defender	BRA	26
sr:player:1323034	Vitinho	sr:competitor:25777	midfielder	BRA	43
sr:player:1414135	Trezza, Alfonso	sr:competitor:25777	midfielder	URY	19
sr:player:1643612	Gozalbez, Pablo	sr:competitor:25777	forward	ESP	22
sr:player:1672421	Valido, Joao	sr:competitor:25777	goalkeeper	PRT	1
sr:player:1672519	Quaresma	sr:competitor:25777	defender	BRA	6
sr:player:1737539	Dante, Amadou	sr:competitor:25777	defender	MLI	27
sr:player:1743261	Fontán, Jose	sr:competitor:25777	defender	ESP	3
sr:player:1766015	Morozov, Vladislav	sr:competitor:25777	forward	BLR	9
sr:player:1950980	Araujo, Henrique	sr:competitor:25777	forward	PRT	39
sr:player:1953626	Puche Garcia, Miguel	sr:competitor:25777	forward	ESP	11
sr:player:2079197	Rocha, Matias	sr:competitor:25777	defender	URY	4
sr:player:2156574	Fukui, Taichi	sr:competitor:25777	midfielder	JPN	21
sr:player:2239973	Lamba, Chico	sr:competitor:25777	defender	PRT	73
sr:player:2436877	Santos, Pedro	sr:competitor:25777	midfielder	PRT	89
sr:player:103115	Bidwell, Jake	sr:competitor:11	defender	ENG	21
sr:player:216590	Wilson, Ben	sr:competitor:11	goalkeeper	ENG	13
sr:player:310546	Allen, Jamie	sr:competitor:11	midfielder	ENG	8
sr:player:367058	Collins, Bradley	sr:competitor:11	goalkeeper	ENG	40
sr:player:605330	Sheaf, Ben	sr:competitor:11	midfielder	ENG	14
sr:player:769093	DaSilva, Jay	sr:competitor:11	defender	WAL	3
sr:player:809762	Wright, Haji	sr:competitor:11	forward	USA	11
sr:player:944542	Torp, Victor	sr:competitor:11	midfielder	DNK	29
sr:player:1015215	Thomas-Asante, Brandon	sr:competitor:11	forward	GHA	23
sr:player:1047095	Latibeaudiere, Joel	sr:competitor:11	defender	JAM	22
sr:player:1079834	Mason-Clark, Ephron Jardell	sr:competitor:11	forward	ENG	10
sr:player:1300736	Binks, Luis	sr:competitor:11	defender	ENG	2
sr:player:1391335	Kitching, Liam	sr:competitor:11	defender	ENG	15
sr:player:1606440	Van Ewijk, Milan	sr:competitor:11	defender	NLD	27
sr:player:1708063	Sakamoto, Tatsuhiro	sr:competitor:11	midfielder	JPN	7
sr:player:1720482	Rudoni, Jack	sr:competitor:11	midfielder	ENG	5
sr:player:1724722	Dovin, Oliver	sr:competitor:11	goalkeeper	SWE	1
sr:player:1836834	Eccles, Josh	sr:competitor:11	midfielder	ENG	28
sr:player:1837596	Tavares, Fabio	sr:competitor:11	forward	ENG	30
sr:player:1880202	Borges Rodrigues, Raphael	sr:competitor:11	midfielder	AUS	17
sr:player:2047569	Thomas, Bobby	sr:competitor:11	defender	ENG	4
sr:player:2052913	Simms, Ellis Reco	sr:competitor:11	forward	ENG	9
sr:player:2202410	Howley, Ryan	sr:competitor:11	midfielder	WAL	36
sr:player:2210824	Bassette, Norman	sr:competitor:11	forward	BEL	37
sr:player:2276203	Yearn, Kai	sr:competitor:11	midfielder	ENG	\N
sr:player:2660269	Perry, Callum	sr:competitor:11	defender	ENG	61
sr:player:2661553	Andrews, Kai	sr:competitor:11	midfielder	WAL	54
sr:player:2793561	Dausch, Aidan	sr:competitor:11	forward	ENG	59
sr:player:2862117	Broad, Harvey	sr:competitor:11	defender	ENG	51
sr:player:2888015	Bell, Luke	sr:competitor:11	goalkeeper	ENG	48
sr:player:2892421	Rachel, Daniel	sr:competitor:11	goalkeeper	ENG	99
sr:player:2863809	Chibueze, Chinonso	sr:competitor:29	forward	ENG	51
sr:player:2886075	Giani, Laurence	sr:competitor:29	defender	ENG	52
sr:player:22981	Sosa, Jose	sr:competitor:3206	midfielder	ARG	7
sr:player:33958	Perez, Enzo	sr:competitor:3206	midfielder	ARG	22
sr:player:33959	Piatti, Pablo	sr:competitor:3206	forward	ARG	10
sr:player:38393	Fernandez, Federico	sr:competitor:3206	defender	ARG	6
sr:player:174519	Carrillo, Guido	sr:competitor:3206	forward	ARG	9
sr:player:249009	Lollo, Luciano	sr:competitor:3206	defender	ARG	26
sr:player:954864	Ascacibar, Santiago	sr:competitor:3206	midfielder	ARG	5
sr:player:1111571	Neves, Gabriel	sr:competitor:3206	midfielder	URY	8
sr:player:1235580	Arzamendia, Santiago	sr:competitor:3206	defender	PRY	15
sr:player:1406243	Cetre, Edwuin	sr:competitor:3206	forward	COL	18
sr:player:1408083	Altamirano, Javier	sr:competitor:3206	midfielder	CHL	17
sr:player:1721874	Mendez, Mauro	sr:competitor:3206	forward	URY	16
sr:player:1725614	Rodriguez, Facundo	sr:competitor:3206	defender	ARG	2
sr:player:2072607	Benedetti Taffarel, Gaston	sr:competitor:3206	defender	ARG	13
sr:player:2089527	Kociubinski, Bautista	sr:competitor:3206	midfielder	ARG	24
sr:player:2091211	Meza, Eric	sr:competitor:3206	midfielder	ARG	20
sr:player:2109232	Palacios, Tiago	sr:competitor:3206	midfielder	URY	32
sr:player:2173246	Mansilla, Matias	sr:competitor:3206	goalkeeper	ARG	12
sr:player:98454	Robinson, Jack	sr:competitor:15	defender	ENG	19
sr:player:77929	Matias, Marco	sr:competitor:2998	forward	PRT	77
sr:player:288997	Davies, Adam	sr:competitor:15	goalkeeper	WAL	17
sr:player:298366	Moore, Kieffer	sr:competitor:15	forward	WAL	9
sr:player:769103	Davies, Tom	sr:competitor:15	midfielder	ENG	22
sr:player:819294	Souttar, Harry	sr:competitor:15	defender	AUS	6
sr:player:934484	Ahmedhodzic, Anel	sr:competitor:15	defender	BIH	15
sr:player:936322	Campbell, Tyrese	sr:competitor:15	forward	ENG	23
sr:player:1011811	Hamer, Gustavo	sr:competitor:15	midfielder	NLD	8
sr:player:1089766	Brewster, Rhian	sr:competitor:15	forward	ENG	7
sr:player:1107735	Coulibaly, Ismaila	sr:competitor:15	forward	MLI	29
sr:player:1111055	O`Hare, Callum	sr:competitor:15	midfielder	ENG	10
sr:player:126076	Tomane	sr:competitor:2998	forward	PRT	9
sr:player:280977	Barbosa, Rafael	sr:competitor:2998	midfielder	PRT	8
sr:player:310800	Artur Jorge	sr:competitor:2998	defender	PRT	4
sr:player:551812	Silva, Raul	sr:competitor:2998	defender	BRA	34
sr:player:776023	Poloni, Derick	sr:competitor:2998	forward	BRA	31
sr:player:790663	Carvalho, Miguel	sr:competitor:2998	goalkeeper	PRT	22
sr:player:935060	Millan, Alex	sr:competitor:2998	forward	ESP	19
sr:player:944220	Poveda, Darío	sr:competitor:2998	forward	ESP	14
sr:player:951394	Gomes Pinto, Jaime Alexandrino	sr:competitor:2998	forward	PRT	71
sr:player:1007047	Neto, Angelo	sr:competitor:2998	midfielder	BRA	6
sr:player:1356296	Norrington-Davies, Rhys	sr:competitor:15	defender	WAL	33
sr:player:1553543	Cooper, Michael	sr:competitor:15	goalkeeper	ENG	1
sr:player:1555685	Shackleton, Jamie	sr:competitor:15	midfielder	ENG	16
sr:player:1557125	Souza, Vinicius	sr:competitor:15	midfielder	BRA	21
sr:player:1654825	McCallum, Sam	sr:competitor:15	defender	ENG	3
sr:player:1732473	Burrows, Harrison	sr:competitor:15	midfielder	ENG	14
sr:player:1737729	Seriki, Femi	sr:competitor:15	defender	ENG	38
sr:player:2144758	Rak-Sakyi, Jesuran	sr:competitor:15	midfielder	ENG	11
sr:player:2160046	Boyes, Harry	sr:competitor:15	defender	ENG	43
sr:player:2249329	Gilchrist, Alfie	sr:competitor:15	defender	ENG	2
sr:player:2316601	Arblaster, Ollie	sr:competitor:15	midfielder	ENG	4
sr:player:1012931	Falcao, Claudio	sr:competitor:2998	midfielder	BRA	29
sr:player:1013311	Velho, Ricardo	sr:competitor:2998	goalkeeper	PRT	33
sr:player:1015151	Balde, Elves	sr:competitor:2998	forward	GNB	7
sr:player:1017081	Merghem, Mehdi	sr:competitor:2998	midfielder	FRA	79
sr:player:1046781	Soares, Filipe	sr:competitor:2998	midfielder	PRT	21
sr:player:1297782	Moreno, Marco	sr:competitor:2998	defender	ESP	3
sr:player:1395461	Talys	sr:competitor:2998	defender	BRA	12
sr:player:1404929	Velasquez, Jhon	sr:competitor:2998	midfielder	COL	10
sr:player:1514065	Lucas Africo	sr:competitor:2998	defender	BRA	44
sr:player:1609468	Bermejo Escribano, Alex	sr:competitor:2998	forward	ESP	11
sr:player:2404997	One, Ryan	sr:competitor:15	forward	SCO	39
sr:player:1633732	Canizares, Lucas	sr:competitor:2998	goalkeeper	ESP	23
sr:player:2032853	Felipe, Luiz	sr:competitor:2998	goalkeeper	BRA	1
sr:player:2104448	Custodio Lima, David Samuel	sr:competitor:2998	defender	BRA	28
sr:player:2178968	Victor, Paulo	sr:competitor:2998	defender	BRA	2
sr:player:2201194	Seruca, Andre	sr:competitor:2998	defender	PRT	50
sr:player:2265075	Menino, Miguel	sr:competitor:2998	midfielder	PRT	93
sr:player:2266581	Pereira, Kaique	sr:competitor:2998	goalkeeper	BRA	1
sr:player:2282543	Vicente dos Santos, Bruno Miguel	sr:competitor:2998	forward	PRT	17
sr:player:2631593	Arsrnio Candeias, Andre Miguel	sr:competitor:2998	forward	PRT	41
sr:player:2803405	Teixeira, Rafael	sr:competitor:2998	midfielder	PRT	88
sr:player:2821325	Bastos Almeida, Geovanny Miguel	sr:competitor:2998	midfielder	PRT	16
sr:player:2837747	Rivaldo	sr:competitor:2998	defender	PRT	70
sr:player:2443617	Brooks, Andre	sr:competitor:15	midfielder	ENG	35
sr:player:2661189	Faxon, Luke	sr:competitor:15	goalkeeper	ENG	31
sr:player:2740599	Peck, Sydie	sr:competitor:15	midfielder	ENG	42
sr:player:2769201	Blacker, Billy	sr:competitor:15	forward	ENG	41
sr:player:2792935	Sachdev, Sai	sr:competitor:15	defender	ENG	45
sr:player:2793567	Hampson, Owen	sr:competitor:15	midfielder	WAL	44
sr:player:2836925	Marsh, Louie	sr:competitor:15	forward	ENG	34
sr:player:26989	Rodriguez, Jay	sr:competitor:6	forward	ENG	9
sr:player:100578	Egan, John	sr:competitor:6	defender	IRL	16
sr:player:115346	Redmond, Nathan	sr:competitor:6	forward	ENG	15
sr:player:151518	Hladky, Vaclav	sr:competitor:6	goalkeeper	CZE	32
sr:player:358394	Brownhill, Josh	sr:competitor:6	midfielder	ENG	8
sr:player:552036	Laurent, Josh	sr:competitor:6	midfielder	ENG	29
sr:player:552632	Manuel, Benson	sr:competitor:6	forward	AGO	10
sr:player:816106	Cullen, Josh	sr:competitor:6	midfielder	IRL	24
sr:player:869092	Roberts, Connor	sr:competitor:6	defender	WAL	14
sr:player:914348	Ekdal, Hjalmar	sr:competitor:6	defender	SWE	18
sr:player:936432	Delcroix, Hannes	sr:competitor:6	defender	BEL	44
sr:player:936458	Tresor, Mike	sr:competitor:6	forward	BEL	31
sr:player:945378	Flemming, Zian	sr:competitor:6	midfielder	NLD	19
sr:player:948682	Worrall, Joe	sr:competitor:6	defender	ENG	4
sr:player:1047255	Beyer, Louis	sr:competitor:6	defender	DEU	13
sr:player:1298608	Foster, Lyle	sr:competitor:6	forward	ZAF	17
sr:player:1300186	Massengo, Han-Noah	sr:competitor:6	midfielder	FRA	42
sr:player:1382065	Sambo, Shurandy	sr:competitor:6	defender	NLD	3
sr:player:96845	Abdoulaye	sr:competitor:49531	defender	SEN	55
sr:player:190137	Soares, Rafa	sr:competitor:49531	defender	PRT	5
sr:player:318623	Gonzalez, Mario	sr:competitor:49531	forward	ESP	9
sr:player:352874	Rochinha	sr:competitor:49531	forward	PRT	10
sr:player:355352	Zlobin, Ivan	sr:competitor:49531	goalkeeper	RUS	1
sr:player:583838	Dias, Gil	sr:competitor:49531	midfielder	PRT	23
sr:player:758314	Carevic, Lazar	sr:competitor:49531	goalkeeper	MNE	25
sr:player:978127	Van de Looi, Tom	sr:competitor:49531	midfielder	NLD	6
sr:player:1045869	Mihaj, Enea	sr:competitor:49531	defender	ALB	4
sr:player:1081796	Youssouf, Zaydou	sr:competitor:49531	midfielder	FRA	28
sr:player:1115925	De Haas, Justin	sr:competitor:49531	defender	NLD	16
sr:player:1297958	Pires Da Cunha, Hugo Alberto	sr:competitor:49531	goalkeeper	PRT	90
sr:player:1604140	Riccieli	sr:competitor:49531	defender	BRA	15
sr:player:1710501	Realpe, Leo	sr:competitor:49531	defender	ECU	\N
sr:player:1711151	Topic, Mirko	sr:competitor:49531	midfielder	SRB	8
sr:player:1724786	Aranda, Oscar	sr:competitor:49531	forward	ESP	11
sr:player:1830256	Calegari	sr:competitor:49531	defender	BRA	2
sr:player:1850758	Pinheiro Ferreira, Rodrigo	sr:competitor:49531	defender	PRT	17
sr:player:2139162	Liimatta, Otso	sr:competitor:49531	midfielder	FIN	18
sr:player:2157496	Sorriso	sr:competitor:49531	forward	BRA	7
sr:player:2264537	Muller, Jose Claro	sr:competitor:49531	defender	PRT	\N
sr:player:2265669	Gomes Cabral, Diogo Rafael	sr:competitor:49531	midfielder	ITA	71
sr:player:2409745	Lobato, Samuel	sr:competitor:49531	midfielder	PRT	88
sr:player:2417945	Sa, Gustavo	sr:competitor:49531	midfielder	PRT	20
sr:player:2527033	Costa, Diogo	sr:competitor:49531	\N	PRT	75
sr:player:2530491	Gabriel Cabral	sr:competitor:49531	midfielder	BRA	22
sr:player:2615015	Rodrigues, Afonso	sr:competitor:49531	forward	PRT	19
sr:player:2659405	De Amorim, Mathias	sr:competitor:49531	midfielder	PRT	14
sr:player:2822029	Ba, Ibrahima	sr:competitor:49531	defender	SEN	55
sr:player:2848201	Zabiri, Yassir	sr:competitor:49531	forward	MAR	21
sr:player:23571	Ramsey, Aaron	sr:competitor:61	midfielder	WAL	10
sr:player:136675	Siopis, Manolis	sr:competitor:61	midfielder	GRC	3
sr:player:158221	Alnwick, Jak	sr:competitor:61	goalkeeper	ENG	21
sr:player:184463	Ralls, Joe	sr:competitor:61	midfielder	ENG	8
sr:player:190851	Robinson, Callum	sr:competitor:61	forward	IRL	47
sr:player:227942	Chambers, Calum	sr:competitor:61	defender	ENG	12
sr:player:257497	Goutas, Dimitris	sr:competitor:61	defender	GRC	4
sr:player:305128	Collins, Jamilu	sr:competitor:61	defender	NGA	17
sr:player:305230	O'Dowda, Callum	sr:competitor:61	midfielder	IRL	11
sr:player:343013	Horvath, Ethan	sr:competitor:61	goalkeeper	USA	1
sr:player:352922	Meite, Yakou	sr:competitor:61	forward	CIV	19
sr:player:356334	Willock, Chris	sr:competitor:61	midfielder	ENG	16
sr:player:362470	El Ghazi, Anwar	sr:competitor:61	midfielder	NLD	20
sr:player:582190	Ng, Perry	sr:competitor:61	defender	ENG	38
sr:player:851776	Daland, Jesper	sr:competitor:61	defender	NOR	5
sr:player:907872	Kanga, Wilfried	sr:competitor:61	forward	CIV	15
sr:player:992775	Turnbull, David	sr:competitor:61	forward	SCO	14
sr:player:1249402	Rinomhota, Andy	sr:competitor:61	midfielder	ZWE	35
sr:player:1382205	Davies, Isaak	sr:competitor:61	forward	WAL	39
sr:player:1633866	Etete, Kion	sr:competitor:61	forward	ENG	9
sr:player:1644204	Colwill, Rubin	sr:competitor:61	midfielder	WAL	27
sr:player:1652557	Fish, Will	sr:competitor:61	defender	ENG	2
sr:player:1744909	Tsunoda, Ryotaro	sr:competitor:61	defender	JPN	\N
sr:player:1973193	Tanner, Ollie	sr:competitor:61	forward	ENG	32
sr:player:2010765	Bagan, Joel	sr:competitor:61	defender	IRL	23
sr:player:2080873	Turner, Matthew	sr:competitor:61	goalkeeper	WAL	41
sr:player:2180616	Robertson, Alex	sr:competitor:61	midfielder	ENG	18
sr:player:2201782	Davies, Thomas	sr:competitor:61	defender	WAL	37
sr:player:2256219	Nyakuhwa, Tanatswa	sr:competitor:61	midfielder	WAL	53
sr:player:2535583	Wigley, Morgan	sr:competitor:61	forward	ENG	54
sr:player:2610759	Lawlor, Dylan	sr:competitor:61	defender	WAL	48
sr:player:2612283	Giles, Luey	sr:competitor:61	defender	WAL	49
sr:player:2612285	Twose, Cody	sr:competitor:61	midfielder	WAL	52
sr:player:2660265	Ashford, Cian	sr:competitor:61	midfielder	WAL	45
sr:player:2731872	Kpakio, Ronan	sr:competitor:61	defender	WAL	44
sr:player:2798459	Mafico, Dakarai	sr:competitor:61	midfielder	WAL	51
sr:player:2841043	Gbadehan, Adeteye	sr:competitor:61	midfielder	ENG	43
sr:player:2841045	Reindorf, Michael	sr:competitor:61	midfielder	ENG	46
sr:player:2849363	Jefferies, Isaac	sr:competitor:61	forward	ENG	50
sr:player:40776	Jara, Franco	sr:competitor:3203	forward	ARG	29
sr:player:46007	Suarez, Matias	sr:competitor:3203	forward	ARG	7
sr:player:121973	Chavarria, Pablo	sr:competitor:3203	forward	ARG	19
sr:player:249429	Menossi, Lucas	sr:competitor:3203	midfielder	ARG	15
sr:player:340731	Quignon, Facundo	sr:competitor:3203	midfielder	ARG	23
sr:player:341059	Delgado, Rafael	sr:competitor:3203	defender	ARG	33
sr:player:579316	Passerini, Lucas	sr:competitor:3203	forward	ARG	9
sr:player:581804	Fernandez, Nicolas	sr:competitor:3203	forward	ARG	22
sr:player:872024	Espinola, Juan	sr:competitor:3203	goalkeeper	PRY	25
sr:player:912992	Rolon, Esteban	sr:competitor:3203	midfielder	ARG	16
sr:player:954896	Rebola, Alejandro Daniel	sr:competitor:3203	defender	ARG	6
sr:player:1112441	Chicco, Ignacio	sr:competitor:3203	goalkeeper	ARG	1
sr:player:39697	Perez, Damian	sr:competitor:3209	defender	ARG	15
sr:player:2009095	Jones, Isaiah	sr:competitor:36	midfielder	ENG	11
sr:player:2042621	Hoppe, Matthew	sr:competitor:36	forward	USA	13
sr:player:2055753	Azaz, Finn	sr:competitor:36	midfielder	IRL	20
sr:player:2064915	Van den Berg, Rav	sr:competitor:36	defender	NLD	3
sr:player:2131958	Conway, Tommy	sr:competitor:36	forward	SCO	22
sr:player:2246813	Hamilton, Micah	sr:competitor:36	midfielder	ENG	17
sr:player:2281013	Doak, Ben	sr:competitor:36	midfielder	SCO	50
sr:player:2659749	Cartwrtight, Fin	sr:competitor:36	midfielder	ENG	40
sr:player:2669999	Hunt, Harley	sr:competitor:36	defender	ENG	41
sr:player:2782043	Lennon, Charlie	sr:competitor:36	forward	ENG	43
sr:player:2837189	McCormick, George	sr:competitor:36	defender	ENG	37
sr:player:2848425	McCabe, Law Marc	sr:competitor:36	midfielder	ENG	49
sr:player:2848427	Wilson, James	sr:competitor:36	midfielder	ENG	42
sr:player:2850241	Simpson, Nathan	sr:competitor:36	defender	ENG	44
sr:player:59932	Forsyth, Craig	sr:competitor:27	defender	SCO	3
sr:player:88169	Collins, James	sr:competitor:27	forward	IRL	9
sr:player:115434	Nelson, Curtis	sr:competitor:27	defender	ENG	35
sr:player:120480	Mendez Laing, Nathaniel	sr:competitor:27	midfielder	GTM	11
sr:player:137808	Barkhuizen, Tom	sr:competitor:27	forward	ENG	7
sr:player:144679	Bradley, Sonny	sr:competitor:27	defender	ENG	5
sr:player:282665	Osborn, Ben	sr:competitor:27	midfielder	ENG	8
sr:player:291027	Washington, Conor	sr:competitor:27	forward	NIR	14
sr:player:340689	Jackson, Kayden	sr:competitor:27	forward	ENG	19
sr:player:368146	Harness, Marcus	sr:competitor:27	forward	ENG	18
sr:player:370476	Vickers, Josh	sr:competitor:27	goalkeeper	ENG	31
sr:player:557614	Adams, Ebou	sr:competitor:27	midfielder	GMB	32
sr:player:789687	Yates, Jerry	sr:competitor:27	forward	ENG	10
sr:player:791753	Elder, Callum	sr:competitor:27	defender	AUS	20
sr:player:824104	Nyambe, Ryan	sr:competitor:27	defender	NAM	24
sr:player:932774	Blackett-Taylor, Corey	sr:competitor:27	forward	ENG	27
sr:player:1006787	Wilson, Kane	sr:competitor:27	defender	ENG	2
sr:player:1104761	Ward, Joe	sr:competitor:27	midfielder	ENG	23
sr:player:1382073	Goudmijn, Kenzo	sr:competitor:27	midfielder	NLD	17
sr:player:1498433	Widell Zetterstrom, Jacob	sr:competitor:27	goalkeeper	SWE	1
sr:player:1544819	Phillips, Nat	sr:competitor:27	defender	ENG	12
sr:player:1951292	Thompson, Liam Francis	sr:competitor:27	midfielder	ENG	16
sr:player:1951296	Cashin, Eiran Joe	sr:competitor:27	defender	IRL	6
sr:player:2331733	Luthra, Rohan	sr:competitor:27	goalkeeper	ENG	13
sr:player:2337541	Chirewa, Tawanda	sr:competitor:27	midfielder	ENG	28
sr:player:2415625	Rooney, Jake	sr:competitor:27	defender	ENG	34
sr:player:2451021	Turley, Freddie	sr:competitor:27	midfielder	IRL	40
sr:player:2496427	Ozoh, David	sr:competitor:27	midfielder	ENG	4
sr:player:2549295	Brown, Dajaune	sr:competitor:27	forward	ENG	39
sr:player:1112863	Palavecino, Matias	sr:competitor:3203	midfielder	ARG	14
sr:player:1295652	Reyna, Bryan	sr:competitor:3203	forward	PER	11
sr:player:1401345	Marin, Matias	sr:competitor:3203	midfielder	CHL	10
sr:player:1560706	Compagnucci, Gabriel Carlos	sr:competitor:3203	midfielder	ARG	8
sr:player:1694093	Gonzalez Metilli, Francisco	sr:competitor:3203	midfielder	ARG	24
sr:player:1829486	Leguizamon, Anibal	sr:competitor:3203	defender	ARG	2
sr:player:2077079	Baldi, Agustin	sr:competitor:3203	defender	ARG	45
sr:player:2113510	Sanchez, Ulises	sr:competitor:3203	forward	ARG	12
sr:player:2184886	Meriano, Nicolas	sr:competitor:3203	defender	ARG	13
sr:player:2442897	Barbieri, Gino	sr:competitor:3203	defender	ARG	\N
sr:player:2548605	Tapia, Ignacio	sr:competitor:3203	forward	ARG	21
sr:player:2652415	Facelo	sr:competitor:3203	defender	ARG	35
sr:player:2652417	Troilo	sr:competitor:3203	defender	ARG	37
sr:player:2652421	Lencioni	sr:competitor:3203	forward	ARG	26
sr:player:2706250	Heredia, Geronimo	sr:competitor:3203	defender	ARG	34
sr:player:2725744	Lucco, Jeremias	sr:competitor:3203	midfielder	ARG	42
sr:player:2738127	Rami, Franco	sr:competitor:3203	forward	ARG	43
sr:player:2782217	Daniele, Matias	sr:competitor:3203	goalkeeper	ARG	28
sr:player:2793605	Bernabeu, Lucas	sr:competitor:3203	defender	ARG	44
sr:player:2801593	Velazquez, Juan	sr:competitor:3203	forward	ARG	53
sr:player:2803489	Oses, Maximo	sr:competitor:3203	forward	ARG	52
sr:player:2814411	Bustos, Lucas Emanuel	sr:competitor:3203	midfielder	ARG	48
sr:player:2814413	Hernandes, Ramiro	sr:competitor:3203	midfielder	ARG	51
sr:player:2835199	Argayo, Lucas	sr:competitor:3203	goalkeeper	ARG	39
sr:player:2843483	Herrera, Juan	sr:competitor:3203	defender	ARG	57
sr:player:2843485	Velazco, Lucio	sr:competitor:3203	defender	ARG	56
sr:player:2843487	Bonfigli, Mirko	sr:competitor:3203	midfielder	ARG	58
sr:player:2843489	Acosta, Santiago	sr:competitor:3203	midfielder	ARG	55
sr:player:2843491	Zelarayn, Gonzalo	sr:competitor:3203	forward	ARG	54
sr:player:2272757	Castillo Manyoma, Alexis	sr:competitor:3206	midfielder	COL	19
sr:player:2287817	Boselli, Juan Sebastian	sr:competitor:3206	defender	URY	14
sr:player:2315095	Arango, Juan	sr:competitor:3206	defender	ARG	46
sr:player:2315099	Flores, Santiago Gabriel	sr:competitor:3206	defender	ARG	4
sr:player:2336605	Iacovich, Fabricio	sr:competitor:3206	goalkeeper	ARG	1
sr:player:2559501	Orbe, Ezequiel	sr:competitor:3206	defender	ARG	36
sr:player:2588911	Borzone, Rodrigo	sr:competitor:3206	goalkeeper	ARG	30
sr:player:2588955	Benedetti, Nehuen	sr:competitor:3206	midfielder	ARG	28
sr:player:2256197	Crewe, Charles	sr:competitor:34	midfielder	WAL	50
sr:player:2278983	Moore, Kris	sr:competitor:34	defender	ENG	46
sr:player:2406171	Christy, Harry	sr:competitor:34	goalkeeper	ENG	55
sr:player:2491027	Fernandez, Mateo Joseph	sr:competitor:34	forward	ESP	19
sr:player:2495819	Debayo, James	sr:competitor:34	defender	ENG	37
sr:player:2846515	Chambers, Sam	sr:competitor:34	\N	ENG	42
sr:player:31761	Evans, Ched	sr:competitor:21	forward	WAL	9
sr:player:73412	Cornell, David	sr:competitor:21	goalkeeper	WAL	13
sr:player:78368	Hughes, Andrew	sr:competitor:21	defender	WAL	16
sr:player:98431	Keane, Will	sr:competitor:21	forward	IRL	7
sr:player:117899	Brady, Robbie	sr:competitor:21	midfielder	IRL	11
sr:player:139520	Bauer, Patrick	sr:competitor:21	defender	DEU	26
sr:player:252999	Potts, Brad	sr:competitor:21	midfielder	ENG	44
sr:player:255073	Whatmough, Jack	sr:competitor:21	defender	ENG	5
sr:player:284417	Woodman, Freddie	sr:competitor:21	goalkeeper	ENG	1
sr:player:309290	Holmes, Duane	sr:competitor:21	midfielder	USA	25
sr:player:331219	Lindsay, Liam	sr:competitor:21	defender	SCO	6
sr:player:361322	Ledson, Ryan	sr:competitor:21	midfielder	ENG	18
sr:player:775063	Whiteman, Ben	sr:competitor:21	midfielder	ENG	4
sr:player:935544	Okkels, Jeppe	sr:competitor:21	midfielder	DNK	23
sr:player:992575	Thordarson, Stefan Teitur	sr:competitor:21	forward	ISL	22
sr:player:1012773	Storey, Jordan	sr:competitor:21	defender	ENG	14
sr:player:1132695	Bowler, Josh	sr:competitor:21	midfielder	ENG	40
sr:player:1246248	McCann, Ali	sr:competitor:21	midfielder	NIR	8
sr:player:1395885	Riis, Emil	sr:competitor:21	forward	DNK	9
sr:player:1418987	Osmajic, Milutin	sr:competitor:21	midfielder	MNE	28
sr:player:1476700	Frokjaer-Jensen, Mads	sr:competitor:21	midfielder	DNK	10
sr:player:1724640	Greenwood, Sam	sr:competitor:21	forward	ENG	20
sr:player:1884448	Stewart, Layton	sr:competitor:21	forward	ENG	17
sr:player:2052337	Hayden, Kaine	sr:competitor:21	defender	ENG	29
sr:player:2239514	Seary, Josh	sr:competitor:21	defender	IRL	36
sr:player:2470921	Cross Adair, Finlay Douglas	sr:competitor:21	forward	ENG	29
sr:player:2654461	Nelson, Kitt	sr:competitor:21	midfielder	ENG	34
sr:player:2657109	Taylor, Kian	sr:competitor:21	midfielder	ENG	30
sr:player:2657113	Rodriguez-Gentile, Felipe	sr:competitor:21	forward	BRA	24
sr:player:2657785	Best, Kian	sr:competitor:21	defender	ENG	33
sr:player:2785107	Mawene, Theo	sr:competitor:21	midfielder	ENG	31
sr:player:2711726	Gonzlez, David	sr:competitor:3215	midfielder	ARG	49
sr:player:2778279	Dalbon, Juan Martin	sr:competitor:3215	forward	ARG	\N
sr:player:2814417	Paredes, Pedro Maximo	sr:competitor:3215	midfielder	ARG	14
sr:player:2828895	Bergara, Matias	sr:competitor:3215	forward	ARG	37
sr:player:2859287	Acevedo, Matias	sr:competitor:3215	midfielder	ARG	11
sr:player:146982	Rodriguez, Lucas	sr:competitor:4937	defender	ARG	18
sr:player:174937	Romero, Silvio	sr:competitor:4937	forward	ARG	10
sr:player:339933	Franco, Juan	sr:competitor:4937	defender	PRY	2
sr:player:537036	Cabrera, Victor	sr:competitor:4937	defender	ARG	36
sr:player:802434	Papaleo, Joaquin	sr:competitor:4937	goalkeeper	ARG	38
sr:player:802444	Bay, Jonathan	sr:competitor:4937	defender	ARG	12
sr:player:847259	Alarcon, Fernando Ruben	sr:competitor:4937	defender	ARG	6
sr:player:956070	Batallini, Damian	sr:competitor:4937	forward	ARG	11
sr:player:1112613	Acevedo, Jonas	sr:competitor:4937	forward	ARG	8
sr:player:1134751	Roffo, Manuel	sr:competitor:4937	goalkeeper	ARG	28
sr:player:1143532	Cuello, Brahian	sr:competitor:4937	midfielder	ARG	20
sr:player:1403327	Lodico, Gaston	sr:competitor:4937	midfielder	ARG	19
sr:player:1561626	Romero, Matias	sr:competitor:4937	midfielder	ARG	32
sr:player:1736137	Lo Celso, Francesco	sr:competitor:4937	midfielder	ARG	17
sr:player:1744143	Bochi, Roberto Agustin	sr:competitor:4937	midfielder	ARG	5
sr:player:1836046	Brizuela, Miguel	sr:competitor:4937	midfielder	ARG	33
sr:player:1945980	Suarez, Facundo	sr:competitor:4937	forward	ARG	9
sr:player:2073259	Cerato, Giuliano	sr:competitor:4937	defender	ARG	4
sr:player:2091213	Moreyra, Stefano	sr:competitor:4937	midfielder	ARG	34
sr:player:2098014	Russo Cordero, Ignacio	sr:competitor:4937	forward	ARG	29
sr:player:2110100	Franco Diaz	sr:competitor:4937	midfielder	ARG	30
sr:player:2541149	Sittaro, Emanuel	sr:competitor:4937	goalkeeper	ARG	35
sr:player:2541155	Rodriguez, Gregorio	sr:competitor:4937	forward	ARG	7
sr:player:2553203	Puebla, Damian	sr:competitor:4937	midfielder	ARG	22
sr:player:2580569	Requena, Gonzalo	sr:competitor:4937	defender	ARG	31
sr:player:2734152	Dubersarsky, Nicolas	sr:competitor:4937	midfielder	ARG	47
sr:player:2765423	Lazaro, Jeremias	sr:competitor:4937	midfielder	ARG	16
sr:player:2772287	Cabrera, Lautaro	sr:competitor:4937	defender	ARG	42
sr:player:2834701	Klimowicz, Matias	sr:competitor:4937	forward	ECU	59
sr:player:2839771	Espeche, Lautaro	sr:competitor:4937	goalkeeper	ARG	\N
sr:player:2839777	Ledesma, Mateo	sr:competitor:4937	goalkeeper	ARG	\N
sr:player:2839781	Albornoz, Santiago	sr:competitor:4937	defender	ARG	\N
sr:player:2839789	Albarracin, Juan Pablo	sr:competitor:4937	defender	ARG	\N
sr:player:2839793	Velazquez, Pedro	sr:competitor:4937	defender	ARG	\N
sr:player:2839797	Canalda, Joel	sr:competitor:4937	defender	ARG	\N
sr:player:2839799	Ferreyra, Luka	sr:competitor:4937	midfielder	ARG	\N
sr:player:2839805	Vasquez, Matias	sr:competitor:4937	midfielder	ARG	\N
sr:player:2839817	Rodriguez, Lautaro	sr:competitor:4937	midfielder	ARG	\N
sr:player:2070485	Morais, Tiago	sr:competitor:3036	forward	PRT	11
sr:player:2143616	Aguilera, Brandon	sr:competitor:3036	midfielder	CRI	16
sr:player:2146272	Silva, Clayton	sr:competitor:3036	forward	BRA	9
sr:player:2203202	Ronaldo, Fabio	sr:competitor:3036	forward	PRT	77
sr:player:2229732	Tiknaz, Demir	sr:competitor:3036	midfielder	TUR	34
sr:player:2268487	Muniz, Joao	sr:competitor:3036	defender	PRT	\N
sr:player:2353685	Zoabi, Karem	sr:competitor:3036	forward	ISR	14
sr:player:2366167	Okkas, Georgios	sr:competitor:3036	midfielder	CYP	\N
sr:player:2645735	Medina, Tobias	sr:competitor:3036	forward	ARG	27
sr:player:2691984	Igbokwe, Goodluck	sr:competitor:3036	forward	NGA	15
sr:player:2702772	Sina, Anxhelo	sr:competitor:3036	goalkeeper	ALB	\N
sr:player:2760507	Petrasso, Francisco	sr:competitor:3036	defender	ARG	23
sr:player:42699	Ritchie, Matt	sr:competitor:2	midfielder	SCO	30
sr:player:84258	Pack, Marlon	sr:competitor:2	midfielder	ENG	7
sr:player:181583	Archer, Jordan	sr:competitor:2	goalkeeper	SCO	31
sr:player:284427	Ogilvie, Connor	sr:competitor:2	defender	ENG	3
sr:player:291483	Murphy, Josh	sr:competitor:2	midfielder	ENG	23
sr:player:365296	Norris, Will	sr:competitor:2	goalkeeper	ENG	1
sr:player:374384	Bishop, Colby	sr:competitor:2	forward	ENG	9
sr:player:573696	Whyte, Gavin	sr:competitor:2	forward	NIR	11
sr:player:605062	Poole, Regan	sr:competitor:2	defender	WAL	5
sr:player:755276	McIntyre, Tom	sr:competitor:2	defender	SCO	16
sr:player:859006	Schmid, Nicolas	sr:competitor:2	goalkeeper	AUT	13
sr:player:868412	Moxon, Owen	sr:competitor:2	midfielder	ENG	17
sr:player:912934	Stevenson, Ben	sr:competitor:2	midfielder	ENG	14
sr:player:936290	Williams, Jordan	sr:competitor:2	defender	ENG	2
sr:player:936304	Dozzell, Andre	sr:competitor:2	midfielder	ENG	21
sr:player:979113	Scully, Anthony	sr:competitor:2	midfielder	IRL	27
sr:player:1012671	Lowery, Tom	sr:competitor:2	midfielder	ENG	26
sr:player:1086096	Sorensen, Elias	sr:competitor:2	forward	DNK	18
sr:player:1132691	Lang, Callum	sr:competitor:2	forward	ENG	49
sr:player:1249158	Shaughnessy, Conor	sr:competitor:2	defender	IRL	6
sr:player:1880186	Yengi, Kusini	sr:competitor:2	forward	AUS	10
sr:player:1880416	Silvera, Sam	sr:competitor:2	forward	AUS	20
sr:player:1889428	Devlin, Terry	sr:competitor:2	midfielder	NIR	24
sr:player:1939974	Blair, Harvey	sr:competitor:2	forward	ENG	29
sr:player:1965559	Kamara, Abdoulaye	sr:competitor:2	midfielder	GIN	25
sr:player:1979519	Saydee, Christian	sr:competitor:2	forward	ENG	15
sr:player:2064625	Swanson, Zak	sr:competitor:2	defender	ENG	22
sr:player:2093886	Towler, Ryley	sr:competitor:2	midfielder	ENG	4
sr:player:2218908	Lane, Paddy	sr:competitor:2	defender	NIR	32
sr:player:2257259	Steward, Toby	sr:competitor:2	goalkeeper	ENG	33
sr:player:2262323	Farrell, Jacob	sr:competitor:2	defender	AUS	19
sr:player:2275129	Potts, Freddie	sr:competitor:2	midfielder	ENG	8
sr:player:2306871	O'Mahony, Mark	sr:competitor:2	forward	IRL	11
sr:player:2543103	Bowat, Ibane	sr:competitor:2	defender	SCO	34
sr:player:2842889	Clout, Harry	sr:competitor:2	midfielder	ENG	99
sr:player:33268	Sigali, Leonardo	sr:competitor:3215	defender	ARG	30
sr:player:221162	Quintero, Juan Fernando	sr:competitor:3215	midfielder	COL	8
sr:player:249407	Vietto, Luciano	sr:competitor:3215	forward	ARG	12
sr:player:249409	Zuculini, Bruno	sr:competitor:3215	midfielder	ARG	36
sr:player:320917	Conti, German	sr:competitor:3215	defender	ARG	20
sr:player:327293	Garcia Basso, Agustin	sr:competitor:3215	defender	ARG	2
sr:player:344243	Martínez, Roger	sr:competitor:3215	forward	COL	10
sr:player:581782	Arias, Gabriel	sr:competitor:3215	goalkeeper	CHL	21
sr:player:954706	Rojas, Hernan Gabriel	sr:competitor:3215	defender	ARG	27
sr:player:954718	Reniero, Nicolas	sr:competitor:3215	forward	ARG	9
sr:player:976053	Cambeses, Facundo	sr:competitor:3215	goalkeeper	ARG	25
sr:player:1141112	Salas, Maximiliano	sr:competitor:3215	forward	ARG	7
sr:player:1328854	Martinez, Adrian	sr:competitor:3215	forward	ARG	9
sr:player:1407479	Carbonero, Johan	sr:competitor:3215	forward	COL	17
sr:player:1417701	Sosa, Santiago	sr:competitor:3215	midfielder	ARG	13
sr:player:1419563	Almendra, Agustin	sr:competitor:3215	midfielder	ARG	32
sr:player:1428209	Barrios, Martin	sr:competitor:3215	midfielder	URY	16
sr:player:1559008	Urzi, Agustin	sr:competitor:3215	forward	ARG	18
sr:player:1707813	Mura, Facundo	sr:competitor:3215	defender	ARG	34
sr:player:1835604	Colombo, Nazareno	sr:competitor:3215	defender	ARG	6
sr:player:1875686	Nardoni, Juan	sr:competitor:3215	midfielder	ARG	5
sr:player:2012055	Martirena, Gaston	sr:competitor:3215	defender	URY	15
sr:player:2090929	Di Cesare, Marco	sr:competitor:3215	defender	ARG	3
sr:player:2148978	Leon, Roberto Ignacio	sr:competitor:3215	goalkeeper	ARG	1
sr:player:2220180	Solari, Santiago	sr:competitor:3215	forward	ARG	28
sr:player:2343043	Rodriguez, Baltasar	sr:competitor:3215	midfielder	ARG	22
sr:player:2372887	Fernandez, Roman	sr:competitor:3215	forward	ARG	50
sr:player:2375163	Meaurio, Nicolas	sr:competitor:3215	forward	ARG	58
sr:player:2524227	Elordi, Juan Manuel	sr:competitor:3215	defender	ARG	19
sr:player:2542695	Quiros, Santiago	sr:competitor:3215	midfielder	ARG	35
sr:player:2597111	Degregorio, Ramiro Matias	sr:competitor:3215	forward	ARG	41
sr:player:2616015	Vera, Santino	sr:competitor:3215	forward	ARG	29
sr:player:2657261	Gomez, Francisco	sr:competitor:3215	goalkeeper	ARG	44
sr:player:2665869	Escudero, Gonzalo	sr:competitor:3215	defender	ARG	43
sr:player:773591	Pedersen, Kristian	sr:competitor:74	defender	DNK	3
sr:player:953266	Tymon, Josh	sr:competitor:74	defender	ENG	14
sr:player:1050245	Cabango, Ben	sr:competitor:74	defender	WAL	5
sr:player:1079566	Watt, Daniel	sr:competitor:74	forward	WAL	43
sr:player:1090480	Darling, Harry	sr:competitor:74	defender	ENG	6
sr:player:1125457	Fisher, Andy	sr:competitor:74	goalkeeper	ENG	1
sr:player:1298458	Vipotnik, Zan	sr:competitor:74	forward	SVN	9
sr:player:1393821	Cooper, Oliver	sr:competitor:74	midfielder	WAL	31
sr:player:1428315	Key, Josh	sr:competitor:74	defender	ENG	2
sr:player:1724648	Peart-Harris, Myles	sr:competitor:74	midfielder	ENG	25
sr:player:1745725	Franco, Goncalo	sr:competitor:74	midfielder	PRT	17
sr:player:1882766	Tjoe-a-On, Nathan	sr:competitor:74	defender	IDN	21
sr:player:1957949	Ji-sung, Eom	sr:competitor:74	midfielder	KOR	10
sr:player:1981053	Bianchini, Florian	sr:competitor:74	midfielder	FRA	19
sr:player:2065213	Abbey, Nelson	sr:competitor:74	defender	ENG	32
sr:player:2120914	Pereira Martins, Ronald	sr:competitor:74	midfielder	BRA	35
sr:player:2284293	Abdulai, Azeem	sr:competitor:74	midfielder	ENG	47
sr:player:2293235	Broome, Nathan	sr:competitor:74	goalkeeper	ENG	29
sr:player:2610789	Parker, Samuel	sr:competitor:74	defender	WAL	41
sr:player:2713962	Govea, Aimar	sr:competitor:74	forward	ECU	37
sr:player:80918	Tobio, Fernando	sr:competitor:7629	defender	ARG	2
sr:player:106490	Burdisso, Guillermo	sr:competitor:7629	defender	ARG	33
sr:player:339265	Echeverria, Rodrigo	sr:competitor:7629	midfielder	CHL	20
sr:player:588618	Galindez, Hernan	sr:competitor:7629	goalkeeper	ECU	1
sr:player:798660	Abila, Ramon	sr:competitor:7629	forward	ARG	9
sr:player:802938	Fattori, Federico	sr:competitor:7629	midfielder	ARG	24
sr:player:817530	Ramirez, Erik	sr:competitor:7629	forward	ARG	43
sr:player:954460	Benitez, Guillermo	sr:competitor:7629	defender	ARG	13
sr:player:960926	Fertoli, Hector	sr:competitor:7629	forward	ARG	8
sr:player:1079872	Mazzantti, Walter	sr:competitor:7629	forward	ARG	10
sr:player:1103771	Carrizo, Lucas	sr:competitor:7629	defender	ARG	3
sr:player:1358546	De La Fuente, Hernan	sr:competitor:7629	defender	ARG	29
sr:player:1407145	Siles, Pablo	sr:competitor:7629	midfielder	URY	22
sr:player:1492874	Alarcon, Williams	sr:competitor:7629	midfielder	CHL	5
sr:player:1509277	Pereyra, Fabio	sr:competitor:7629	defender	ARG	6
sr:player:1726056	Perez, Marcelo	sr:competitor:7629	forward	PRY	19
sr:player:1835018	Sonora, Alan	sr:competitor:7629	midfielder	USA	28
sr:player:1835390	Ramirez, Sebastian Francisco	sr:competitor:7629	forward	ARG	17
sr:player:1862862	Ibanez, Cesar	sr:competitor:7629	defender	ARG	25
sr:player:1862864	Cabral, Rodrigo	sr:competitor:7629	forward	ARG	16
sr:player:2010547	Meza, Sebastian Tomas	sr:competitor:7629	goalkeeper	ARG	32
sr:player:2109738	Souto, Lucas	sr:competitor:7629	defender	ARG	4
sr:player:2226284	Toledo, Agustin	sr:competitor:7629	midfielder	ARG	26
sr:player:2376661	Pizarro, .	sr:competitor:7629	defender	ARG	\N
sr:player:2440529	Figueredo	sr:competitor:7629	defender	ARG	31
sr:player:2455769	Alfonso, Franco	sr:competitor:7629	forward	ARG	11
sr:player:2541151	Watson, Franco	sr:competitor:7629	midfielder	ARG	21
sr:player:2620345	Martinez, Alexis	sr:competitor:7629	defender	ARG	39
sr:player:2642237	Duran, Nazareno	sr:competitor:7629	goalkeeper	ARG	27
sr:player:2868381	Campo, Ignacio Nicolas	sr:competitor:7629	defender	ARG	34
sr:player:329601	Borja, Miguel	sr:competitor:3211	forward	COL	9
sr:player:340861	Fernandez, Ignacio	sr:competitor:3211	midfielder	ARG	26
sr:player:340897	Meza, Maximiliano	sr:competitor:3211	midfielder	ARG	8
sr:player:341097	Ledesma, Jeremias	sr:competitor:3211	goalkeeper	ARG	25
sr:player:578560	Acuna, Marcos	sr:competitor:3211	defender	ARG	24
sr:player:803412	Martinez, Gonzalo	sr:competitor:3211	midfielder	ARG	18
sr:player:803812	Diaz, Paulo	sr:competitor:3211	defender	CHL	17
sr:player:954976	Aliendro, Rodrigo	sr:competitor:3211	midfielder	ARG	29
sr:player:1038623	Bustos, Fabricio	sr:competitor:3211	defender	ARG	16
sr:player:1099078	Sant'Anna, Agustin	sr:competitor:3211	defender	URY	27
sr:player:1101471	Bareiro, Adam	sr:competitor:3211	forward	PRY	7
sr:player:1414409	Colidio, Facundo	sr:competitor:3211	forward	ARG	11
sr:player:1548187	Gattoni, Federico	sr:competitor:3211	defender	ARG	2
sr:player:1600932	Fonseca, Nicolas	sr:competitor:3211	midfielder	URY	4
sr:player:1696453	Diaz, Enzo	sr:competitor:3211	defender	ARG	13
sr:player:1713493	Villagra, Rodrigo	sr:competitor:3211	midfielder	ARG	23
sr:player:1957475	Simon, Santiago	sr:competitor:3211	forward	ARG	31
sr:player:2090823	Solari, Pablo	sr:competitor:3211	forward	ARG	36
sr:player:2602517	Lavagnino, Lucas	sr:competitor:3211	goalkeeper	ARG	37
sr:player:2616751	Echeverri, Claudio	sr:competitor:3211	midfielder	ARG	19
sr:player:2717356	Mastantuono, Franco	sr:competitor:3211	midfielder	ARG	30
sr:player:2717360	Subiabre, Ian Martin	sr:competitor:3211	forward	ARG	38
sr:player:2717362	Ruberto, Agustin Fabian	sr:competitor:3211	forward	ARG	32
sr:player:2762913	Luna, Jonas	sr:competitor:3211	midfielder	ARG	34
sr:player:93199	Rodriguez, Luis Miguel	sr:competitor:36833	forward	ARG	7
sr:player:129520	Peruzzi, Gino	sr:competitor:36833	defender	ARG	30
sr:player:579356	Breitenbruch, Nestor	sr:competitor:36833	defender	ARG	15
sr:player:584422	Orihuela, Matias	sr:competitor:36833	defender	ARG	39
sr:player:954974	Acosta, Guillermo	sr:competitor:36833	midfielder	ARG	8
sr:player:87185	Weimann, Andreas	sr:competitor:46	forward	AUT	14
sr:player:90121	Batth, Danny	sr:competitor:46	defender	ENG	15
sr:player:129118	McFadzean, Kyle	sr:competitor:46	defender	ENG	4
sr:player:190859	Baker, Lewis	sr:competitor:46	midfielder	ENG	42
sr:player:228374	Trondstad, Sondre	sr:competitor:46	midfielder	NOR	6
sr:player:600608	Hyam, Dominic	sr:competitor:46	defender	SCO	5
sr:player:600620	Hedges, Ryan	sr:competitor:46	midfielder	WAL	19
sr:player:851054	Sigurdsson, Arnor	sr:competitor:46	midfielder	ISL	7
sr:player:943474	Toth, Balazs	sr:competitor:46	goalkeeper	HUN	12
sr:player:944796	Pears, Aynsley	sr:competitor:46	goalkeeper	ENG	1
sr:player:993319	Brittain, Callum	sr:competitor:46	defender	ENG	2
sr:player:1012669	Pickering, Harry	sr:competitor:46	defender	ENG	3
sr:player:1012777	Wharton, Scott	sr:competitor:46	defender	ENG	16
sr:player:1088468	Travis, Lewis	sr:competitor:46	midfielder	ENG	27
sr:player:1298332	Beck, Owen	sr:competitor:46	defender	WAL	24
sr:player:1336196	Cantwell, Todd	sr:competitor:46	midfielder	ENG	8
sr:player:1567420	Gueye, Makhtar	sr:competitor:46	forward	SEN	9
sr:player:1646134	Ohashi, Yuki	sr:competitor:46	forward	JPN	23
sr:player:1720470	Buckley, John	sr:competitor:46	midfielder	ENG	21
sr:player:1856846	Rankin-Costello, Joe	sr:competitor:46	midfielder	ENG	11
sr:player:2017981	Carter, Hayden	sr:competitor:46	defender	ENG	17
sr:player:2067743	Dolan, Tyrhys	sr:competitor:46	midfielder	ENG	10
sr:player:2116920	Hilton, Joe	sr:competitor:46	goalkeeper	ENG	13
sr:player:2404523	Leonard, Harry	sr:competitor:46	forward	ENG	20
sr:player:2439779	Cozier-Duberry, Amario	sr:competitor:46	forward	ENG	33
sr:player:2453651	Mafoumbi, Exauce	sr:competitor:46	midfielder	FRA	\N
sr:player:2644765	Doherty, Aodhan	sr:competitor:46	forward	NIR	\N
sr:player:2659751	Gilsenan, Zak	sr:competitor:46	midfielder	IRL	22
sr:player:2659971	Bloxham, Tom	sr:competitor:46	forward	ENG	37
sr:player:2733436	Duru, Leonard Chibueze	sr:competitor:46	defender	ENG	39
sr:player:2742899	Finneran, Rory	sr:competitor:46	midfielder	IRL	42
sr:player:2770297	Barrett, Jack	sr:competitor:46	goalkeeper	ENG	\N
sr:player:2787059	Tyjon, Igor	sr:competitor:46	forward	ENG	32
sr:player:2891101	Litherland, Matthew	sr:competitor:46	defender	ENG	40
sr:player:1400055	Durso, Tomas	sr:competitor:36833	goalkeeper	ARG	25
sr:player:1404325	De los Santos, Matias	sr:competitor:36833	defender	URY	3
sr:player:1476492	Tesuri, Renzo Ivan	sr:competitor:36833	forward	ARG	18
sr:player:1488592	Melo, Rodrigo	sr:competitor:36833	midfielder	ARG	41
sr:player:1561328	Ferrari, Gianluca	sr:competitor:36833	defender	ARG	6
sr:player:1605764	Albornoz, Camilo	sr:competitor:36833	midfielder	ARG	\N
sr:player:1712575	Sanchez, Adrian	sr:competitor:36833	midfielder	ARG	5
sr:player:1726226	Estigarriba, Marcelo	sr:competitor:36833	forward	ARG	19
sr:player:1835312	Ambrogio, Lucas Martin	sr:competitor:36833	forward	ARG	27
sr:player:2839825	Rossi, Ignacio	sr:competitor:4937	midfielder	ARG	\N
sr:player:2839839	Paez, Adrian	sr:competitor:4937	forward	ARG	\N
sr:player:2839843	Avellaneda, Manuel	sr:competitor:4937	forward	ARG	\N
sr:player:2839847	Guzman, Diago	sr:competitor:4937	forward	ARG	\N
sr:player:2839859	Albarracin, Lorenzo	sr:competitor:4937	forward	ARG	\N
sr:player:2850825	Rojas, Hugo Eliel	sr:competitor:4937	\N	\N	55
sr:player:122615	Mancuello, Federico	sr:competitor:3209	midfielder	ARG	11
sr:player:122634	Marcone, Ivan	sr:competitor:3209	midfielder	ARG	23
sr:player:158249	Rey, Rodrigo	sr:competitor:3209	goalkeeper	ARG	33
sr:player:249657	Buffarini, Julio	sr:competitor:3209	defender	ARG	7
sr:player:802574	Avalos, Gabriel	sr:competitor:3209	forward	PRY	9
sr:player:802990	Canelo, Alexis	sr:competitor:3209	forward	ARG	32
sr:player:803382	Laso, Joaquin	sr:competitor:3209	defender	ARG	2
sr:player:984351	Sporle, Adrian	sr:competitor:3209	defender	ARG	3
sr:player:1134379	Quinonez, Jhonny	sr:competitor:3209	midfielder	ECU	28
sr:player:1835022	Gonzalez, Lucas	sr:competitor:3209	midfielder	ARG	17
sr:player:1957415	Lomonaco, Kevin	sr:competitor:3209	defender	ARG	26
sr:player:2013263	Ortega, Thomas	sr:competitor:3209	defender	ARG	3
sr:player:2090563	Vera, Federico	sr:competitor:3209	defender	ARG	4
sr:player:2115362	Maestro Puch, Ignacio	sr:competitor:3209	forward	ARG	18
sr:player:2136800	Pellegrino, Marco	sr:competitor:3209	defender	ARG	6
sr:player:2149448	Toloza, Santiago	sr:competitor:3209	midfielder	ARG	10
sr:player:2153932	Segovia, Diego	sr:competitor:3209	goalkeeper	URY	25
sr:player:2154490	Barcia, Mateo	sr:competitor:3209	midfielder	URY	8
sr:player:2185314	Chavez, Fernando Joaquin	sr:competitor:3209	defender	ARG	6
sr:player:2343087	Hidalgo, Santiago	sr:competitor:3209	forward	ARG	16
sr:player:2395761	Ortiz, Sergio Fabian	sr:competitor:3209	midfielder	ARG	37
sr:player:2400849	Vallejo, Javier Nicolas	sr:competitor:3209	forward	ARG	31
sr:player:2407647	Montiel, Santiago	sr:competitor:3209	defender	ARG	44
sr:player:2419681	Fedorco, Juan Manuel	sr:competitor:3209	defender	ARG	29
sr:player:2532751	Gimenez Rojas, Matias	sr:competitor:3209	forward	ARG	34
sr:player:2548151	Tasso, Manuel	sr:competitor:3209	goalkeeper	ARG	12
sr:player:2558461	Da Rosa, Fernando Sebastian	sr:competitor:3209	defender	ARG	31
sr:player:2558465	Salle, Santiago	sr:competitor:3209	midfielder	ARG	35
sr:player:2560237	Loyola, Felipe	sr:competitor:3209	defender	CHL	5
sr:player:2586753	Martinez, Ruben	sr:competitor:3209	midfielder	ARG	21
sr:player:2615573	Lopez, Santiago	sr:competitor:3209	forward	ARG	24
sr:player:1643946	Mejbri, Hannibal	sr:competitor:6	midfielder	TUN	28
sr:player:1644602	Esteve, Maxime	sr:competitor:6	defender	FRA	5
sr:player:1724642	Trafford, James	sr:competitor:6	goalkeeper	ENG	1
sr:player:1793748	Sarmiento, Jeremy	sr:competitor:6	forward	ECU	7
sr:player:1984485	Egan-Riley, CJ	sr:competitor:6	defender	ENG	6
sr:player:1984739	Humphreys, Bashir	sr:competitor:6	defender	ENG	12
sr:player:2058603	Green, Etienne	sr:competitor:6	goalkeeper	FRA	20
sr:player:2070595	Anthony, Jaidon	sr:competitor:6	forward	ENG	11
sr:player:2142354	Hountondji, Andreas	sr:competitor:6	forward	BEN	37
sr:player:2200574	Pires, Lucas	sr:competitor:6	defender	BRA	23
sr:player:2206302	Dodgson, Owen	sr:competitor:6	defender	ENG	39
sr:player:2208306	Ramsey, Aaron	sr:competitor:6	midfielder	ENG	21
sr:player:2284359	McDermott, Tommy	sr:competitor:6	midfielder	ENG	49
sr:player:2355173	Agyei, Enock	sr:competitor:6	forward	BEL	48
sr:player:2358299	Koleosho, Luca	sr:competitor:6	forward	ITA	30
sr:player:2764511	Bevan, Joe	sr:competitor:6	forward	SCO	\N
sr:player:2793037	Westley, Joe	sr:competitor:6	forward	ENG	47
sr:player:2846735	Hugill, Will	sr:competitor:6	midfielder	ENG	43
sr:player:2846739	Masara, Vernon	sr:competitor:6	forward	ENG	51
sr:player:140103	Barrios, Pier	sr:competitor:6074	defender	ARG	2
sr:player:551382	Ramirez, Roberto Fabian	sr:competitor:6074	goalkeeper	ARG	12
sr:player:918898	Petroli, Franco	sr:competitor:6074	goalkeeper	ARG	1
sr:player:1016781	Fernandez, Roberto	sr:competitor:6074	midfielder	URY	13
sr:player:871966	Rodriguez, Walter	sr:competitor:191648	midfielder	PRY	25
sr:player:912404	Saracho, Rodrigo	sr:competitor:191648	goalkeeper	ARG	29
sr:player:931516	Brito Hernandez, Maximiliano	sr:competitor:191648	forward	URY	33
sr:player:984233	Benegas, Nicolas	sr:competitor:191648	forward	ARG	32
sr:player:1046427	Bravo, Gonzalo	sr:competitor:191648	midfielder	ARG	10
sr:player:1108191	Herrera, Jonathan	sr:competitor:191648	forward	ARG	9
sr:player:1143516	Murillo Mena, Yaison	sr:competitor:191648	defender	COL	4
sr:player:1267486	Goitia, Jonathan Esteban	sr:competitor:191648	defender	ARG	27
sr:player:1509291	Sansotre, Nicolas	sr:competitor:191648	midfielder	ARG	15
sr:player:1560590	Arce, Ignacio	sr:competitor:191648	goalkeeper	ARG	1
sr:player:1599824	Diaz, Alexander	sr:competitor:191648	forward	ARG	20
sr:player:2070031	Ramirez, Pedro David	sr:competitor:191648	defender	ARG	5
sr:player:2089993	Manganelli, Nahuel	sr:competitor:191648	goalkeeper	ARG	12
sr:player:2105126	Rodriguez, Maximiliano	sr:competitor:191648	defender	ARG	26
sr:player:2114484	Sayavedra, Rodrigo	sr:competitor:191648	forward	ARG	28
sr:player:2120742	Caro Torres, Nicolas	sr:competitor:191648	defender	ARG	3
sr:player:2126126	Sanchez, Braian	sr:competitor:191648	midfielder	ARG	35
sr:player:2142908	Villoldo, Tomas	sr:competitor:191648	defender	ARG	18
sr:player:2142916	Goya, Jonathan Javier	sr:competitor:191648	midfielder	ARG	19
sr:player:2225032	Barrionuevo, Alan	sr:competitor:191648	defender	ARG	40
sr:player:2226316	Alonso Espinoza, Antony Daniel	sr:competitor:191648	forward	URY	7
sr:player:2226318	Benitez, Gustavo	sr:competitor:191648	defender	ARG	24
sr:player:2239657	Cavallera, Rodrigo	sr:competitor:191648	defender	ARG	38
sr:player:2303289	James, Jeremias	sr:competitor:191648	defender	ARG	6
sr:player:2328683	Landriel, Leonardo	sr:competitor:191648	midfielder	ARG	30
sr:player:2566569	Toledo Pacheco, Lautaro Alfredo	sr:competitor:191648	defender	ARG	\N
sr:player:2609613	Minervino, Delfor	sr:competitor:191648	defender	ARG	36
sr:player:2640479	Sanabria, Mario	sr:competitor:191648	forward	ARG	37
sr:player:2758263	Monje, Pablo	sr:competitor:191648	midfielder	ARG	14
sr:player:2767101	Borja Velazquez, Joaquin	sr:competitor:191648	midfielder	ARG	23
sr:player:2775555	Cucinotta, Matteo	sr:competitor:191648	forward	ARG	31
sr:player:2802825	Apolonio, Mateo	sr:competitor:191648	defender	ARG	25
sr:player:2802829	Rojas, Benjamin	sr:competitor:191648	defender	CHL	35
sr:player:2814121	Barcelo, Jaime	sr:competitor:191648	goalkeeper	ARG	39
sr:player:2893937	Spreen	sr:competitor:191648	midfielder	ARG	47
sr:player:2588957	Atum, Axel	sr:competitor:3206	midfielder	ARG	29
sr:player:2588969	Amato, Fabricio	sr:competitor:3206	midfielder	ARG	46
sr:player:2717122	Pierani, Valente	sr:competitor:3206	defender	ARG	34
sr:player:2737533	Gimenez, Luciano	sr:competitor:3206	forward	ARG	23
sr:player:2773251	Gomez, Roman	sr:competitor:3206	defender	ARG	31
sr:player:2774947	Dall'aglio, Emanuel	sr:competitor:3206	defender	ARG	40
sr:player:2774949	Pereyra, Joaquin	sr:competitor:3206	defender	ARG	39
sr:player:2785217	Sagues Barreiro, Benjamin	sr:competitor:3206	forward	ARG	49
sr:player:2827919	Amondarain, Mikel	sr:competitor:3206	midfielder	ARG	35
sr:player:2859665	Perez Escudero, Fabricio Alexis	sr:competitor:3206	forward	ARG	37
sr:player:2865093	Contrera, Matias	sr:competitor:3206	forward	ARG	45
sr:player:2873539	Burgos, Joaquin Tobio	sr:competitor:3206	forward	ARG	38
sr:player:2873543	Cornejo, Lucas Dante	sr:competitor:3206	midfielder	ARG	42
sr:player:1103747	Salvareschi, Braian	sr:competitor:6074	defender	ARG	15
sr:player:1104389	Cejas, Juan	sr:competitor:6074	forward	ARG	7
sr:player:1433631	Pereyra, Elias	sr:competitor:6074	defender	ARG	21
sr:player:2005583	Rodriguez, Salomon	sr:competitor:6074	forward	URY	19
sr:player:2018073	Poggi, Vicente	sr:competitor:6074	midfielder	URY	25
sr:player:2052451	Rasmussen, Federico	sr:competitor:6074	defender	ARG	23
sr:player:2092958	Pozzo, Tomas Agustin	sr:competitor:6074	midfielder	ARG	10
sr:player:40686	Colback, Jack	sr:competitor:1	midfielder	ENG	4
sr:player:42707	Cook, Steve	sr:competitor:1	defender	ENG	5
sr:player:134248	Frey, Michael	sr:competitor:1	forward	CHE	12
sr:player:135263	Andersen, Lucas	sr:competitor:1	midfielder	DNK	25
sr:player:155717	Nardi, Paul	sr:competitor:1	goalkeeper	FRA	1
sr:player:285997	Paal, Kenneth	sr:competitor:1	defender	SUR	22
sr:player:288957	Fox, Morgan	sr:competitor:1	defender	WAL	15
sr:player:775071	Clarke-Salter, Jake	sr:competitor:1	defender	ENG	6
sr:player:886286	Chair, Ilias	sr:competitor:1	midfielder	MAR	10
sr:player:908332	Dunne, Jimmy	sr:competitor:1	defender	IRL	3
sr:player:932612	Smyth, Paul	sr:competitor:1	midfielder	NIR	11
sr:player:936488	Celar, Zan	sr:competitor:1	forward	SVN	18
sr:player:990853	Field, Sam	sr:competitor:1	midfielder	ENG	8
sr:player:1061660	Madsen, Nicolas	sr:competitor:1	midfielder	DNK	24
sr:player:1298502	Dixon-Bonner, Elijah	sr:competitor:1	midfielder	ENG	19
sr:player:1322518	Saito, Koki	sr:competitor:1	midfielder	JPN	14
sr:player:1428671	Ashby, Harrison	sr:competitor:1	defender	SCO	20
sr:player:1635754	Morrison, Liam	sr:competitor:1	defender	SCO	16
sr:player:1745723	Dembele, Karamoko	sr:competitor:1	forward	ENG	7
sr:player:1838692	Walsh, Joe	sr:competitor:1	goalkeeper	ENG	13
sr:player:2116298	Shepperd, Nathan	sr:competitor:1	goalkeeper	WAL	41
sr:player:2137584	Lloyd, Alfie	sr:competitor:1	midfielder	ENG	28
sr:player:2150258	Varane, Jonathan	sr:competitor:1	midfielder	FRA	40
sr:player:2363529	Aoraha, Alex	sr:competitor:1	midfielder	IRQ	33
sr:player:2409689	Hevertton	sr:competitor:1	defender	BRA	23
sr:player:2487249	Morgan, Kieran	sr:competitor:1	defender	ENG	21
sr:player:2610797	Tuck, Alfie	sr:competitor:1	midfielder	WAL	29
sr:player:2625085	Bennie, Daniel	sr:competitor:1	forward	AUS	27
sr:player:2661625	Kolli, Rayan	sr:competitor:1	forward	DZA	26
sr:player:2752537	Talla, Lorent	sr:competitor:1	midfielder	KOS	30
sr:player:155714	Rodriguez, Juan Gabriel	sr:competitor:3210	defender	ARG	6
sr:player:248977	Herrera, Guido	sr:competitor:3210	goalkeeper	ARG	22
sr:player:249643	Catalan, Matias	sr:competitor:3210	defender	CHL	4
sr:player:249829	Botta Montero, Ruben Alejandro	sr:competitor:3210	midfielder	ARG	10
sr:player:312056	Palacios, Sebastian	sr:competitor:3210	forward	ARG	34
sr:player:579312	Suarez, Lucas	sr:competitor:3210	defender	ARG	3
sr:player:21521	Cavani, Edinson	sr:competitor:3202	forward	URY	10
sr:player:22975	Medel, Gary	sr:competitor:3202	defender	CHL	5
sr:player:25566	Romero, Sergio	sr:competitor:3202	goalkeeper	ARG	1
sr:player:31967	Garcia, Javier	sr:competitor:3202	goalkeeper	ARG	13
sr:player:46998	Rojo, Marcos	sr:competitor:3202	defender	ARG	6
sr:player:106384	Lema, Cristian	sr:competitor:3202	defender	ARG	2
sr:player:149850	Advincula, Luis	sr:competitor:3202	defender	PER	17
sr:player:174961	Ramirez, Juan	sr:competitor:3202	midfielder	ARG	20
sr:player:247741	Fabra, Frank	sr:competitor:3202	defender	COL	18
sr:player:249843	Janson, Lucas	sr:competitor:3202	forward	ARG	11
sr:player:250231	Fernandez, Guillermo	sr:competitor:3202	midfielder	ARG	8
sr:player:579350	Figal, Jorge	sr:competitor:3202	defender	ARG	4
sr:player:843721	Saracchi, Marcelo	sr:competitor:3202	defender	URY	3
sr:player:1103567	Blondel, Lucas	sr:competitor:3202	defender	ARG	42
sr:player:871402	Riveros, Blas	sr:competitor:3210	defender	PRY	15
sr:player:955056	Tarragona, Cristian	sr:competitor:3210	forward	ARG	25
sr:player:1264470	Navarro, Miguel	sr:competitor:3210	defender	VEN	16
sr:player:1297106	Moyano, Franco	sr:competitor:3210	midfielder	ARG	20
sr:player:1484008	Ruiz Rodriguez, Ramiro	sr:competitor:3210	forward	ARG	18
sr:player:1649250	Girotti, Federico	sr:competitor:3210	forward	ARG	9
sr:player:1696943	Vigo, Alex	sr:competitor:3210	defender	ARG	13
sr:player:1707811	Morales, Lautaro	sr:competitor:3210	goalkeeper	ARG	17
sr:player:1722974	Portilla, Juan	sr:competitor:3210	midfielder	COL	27
sr:player:1738665	Blazquez, Joaquin	sr:competitor:3210	goalkeeper	ARG	33
sr:player:1743915	Benavidez, Gaston	sr:competitor:3210	defender	ARG	29
sr:player:1835612	Esquivel, Matias	sr:competitor:3210	forward	ARG	23
sr:player:1993051	Galarza, Matias	sr:competitor:3210	midfielder	PRY	8
sr:player:2004961	Barticciotto, Bruno	sr:competitor:3210	forward	CHL	32
sr:player:2091261	Portillo, Juan Carlos	sr:competitor:3210	defender	ARG	28
sr:player:2101892	Zeballos, Juan Sebastian	sr:competitor:3210	forward	ARG	\N
sr:player:2104220	Depietri, Valentin	sr:competitor:3210	forward	ARG	11
sr:player:2148392	Galarza, Matias	sr:competitor:3210	midfielder	ARG	7
sr:player:2149426	Laureano Imanol Martínez Lezcano	sr:competitor:3210	goalkeeper	ARG	12
sr:player:2150344	Mantilla, Kevin	sr:competitor:3210	defender	COL	5
sr:player:2191146	Martinez, Alejandro	sr:competitor:3210	midfielder	ARG	14
sr:player:2276701	Portillo, Marcos	sr:competitor:3210	midfielder	ARG	26
sr:player:2313841	Saavedra, Franco	sr:competitor:3210	midfielder	ARG	39
sr:player:2381471	Ortegoza, Ulises	sr:competitor:3210	midfielder	CHL	30
sr:player:2548159	Kummer, Tomas	sr:competitor:3210	defender	ARG	35
sr:player:2637463	Gomez, Matias Ezequiel	sr:competitor:3210	midfielder	ARG	21
sr:player:2666335	Pozzo, Francisco Jose	sr:competitor:3210	forward	ARG	36
sr:player:2717352	Albarracin, Gustavo	sr:competitor:3210	midfielder	ARG	38
sr:player:2814771	Gallard, Jeremias	sr:competitor:3210	midfielder	ARG	39
sr:player:2888177	Barbi, Santino	sr:competitor:3210	goalkeeper	ARG	1
sr:player:97000	Esgaio, Ricardo	sr:competitor:3001	defender	PRT	47
sr:player:352882	Santos, Nuno	sr:competitor:3001	forward	PRT	11
sr:player:769109	Edwards, Marcus	sr:competitor:3001	forward	ENG	10
sr:player:793738	St. Juste, Jeremiah	sr:competitor:3001	defender	NLD	3
sr:player:853560	Reis, Matheus	sr:competitor:3001	defender	BRA	2
sr:player:869030	Gyokeres, Viktor	sr:competitor:3001	forward	SWE	9
sr:player:974071	Trincao, Francisco	sr:competitor:3001	forward	PRT	17
sr:player:1009209	Kovacevic, Vladan	sr:competitor:3001	goalkeeper	SRB	13
sr:player:1047659	Braganca, Daniel	sr:competitor:3001	midfielder	PRT	23
sr:player:1058215	Hjulmand, Morten	sr:competitor:3001	midfielder	DNK	42
sr:player:1109647	Israel, Franco	sr:competitor:3001	goalkeeper	URY	1
sr:player:1327228	Goncalves, Pedro	sr:competitor:3001	midfielder	PRT	8
sr:player:1409457	Morita, Hidemasa	sr:competitor:3001	midfielder	JPN	5
sr:player:1423903	Araujo, Maxi	sr:competitor:3001	forward	URY	20
sr:player:1724662	Quaresma	sr:competitor:3001	defender	PRT	72
sr:player:1985243	Debast, Zeno	sr:competitor:3001	defender	BEL	6
sr:player:2050613	Goncalo Inacio	sr:competitor:3001	defender	PRT	25
sr:player:2070457	Catamo, Geny	sr:competitor:3001	forward	MOZ	21
sr:player:2125314	Estrela, Bento	sr:competitor:3001	midfielder	USA	\N
sr:player:2194738	Callai, Diego	sr:competitor:3001	goalkeeper	BRA	41
sr:player:2265651	Pinto, Diogo	sr:competitor:3001	goalkeeper	PRT	51
sr:player:2268547	Moreira, Afonso Bastardo	sr:competitor:3001	forward	PRT	90
sr:player:2282091	Fresneda, Ivan	sr:competitor:3001	defender	ESP	22
sr:player:2298655	Diomande, Ousmane	sr:competitor:3001	defender	CIV	26
sr:player:2355165	Silva, Francisco	sr:competitor:3001	goalkeeper	PRT	99
sr:player:2435159	Couto, Mauro	sr:competitor:3001	forward	PRT	78
sr:player:2439429	Nel, Rafael Ferreira	sr:competitor:3001	forward	PRT	86
sr:player:2610683	Quenda, Geovany	sr:competitor:3001	forward	PRT	57
sr:player:2612927	Harder, Conrad	sr:competitor:3001	forward	DNK	19
sr:player:2659819	Ramos, Bruno	sr:competitor:3001	defender	BRA	54
sr:player:2728018	Simoes, Joao Pedro	sr:competitor:3001	midfielder	PRT	52
sr:player:2728020	Silva, Gabriel	sr:competitor:3001	forward	PRT	82
sr:player:2851983	Alves, Miguel Monteiro	sr:competitor:3001	defender	PRT	66
sr:player:2869853	Luis Gomes	sr:competitor:3001	midfielder	PRT	80
sr:player:2882709	Taibo Dominguez, Lucas	sr:competitor:3001	defender	ESP	95
sr:player:95461	Moore, Simon	sr:competitor:41	goalkeeper	ENG	21
sr:player:247459	Browne, Alan	sr:competitor:41	midfielder	IRL	8
sr:player:361326	Roberts, Patrick	sr:competitor:41	midfielder	ENG	10
sr:player:365812	O'Nien, Luke	sr:competitor:41	midfielder	ENG	13
sr:player:822670	Rusyn, Nazary	sr:competitor:41	midfielder	UKR	15
sr:player:1047157	Poveda, Ian	sr:competitor:41	forward	COL	36
sr:player:1057153	Ballard, Daniel	sr:competitor:41	defender	NIR	5
sr:player:1069194	Connolly, Aaron	sr:competitor:41	forward	IRL	24
sr:player:1089958	Mepham, Chris	sr:competitor:41	defender	WAL	26
sr:player:1118043	Isidor, Wilson	sr:competitor:41	forward	FRA	18
sr:player:1479622	Alese, Aji	sr:competitor:41	defender	ENG	42
sr:player:1625956	Cirkin, Dennis	sr:competitor:41	defender	ENG	3
sr:player:1626030	Aouchiche, Adil	sr:competitor:41	midfielder	FRA	22
sr:player:1642848	Hume, Trai	sr:competitor:41	defender	NIR	32
sr:player:1646414	Patterson, Anthony	sr:competitor:41	goalkeeper	ENG	1
sr:player:1864700	Abdul Samed, Salis	sr:competitor:41	midfielder	GHA	\N
sr:player:1939866	Mundle, Romaine	sr:competitor:41	midfielder	ENG	14
sr:player:1956462	Hjelde, Leo Fuhr	sr:competitor:41	defender	NOR	33
sr:player:1977217	Huggins, Niall	sr:competitor:41	forward	WAL	2
sr:player:1986921	Ba, Abdoullah	sr:competitor:41	midfielder	FRA	17
sr:player:2051481	Nna Noukeu, Blondy	sr:competitor:41	goalkeeper	CMR	16
sr:player:2065843	Neill, Dan	sr:competitor:41	midfielder	ENG	4
sr:player:2094054	Seelt, Jenson	sr:competitor:41	defender	NLD	23
sr:player:2202034	Bellingham, Jobe	sr:competitor:41	midfielder	ENG	7
sr:player:2271547	Johnson, Zac	sr:competitor:41	midfielder	ENG	41
sr:player:2279477	Dossou, Eliezer Mayenda	sr:competitor:41	forward	FRA	12
sr:player:2290331	Bennette, Jewison	sr:competitor:41	midfielder	CRI	19
sr:player:2498299	Tutierov, Timur	sr:competitor:41	midfielder	UKR	57
sr:player:2532601	Rigg, Chris	sr:competitor:41	midfielder	ENG	11
sr:player:2535393	Watson, Tom	sr:competitor:41	forward	ENG	40
sr:player:2544725	Anderson, Joseph	sr:competitor:41	defender	ENG	45
sr:player:2558289	Abdullahi, Ahmed	sr:competitor:41	forward	NGA	12
sr:player:2659753	Crompton, Ben	sr:competitor:41	defender	ENG	44
sr:player:2692126	Aleksic, Milan	sr:competitor:41	forward	SRB	30
sr:player:2774887	Jones, Harrison	sr:competitor:41	midfielder	ENG	50
sr:player:2859119	Samuel-Ogunsuyi, Trey	sr:competitor:41	forward	ENG	47
sr:player:20602	Allen, Joe	sr:competitor:74	midfielder	WAL	7
sr:player:32821	Naughton, Kyle	sr:competitor:74	defender	ENG	26
sr:player:42691	Mclaughlin, Jon	sr:competitor:74	goalkeeper	SCO	33
sr:player:125558	Christie, Cyrus	sr:competitor:74	defender	IRL	23
sr:player:164291	Fulton, Jay	sr:competitor:74	midfielder	SCO	4
sr:player:340713	Grimes, Matt	sr:competitor:74	midfielder	ENG	8
sr:player:373240	Vigouroux, Lawrence	sr:competitor:74	goalkeeper	CHL	22
sr:player:555372	Ginnelly, Josh	sr:competitor:74	forward	ENG	11
sr:player:758400	Cullen, Liam	sr:competitor:74	forward	WAL	20
sr:player:2752249	Luna, Alex Nahuel	sr:competitor:3209	midfielder	ARG	19
sr:player:2762263	Parmo, Tomas	sr:competitor:3209	midfielder	ARG	30
sr:player:2762265	Tarzia, Diego	sr:competitor:3209	midfielder	ARG	27
sr:player:2767759	Morro, Mateo	sr:competitor:3209	goalkeeper	ARG	12
sr:player:2803749	Echeverria, Luciano	sr:competitor:3209	defender	ARG	36
sr:player:2806871	Millan, Lautaro	sr:competitor:3209	midfielder	ARG	14
sr:player:2810537	Duarte, Ezequiel	sr:competitor:3209	defender	ARG	38
sr:player:2828309	De Irastorza, Jonathan	sr:competitor:3209	defender	ARG	39
sr:player:2828311	Scafati, Juli	sr:competitor:3209	\N	\N	41
sr:player:31981	Banega, Ever	sr:competitor:3212	midfielder	ARG	10
sr:player:93186	Vangioni, Leonel	sr:competitor:3212	defender	ARG	21
sr:player:106111	Hoyos, Lucas	sr:competitor:3212	goalkeeper	ARG	1
sr:player:795806	Salcedo, Saul	sr:competitor:3212	defender	PRY	6
sr:player:872032	Velazquez, Gustavo	sr:competitor:3212	defender	PRY	25
sr:player:916140	Macagno, Ramiro	sr:competitor:3212	goalkeeper	ARG	12
sr:player:931530	Garcia, Juan Manuel	sr:competitor:3212	forward	ARG	9
sr:player:954870	Carabajal, Gabriel	sr:competitor:3212	midfielder	ARG	17
sr:player:1103575	Martino, Angelo	sr:competitor:3212	defender	ARG	23
sr:player:1115583	Cardozo, Fernando	sr:competitor:3212	forward	PRY	7
sr:player:1121383	Ramirez, Juan	sr:competitor:3212	forward	URY	99
sr:player:1121833	Fernandez, Rodrigo	sr:competitor:3212	midfielder	URY	5
sr:player:1134765	Mendez, Ignacio	sr:competitor:3212	midfielder	ARG	26
sr:player:1403293	Cacciabue, Jeronimo	sr:competitor:3212	midfielder	ARG	33
sr:player:1562066	Mendez, Armando	sr:competitor:3212	defender	URY	14
sr:player:1641710	Miljevic, Matko	sr:competitor:3212	midfielder	ARG	19
sr:player:1834660	Schott, Augusto	sr:competitor:3212	defender	ARG	4
sr:player:1872694	Gonzalez, Francisco Agustin	sr:competitor:3212	forward	ARG	44
sr:player:2090303	Besozzi, Lucas	sr:competitor:3212	forward	ARG	77
sr:player:2090815	Calderara, Brian	sr:competitor:3212	defender	ARG	16
sr:player:2126168	Berardozzi, Tomas	sr:competitor:3212	defender	ARG	45
sr:player:2145670	Jaime, Misael Omar Jaime	sr:competitor:3212	defender	ARG	35
sr:player:2241529	Perez Tica, Jeremias	sr:competitor:3212	midfielder	ARG	27
sr:player:2244207	Jacob, Tomas	sr:competitor:3212	defender	ARG	55
sr:player:2377255	Glavinovich, Ivan	sr:competitor:3212	defender	ARG	37
sr:player:2444849	Sotelo, David	sr:competitor:3212	midfielder	ARG	34
sr:player:2588875	Canteros, Ignacio	sr:competitor:3212	defender	ARG	38
sr:player:2588881	Reinatti Balansino, Josue Jeronimo	sr:competitor:3212	goalkeeper	ARG	30
sr:player:2588887	Russo, Jeronimo	sr:competitor:3212	midfielder	ARG	50
sr:player:2588889	Plaza Molina, Francisco Joaquin	sr:competitor:3212	forward	ARG	52
sr:player:2588891	Finardi Niz, Blas Adrian Agustin	sr:competitor:3212	midfielder	ARG	54
sr:player:2588893	Chiaverano Meroi, Giovani	sr:competitor:3212	midfielder	ARG	38
sr:player:2639881	Perez, Tomas	sr:competitor:3212	midfielder	ARG	41
sr:player:2704004	Fernandez, Esteban	sr:competitor:3212	midfielder	ARG	36
sr:player:2717358	Acuna, Valentino	sr:competitor:3212	midfielder	ARG	46
sr:player:2765205	Banos, Lucas	sr:competitor:3212	defender	ARG	3
sr:player:2782903	Tirado, Fabricio	sr:competitor:3212	midfielder	ARG	28
sr:player:2810799	Mihovilcevich, Lucas	sr:competitor:3212	defender	ARG	29
sr:player:2828675	Silvetti, Mateo	sr:competitor:3212	forward	ARG	24
sr:player:2828677	Piotti, Faustino	sr:competitor:3212	goalkeeper	ARG	31
sr:player:2834655	Torrente, Valentino	sr:competitor:3212	defender	ARG	39
sr:player:2842773	Moya, Ezequiel Tomas	sr:competitor:3212	defender	ARG	43
sr:player:2847291	Juarez, Agustin	sr:competitor:3212	forward	ARG	42
sr:player:2864233	Altamirano, Pablo	sr:competitor:3212	midfielder	ARG	48
sr:player:791	Milner, James	sr:competitor:30	midfielder	ENG	6
sr:player:31867	Steele, Jason	sr:competitor:30	goalkeeper	ENG	23
sr:player:33902	Welbeck, Danny	sr:competitor:30	forward	ENG	18
sr:player:115365	Dunk, Lewis	sr:competitor:30	defender	ENG	5
sr:player:216308	Webster, Adam	sr:competitor:30	defender	ENG	4
sr:player:219572	Veltman, Joel	sr:competitor:30	defender	NLD	34
sr:player:301288	March, Solly	sr:competitor:30	midfielder	ENG	7
sr:player:872110	Estupinan, Pervis	sr:competitor:30	defender	ECU	30
sr:player:934224	Kadioglu, Ferdi	sr:competitor:30	defender	TUR	24
sr:player:935220	Moder, Jakub	sr:competitor:30	midfielder	POL	15
sr:player:1008323	Igor	sr:competitor:30	defender	BRA	3
sr:player:1245272	O'Riley, Matt	sr:competitor:30	midfielder	DNK	33
sr:player:1297724	Lamptey, Tariq	sr:competitor:30	defender	GHA	2
sr:player:1494743	Mitoma, Kaoru	sr:competitor:30	midfielder	JPN	22
sr:player:1565286	Rutter, Georginio	sr:competitor:30	forward	FRA	14
sr:player:1621256	Wieffer, Mats	sr:competitor:30	midfielder	NLD	27
sr:player:1630352	Van Hecke, Jan Paul	sr:competitor:30	defender	NLD	29
sr:player:1710063	Pedro, Joao	sr:competitor:30	forward	BRA	9
sr:player:1720568	Enciso, Julio	sr:competitor:30	forward	PRY	10
sr:player:1859404	Verbruggen, Bart	sr:competitor:30	goalkeeper	NLD	1
sr:player:1951258	Ferguson, Evan	sr:competitor:30	forward	IRL	28
sr:player:1957397	Peupion, Cameron	sr:competitor:30	midfielder	AUS	32
sr:player:2052205	Ayari, Yasin	sr:competitor:30	midfielder	SWE	26
sr:player:2065207	Samuels, Imari	sr:competitor:30	defender	ENG	47
sr:player:2142670	Adingra, Simon	sr:competitor:30	forward	CIV	11
sr:player:2226614	Turns, Ed	sr:competitor:30	defender	WAL	43
sr:player:2327301	Baleba, Carlos	sr:competitor:30	midfielder	CMR	20
sr:player:106294	Colazo, Nicolas	sr:competitor:3205	midfielder	ARG	18
sr:player:122711	Castro, Lucas	sr:competitor:3205	midfielder	ARG	19
sr:player:256683	De Blasis, Pablo	sr:competitor:3205	midfielder	ARG	10
sr:player:385318	Cabral, Yonathan	sr:competitor:3205	defender	ARG	20
sr:player:757762	Ledesma, Marcos	sr:competitor:3205	goalkeeper	ARG	13
sr:player:816184	Canto, Gustavo	sr:competitor:3205	defender	ARG	32
sr:player:871880	Pintado, Juan	sr:competitor:3205	defender	URY	15
sr:player:927888	Blasi, Brian	sr:competitor:3205	defender	ARG	17
sr:player:1016091	Martinez, Enzo	sr:competitor:3205	defender	URY	21
sr:player:1029875	Briasco, Norberto	sr:competitor:3205	forward	ARM	25
sr:player:1103791	Troyansky, Franco	sr:competitor:3205	forward	ARG	33
sr:player:1112963	Insfran, Nelson	sr:competitor:3205	goalkeeper	ARG	23
sr:player:1267436	Bolivar, Agustin Gabriel	sr:competitor:3205	midfielder	ARG	14
sr:player:1270480	Morales, Leonardo	sr:competitor:3205	defender	ARG	4
sr:player:1701545	Fernandez, Martin	sr:competitor:3205	midfielder	URY	6
sr:player:1856382	Max, Augusto	sr:competitor:3205	midfielder	ARG	16
sr:player:1938654	Miranda, Matias	sr:competitor:3205	midfielder	ARG	8
sr:player:2008563	Garayalde, Nicolas	sr:competitor:3205	midfielder	ARG	36
sr:player:2068905	Rodriguez, Valentin	sr:competitor:3205	defender	URY	26
sr:player:2089339	Panaro, Manuel	sr:competitor:3205	midfielder	ARG	\N
sr:player:2108170	Esquivel, Juan Cruz	sr:competitor:3205	forward	ARG	22
sr:player:2112598	Mammini, Ivo	sr:competitor:3205	forward	ARG	29
sr:player:2115186	Gallo, Rodrigo	sr:competitor:3205	defender	ARG	3
sr:player:2129558	Mamut, Leandro	sr:competitor:3205	midfielder	ARG	34
sr:player:2252621	Kadijevic, Julian	sr:competitor:3205	goalkeeper	ARG	12
sr:player:2296055	Abaldo, Matias	sr:competitor:3205	forward	URY	9
sr:player:2299269	Zalazar, David	sr:competitor:3205	midfielder	ARG	11
sr:player:2549321	Castillo, Rodrigo	sr:competitor:3205	forward	ARG	30
sr:player:2558951	Penalva, Valentin	sr:competitor:3205	defender	ARG	40
sr:player:2589695	Sanchez, Nicolas	sr:competitor:3205	midfielder	ARG	5
sr:player:2764101	Cortazzo, Juan Cruz	sr:competitor:3205	defender	ARG	35
sr:player:2799543	Zappulla, Ignacio	sr:competitor:3205	midfielder	ARG	\N
sr:player:2828295	Corbalan, Fabricio	sr:competitor:3205	\N	\N	28
sr:player:2828297	Merlo, Jeremias	sr:competitor:3205	forward	ARG	24
sr:player:2835801	Primante, Santino	sr:competitor:3205	forward	ARG	31
sr:player:1134759	Belmonte, Tomas	sr:competitor:3202	midfielder	ARG	30
sr:player:1248934	Merentiel, Miguel	sr:competitor:3202	forward	URY	16
sr:player:1834730	Martegani, Agustin	sr:competitor:3202	midfielder	ARG	19
sr:player:1957459	Zeballos, Exequiel	sr:competitor:3202	forward	ARG	7
sr:player:1957471	Medina, Cristian	sr:competitor:3202	midfielder	ARG	36
sr:player:2089979	Aguirre, Brian Nicolas	sr:competitor:3202	forward	ARG	33
sr:player:2090567	Zenon, Kevin	sr:competitor:3202	midfielder	ARG	22
sr:player:2091647	Blanco, Lautaro	sr:competitor:3202	defender	ARG	23
sr:player:2098990	Miramon,Ignacio	sr:competitor:3202	midfielder	ARG	21
sr:player:2107162	Barinaga, Juan	sr:competitor:3202	defender	ARG	24
sr:player:2108366	Gimenez, Milton	sr:competitor:3202	forward	ARG	9
sr:player:2109186	Baiardino, Juan Ignacio	sr:competitor:3202	forward	ARG	\N
sr:player:2148804	Valentini, Nicolas	sr:competitor:3202	defender	ARG	15
sr:player:2191582	Diaz Robles, Sebastian Gabriel	sr:competitor:3202	goalkeeper	ARG	37
sr:player:2191592	Genez, Nahuel	sr:competitor:3202	midfielder	ARG	35
sr:player:2324427	Brey, Leandro	sr:competitor:3202	goalkeeper	ARG	12
sr:player:2395781	Di Lollo, Lautaro	sr:competitor:3202	defender	ARG	40
sr:player:2434763	Benitez, Mauricio	sr:competitor:3202	midfielder	ARG	45
sr:player:2464991	Saralegui, Jabes	sr:competitor:3202	midfielder	ARG	47
sr:player:2625021	Rodriguez, Roman	sr:competitor:3202	midfielder	ARG	30
sr:player:2625033	Anselmino, Aaron	sr:competitor:3202	midfielder	ARG	38
sr:player:2717346	Gorosito, Dylan	sr:competitor:3202	defender	ARG	48
sr:player:2784029	Ceballos, Julian	sr:competitor:3202	midfielder	ARG	50
sr:player:2784031	Molas, Walter	sr:competitor:3202	defender	ARG	52
sr:player:2784033	Delgado, Milton	sr:competitor:3202	midfielder	ARG	43
sr:player:2784035	Zufiaurre, Iker	sr:competitor:3202	forward	ARG	41
sr:player:2801595	Mendia, Mateo	sr:competitor:3202	defender	ARG	34
sr:player:2803757	Bautista Rodrguez, Ignacio	sr:competitor:3202	forward	URY	44
sr:player:2803759	Cruz Payal, Juan	sr:competitor:3202	midfielder	ARG	46
sr:player:2827931	Dalmasso, Santiago	sr:competitor:3202	midfielder	ARG	51
sr:player:2834737	Simoni, Valentino	sr:competitor:3202	forward	ARG	\N
sr:player:2868419	Ruiz, Joaquin	sr:competitor:3202	midfielder	ARG	53
sr:player:13207	Lopez, Lisandro	sr:competitor:42338	forward	ARG	7
sr:player:33654	Champagne, Nereo	sr:competitor:42338	goalkeeper	ARG	13
sr:player:34391	Roncaglia, Facundo	sr:competitor:42338	defender	ARG	14
sr:player:38784	Hauche, Gabriel	sr:competitor:42338	forward	ARG	21
sr:player:42455	Gaitan, Osvaldo Nicolas Fabian	sr:competitor:42338	forward	ARG	10
sr:player:47667	Sauro, Gaston	sr:competitor:42338	defender	ARG	3
sr:player:93196	Insaurralde, Juan	sr:competitor:42338	defender	ARG	2
sr:player:340845	Acosta, Lucas	sr:competitor:42338	goalkeeper	ARG	42
sr:player:590178	Cabezas, Bryan	sr:competitor:42338	midfielder	ECU	23
sr:player:1029879	Andrada, Juan	sr:competitor:42338	midfielder	ARG	6
sr:player:1030413	Gudino, Gabriel	sr:competitor:42338	midfielder	ARG	20
sr:player:1056651	Morales Bravo, Ivan Andres	sr:competitor:42338	forward	CHL	18
sr:player:34007	Bianchi, Bruno	sr:competitor:36842	defender	ARG	2
sr:player:42571	Marinelli, Gonzalo	sr:competitor:36842	goalkeeper	ARG	32
sr:player:249083	Abecasis, Luciano	sr:competitor:36842	defender	ARG	29
sr:player:249301	Cavallaro, Juan	sr:competitor:36842	midfielder	ARG	13
sr:player:254797	Tonetto, Diego Ruben	sr:competitor:36842	midfielder	ARG	11
sr:player:340449	Milo, Federico	sr:competitor:36842	defender	ARG	25
sr:player:546316	Ham, Ezequiel	sr:competitor:36842	midfielder	SYR	8
sr:player:581666	Asenjo Albelda, Mauricio Gabriel	sr:competitor:36842	forward	ARG	31
sr:player:594426	Burgos, Esteban	sr:competitor:36842	defender	ARG	5
sr:player:805962	Castro, Federico	sr:competitor:36842	forward	ARG	22
sr:player:954552	Gomez, Luciano	sr:competitor:36842	defender	ARG	14
sr:player:1018585	Villa, Sebastian	sr:competitor:36842	forward	COL	22
sr:player:1051555	Villalba, Ivan	sr:competitor:36842	defender	PRY	40
sr:player:1059963	Ramis, Victorio	sr:competitor:36842	forward	ARG	7
sr:player:1111251	Sanguina, Jorge	sr:competitor:36842	forward	PRY	9
sr:player:1121083	Romero, Fernando	sr:competitor:36842	forward	PRY	39
sr:player:1236858	Diaz, Matias	sr:competitor:36842	defender	ARG	41
sr:player:1343668	Gallardo, Nahuel Ezequiel	sr:competitor:36842	defender	ARG	20
sr:player:1627216	Centurion, Ezequiel	sr:competitor:36842	goalkeeper	ARG	1
sr:player:1633532	Vera, Fredy	sr:competitor:36842	forward	PRY	36
sr:player:1858868	Rios, Lautaro	sr:competitor:36842	midfielder	ARG	17
sr:player:1972107	Sequeira, Luis	sr:competitor:36842	midfielder	ARG	24
sr:player:2005113	Alvez, Maximiliano Gonzalo	sr:competitor:36842	midfielder	ARG	10
sr:player:2089541	Romero, Franco	sr:competitor:36842	midfielder	ARG	26
sr:player:2098678	Segovia, Imanol	sr:competitor:36842	defender	ARG	3
sr:player:2101872	Mulet, Agustin	sr:competitor:36842	midfielder	ARG	6
sr:player:2129556	Napolitano, Antonio	sr:competitor:36842	midfielder	ARG	19
sr:player:2148802	Lastra, Agustin Jesus	sr:competitor:36842	goalkeeper	ARG	12
sr:player:2149438	Studer, Sheyko	sr:competitor:36842	defender	ARG	42
sr:player:2219972	Rios, Gonzalo	sr:competitor:36842	midfielder	ARG	28
sr:player:2226510	Ostchega, Tobias	sr:competitor:36842	defender	ARG	16
sr:player:2315101	Ascacibar, Julian Emanuel	sr:competitor:36842	midfielder	ARG	18
sr:player:2760499	Ortale, Mateo	sr:competitor:36842	defender	ARG	15
sr:player:2762255	Vera, Juan Ignacio	sr:competitor:36842	midfielder	ARG	21
sr:player:2772293	Sartori, Fabrizio	sr:competitor:36842	forward	ARG	43
sr:player:2772295	Moreno, Federico	sr:competitor:36842	forward	ARG	44
sr:player:2865095	Cardillo, Mauricio	sr:competitor:36842	forward	ARG	23
sr:player:42454	Diaz, Damian	sr:competitor:3219	midfielder	ECU	20
sr:player:250345	Insua, Emanuel	sr:competitor:3219	defender	ARG	33
sr:player:364980	Garate, Leandro	sr:competitor:3219	forward	ARG	30
sr:player:578460	Devecchi, Jose	sr:competitor:3219	goalkeeper	ARG	26
sr:player:583978	Bonifacio, Ezequiel Augusto	sr:competitor:3219	defender	ARG	19
sr:player:1135991	Pablo Alvarez, Juan	sr:competitor:3219	midfielder	ARG	22
sr:player:1240030	Maldonado, Luis Alexis	sr:competitor:3219	defender	ARG	2
sr:player:1271316	Galvan, Braian	sr:competitor:3219	forward	ARG	14
sr:player:1307832	Maciel, Alejandro	sr:competitor:3219	defender	ARG	4
sr:player:1401911	Recalde, Luciano	sr:competitor:3219	defender	ARG	25
sr:player:1403297	Nunez, Cristian	sr:competitor:3219	midfielder	PRY	5
sr:player:1545549	Soraire, Jesus Miguel	sr:competitor:3219	midfielder	ARG	8
sr:player:1694095	Obando, Javier Agustin	sr:competitor:3219	forward	ARG	40
sr:player:1695633	Hernandez, Nicolas	sr:competitor:3219	defender	COL	3
sr:player:1743913	Cabrera, Alejandro	sr:competitor:3219	defender	ARG	16
sr:player:1743921	Sepulveda, Bruno	sr:competitor:3219	midfielder	ARG	9
sr:player:1835624	Enrique, Guillermo	sr:competitor:3219	midfielder	ARG	6
sr:player:2001633	Canete, Ezequiel Martin	sr:competitor:3219	forward	ARG	24
sr:player:2089633	Sanguinetti, Facundo	sr:competitor:3219	goalkeeper	ARG	1
sr:player:2089647	Gonzalez, Matias	sr:competitor:3219	forward	ARG	10
sr:player:2140594	Di Luciano, Ramiro	sr:competitor:3219	defender	ARG	34
sr:player:2141618	Perez, Mateo	sr:competitor:3219	defender	ARG	37
sr:player:2142970	Rodriguez, Ignacio Agustin	sr:competitor:3219	midfielder	ARG	11
sr:player:2144998	Vila, Facundo	sr:competitor:3219	goalkeeper	ARG	21
sr:player:2145018	Villegas, Lautaro	sr:competitor:3219	midfielder	ARG	38
sr:player:2150878	Rodriguez, Yonathan	sr:competitor:3219	midfielder	URY	32
sr:player:2191564	Aranda, Gabriel	sr:competitor:3219	defender	ARG	47
sr:player:2334585	Echeverria, Marcos	sr:competitor:3219	forward	ARG	39
sr:player:2478107	Palavecino, Lucas	sr:competitor:3219	midfielder	ARG	23
sr:player:2551845	Bizans, Juan	sr:competitor:3219	forward	ARG	17
sr:player:2572341	de Ritis, Mathias	sr:competitor:3219	defender	URY	15
sr:player:2587051	Roldan, Mauricio	sr:competitor:3219	forward	ARG	18
sr:player:2592957	Iribarren, Juan	sr:competitor:3219	defender	ARG	29
sr:player:2592961	Gomez, Lautaro	sr:competitor:3219	forward	ARG	27
sr:player:2592979	Cardozo, Lautaro	sr:competitor:3219	defender	ARG	42
sr:player:2620409	Rivera, Geronimo	sr:competitor:3219	midfielder	ARG	7
sr:player:2762257	Bundgaard, Alexander	sr:competitor:3219	forward	ARG	40
sr:player:2762259	Medina, Federico	sr:competitor:3219	midfielder	ARG	28
sr:player:2847925	Pineyro, L	sr:competitor:3219	forward	ARG	31
sr:player:2873531	Esquivel, Santiago	sr:competitor:3219	midfielder	ARG	35
sr:player:2873535	Lazarte, Martin	sr:competitor:3219	defender	ARG	36
sr:player:107418	Bologna, Enrique	sr:competitor:36839	goalkeeper	ARG	23
sr:player:147576	Aguilera, Emanuel	sr:competitor:36839	defender	ARG	28
sr:player:609736	Alanis, Gabriel	sr:competitor:36839	midfielder	ARG	17
sr:player:803520	Barbona, David	sr:competitor:36839	midfielder	ARG	19
sr:player:804160	Bogarin, Rodrigo	sr:competitor:36839	midfielder	PRY	10
sr:player:927892	Soto, Alexis	sr:competitor:36839	defender	ARG	3
sr:player:1100867	Togni, Gaston	sr:competitor:36839	midfielder	ARG	11
sr:player:1108409	Fiermarin, Cristopher	sr:competitor:36839	goalkeeper	URY	22
sr:player:1372424	Gutierrez, Kevin	sr:competitor:36839	midfielder	ARG	5
sr:player:1403329	Caceres Ovelar, Dario Jorge	sr:competitor:36839	defender	PRY	26
sr:player:1615384	Lopez, Julian	sr:competitor:36839	midfielder	ARG	8
sr:player:1712573	Molinas, Aaron	sr:competitor:36839	midfielder	ARG	16
sr:player:1834792	Ramos, Santiago	sr:competitor:36839	defender	ARG	21
sr:player:1957521	Perez, Cesar	sr:competitor:36839	midfielder	CHL	25
sr:player:1966697	Miritello, Juan Bautista	sr:competitor:36839	midfielder	ARG	9
sr:player:2029115	Ferreira, Lucas	sr:competitor:36839	defender	URY	6
sr:player:2113364	Cannavo, Ezequiel	sr:competitor:36839	midfielder	ARG	14
sr:player:2113368	Echevarria, Facundo	sr:competitor:36839	midfielder	ARG	36
sr:player:2125934	Galvan, Ignacio	sr:competitor:36839	defender	ARG	18
sr:player:2132930	Ramirez, Matias	sr:competitor:36839	forward	ARG	37
sr:player:2191990	Palavecino, Nicolas	sr:competitor:36839	midfielder	ARG	33
sr:player:2203504	Garcia, Ramiro Nahuel	sr:competitor:36839	goalkeeper	ARG	15
sr:player:2235136	Gonzales, David Maximiliano	sr:competitor:36839	midfielder	ARG	24
sr:player:2313599	Osorio, Abiel	sr:competitor:36839	forward	ARG	7
sr:player:2329231	Escobar, Lucas Nahuel	sr:competitor:36839	goalkeeper	ARG	1
sr:player:2462733	Lopez, Kevin	sr:competitor:36839	midfielder	ARG	30
sr:player:2553919	Lucero, Esteban	sr:competitor:36839	defender	ARG	13
sr:player:2563893	Herrera, Luciano Ramon	sr:competitor:36839	forward	ARG	27
sr:player:2610769	Ferreira, Tiago	sr:competitor:36839	defender	ARG	4
sr:player:2611585	Schamine, Benjamin	sr:competitor:36839	midfielder	ARG	35
sr:player:2639329	Sosa, Matias Josias	sr:competitor:36839	forward	ARG	32
sr:player:2640353	Rubio, Tobias	sr:competitor:36839	defender	ARG	38
sr:player:2652395	Berizovsky, Andres	sr:competitor:36839	defender	ARG	2
sr:player:2803495	Aguiar, Mateo Adrian	sr:competitor:36839	midfielder	ARG	44
sr:player:2808077	Valenzuela, Alejo Santiago	sr:competitor:36839	forward	ARG	42
sr:player:2815255	Brun, Lorenzo	sr:competitor:36839	forward	ARG	38
sr:player:2815619	Portillo, Ayrton	sr:competitor:36839	forward	ARG	20
sr:player:33239	Blanco, Sebastian	sr:competitor:3201	midfielder	ARG	29
sr:player:71707	Muniain, Iker	sr:competitor:3201	midfielder	ESP	80
sr:player:340785	Cerutti, Ezequiel	sr:competitor:3201	forward	ARG	7
sr:player:351824	Campi, Gaston	sr:competitor:3201	defender	ARG	22
sr:player:358924	Tripichio, Nicolas	sr:competitor:3201	defender	ARG	24
sr:player:594430	Fydriszewski, Francisco	sr:competitor:3201	forward	ARG	18
sr:player:835379	Altamirano, Facundo	sr:competitor:3201	goalkeeper	ARG	13
sr:player:841055	Remedi, Eric	sr:competitor:3201	midfielder	ARG	5
sr:player:955226	Gomez, Gaston	sr:competitor:3201	goalkeeper	ARG	25
sr:player:1111639	Barrios, Nahuel	sr:competitor:3201	midfielder	ARG	10
sr:player:1118887	Bustos, Nahuel	sr:competitor:3201	forward	ARG	77
sr:player:1262144	Vombergar, Andres	sr:competitor:3201	forward	SVN	9
sr:player:1558836	Insaurralde, Carlos	sr:competitor:3201	midfielder	ARG	19
sr:player:1646664	Cuello, Alexis	sr:competitor:3201	forward	ARG	28
sr:player:1693083	Gill, Orlando	sr:competitor:3201	goalkeeper	PRY	12
sr:player:1713171	Lopez, Lautaro	sr:competitor:3201	goalkeeper	ARG	16
sr:player:1727532	Hernandez, Gaston	sr:competitor:3201	defender	ARG	23
sr:player:1979861	Romana, Jhohan	sr:competitor:3201	defender	COL	4
sr:player:2004827	Hausch, Agustin	sr:competitor:3201	forward	ARG	14
sr:player:2089205	Braida, Malcom	sr:competitor:3201	defender	ARG	21
sr:player:2160190	Lujan, Gonzalo	sr:competitor:3201	defender	ARG	35
sr:player:2225026	Zelaya, Maximiliano	sr:competitor:3201	defender	ARG	51
sr:player:2261863	Leguizamon, Ivan	sr:competitor:3201	midfielder	PRY	11
sr:player:2305453	Clemente, Mateo	sr:competitor:3201	goalkeeper	ARG	1
sr:player:2367875	Hernandez, Matias	sr:competitor:3201	forward	ARG	44
sr:player:2382281	Irala, Elian	sr:competitor:3201	midfielder	ARG	17
sr:player:2407605	Arias, Oscar	sr:competitor:3201	defender	ARG	30
sr:player:2407621	Porra, Tomas	sr:competitor:3201	midfielder	ARG	20
sr:player:2645737	Baez	sr:competitor:3201	defender	ARG	37
sr:player:2703294	Vega, Juan Cruz	sr:competitor:3201	midfielder	ARG	26
sr:player:2753451	Reali, Matias	sr:competitor:3201	forward	ARG	8
sr:player:2771071	Perugini, Thiago	sr:competitor:3201	forward	ARG	49
sr:player:2782561	HERRERA, DANIEL	sr:competitor:3201	defender	ARG	36
sr:player:2785215	Sosa, Santiago	sr:competitor:3201	midfielder	ARG	40
sr:player:2802831	Perez, Mauro	sr:competitor:3201	forward	ARG	46
sr:player:2828883	Coronel, Lucas	sr:competitor:3201	defender	ARG	55
sr:player:2840259	Alassia, Gonzalo	sr:competitor:3201	midfielder	ARG	31
sr:player:2853547	Lopez, Fabricio Gabriel	sr:competitor:3201	defender	ARG	84
sr:player:2872363	Pedroza, Ramiro Jonas	sr:competitor:3201	defender	ARG	53
sr:player:2892473	Ladstatter, Agustin	sr:competitor:3201	midfielder	ARG	50
sr:player:50480	Wood, Chris	sr:competitor:14	forward	NZL	11
sr:player:78152	Sels, Matz	sr:competitor:14	goalkeeper	BEL	26
sr:player:2762919	Zabala, Daniel	sr:competitor:3211	defender	ARG	22
sr:player:2762921	Leiva, Tobias	sr:competitor:3211	midfielder	ARG	35
sr:player:2814409	Beltran, Santiago	sr:competitor:3211	goalkeeper	ARG	41
sr:player:2835197	Lencina	sr:competitor:3211	midfielder	ARG	39
sr:player:1131	Ruddy, John	sr:competitor:39	goalkeeper	ENG	26
sr:player:42209	Dubravka, Martin	sr:competitor:39	goalkeeper	SVK	1
sr:player:69256	Trippier, Kieran	sr:competitor:39	defender	ENG	2
sr:player:99090	Burn, Dan	sr:competitor:39	defender	ENG	33
sr:player:101882	Schar, Fabian	sr:competitor:39	defender	CHE	5
sr:player:108508	Gillespie, Mark	sr:competitor:39	goalkeeper	ENG	29
sr:player:113956	Wilson, Callum	sr:competitor:39	forward	ENG	9
sr:player:138149	Vlachodimos, Odysseas	sr:competitor:39	goalkeeper	GRC	19
sr:player:150396	Krafth, Emil	sr:competitor:39	defender	SWE	17
sr:player:153444	Lascelles, Jamaal	sr:competitor:39	defender	ENG	6
sr:player:162653	Pope, Nick	sr:competitor:39	goalkeeper	ENG	22
sr:player:190843	Hayden, Isaac	sr:competitor:39	midfielder	JAM	\N
sr:player:333373	Almiron, Miguel	sr:competitor:39	midfielder	PRY	24
sr:player:368134	Targett, Matt	sr:competitor:39	defender	ENG	13
sr:player:372336	Murphy, Jacob	sr:competitor:39	midfielder	ENG	23
sr:player:560128	Joelinton	sr:competitor:39	forward	BRA	7
sr:player:925724	Isak, Alexander	sr:competitor:39	forward	SWE	14
sr:player:937002	Willock, Joe	sr:competitor:39	midfielder	ENG	28
sr:player:1055187	Barnes, Harvey	sr:competitor:39	forward	ENG	11
sr:player:1059315	Botman, Sven	sr:competitor:39	defender	NLD	4
sr:player:1088608	Kelly, Lloyd	sr:competitor:39	defender	ENG	25
sr:player:1090782	Longstaff, Sean	sr:competitor:39	midfielder	ENG	36
sr:player:1141016	Guimaraes, Bruno	sr:competitor:39	midfielder	BRA	39
sr:player:1265128	Tonali, Sandro	sr:competitor:39	midfielder	ITA	8
sr:player:1373595	Gordon, Anthony	sr:competitor:39	forward	ENG	10
sr:player:1643746	Livramento, Tino	sr:competitor:39	defender	ENG	21
sr:player:2161264	Osula, William	sr:competitor:39	forward	DNK	18
sr:player:2249331	Hall, Lewis	sr:competitor:39	defender	ENG	20
sr:player:2296791	Kuol, Garang	sr:competitor:39	forward	AUS	38
sr:player:2306785	Murphy, Alex	sr:competitor:39	defender	IRL	37
sr:player:2558327	Miley, Lewis	sr:competitor:39	midfielder	ENG	67
sr:player:21555	Azpilicueta, Cesar	sr:competitor:2836	defender	ESP	3
sr:player:35612	Witsel, Axel	sr:competitor:2836	midfielder	BEL	20
sr:player:69768	Oblak, Jan	sr:competitor:2836	goalkeeper	SVN	13
sr:player:84539	Koke	sr:competitor:2836	midfielder	ESP	6
sr:player:85859	Griezmann, Antoine	sr:competitor:2836	midfielder	FRA	7
sr:player:191182	Lemar, Thomas	sr:competitor:2836	midfielder	FRA	11
sr:player:191986	Lenglet, Clement	sr:competitor:2836	defender	FRA	15
sr:player:249399	De Paul, Rodrigo	sr:competitor:2836	midfielder	ARG	5
sr:player:263651	Musso, Juan	sr:competitor:2836	goalkeeper	ARG	1
sr:player:309078	Sorloth, Alexander	sr:competitor:2836	forward	NOR	9
sr:player:316152	Correa, Angel	sr:competitor:2836	forward	ARG	10
sr:player:325355	Gimenez, Jose Maria	sr:competitor:2836	defender	URY	2
sr:player:353138	Llorente, Marcos	sr:competitor:2836	midfielder	ESP	14
sr:player:794664	Le Normand, Robin	sr:competitor:2836	defender	ESP	24
sr:player:929870	Mandava, Reinildo	sr:competitor:2836	defender	MOZ	23
sr:player:931006	Galan, Javi	sr:competitor:2836	midfielder	ESP	21
sr:player:962405	Molina, Nahuel	sr:competitor:2836	defender	ARG	16
sr:player:1057931	Riquelme, Rodrigo	sr:competitor:2836	midfielder	ESP	17
sr:player:1297742	Gallagher, Conor	sr:competitor:2836	midfielder	ENG	4
sr:player:1409503	Garces, Borja	sr:competitor:2836	forward	ESP	\N
sr:player:1630398	Alvarez, Julian	sr:competitor:2836	forward	ARG	19
sr:player:1630420	Paulo, Marcos	sr:competitor:2836	forward	PRT	\N
sr:player:1644310	Iturbe, Alejandro	sr:competitor:2836	goalkeeper	ESP	33
sr:player:1859510	Lino, Samuel	sr:competitor:2836	forward	BRA	12
sr:player:1955872	Gomis, Antonio	sr:competitor:2836	goalkeeper	ESP	31
sr:player:1955882	Gismera, Aitor	sr:competitor:2836	midfielder	ESP	28
sr:player:1986817	Kostis, Ilias	sr:competitor:2836	defender	GRC	27
sr:player:2203378	Serrano, Javier	sr:competitor:2836	midfielder	ESP	29
sr:player:2203382	Simeone, Giuliano	sr:competitor:2836	forward	ARG	22
sr:player:2259755	Barrios, Pablo	sr:competitor:2836	midfielder	ESP	8
sr:player:2357217	Gimenez, Carlos	sr:competitor:2836	defender	ESP	41
sr:player:2691072	Spina, Geronimo	sr:competitor:2836	defender	ESP	43
sr:player:46900	Viergever, Nick	sr:competitor:2948	defender	NLD	24
sr:player:99960	Toornstra, Jens	sr:competitor:2948	midfielder	NLD	18
sr:player:152414	Van Der Hoorn, Mike	sr:competitor:2948	defender	NLD	3
sr:player:252027	Brouwer, Michael	sr:competitor:2948	goalkeeper	NLD	25
sr:player:282975	Barkas, Vasilis	sr:competitor:2948	goalkeeper	GRC	1
sr:player:756510	Finnsson, Kolbeinn	sr:competitor:2948	midfielder	ISL	5
sr:player:815712	Horemans, Siebe	sr:competitor:2948	defender	BEL	2
sr:player:979087	Vesterlund, Niklas	sr:competitor:2948	defender	DNK	23
sr:player:1058219	Jensen, Victor	sr:competitor:2948	midfielder	DNK	7
sr:player:1322046	Booth, Taylor	sr:competitor:2948	forward	USA	10
sr:player:1379293	Bozdogan, Can	sr:competitor:2948	midfielder	DEU	8
sr:player:1396437	Romeny, Ole	sr:competitor:2948	forward	NLD	77
sr:player:1589598	Didden, Matisse	sr:competitor:2948	midfielder	BEL	40
sr:player:1634226	Rodriguez, Miguel	sr:competitor:2948	forward	ESP	22
sr:player:1651155	Min, David	sr:competitor:2948	forward	NLD	9
sr:player:82371	Pillud, Ivan	sr:competitor:65676	defender	ARG	4
sr:player:803612	Andueza, Federico	sr:competitor:65676	defender	URY	16
sr:player:804184	Florentin, Jose	sr:competitor:65676	midfielder	PRY	25
sr:player:931534	Torrent, Fernando	sr:competitor:65676	defender	ARG	4
sr:player:954704	Montoya, Lautaro	sr:competitor:65676	defender	ARG	13
sr:player:1004421	Rak, Yonatthan	sr:competitor:65676	defender	URY	15
sr:player:1103591	Ingolotti, Luis	sr:competitor:65676	goalkeeper	ARG	1
sr:player:1104015	Barrios, Rafael	sr:competitor:65676	defender	ARG	13
sr:player:1640494	Sanchez, Luis	sr:competitor:65676	midfielder	COL	88
sr:player:1646294	Valdez, Sebastian	sr:competitor:65676	defender	ARG	6
sr:player:1835228	Marchi, Leonardo	sr:competitor:65676	defender	ARG	3
sr:player:1835318	Vega, Cristian Orlando	sr:competitor:65676	midfielder	ARG	5
sr:player:1957451	Godoy, Matias	sr:competitor:65676	forward	ARG	11
sr:player:1957483	Varaldo, Lucas	sr:competitor:65676	forward	ARG	9
sr:player:1981351	Quagliata, Nicolas	sr:competitor:65676	forward	URY	27
sr:player:1990287	Aragon, Franco	sr:competitor:65676	midfielder	ARG	22
sr:player:2005115	Cabral, Favio	sr:competitor:65676	forward	ARG	29
sr:player:2101842	Juarez, Sergio	sr:competitor:65676	goalkeeper	ARG	12
sr:player:2121250	Angulo, Luis Miguel	sr:competitor:65676	midfielder	COL	18
sr:player:2137212	Laquidain, Santiago	sr:competitor:65676	defender	ARG	24
sr:player:2142382	Martinez, Fernando	sr:competitor:65676	defender	ARG	20
sr:player:2188614	Meli, Andres	sr:competitor:65676	midfielder	ARG	26
sr:player:2253163	Gomez, Jose	sr:competitor:65676	defender	ARG	36
sr:player:2277181	Bursich, Lautaro	sr:competitor:65676	goalkeeper	ARG	23
sr:player:2327461	Segovia, Alexis	sr:competitor:65676	defender	ARG	21
sr:player:2329129	Cabrera, Elias	sr:competitor:65676	forward	ARG	10
sr:player:2343085	Atencio, Rodrigo	sr:competitor:65676	forward	ARG	8
sr:player:2384507	Palavecino, Manuel	sr:competitor:65676	midfielder	ARG	38
sr:player:2387675	Cansinos, Ramon	sr:competitor:65676	midfielder	ARG	28
sr:player:2533619	Vazquez, Kevin	sr:competitor:65676	midfielder	ARG	32
sr:player:2534221	Abascia, Lucas Nicolas	sr:competitor:65676	defender	ARG	2
sr:player:2545777	Benitez, Fernando Matias	sr:competitor:65676	forward	ARG	7
sr:player:2643443	Vallejos, Javier	sr:competitor:65676	goalkeeper	ARG	40
sr:player:2706190	Morales, Agustin	sr:competitor:65676	forward	ARG	37
sr:player:2756247	Diaz, Agustin Ariel	sr:competitor:65676	forward	ARG	\N
sr:player:2789033	Rojas, Brian	sr:competitor:65676	midfielder	ARG	35
sr:player:2789035	Galvan, Ignacio	sr:competitor:65676	defender	ARG	31
sr:player:2790187	Casermeiro, Yuri	sr:competitor:65676	defender	ARG	17
sr:player:2809645	Rivero, Lautaro	sr:competitor:65676	defender	ARG	19
sr:player:2811195	Trindade, Gonzalo	sr:competitor:65676	defender	ARG	14
sr:player:2827755	Cuevas, Lucas	sr:competitor:65676	goalkeeper	ARG	12
sr:player:2827921	Diaz, Matias Nicolas	sr:competitor:65676	midfielder	ARG	7
sr:player:26025	Olsen, Robin	sr:competitor:40	goalkeeper	SWE	25
sr:player:96538	Digne, Lucas	sr:competitor:40	defender	FRA	12
sr:player:98435	Barkley, Ross	sr:competitor:40	midfielder	ENG	6
sr:player:158263	Martinez, Emiliano	sr:competitor:40	goalkeeper	ARG	23
sr:player:250223	McGinn, John	sr:competitor:40	midfielder	SCO	7
sr:player:255189	Hause, Kortney	sr:competitor:40	defender	ENG	30
sr:player:303638	Mings, Tyrone	sr:competitor:40	defender	ENG	5
sr:player:331737	Tielemans, Youri	sr:competitor:40	midfielder	BEL	8
sr:player:555386	Watkins, Ollie	sr:competitor:40	forward	ENG	11
sr:player:604232	Carlos, Diego	sr:competitor:40	defender	BRA	3
sr:player:783126	Buendia, Emiliano	sr:competitor:40	midfielder	ARG	10
sr:player:883594	Bailey, Leon	sr:competitor:40	midfielder	JAM	31
sr:player:936566	Kamara, Boubacar	sr:competitor:40	midfielder	FRA	44
sr:player:942488	Konsa, Ezri	sr:competitor:40	defender	ENG	4
sr:player:944170	Torres, Pau	sr:competitor:40	defender	ESP	14
sr:player:968907	Cash, Matty	sr:competitor:40	defender	POL	2
sr:player:1402475	Onana, Amadou	sr:competitor:40	midfielder	BEL	24
sr:player:1577506	Rogers, Morgan	sr:competitor:40	forward	ENG	27
sr:player:1613022	Maatsen, Ian	sr:competitor:40	defender	NLD	22
sr:player:1619862	Gauci, Joe	sr:competitor:40	goalkeeper	AUS	18
sr:player:1697559	Duran, Jhon	sr:competitor:40	forward	COL	9
sr:player:1705555	Ramsey, Jacob	sr:competitor:40	midfielder	ENG	41
sr:player:1996701	Zych, Oliwier	sr:competitor:40	goalkeeper	POL	48
sr:player:2115982	Bogarde, Lamare	sr:competitor:40	midfielder	NLD	26
sr:player:2115992	Swinkels, Sil	sr:competitor:40	defender	NLD	50
sr:player:2134236	Philogene, Jaden	sr:competitor:40	forward	ENG	19
sr:player:2355119	Nedeljkovic, Kosta	sr:competitor:40	defender	SRB	20
sr:player:2530535	Young, Kadan	sr:competitor:40	midfielder	ENG	72
sr:player:2592559	Patterson, Travis	sr:competitor:40	defender	ENG	66
sr:player:2865451	Rowe, Triston	sr:competitor:40	defender	ENG	45
sr:player:2865453	Borland, Aidan	sr:competitor:40	midfielder	SCO	54
sr:player:2865455	Jimoh, Jamaldeen	sr:competitor:40	midfielder	ENG	56
sr:player:2865459	Moore, Kobei	sr:competitor:40	forward	ENG	77
sr:player:2865463	Broggio, Ben	sr:competitor:40	midfielder	ENG	79
sr:player:2865467	Katsukunya, Thierry	sr:competitor:40	defender	WAL	\N
sr:player:11869	Navas, Jesus	sr:competitor:2833	forward	ESP	16
sr:player:22209	Nyland, Orjan	sr:competitor:2833	goalkeeper	NOR	13
sr:player:68332	Gudelj, Nemanja	sr:competitor:2833	midfielder	SRB	6
sr:player:96370	Suso	sr:competitor:2833	forward	ESP	10
sr:player:1957399	Flores, Alexis	sr:competitor:36833	defender	ARG	2
sr:player:1999395	Coronel, Mateo	sr:competitor:36833	forward	ARG	37
sr:player:2078887	Bajamich, Mateo	sr:competitor:36833	forward	ARG	9
sr:player:2081955	Gonzalez, Juan	sr:competitor:36833	goalkeeper	URY	12
sr:player:2091251	Castro, Nicolas Eduardo	sr:competitor:36833	midfielder	ARG	11
sr:player:2098690	Castro Ponce, Tomas	sr:competitor:36833	forward	ARG	26
sr:player:2107152	Giani, Justo	sr:competitor:36833	forward	ARG	40
sr:player:2109226	Infante, Juan	sr:competitor:36833	defender	ARG	32
sr:player:2125946	Romero, Nicolas	sr:competitor:36833	forward	ARG	20
sr:player:2329153	Pimienta, Facundo	sr:competitor:36833	forward	ARG	22
sr:player:2351633	Nicola, Franco	sr:competitor:36833	forward	URY	10
sr:player:2760743	Lescano, Gustavo	sr:competitor:36833	goalkeeper	ARG	36
sr:player:2762097	Rad, Alexis	sr:competitor:36833	midfielder	ARG	45
sr:player:2763973	Bonfiglio, Francisco	sr:competitor:36833	forward	ARG	23
sr:player:2769701	Brandan, Moises	sr:competitor:36833	defender	ARG	16
sr:player:2805465	Bedmar, Fabricio	sr:competitor:36833	defender	ARG	35
sr:player:2828471	Godoy, Lautaro	sr:competitor:36833	midfielder	ARG	24
sr:player:2892471	Olima, Leandro	sr:competitor:36833	forward	ARG	21
sr:player:19314	Forster, Fraser	sr:competitor:33	goalkeeper	ENG	20
sr:player:94758	Davies, Ben	sr:competitor:33	defender	WAL	33
sr:player:111505	Heung-min, Son	sr:competitor:33	forward	KOR	7
sr:player:232306	Werner, Timo	sr:competitor:33	forward	DEU	16
sr:player:356398	Maddison, James	sr:competitor:33	midfielder	ENG	10
sr:player:361420	Solanke, Dominic	sr:competitor:33	forward	ENG	19
sr:player:553606	Vicario, Guglielmo	sr:competitor:33	goalkeeper	ITA	1
sr:player:777892	Reguilon, Sergio	sr:competitor:33	defender	ESP	3
sr:player:810644	Bentancur, Rodrigo	sr:competitor:33	midfielder	URY	30
sr:player:918722	Whiteman, Alfie	sr:competitor:33	goalkeeper	ENG	41
sr:player:952278	Romero, Cristian	sr:competitor:33	defender	ARG	17
sr:player:992069	Richarlison	sr:competitor:33	forward	BRA	9
sr:player:1010967	Bissouma, Yves	sr:competitor:33	midfielder	MLI	8
sr:player:1058637	Austin, Brandon	sr:competitor:33	goalkeeper	ENG	40
sr:player:1065654	Kulusevski, Dejan	sr:competitor:33	midfielder	SWE	21
sr:player:1363568	Porro, Pedro	sr:competitor:33	defender	ESP	23
sr:player:1564490	Spence, Djed	sr:competitor:33	defender	ENG	24
sr:player:1642306	Dragusin, Radu	sr:competitor:33	defender	ROU	6
sr:player:1646334	Johnson, Brennan	sr:competitor:33	forward	WAL	22
sr:player:1722002	Udogie, Destiny	sr:competitor:33	defender	ITA	13
sr:player:1938216	Van de Ven, Micky	sr:competitor:33	defender	NLD	37
sr:player:1957969	Sarr, Pape Matar	sr:competitor:33	midfielder	SEN	29
sr:player:2239979	Odobert, Wilson	sr:competitor:33	forward	FRA	28
sr:player:2278985	Gray, Archie	sr:competitor:33	midfielder	ENG	14
sr:player:2397923	Bergvall, Lucas	sr:competitor:33	midfielder	SWE	15
sr:player:2439481	Dorrington, Alfie	sr:competitor:33	defender	ENG	48
sr:player:2439499	Moore, Mikey	sr:competitor:33	forward	ENG	47
sr:player:2439511	Ajayi, Oyindamola	sr:competitor:33	midfielder	ENG	63
sr:player:2469939	Lankshear, William	sr:competitor:33	forward	ENG	42
sr:player:2805341	Olusesi, Callum William	sr:competitor:33	midfielder	ENG	64
sr:player:2871221	Cassanova, Dante	sr:competitor:33	defender	ENG	59
sr:player:2891569	Williams-Barnet, Luca	sr:competitor:33	forward	ENG	78
sr:player:32048	Stuani, Cristhian	sr:competitor:24264	forward	URY	7
sr:player:44864	Blind, Daley	sr:competitor:24264	defender	NLD	17
sr:player:69416	Romeu, Oriol	sr:competitor:24264	midfielder	ESP	14
sr:player:83708	Carlos, Juan	sr:competitor:24264	goalkeeper	ESP	1
sr:player:129861	Juanpe	sr:competitor:24264	defender	ESP	15
sr:player:135116	Lopez, David	sr:competitor:24264	midfielder	ESP	5
sr:player:164343	Gazzaniga, Paulo	sr:competitor:24264	goalkeeper	ARG	13
sr:player:218616	Portu	sr:competitor:24264	midfielder	ESP	24
sr:player:319735	Tsygankov, Viktor	sr:competitor:24264	forward	UKR	8
sr:player:361790	Van De Beek, Donny	sr:competitor:24264	forward	NLD	6
sr:player:548848	Lopez, Pau	sr:competitor:24264	goalkeeper	ESP	25
sr:player:908280	Danjuma, Arnaut	sr:competitor:24264	forward	NLD	11
sr:player:927018	Krejci, Ladislav	sr:competitor:24264	defender	CZE	18
sr:player:935064	Ruiz, Abel	sr:competitor:24264	forward	ESP	9
sr:player:973785	Martin, Ivan	sr:competitor:24264	midfielder	ESP	23
sr:player:984649	Herrera, Yangel	sr:competitor:24264	midfielder	VEN	21
sr:player:1083714	Miovski, Bojan	sr:competitor:24264	forward	MKD	19
sr:player:1298208	Bryan Gil	sr:competitor:24264	midfielder	ESP	20
sr:player:1302138	Gutierrez, Miguel	sr:competitor:24264	defender	ESP	3
sr:player:1953614	Frances, Alejandro	sr:competitor:24264	defender	ESP	16
sr:player:2080919	Arnau, Martinez	sr:competitor:24264	defender	ESP	4
sr:player:2105890	Asprilla, Yaser	sr:competitor:24264	forward	COL	10
sr:player:2202948	Artero Ruiz, Ricard	sr:competitor:24264	midfielder	ESP	\N
sr:player:2229698	Misehouy, Gabriel	sr:competitor:24264	midfielder	NLD	27
sr:player:2266495	Marti, Ferran Ruiz	sr:competitor:24264	defender	ESP	45
sr:player:2277823	Solis, Jhon	sr:competitor:24264	midfielder	COL	22
sr:player:2661139	Garca, Jastin	sr:competitor:24264	forward	ESP	31
sr:player:2661635	Oya, Silvi Clua	sr:competitor:24264	midfielder	ESP	28
sr:player:2716834	Arango, Juan	sr:competitor:24264	forward	VEN	34
sr:player:2729162	Yaakobishvili, Antal	sr:competitor:24264	defender	HUN	35
sr:player:2741729	Garcia, Enric	sr:competitor:24264	midfielder	ESP	30
sr:player:26995	Sanchez, Carlos	sr:competitor:65668	midfielder	COL	13
sr:player:122713	Miloc, Dardo	sr:competitor:65668	midfielder	ARG	28
sr:player:147578	Moyano, Sebastian	sr:competitor:65668	goalkeeper	ARG	25
sr:player:1103783	Goni, Gonzalo	sr:competitor:65668	defender	ARG	14
sr:player:1112861	Mino, Marcelo	sr:competitor:65668	goalkeeper	ARG	30
sr:player:1121379	Candia, Jhonatan	sr:competitor:65668	forward	URY	20
sr:player:1131875	Dominguez, Alexis	sr:competitor:65668	forward	ARG	9
sr:player:1713131	Ferrario, Rafael	sr:competitor:65668	goalkeeper	ARG	1
sr:player:2038795	Zalazar, Maximiliano	sr:competitor:65668	midfielder	ARG	43
sr:player:2073027	Mater, Facundo	sr:competitor:65668	midfielder	ARG	33
sr:player:2083425	Herrera, Rodrigo	sr:competitor:65668	midfielder	ARG	5
sr:player:2089567	Cantero, Alan	sr:competitor:65668	midfielder	ARG	11
sr:player:2091259	Juarez, Daniel Eduardo	sr:competitor:65668	forward	ARG	29
sr:player:2091333	Brochero, Lucas	sr:competitor:65668	forward	ARG	21
sr:player:2098302	Rosane, Siro	sr:competitor:65668	midfielder	ARG	8
sr:player:2104216	Tapia, Ivan	sr:competitor:65668	midfielder	ARG	10
sr:player:2108256	Iacobellis, Marcos	sr:competitor:65668	midfielder	ARG	27
sr:player:2108302	Bruera, Facundo	sr:competitor:65668	forward	ARG	\N
sr:player:2109216	Insua, Rodrigo	sr:competitor:65668	forward	ARG	6
sr:player:2136340	Demartini, Nicolas	sr:competitor:65668	defender	ARG	15
sr:player:2148716	Duarte, Manuel	sr:competitor:65668	midfielder	ARG	24
sr:player:2186238	Coronel, Santiago Agustin	sr:competitor:65668	forward	ARG	32
sr:player:2220158	Irazoque, Agustin	sr:competitor:65668	defender	ARG	26
sr:player:2227176	López, Lucas	sr:competitor:65668	midfielder	ARG	40
sr:player:2254161	Velurtas, Pedro	sr:competitor:65668	midfielder	ARG	4
sr:player:2296877	Puig, Maximiliano	sr:competitor:65668	midfielder	ARG	79
sr:player:2317417	Faggioli, Lucas	sr:competitor:65668	defender	ARG	23
sr:player:2327607	Kruger, Facundo Nicolas	sr:competitor:65668	forward	ARG	7
sr:player:2342547	Tolosa, Franco Nicolas	sr:competitor:65668	defender	ARG	3
sr:player:2374465	Juarez, Axel	sr:competitor:65668	midfielder	ARG	36
sr:player:2539015	Capraro, Nicolas	sr:competitor:65668	defender	ARG	2
sr:player:2563575	Aguirre, Federico	sr:competitor:65668	forward	ARG	48
sr:player:2764107	Ruiz, Javier	sr:competitor:65668	forward	ARG	41
sr:player:2784121	Ruiz, Javier	sr:competitor:65668	midfielder	ARG	41
sr:player:2810795	Pavia, Diego	sr:competitor:65668	midfielder	ARG	58
sr:player:2828917	Bruera, Facundo	sr:competitor:65668	defender	ARG	7
sr:player:2847919	Villalba, Santiago	sr:competitor:65668	forward	ARG	22
sr:player:44566	Smith, Adam	sr:competitor:60	defender	ENG	15
sr:player:232422	Arrizabalaga, Kepa	sr:competitor:60	goalkeeper	ESP	13
sr:player:322391	Christie, Ryan	sr:competitor:60	forward	SCO	10
sr:player:336655	Unal, Enes	sr:competitor:60	forward	TUR	26
sr:player:548188	Cook, Lewis	sr:competitor:60	midfielder	ENG	4
sr:player:548660	Billing, Philip	sr:competitor:60	midfielder	DNK	29
sr:player:809778	Adams, Tyler	sr:competitor:60	midfielder	USA	12
sr:player:934234	Kluivert, Justin	sr:competitor:60	forward	NLD	19
sr:player:934536	Travers, Mark	sr:competitor:60	goalkeeper	IRL	42
sr:player:944820	Tavernier, Marcus	sr:competitor:60	midfielder	ENG	16
sr:player:954708	Senesi, Marcos	sr:competitor:60	defender	ARG	5
sr:player:1056631	Brooks, David	sr:competitor:60	midfielder	WAL	7
sr:player:1124571	Sinisterra, Luis	sr:competitor:60	forward	COL	17
sr:player:1436414	Evanilson	sr:competitor:60	forward	BRA	9
sr:player:1480070	Semenyo, Antoine	sr:competitor:60	forward	GHA	24
sr:player:1549771	Aarons, Max	sr:competitor:60	defender	ENG	37
sr:player:1631296	Zabarnyi, Illia	sr:competitor:60	defender	UKR	27
sr:player:1653565	Hill, James	sr:competitor:60	defender	ENG	23
sr:player:1712141	Araujo, Julian	sr:competitor:60	defender	MEX	22
sr:player:1839276	Dennis, Will	sr:competitor:60	goalkeeper	ENG	40
sr:player:1989917	Kerkez, Milos	sr:competitor:60	defender	HUN	3
sr:player:2131960	Scott, Alex	sr:competitor:60	midfielder	ENG	8
sr:player:2200344	Ouattara, Dango	sr:competitor:60	forward	BFA	11
sr:player:2354391	Huijsen, Dean	sr:competitor:60	defender	ESP	2
sr:player:2539017	DaCosta, Michael	sr:competitor:60	forward	ESP	50
sr:player:19013	Cuellar, Ivan	sr:competitor:2826	goalkeeper	ESP	25
sr:player:106578	Rodriguez, Dani	sr:competitor:2826	midfielder	ESP	14
sr:player:110783	Darder, Sergi	sr:competitor:2826	midfielder	ESP	10
sr:player:146852	Abdon	sr:competitor:2826	forward	ESP	9
sr:player:255999	Mascarell, Omar	sr:competitor:2826	midfielder	GNQ	5
sr:player:300522	Valjent, Martin	sr:competitor:2826	defender	SVK	24
sr:player:309546	Asano, Takuma	sr:competitor:2826	forward	JPN	11
sr:player:310874	Muriqi, Vedat	sr:competitor:2826	forward	KOS	7
sr:player:344847	Mojica, Johan	sr:competitor:2826	defender	COL	22
sr:player:352666	Maffeo, Pablo	sr:competitor:2826	defender	ARG	23
sr:player:756754	Larin, Cyle	sr:competitor:2826	forward	CAN	17
sr:player:769519	Morlanes, Manu	sr:competitor:2826	midfielder	ARG	8
sr:player:808932	Greif, Dominik	sr:competitor:2826	goalkeeper	SVK	1
sr:player:877484	Raillo, Antonio	sr:competitor:2826	defender	ESP	21
sr:player:935966	Lato Toni	sr:competitor:2826	defender	ESP	3
sr:player:943420	Van Der Heyden, Siebe	sr:competitor:2826	defender	BEL	4
sr:player:1051063	Morey, Mateu	sr:competitor:2826	defender	ESP	2
sr:player:1383611	Copete, Jose	sr:competitor:2826	defender	ESP	6
sr:player:1508073	Navarro, Robert	sr:competitor:2826	midfielder	ESP	27
sr:player:33256	Acosta, Lautaro	sr:competitor:3218	forward	ARG	7
sr:player:42450	Munoz, Ezequiel	sr:competitor:3218	defender	ARG	2
sr:player:47334	Eduardo Salvio	sr:competitor:3218	midfielder	ARG	14
sr:player:107397	Diaz, Leandro	sr:competitor:3218	forward	ARG	18
sr:player:147351	Aguerre, Alan	sr:competitor:3218	goalkeeper	ARG	1
sr:player:174943	Izquierdoz, Carlos	sr:competitor:3218	defender	ARG	24
sr:player:250933	Jara, Leonardo	sr:competitor:3218	defender	ARG	19
sr:player:340441	Carrera, Ramiro	sr:competitor:3218	midfielder	ARG	32
sr:player:340727	Luciatti, Brian Abel	sr:competitor:3218	defender	ARG	6
sr:player:341075	Dominguez, Nery	sr:competitor:3218	midfielder	ARG	23
sr:player:384552	Losada, Nahuel Hernan	sr:competitor:3218	goalkeeper	ARG	26
sr:player:558816	Bou, Walter	sr:competitor:3218	forward	ARG	9
sr:player:803060	Alvarez, Fabio	sr:competitor:3218	midfielder	ARG	40
sr:player:1029363	Moreno, Marcelino	sr:competitor:3218	midfielder	ARG	10
sr:player:1110799	Thaller, Nicolas	sr:competitor:3218	defender	ARG	\N
sr:player:1119155	Loaiza, Raul	sr:competitor:3218	midfielder	COL	15
sr:player:1723194	Boggio, Luciano	sr:competitor:3218	midfielder	URY	8
sr:player:1870920	Perez, Facundo	sr:competitor:3218	midfielder	ARG	34
sr:player:1998029	Morgantini, Nicolas Jorge	sr:competitor:3218	defender	ARG	3
sr:player:2004313	Caceres, Juan Jose	sr:competitor:3218	defender	PRY	21
sr:player:2008353	Perez, Gonzalo	sr:competitor:3218	defender	URY	4
sr:player:2107148	Torres, Jonathan	sr:competitor:3218	forward	ARG	27
sr:player:2149474	Rodríguez, Agustin	sr:competitor:3218	midfielder	ARG	17
sr:player:2159324	Pena Biafore, Felipe	sr:competitor:3218	defender	ARG	5
sr:player:2336441	Soler, Julio	sr:competitor:3218	defender	ARG	22
sr:player:2343083	Irusta, Lucas	sr:competitor:3218	defender	ARG	33
sr:player:2602515	Claa, Nicolas	sr:competitor:3218	goalkeeper	ARG	12
sr:player:2629159	Aquino, Dylan	sr:competitor:3218	midfielder	ARG	25
sr:player:2685123	Watson, Franco Nahuel	sr:competitor:3218	midfielder	ARG	16
sr:player:2717342	Ontivero, Octavio	sr:competitor:3218	defender	ARG	28
sr:player:2717348	Gerez, Mariano	sr:competitor:3218	midfielder	ARG	36
sr:player:2773249	Cabrera, Bruno	sr:competitor:3218	forward	ARG	20
sr:player:2809947	Alvarez	sr:competitor:3218	\N	\N	11
sr:player:2836919	Balbuena, Tiago	sr:competitor:3218	forward	ARG	38
sr:player:2836921	Medina, Agustin	sr:competitor:3218	midfielder	ARG	39
sr:player:2836923	Cardozo, Leonel	sr:competitor:3218	defender	ARG	37
sr:player:2885245	Romero, Luciano	sr:competitor:3218	\N	ARG	41
sr:player:18122	Heaton, Tom	sr:competitor:35	goalkeeper	ENG	22
sr:player:30144	Evans, Jonny	sr:competitor:35	defender	NIR	35
sr:player:105734	Eriksen, Christian	sr:competitor:35	midfielder	DNK	14
sr:player:122951	Casemiro	sr:competitor:35	midfielder	BRA	18
sr:player:143334	Lindelof, Victor	sr:competitor:35	defender	SWE	2
sr:player:149380	Maguire, Harry	sr:competitor:35	defender	ENG	5
sr:player:190839	Shaw, Luke	sr:competitor:35	defender	ENG	23
sr:player:288205	Fernandes, Bruno	sr:competitor:35	midfielder	PRT	8
sr:player:772389	Onana, Andre	sr:competitor:35	goalkeeper	CMR	24
sr:player:815732	De Ligt, Matthijs	sr:competitor:35	defender	NLD	4
sr:player:817522	Dalot, Diogo	sr:competitor:35	defender	PRT	20
sr:player:903830	Rashford, Marcus	sr:competitor:35	forward	ENG	10
sr:player:909328	Bayindir, Altay	sr:competitor:35	goalkeeper	TUR	1
sr:player:934214	Malacia, Tyrell	sr:competitor:35	defender	NLD	12
sr:player:936126	Mount, Mason	sr:competitor:35	midfielder	ENG	7
sr:player:943506	Mazraoui, Noussair	sr:competitor:35	defender	MAR	3
sr:player:1016803	Ugarte, Manuel	sr:competitor:35	midfielder	URY	25
sr:player:1134755	Martinez, Lisandro	sr:competitor:35	defender	ARG	6
sr:player:1382367	Zirkzee, Joshua	sr:competitor:35	forward	NLD	11
sr:player:1614982	Antony	sr:competitor:35	forward	BRA	21
sr:player:1886726	Diallo, Amad	sr:competitor:35	midfielder	CIV	16
sr:player:1955902	Garnacho, Alejandro	sr:competitor:35	forward	ARG	17
sr:player:1986771	Hojlund, Rasmus	sr:competitor:35	forward	DNK	9
sr:player:2264779	Yoro, Leny	sr:competitor:35	defender	FRA	15
sr:player:2264945	Mainoo, Kobbie	sr:competitor:35	midfielder	ENG	37
sr:player:2271089	Ogunneye, Habeeb	sr:competitor:35	defender	ENG	66
sr:player:2271105	Gore, Daniel	sr:competitor:35	midfielder	ENG	44
sr:player:2534697	Amass, Harry	sr:competitor:35	defender	ENG	41
sr:player:2651045	Collyer, Toby	sr:competitor:35	midfielder	ENG	43
sr:player:2691742	Wheatley, Ethan	sr:competitor:35	forward	ENG	36
sr:player:2691760	Fitzgerald, Jayce	sr:competitor:35	midfielder	ENG	75
sr:player:2736255	Fletcher, Jack	sr:competitor:35	midfielder	SCO	57
sr:player:49655	Berchiche, Yuri	sr:competitor:2825	defender	ESP	17
sr:player:52663	De Marcos, Oscar	sr:competitor:2825	defender	ESP	18
sr:player:82474	Herrera, Ander	sr:competitor:2825	midfielder	ESP	21
sr:player:96365	Ruiz De Galarreta, Inigo	sr:competitor:2825	midfielder	ESP	16
sr:player:353238	Gorosabel, Andoni	sr:competitor:2825	defender	ESP	2
sr:player:359742	Vesga, Mikel	sr:competitor:2825	midfielder	ESP	6
sr:player:592012	Berenguer, Alex	sr:competitor:2825	forward	ESP	7
sr:player:605658	Nunez, Unai	sr:competitor:2825	defender	ESP	14
sr:player:605672	Guruzeta, Gorka	sr:competitor:2825	forward	ESP	12
sr:player:783374	Williams, Inaki	sr:competitor:2825	forward	GHA	9
sr:player:796802	Simon, Unai	sr:competitor:2825	goalkeeper	ESP	1
sr:player:864636	Lekue, Inigo	sr:competitor:2825	defender	ESP	15
sr:player:33943	Meza, Fernando	sr:competitor:3216	defender	ARG	18
sr:player:38266	Rodriguez, Diego	sr:competitor:3216	goalkeeper	ARG	50
sr:player:249427	Godoy, Erik	sr:competitor:3216	defender	ARG	4
sr:player:558790	Oroz, Nicolas	sr:competitor:3216	midfielder	ARG	21
sr:player:802004	Galvan, Jonatan	sr:competitor:3216	defender	ARG	19
sr:player:819598	Romero, Maximiliano	sr:competitor:3216	forward	ARG	9
sr:player:966281	Mac Allister, Francis	sr:competitor:3216	midfielder	ARG	30
sr:player:966335	Molina, Tomas	sr:competitor:3216	forward	ARG	27
sr:player:1104095	Cordero, Nicolas	sr:competitor:3216	forward	ARG	32
sr:player:1109657	Rodriguez, Alan	sr:competitor:3216	midfielder	URY	8
sr:player:1112533	Ferreira, Cristian	sr:competitor:3216	midfielder	ARG	17
sr:player:1121711	Ardaiz de los Santos, Joaquin Matias	sr:competitor:3216	forward	URY	\N
sr:player:1143528	Rodriguez, Santiago Alejandro	sr:competitor:3216	forward	ARG	7
sr:player:1241274	Sanchez, Luciano	sr:competitor:3216	defender	ARG	3
sr:player:1267462	Heredia, Leonardo	sr:competitor:3216	midfielder	ARG	15
sr:player:1403539	Veron, Gaston	sr:competitor:3216	forward	ARG	10
sr:player:2013345	Acosta, Miguel	sr:competitor:3216	goalkeeper	ARG	1
sr:player:2070033	Prieto, Sebastian	sr:competitor:3216	defender	ARG	20
sr:player:2091739	Gimenez, Sergio Benjamin	sr:competitor:3216	forward	ARG	\N
sr:player:2137210	Vega, Roman	sr:competitor:3216	defender	ARG	6
sr:player:2148410	Perello, Matias Mijail	sr:competitor:3216	forward	ARG	28
sr:player:2149894	Viveros, Emiliano	sr:competitor:3216	midfielder	ARG	29
sr:player:2288133	Alvarez, Francisco	sr:competitor:3216	defender	ARG	16
sr:player:2312449	Lescano, Alan	sr:competitor:3216	midfielder	ARG	22
sr:player:2342529	Siri, Gonzalo	sr:competitor:3216	goalkeeper	ARG	12
sr:player:2342541	Santamaría, Thiago	sr:competitor:3216	defender	ARG	23
sr:player:2342553	Cardozo, Juan Jose	sr:competitor:3216	midfielder	PRY	12
sr:player:2342557	Herrera, Jose Maria	sr:competitor:3216	forward	ARG	11
sr:player:2407637	Gomez, Lucas	sr:competitor:3216	midfielder	ARG	25
sr:player:2407657	Diaz Chaves, Mateo	sr:competitor:3216	forward	ARG	24
sr:player:2645791	Raccio, Jonathan	sr:competitor:3216	midfielder	ARG	43
sr:player:2661301	Guillen, Manuel	sr:competitor:3216	defender	ARG	31
sr:player:2714324	Coronel, Kevin	sr:competitor:3216	defender	ARG	14
sr:player:2717120	Palacio, Tobias	sr:competitor:3216	defender	ARG	2
sr:player:2762933	Gamarra, Ariel	sr:competitor:3216	midfielder	PRY	36
sr:player:2793121	Sosa, Marcos Uriel	sr:competitor:3216	defender	ARG	42
sr:player:2807639	Rocha, Gabriel	sr:competitor:3216	midfielder	BRA	39
sr:player:2807641	Vazquez, Franco Agustin	sr:competitor:3216	defender	ARG	38
sr:player:2807643	Porcel, Diego	sr:competitor:3216	forward	ARG	47
sr:player:2807645	Villalba, Bruno	sr:competitor:3216	midfielder	ARG	34
sr:player:2807647	Baez, Facundo	sr:competitor:3216	forward	ARG	41
sr:player:2836237	Meza Montiel, Daniel	sr:competitor:3216	defender	ARG	\N
sr:player:2859707	Mangiaut, Agustin	sr:competitor:3216	goalkeeper	ARG	35
sr:player:2869415	Ramirez, Tobias	sr:competitor:3216	defender	ARG	2
sr:player:17054	Lallana, Adam	sr:competitor:45	midfielder	ENG	10
sr:player:45502	McCarthy, Alex	sr:competitor:45	goalkeeper	ENG	1
sr:player:134361	Stephens, Jack	sr:competitor:45	defender	ENG	5
sr:player:138261	Fraser, Ryan	sr:competitor:45	forward	SCO	24
sr:player:166381	Taylor, Charlie	sr:competitor:45	defender	ENG	21
sr:player:280439	Cornet, Maxwel	sr:competitor:45	midfielder	CIV	22
sr:player:286085	Bednarek, Jan	sr:competitor:45	defender	POL	35
sr:player:295123	Onuachu, Paul	sr:competitor:45	forward	NGA	32
sr:player:328701	Manning, Ryan	sr:competitor:45	midfielder	IRL	3
sr:player:361352	Armstrong, Adam	sr:competitor:45	forward	ENG	9
sr:player:555406	Bree, James	sr:competitor:45	defender	ENG	14
sr:player:591620	Lumley, Joe	sr:competitor:45	goalkeeper	ENG	13
sr:player:920380	Walker-Peters, Kyle	sr:competitor:45	defender	ENG	2
sr:player:988185	Ramsdale, Aaron	sr:competitor:45	goalkeeper	ENG	30
sr:player:1084012	Aribo, Joe	sr:competitor:45	midfielder	NGA	7
sr:player:1094200	Brereton, Ben	sr:competitor:45	forward	CHL	17
sr:player:1096354	Stewart, Ross	sr:competitor:45	forward	SCO	11
sr:player:1132685	Downes, Flynn	sr:competitor:45	midfielder	ENG	4
sr:player:1322500	Sugawara, Yukinari	sr:competitor:45	defender	JPN	16
sr:player:1494177	Bazunu, Gavin	sr:competitor:45	goalkeeper	IRL	31
sr:player:1555691	Wood, Nathan	sr:competitor:45	defender	ENG	15
sr:player:1576010	Bella-Kotchap, Armel	sr:competitor:45	defender	DEU	37
sr:player:1628260	Harwood-Bellis, Taylor	sr:competitor:45	defender	ENG	6
sr:player:1770020	Smallbone, William	sr:competitor:45	midfielder	IRL	8
sr:player:1868542	Archer, Cameron	sr:competitor:45	forward	ENG	19
sr:player:2021829	Sulemana, Kamaldeen	sr:competitor:45	forward	GHA	20
sr:player:2057757	Edwards, Ronnie	sr:competitor:45	defender	ENG	12
sr:player:2059271	Ugochukwu, Lesley	sr:competitor:45	midfielder	FRA	26
sr:player:2221324	Fernandes, Mateus	sr:competitor:45	midfielder	PRT	18
sr:player:2246807	Larios, Juan	sr:competitor:45	defender	ESP	28
sr:player:2306869	O'Brien-Whitmarsh, Joe	sr:competitor:45	midfielder	IRL	60
sr:player:2336549	Akachukwu, Romeo	sr:competitor:45	midfielder	IRL	54
sr:player:2346621	Dibling, Tyler	sr:competitor:45	forward	ENG	33
sr:player:2615889	Amo-Ameyaw, Samuel	sr:competitor:45	midfielder	ENG	27
sr:player:2714262	Robinson, Jay	sr:competitor:45	forward	ENG	46
sr:player:2849359	Moore, Jayden	sr:competitor:45	midfielder	ENG	57
sr:player:32934	Ruben Rodriguez, Marco Gaston	sr:competitor:3217	forward	ARG	9
sr:player:33202	Quintana, Carlos	sr:competitor:3217	defender	ARG	2
sr:player:38106	Martinez, Damian	sr:competitor:3217	defender	ARG	4
sr:player:239252	Gomez, Jonathan	sr:competitor:3217	midfielder	ARG	8
sr:player:250219	Werner, Axel	sr:competitor:3217	goalkeeper	ARG	20
sr:player:291279	Solari, Augusto	sr:competitor:3217	midfielder	ARG	23
sr:player:376734	Komar, Juan	sr:competitor:3217	defender	ARG	6
sr:player:802472	Broun, Jorge	sr:competitor:3217	goalkeeper	ARG	1
sr:player:802502	Martinez, Mauricio	sr:competitor:3217	midfielder	ARG	16
sr:player:802538	Malcorra, Ignacio	sr:competitor:3217	midfielder	ARG	10
sr:player:969473	Barbieri, Miguel	sr:competitor:3217	defender	ARG	6
sr:player:989543	Lovera, Maximiliano	sr:competitor:3217	forward	ARG	7
sr:player:1103569	Copetti, Enzo	sr:competitor:3217	forward	ARG	25
sr:player:1115523	Campaz, Jaminton	sr:competitor:3217	midfielder	COL	13
sr:player:1115569	Rodriguez, Alan	sr:competitor:3217	defender	PRY	21
sr:player:1120951	Mallo, Facundo	sr:competitor:3217	defender	URY	15
sr:player:1401231	Coronel, Emanuel	sr:competitor:3217	defender	ARG	32
sr:player:1835308	Ibarra, Franco	sr:competitor:3217	midfielder	ARG	5
sr:player:2069987	Sandez, Gonzalo	sr:competitor:3217	defender	PRY	3
sr:player:2091653	Dupuy, Luca	sr:competitor:3217	forward	MEX	29
sr:player:2114448	Giaccone, Lautaro Dario	sr:competitor:3217	forward	ARG	22
sr:player:2184866	Quintero, Valentino Mariano	sr:competitor:3217	goalkeeper	ARG	31
sr:player:2184890	Silva, Kevin Isaias	sr:competitor:3217	defender	ARG	49
sr:player:2185028	O'Connor, Tomas	sr:competitor:3217	midfielder	ARG	30
sr:player:2299715	Ortiz, Kevin	sr:competitor:3217	midfielder	ARG	45
sr:player:2686335	Modica, Agustin	sr:competitor:3217	forward	ARG	44
sr:player:2717126	Gimenez, Juan	sr:competitor:3217	defender	ARG	24
sr:player:2717350	Gutierrez, Kevin Tomas	sr:competitor:3217	midfielder	ARG	43
sr:player:2755017	Bravo, Agustin Antonio	sr:competitor:3217	defender	ARG	19
sr:player:2762095	Ocampo, Elias	sr:competitor:3217	midfielder	ARG	37
sr:player:2762493	Burgos, Santiago	sr:competitor:3217	defender	ARG	26
sr:player:2805919	Carnicero, Felipe	sr:competitor:3217	midfielder	ARG	36
sr:player:2842959	Beltran, Samuel	sr:competitor:3217	midfielder	ARG	34
sr:player:2859695	Ponce, Thiago	sr:competitor:3217	forward	ARG	50
sr:player:2864693	Segovia, Santiago	sr:competitor:3217	midfielder	ARG	51
sr:player:2869873	Duarte, Gaspar	sr:competitor:3217	forward	ARG	27
sr:player:2873559	Lacoste, Facundo Esteban Cardozo	sr:competitor:3217	defender	ARG	17
sr:player:94756	Ward, Danny	sr:competitor:31	goalkeeper	WAL	1
sr:player:98449	Coady, Conor	sr:competitor:31	defender	ENG	4
sr:player:103045	Ayew, Jordan	sr:competitor:31	forward	GHA	18
sr:player:120538	Vestergaard, Jannik	sr:competitor:31	defender	DNK	23
sr:player:151499	De Cordova-Reid, Bobby	sr:competitor:31	forward	JAM	14
sr:player:173827	Vardy, Jamie	sr:competitor:31	forward	ENG	9
sr:player:221200	Pereira, Ricardo	sr:competitor:31	defender	PRT	21
sr:player:355532	Iversen, Daniel	sr:competitor:31	goalkeeper	DNK	31
sr:player:361696	Faes, Wout	sr:competitor:31	defender	BEL	3
sr:player:545780	Winks, Harry	sr:competitor:31	midfielder	ENG	8
sr:player:605338	Mavididi, Stephy	sr:competitor:31	forward	ENG	10
sr:player:769147	Edouard, Odsonne	sr:competitor:31	forward	FRA	29
sr:player:795266	Ndidi, Wilfred	sr:competitor:31	midfielder	NGA	6
sr:player:815788	Daka, Patson	sr:competitor:31	forward	ZMB	20
sr:player:907860	Soumare, Boubakary	sr:competitor:31	midfielder	FRA	24
sr:player:942498	Justin, James	sr:competitor:31	defender	ENG	2
sr:player:966205	Choudhury, Hamza	sr:competitor:31	midfielder	ENG	17
sr:player:1058725	Skipp, Oliver	sr:competitor:31	midfielder	ENG	22
sr:player:1061592	Hermansen, Mads	sr:competitor:31	goalkeeper	DNK	30
sr:player:1654317	Okoli, Caleb	sr:competitor:31	defender	ITA	5
sr:player:1982795	Thomas, Luke	sr:competitor:31	defender	ENG	33
sr:player:2032765	Kristiansen, Victor	sr:competitor:31	defender	DNK	16
sr:player:2106232	Stolarczyk, Jakub	sr:competitor:31	goalkeeper	POL	41
sr:player:2140422	Fatawu, Issahaku	sr:competitor:31	forward	GHA	7
sr:player:2184938	Facundo, Buonanotte	sr:competitor:31	midfielder	ARG	40
sr:player:2245351	Marcal Madivadua, Wanya	sr:competitor:31	midfielder	PRT	\N
sr:player:2253873	Golding, Michael	sr:competitor:31	midfielder	ENG	34
sr:player:2274991	McAteer, Kasey	sr:competitor:31	midfielder	IRL	35
sr:player:2298727	El Khannouss, Bilal	sr:competitor:31	midfielder	MAR	11
sr:player:2325853	Popov, Christopher Petrov	sr:competitor:31	midfielder	WAL	48
sr:player:2528461	Alves, William	sr:competitor:31	midfielder	ENG	37
sr:player:37318	Budimir, Ante	sr:competitor:2820	forward	HRV	17
sr:player:99516	Fernandez, Aitor	sr:competitor:2820	goalkeeper	ESP	13
sr:player:142092	Cruz, Juan	sr:competitor:2820	defender	ESP	3
sr:player:149370	Gomez, Moi	sr:competitor:2820	midfielder	ESP	16
sr:player:187313	Torro, Lucas	sr:competitor:2820	midfielder	ESP	6
sr:player:255973	Pena, Ruben	sr:competitor:2820	forward	ESP	15
sr:player:260031	Garcia, Ruben	sr:competitor:2820	forward	ESP	14
sr:player:294377	Herrera, Sergio	sr:competitor:2820	goalkeeper	ESP	1
sr:player:330675	Garcia, Unai	sr:competitor:2820	defender	ESP	4
sr:player:591132	Barja, Kike	sr:competitor:2820	forward	ESP	11
sr:player:925976	Arnaiz, Jose	sr:competitor:2820	forward	ESP	20
sr:player:1122627	Vidal, Nacho	sr:competitor:2820	defender	ESP	2
sr:player:122642	Rius Aragallo, Ciro Pablo	sr:competitor:36837	forward	ARG	12
sr:player:250015	Hachen, Gabriel	sr:competitor:36837	midfielder	ARG	20
sr:player:913374	Rivero, Braian	sr:competitor:36837	midfielder	ARG	23
sr:player:927766	Lotti, Augusto	sr:competitor:36837	forward	ARG	33
sr:player:1030845	Gomez, Ivan	sr:competitor:36837	midfielder	ARG	21
sr:player:1046429	Suso, Gaston	sr:competitor:36837	defender	ARG	6
sr:player:1050097	Juarez, Fernando	sr:competitor:36837	midfielder	ARG	8
sr:player:1108423	Martinez, Ronaldo	sr:competitor:36837	forward	PRY	77
sr:player:1110793	Cozzani, Juan	sr:competitor:36837	goalkeeper	ARG	31
sr:player:1141090	Vazquez, Ignacio	sr:competitor:36837	defender	ARG	13
sr:player:1143430	Lozano, Raul Alberto	sr:competitor:36837	defender	ARG	22
sr:player:1385761	Mainero, Guido	sr:competitor:36837	midfielder	ARG	7
sr:player:1488236	Ocampo, Agustin	sr:competitor:36837	midfielder	URY	10
sr:player:1704281	Villalba, Carlos	sr:competitor:36837	midfielder	ARG	5
sr:player:1835232	Picco, Leonel	sr:competitor:36837	midfielder	ARG	14
sr:player:1858862	Sumavil, Nicolas	sr:competitor:36837	goalkeeper	ARG	32
sr:player:1861492	Salomon, Oscar	sr:competitor:36837	defender	ARG	24
sr:player:2090005	Schelotto, Bautista Barros	sr:competitor:36837	defender	ARG	4
sr:player:2092972	Marquez, Rodrigo	sr:competitor:36837	forward	ARG	47
sr:player:2101878	Pellegrino, Mateo	sr:competitor:36837	forward	ARG	9
sr:player:2107166	Schor, Ignacio	sr:competitor:36837	midfielder	ARG	26
sr:player:2109222	Desabato, Andres	sr:competitor:36837	goalkeeper	ARG	1
sr:player:2109228	Baldassarra, Franco	sr:competitor:36837	midfielder	ARG	11
sr:player:2130212	Marcich, Sasha Julian	sr:competitor:36837	defender	ARG	18
sr:player:2186562	Zapiola, Franco	sr:competitor:36837	midfielder	ARG	15
sr:player:2187244	Russo, Facundo	sr:competitor:36837	midfielder	ARG	19
sr:player:2191576	Taborda, Vicente	sr:competitor:36837	forward	ARG	16
sr:player:2300899	Pignani, Juan Pablo	sr:competitor:36837	defender	ARG	2
sr:player:2304995	Valdivia, Gonzalo	sr:competitor:36837	defender	ARG	40
sr:player:2382479	Cervera, Tobias	sr:competitor:36837	midfielder	SYR	30
sr:player:2453659	Saborido, Juan Ignacio	sr:competitor:36837	defender	ARG	25
sr:player:2475435	Goicochea del Carpio, Juan Pablo	sr:competitor:36837	forward	PER	97
sr:player:2548549	Montenegro, Lisandro Sebastian	sr:competitor:36837	midfielder	ARG	43
sr:player:2586751	Quiroga, Agustin	sr:competitor:36837	defender	ARG	27
sr:player:2666453	Palavecino, Facundo Martn	sr:competitor:36837	midfielder	ARG	\N
sr:player:2733556	Tucker, Manuel	sr:competitor:36837	forward	ARG	35
sr:player:2762691	Ortiz	sr:competitor:36837	midfielder	ARG	28
sr:player:2807401	Minerva, Franco	sr:competitor:36837	midfielder	ARG	29
sr:player:39183	Ward, Joel	sr:competitor:7	defender	ENG	2
sr:player:43215	Clyne, Nathaniel	sr:competitor:7	defender	ENG	17
sr:player:148710	Schlupp, Jeffrey	sr:competitor:7	midfielder	GHA	15
sr:player:193554	Hughes, Will	sr:competitor:7	midfielder	ENG	19
sr:player:353202	Henderson, Dean	sr:competitor:7	goalkeeper	ENG	1
sr:player:355796	Lerma, Jefferson	sr:competitor:7	midfielder	COL	8
sr:player:581610	Matthews, Remi	sr:competitor:7	goalkeeper	ENG	31
sr:player:821198	Holding, Rob	sr:competitor:7	defender	ENG	4
sr:player:827253	Kamada, Daichi	sr:competitor:7	midfielder	JPN	18
sr:player:936112	Chalobah, Trevoh	sr:competitor:7	defender	ENG	27
sr:player:936120	Guehi, Marc	sr:competitor:7	defender	ENG	6
sr:player:937000	Nketiah, Eddie	sr:competitor:7	forward	ENG	9
sr:player:967039	Turner, Matt	sr:competitor:7	goalkeeper	USA	30
sr:player:1011939	Sarr, Ismaila	sr:competitor:7	forward	SEN	7
sr:player:1027583	Mateta, Jean-Philippe	sr:competitor:7	forward	FRA	14
sr:player:1088470	Eze, Eberechi	sr:competitor:7	forward	ENG	10
sr:player:1108227	Munoz, Daniel	sr:competitor:7	defender	COL	12
sr:player:1132173	Lacroix, Maxence	sr:competitor:7	defender	FRA	5
sr:player:1322160	Doucoure, Cheick	sr:competitor:7	midfielder	MLI	28
sr:player:1512315	Richards, Chris	sr:competitor:7	defender	USA	26
sr:player:1984029	Mitchell, Tyrick	sr:competitor:7	defender	ENG	3
sr:player:2070773	Riad, Chadi	sr:competitor:7	defender	MAR	34
sr:player:2185650	Franca, Matheus	sr:competitor:7	midfielder	BRA	11
sr:player:2284355	Wharton, Adam	sr:competitor:7	midfielder	ENG	20
sr:player:2325471	Devenny, Justin	sr:competitor:7	midfielder	NIR	55
sr:player:2426383	Rodney, Kaden	sr:competitor:7	midfielder	ENG	42
sr:player:2652955	Marsh, Zach	sr:competitor:7	forward	ENG	63
sr:player:2769695	Umeh Chibueze, Franco	sr:competitor:7	forward	IRL	46
sr:player:2836701	Agbinone, Asher	sr:competitor:7	forward	ENG	64
sr:player:2836707	Kporha, Caleb	sr:competitor:7	defender	ENG	58
sr:player:84972	Garcia, Kike	sr:competitor:2885	forward	ESP	17
sr:player:267533	Sedlar, Aleksandar	sr:competitor:2885	defender	SRB	4
sr:player:353258	Guridi, Jon	sr:competitor:2885	midfielder	ESP	18
sr:player:355072	Villalibre, Asier	sr:competitor:2885	forward	ESP	9
sr:player:369004	Sivera, Antonio	sr:competitor:2885	goalkeeper	ESP	1
sr:player:547244	Martinez, Toni	sr:competitor:2885	forward	ESP	11
sr:player:566894	Stoichkov	sr:competitor:2885	midfielder	ESP	19
sr:player:591750	Jordan, Joan	sr:competitor:2885	midfielder	ESP	24
sr:player:918932	Conechny, Tomas	sr:competitor:2885	midfielder	ARG	10
sr:player:1047499	Blanco, Antonio	sr:competitor:2885	midfielder	ESP	8
sr:player:1108103	Benavidez, Carlos	sr:competitor:2885	midfielder	URY	23
sr:player:1264250	Guevara, Ander	sr:competitor:2885	midfielder	ESP	6
sr:player:129724	Ferreyra, Facundo	sr:competitor:7628	forward	ARG	14
sr:player:158625	Arias, Ramon	sr:competitor:7628	defender	URY	42
sr:player:310660	Miranda, Leonel	sr:competitor:7628	midfielder	ARG	33
sr:player:340525	Paz, Nehuen	sr:competitor:7628	defender	ARG	30
sr:player:603758	Contin, Leandro	sr:competitor:7628	forward	ARG	29
sr:player:847253	Protti, Ijiel	sr:competitor:7628	forward	ARG	9
sr:player:992911	Maroni, Gonzalo	sr:competitor:7628	midfielder	ARG	10
sr:player:1050911	Cardozo, Agustin	sr:competitor:7628	midfielder	ARG	5
sr:player:1103715	Sosa, Alan	sr:competitor:7628	goalkeeper	ARG	24
sr:player:1115605	Armoa, Blas	sr:competitor:7628	forward	PRY	18
sr:player:1121025	Ramirez, Eric	sr:competitor:7628	forward	VEN	7
sr:player:1887968	Sarmiento, Dario	sr:competitor:7628	forward	ARG	17
sr:player:1957737	Ortiz, Rolando	sr:competitor:7628	defender	PRY	\N
sr:player:1975007	Martin Garay	sr:competitor:7628	defender	ARG	8
sr:player:2008569	Florian Monzon	sr:competitor:7628	forward	ARG	23
sr:player:2026109	Zenobio, Felipe	sr:competitor:7628	goalkeeper	ARG	12
sr:player:2026135	Leizza, Brian	sr:competitor:7628	defender	ARG	22
sr:player:2073011	Banegas, Nahuel	sr:competitor:7628	defender	ARG	3
sr:player:2091215	Nardelli, Gian	sr:competitor:7628	defender	ARG	6
sr:player:2092801	Cavanagh, Tomas	sr:competitor:7628	defender	ARG	26
sr:player:2103186	Benitez, Romeo	sr:competitor:7628	midfielder	PRY	28
sr:player:2114238	Medina, Sebastian	sr:competitor:7628	midfielder	ARG	21
sr:player:2127132	Minissale, Pablo	sr:competitor:7628	defender	ARG	32
sr:player:2159326	Galvan, Tomas Ezequiel	sr:competitor:7628	midfielder	ARG	20
sr:player:2230496	Ortega, Martin	sr:competitor:7628	defender	ARG	4
sr:player:2299689	Forclaz, Ezequiel	sr:competitor:7628	midfielder	ARG	11
sr:player:2313845	Espindola, Matias	sr:competitor:7628	midfielder	ARG	19
sr:player:2335997	Scipioni, Lorenzo	sr:competitor:7628	midfielder	ARG	16
sr:player:2641421	Fernandez, Tomas	sr:competitor:7628	defender	ARG	38
sr:player:2652745	Viganoni, Camilo Francisco	sr:competitor:7628	forward	ARG	37
sr:player:2771639	Moreno, Valentin	sr:competitor:7628	defender	ARG	25
sr:player:2782219	Gonzalez, Santiago	sr:competitor:7628	midfielder	ARG	27
sr:player:2801589	Marchese, Angelo	sr:competitor:7628	defender	ARG	15
sr:player:2828289	Chavez, Tomas	sr:competitor:7628	midfielder	ARG	31
sr:player:2828291	Fuster, Luka	sr:competitor:7628	goalkeeper	ARG	1
sr:player:2828293	Pena, Pena	sr:competitor:7628	\N	\N	34
sr:player:2834775	Giletti, Santino	sr:competitor:7628	midfielder	ARG	\N
sr:player:2834793	Martinez, Tomas	sr:competitor:7628	forward	COL	\N
sr:player:2834803	Zabaleta, Dairo Pena	sr:competitor:7628	midfielder	COL	34
sr:player:82566	Cairney, Tom	sr:competitor:43	midfielder	SCO	10
sr:player:103335	Leno, Bernd	sr:competitor:43	goalkeeper	DEU	1
sr:player:190877	Tete, Kenny	sr:competitor:43	defender	NLD	2
sr:player:192442	Jimenez, Raul	sr:competitor:43	forward	MEX	7
sr:player:280823	Lukic, Sasa	sr:competitor:43	midfielder	SRB	20
sr:player:285949	Pereira, Andreas	sr:competitor:43	midfielder	BRA	18
sr:player:286165	Traore, Adama	sr:competitor:43	forward	ESP	11
sr:player:329417	Castagne, Timothy	sr:competitor:43	defender	BEL	21
sr:player:352770	Iwobi, Alex	sr:competitor:43	forward	NGA	17
sr:player:355528	Wilson, Harry	sr:competitor:43	forward	WAL	8
sr:player:361320	Diop, Issa	sr:competitor:43	defender	FRA	31
sr:player:362682	Andersen, Joachim	sr:competitor:43	defender	DNK	5
sr:player:365802	Reed, Harrison	sr:competitor:43	midfielder	ENG	6
sr:player:566232	Berge, Sander	sr:competitor:43	midfielder	NOR	16
sr:player:867054	Robinson, Antonee	sr:competitor:43	defender	USA	33
sr:player:880750	Benda, Steven	sr:competitor:43	goalkeeper	DEU	23
sr:player:936316	Nelson, Reiss	sr:competitor:43	forward	ENG	19
sr:player:937004	Smith Rowe, Emile	sr:competitor:43	midfielder	ENG	32
sr:player:978193	Sessegnon, Ryan	sr:competitor:43	midfielder	ENG	30
sr:player:1055149	Bassey, Calvin	sr:competitor:43	defender	NGA	3
sr:player:1096424	Cuenca, Jorge	sr:competitor:43	midfielder	ESP	15
sr:player:1233356	Vinicius, Carlos	sr:competitor:43	forward	BRA	12
sr:player:1557191	Muniz, Rodrigo	sr:competitor:43	forward	BRA	9
sr:player:1973247	King, Joshua	sr:competitor:43	defender	ENG	24
sr:player:2426365	Godo, Martial	sr:competitor:43	midfielder	ENG	47
sr:player:2535377	McFarlane, Callum	sr:competitor:43	forward	ENG	34
sr:player:94527	Dmitrovic, Marko	sr:competitor:2845	goalkeeper	SRB	13
sr:player:94539	Brasanac, Darko	sr:competitor:2845	midfielder	SRB	14
sr:player:98440	Nastasic, Matija	sr:competitor:2845	defender	SRB	22
sr:player:149731	Haller, Sebastian	sr:competitor:2845	forward	CIV	18
sr:player:350170	El Haddadi, Munir	sr:competitor:2845	forward	MAR	23
sr:player:352376	Tapia, Renato	sr:competitor:2845	midfielder	PER	5
sr:player:377234	Gonzalez, Sergio	sr:competitor:2845	defender	ESP	6
sr:player:547246	Soriano, Juan	sr:competitor:2845	goalkeeper	ESP	1
sr:player:592098	Saenz, Jorge	sr:competitor:2845	defender	ESP	3
sr:player:769517	Oscar	sr:competitor:2845	midfielder	ESP	7
sr:player:918906	Chicco, Julian	sr:competitor:2845	midfielder	ARG	24
sr:player:937822	Franquesa, Enric	sr:competitor:2845	forward	ESP	15
sr:player:1003759	Rosier, Valentin	sr:competitor:2845	defender	FRA	12
sr:player:1047493	Hernandez, Javi	sr:competitor:2845	midfielder	ESP	20
sr:player:1100235	Neyou, Yvan	sr:competitor:2845	midfielder	CMR	17
sr:player:1108877	Raba, Daniel	sr:competitor:2845	forward	ESP	10
sr:player:1104381	Pourtau, Jeronimo	sr:competitor:42338	goalkeeper	ARG	1
sr:player:1127411	Mendez, Emiliano	sr:competitor:42338	midfielder	ARG	52
sr:player:1143606	Quiroga, Sergio	sr:competitor:42338	forward	ARG	10
sr:player:1145540	Arismendi, Jair	sr:competitor:42338	midfielder	ARG	26
sr:player:1434727	Burgoa, Valentin	sr:competitor:42338	midfielder	ARG	22
sr:player:1834300	Lopez, Elias	sr:competitor:42338	defender	ARG	29
sr:player:1835458	Paredes, Franco Ezequiel	sr:competitor:42338	defender	ARG	32
sr:player:2093972	Guasone, Juan	sr:competitor:42338	defender	ARG	16
sr:player:2113358	Calcaterra, Diego	sr:competitor:42338	defender	ARG	15
sr:player:2130218	Gho, Joaquin	sr:competitor:42338	midfielder	ARG	28
sr:player:2132342	Garcia, Manuel	sr:competitor:42338	midfielder	ARG	5
sr:player:2153326	Paradela, Federico	sr:competitor:42338	midfielder	ARG	99
sr:player:2186558	Naya, Ezequiel	sr:competitor:42338	forward	ARG	9
sr:player:2327351	Diaz, Gabriel	sr:competitor:42338	defender	ARG	33
sr:player:2368277	Monaco, Manuel	sr:competitor:42338	midfielder	ARG	11
sr:player:2376007	Marsengo, Andres	sr:competitor:42338	goalkeeper	ARG	35
sr:player:2548609	Morales, Santiago	sr:competitor:42338	defender	ARG	36
sr:player:2557985	Azcurra, Diego	sr:competitor:42338	forward	ARG	23
sr:player:2644987	Ayala, Thyago	sr:competitor:42338	goalkeeper	ARG	12
sr:player:2657419	Ferreira, Patricio	sr:competitor:42338	midfielder	ARG	37
sr:player:2765651	Vallejos, Jeremias	sr:competitor:42338	midfielder	ARG	17
sr:player:2768081	Molina, Agustin	sr:competitor:42338	midfielder	ARG	24
sr:player:2785977	Guiacobini, Tomas	sr:competitor:42338	midfielder	ARG	31
sr:player:2800809	Seyral, Agustin	sr:competitor:42338	defender	ARG	99
sr:player:2810523	Rosales, Matias	sr:competitor:42338	forward	ARG	38
sr:player:2810525	Godoy, Joel	sr:competitor:42338	defender	ARG	39
sr:player:2810527	Marquez, Brandon	sr:competitor:42338	\N	ARG	40
sr:player:2810529	Calderon, Franco	sr:competitor:42338	forward	ARG	41
sr:player:2887023	Massi, Valentino	sr:competitor:42338	midfielder	ARG	43
sr:player:15479	Fabianski, Lukasz	sr:competitor:37	goalkeeper	POL	1
sr:player:43443	Cresswell, Aaron	sr:competitor:37	defender	ENG	3
sr:player:47772	Antonio, Michail	sr:competitor:37	forward	JAM	9
sr:player:96531	Areola, Alphonse	sr:competitor:37	goalkeeper	FRA	23
sr:player:130181	Ings, Danny	sr:competitor:37	forward	ENG	18
sr:player:132645	Fullkrug, Niclas	sr:competitor:37	forward	DEU	11
sr:player:138024	Coufal, Vladimir	sr:competitor:37	defender	CZE	5
sr:player:155997	Emerson	sr:competitor:37	defender	ITA	33
sr:player:187861	Foderingham, Wes	sr:competitor:37	goalkeeper	ENG	21
sr:player:359840	Soucek, Tomas	sr:competitor:37	midfielder	CZE	28
sr:player:552884	Bowen, Jarrod	sr:competitor:37	forward	ENG	20
sr:player:609752	Rodriguez, Guido	sr:competitor:37	midfielder	ARG	24
sr:player:936000	Soler, Carlos	sr:competitor:37	midfielder	ESP	4
sr:player:950080	Mavropanos, Konstantinos	sr:competitor:37	defender	GRC	15
sr:player:991199	Paqueta, Lucas	sr:competitor:37	midfielder	BRA	10
sr:player:1012359	Irving, Andy	sr:competitor:37	midfielder	SCO	39
sr:player:1020079	Alvarez, Edson	sr:competitor:37	midfielder	MEX	19
sr:player:1086144	Wan-Bissaka, Aaron	sr:competitor:37	defender	ENG	29
sr:player:1263492	Kilman, Max	sr:competitor:37	defender	ENG	26
sr:player:1298504	Summerville, Crysencio	sr:competitor:37	forward	NLD	7
sr:player:1321798	Kudus, Mohammed	sr:competitor:37	midfielder	GHA	14
sr:player:1561172	Todibo, Jean-Clair	sr:competitor:37	defender	FRA	25
sr:player:2439761	Casey, Kaelan	sr:competitor:37	defender	ENG	42
sr:player:2464763	Scarles, Oliver	sr:competitor:37	midfielder	ENG	57
sr:player:2582799	Guilherme, Luis	sr:competitor:37	midfielder	BRA	17
sr:player:128637	Nyom, Allan	sr:competitor:2859	defender	CMR	12
sr:player:307702	Djene	sr:competitor:2859	defender	TGO	2
sr:player:311462	Angileri, Fabrizio	sr:competitor:2859	defender	ARG	3
sr:player:350560	Rico, Diego	sr:competitor:2859	defender	ESP	16
sr:player:355064	Alena, Carles	sr:competitor:2859	midfielder	ESP	11
sr:player:385888	Arambarri, Mauro	sr:competitor:2859	midfielder	URY	8
sr:player:576276	Duarte, Domingos	sr:competitor:2859	defender	PRT	22
sr:player:604258	Soria, David	sr:competitor:2859	goalkeeper	ESP	13
sr:player:604954	Mayoral, Borja	sr:competitor:2859	forward	ESP	9
sr:player:769525	Perez, Carles	sr:competitor:2859	forward	ESP	17
sr:player:795808	Alderete, Omar	sr:competitor:2859	defender	PRY	15
sr:player:891594	Milla, Luis	sr:competitor:2859	midfielder	ESP	5
sr:player:901620	Letacek, Jiri	sr:competitor:2859	goalkeeper	CZE	1
sr:player:1047687	Berrocal, Juan	sr:competitor:2859	defender	ESP	4
sr:player:1587488	Iglesias, Juan	sr:competitor:2859	defender	ESP	21
sr:player:1707489	Sola, Alex	sr:competitor:2859	defender	ESP	7
sr:player:1939270	Gonzalez, Peter	sr:competitor:2859	midfielder	DOM	19
sr:player:1941494	Yildirim, Bertug	sr:competitor:2859	forward	TUR	10
sr:player:2070965	Arguelles, David	sr:competitor:2859	defender	ESP	34
sr:player:2104588	Finn, John Joe Patrick	sr:competitor:2859	midfielder	IRL	31
sr:player:2266525	Rodriguez, Alvaro	sr:competitor:2859	forward	URY	18
sr:player:2272101	Aberdin, Nabil	sr:competitor:2859	defender	MAR	27
sr:player:2278169	Keita, Abdoulaye	sr:competitor:2859	forward	ESP	36
sr:player:2297039	Santiago, Yellu	sr:competitor:2859	midfielder	ESP	20
sr:player:2395323	Da Costa, Coba Gomes	sr:competitor:2859	forward	ESP	29
sr:player:2419929	Rivera, Gorka	sr:competitor:2859	defender	ESP	30
sr:player:143040	Endo, Wataru	sr:competitor:44	midfielder	JPN	3
sr:player:151545	Van Dijk, Virgil	sr:competitor:44	defender	NLD	4
sr:player:159665	Salah, Mohamed	sr:competitor:44	forward	EGY	11
sr:player:243609	Alisson	sr:competitor:44	goalkeeper	BRA	1
sr:player:262911	Robertson, Andy	sr:competitor:44	defender	SCO	26
sr:player:318927	Gomez, Joe	sr:competitor:44	defender	ENG	2
sr:player:605434	Tsimikas, Kostas	sr:competitor:44	defender	GRC	21
sr:player:606164	Jota, Diogo	sr:competitor:44	forward	PRT	20
sr:player:755360	Kelleher, Caoimhin	sr:competitor:44	goalkeeper	IRL	62
sr:player:779556	Alexander-Arnold, Trent	sr:competitor:44	defender	ENG	66
sr:player:936572	Konate, Ibrahima	sr:competitor:44	defender	FRA	5
sr:player:1012117	Chiesa, Federico	sr:competitor:44	midfielder	ITA	14
sr:player:1058437	Gakpo, Cody	sr:competitor:44	forward	NLD	18
sr:player:1064588	Szoboszlai, Dominik	sr:competitor:44	midfielder	HUN	8
sr:player:1134923	Diaz, Luis	sr:competitor:44	forward	COL	7
sr:player:1245194	Mac Allister, Alexis	sr:competitor:44	midfielder	ARG	10
sr:player:1298242	Jaros, Vitezslav	sr:competitor:44	goalkeeper	CZE	56
sr:player:1298510	Jones, Curtis	sr:competitor:44	midfielder	ENG	17
sr:player:1319220	Gravenberch, Ryan	sr:competitor:44	midfielder	NLD	38
sr:player:1406549	Nunez, Darwin	sr:competitor:44	forward	URY	9
sr:player:1604594	Elliott, Harvey	sr:competitor:44	midfielder	ENG	19
sr:player:1939964	Morton, Tyler	sr:competitor:44	midfielder	ENG	80
sr:player:1939984	Davies, Harvey	sr:competitor:44	goalkeeper	ENG	95
sr:player:1939988	Quansah, Jarell	sr:competitor:44	defender	ENG	78
sr:player:1939996	Bradley, Conor	sr:competitor:44	defender	NIR	84
sr:player:2439493	Young, Ranel	sr:competitor:44	forward	ENG	82
sr:player:2714270	Nyoni, Treymaurice	sr:competitor:44	midfielder	ENG	98
sr:player:108515	Morsy, Sam	sr:competitor:32	midfielder	EGY	5
sr:player:197982	Townsend, Conor	sr:competitor:32	defender	ENG	22
sr:player:198038	Walton, Christian	sr:competitor:32	goalkeeper	ENG	28
sr:player:204300	Luongo, Massimo	sr:competitor:32	midfielder	AUS	25
sr:player:305302	Burns, Wes	sr:competitor:32	forward	WAL	7
sr:player:354782	Szmodics, Sammie	sr:competitor:32	midfielder	IRL	23
sr:player:358084	Burgess, Cameron	sr:competitor:32	defender	AUS	15
sr:player:371364	Donacien, Janoi	sr:competitor:32	defender	LCA	44
sr:player:758396	Broadhead, Nathan	sr:competitor:32	forward	WAL	33
sr:player:784625	Chaplin, Conor	sr:competitor:32	forward	ENG	10
sr:player:790679	Phillips, Kalvin	sr:competitor:32	midfielder	ENG	8
sr:player:889444	Ogbene, Chiedozie	sr:competitor:32	forward	IRL	21
sr:player:908340	Tuanzebe, Axel	sr:competitor:32	defender	ENG	40
sr:player:934550	O'Shea, Dara	sr:competitor:32	defender	IRL	26
sr:player:990237	Hirst, George	sr:competitor:32	forward	ENG	27
sr:player:1047063	Muric, Arijanet	sr:competitor:32	goalkeeper	KOS	1
sr:player:1064938	Taylor, Jack	sr:competitor:32	midfielder	IRL	14
sr:player:1069630	Cajuste, Jens-Lys	sr:competitor:32	midfielder	SWE	12
sr:player:1253756	Woolfenden, Luke	sr:competitor:32	defender	ENG	6
sr:player:1372516	Johnson, Ben	sr:competitor:32	defender	ENG	18
sr:player:1391359	Clarke, Jack	sr:competitor:32	forward	ENG	47
sr:player:1640266	Davis, Leif	sr:competitor:32	defender	ENG	3
sr:player:1724684	Slicker, Cieran	sr:competitor:32	goalkeeper	SCO	13
sr:player:1836942	Greaves, Jacob	sr:competitor:32	defender	ENG	24
sr:player:1886706	Delap, Liam	sr:competitor:32	forward	ENG	19
sr:player:2085475	Clarke, Harry	sr:competitor:32	defender	ENG	2
sr:player:2253611	Al-Hamadi, Ali	sr:competitor:32	forward	IRQ	16
sr:player:2284735	Hutchinson, Omari	sr:competitor:32	midfielder	ENG	20
sr:player:96373	Campana, Jose	sr:competitor:6577	midfielder	ESP	8
sr:player:123865	Cillessen, Jasper	sr:competitor:6577	goalkeeper	NLD	1
sr:player:188407	Ramirez, Sandro	sr:competitor:6577	forward	ESP	19
sr:player:273227	Munoz, Alex	sr:competitor:6577	defender	ESP	23
sr:player:328145	Januzaj, Adnan	sr:competitor:6577	midfielder	BEL	24
sr:player:351140	Mata, Jaime	sr:competitor:6577	forward	ESP	17
sr:player:353154	Munoz, Javi	sr:competitor:6577	midfielder	ESP	5
sr:player:358108	McKenna, Scott	sr:competitor:6577	defender	SCO	15
sr:player:367228	McBurnie, Oliver	sr:competitor:6577	forward	SCO	16
sr:player:377206	Sinkgraven, Daley	sr:competitor:6577	defender	NLD	22
sr:player:935104	Horkas, Dinko	sr:competitor:6577	goalkeeper	HRV	13
sr:player:995797	Rozada, Viti	sr:competitor:6577	midfielder	ESP	18
sr:player:1004241	Cardona, Marc	sr:competitor:6577	forward	ESP	9
sr:player:1015637	Ramirez, Benito	sr:competitor:6577	midfielder	ESP	11
sr:player:1263516	Gonzalez, Fabio	sr:competitor:6577	midfielder	ESP	6
sr:player:1302644	Silva, Fabio	sr:competitor:6577	forward	PRT	37
sr:player:1357928	Valles, Alvaro	sr:competitor:6577	goalkeeper	ESP	25
sr:player:1378623	Pejino	sr:competitor:6577	forward	ESP	7
sr:player:1380541	Fuster, Manuel	sr:competitor:6577	midfielder	ESP	14
sr:player:1383775	Suarez, Alex	sr:competitor:6577	defender	ESP	4
sr:player:1473842	Loiodice, Enzo	sr:competitor:6577	midfielder	FRA	12
sr:player:1628342	Park, Marvin	sr:competitor:6577	midfielder	ESP	2
sr:player:1644296	Marmol, Mika	sr:competitor:6577	defender	ESP	3
sr:player:1750405	Rodriguez, Kirian	sr:competitor:6577	midfielder	ESP	20
sr:player:2067865	Moleiro, Alberto	sr:competitor:6577	forward	ESP	10
sr:player:2138640	Essugo, Dario	sr:competitor:6577	midfielder	PRT	29
sr:player:2270121	Gil Calero, Ivan	sr:competitor:6577	midfielder	ESP	21
sr:player:139310	Boly, Willy	sr:competitor:14	defender	CIV	30
sr:player:161717	Ward Prowse, James	sr:competitor:14	midfielder	ENG	18
sr:player:284421	Aina, Ola	sr:competitor:14	defender	NGA	34
sr:player:294593	Moreno, Alex	sr:competitor:14	forward	ESP	19
sr:player:358218	Toffolo, Harry	sr:competitor:14	defender	ENG	15
sr:player:359664	Awoniyi, Taiwo	sr:competitor:14	forward	NGA	9
sr:player:976055	Milenkovic, Nikola	sr:competitor:14	defender	SRB	31
sr:player:1010017	Dennis, Emmanuel	sr:competitor:14	forward	NGA	25
sr:player:1014789	Yates, Ryan	sr:competitor:14	midfielder	ENG	22
sr:player:1017603	Sangare, Ibrahim	sr:competitor:14	midfielder	CIV	6
sr:player:1089760	Gibbs-White, Morgan	sr:competitor:14	midfielder	ENG	10
sr:player:1089772	Hudson-Odoi, Callum	sr:competitor:14	forward	ENG	14
sr:player:1103661	Dominguez, Nicolas	sr:competitor:14	midfielder	ARG	16
sr:player:1298482	Williams, Neco	sr:competitor:14	defender	WAL	7
sr:player:1635776	Anderson, Elliot	sr:competitor:14	midfielder	ENG	8
sr:player:1692807	Miguel, Carlos	sr:competitor:14	goalkeeper	BRA	33
sr:player:1718666	Elanga, Anthony	sr:competitor:14	forward	SWE	21
sr:player:1737595	Omobamidele, Andrew	sr:competitor:14	defender	IRL	12
sr:player:1852246	Oliveira, Danilo	sr:competitor:14	midfielder	BRA	28
sr:player:1888546	Morato	sr:competitor:14	defender	PRT	4
sr:player:2000059	Sosa, Ramon	sr:competitor:14	forward	PRY	24
sr:player:2068145	Silva, Jota	sr:competitor:14	forward	PRT	20
sr:player:2361593	Murillo	sr:competitor:14	midfielder	BRA	5
sr:player:2426393	Abbott, Zach	sr:competitor:14	defender	ENG	44
sr:player:2610745	Da Silva Moreira, Eric	sr:competitor:14	defender	DEU	17
sr:player:2849367	Perry, Ben	sr:competitor:14	midfielder	ENG	59
sr:player:50027	Dawson, Craig	sr:competitor:3	defender	ENG	15
sr:player:98427	Johnstone, Sam	sr:competitor:3	goalkeeper	ENG	31
sr:player:101367	Bentley, Daniel	sr:competitor:3	goalkeeper	ENG	25
sr:player:138573	Sarabia, Pablo	sr:competitor:3	forward	ESP	21
sr:player:143047	Doherty, Matt	sr:competitor:3	defender	IRL	2
sr:player:252669	Sa, Jose	sr:competitor:3	goalkeeper	PRT	1
sr:player:252821	Semedo, Nelson	sr:competitor:3	defender	PRT	22
sr:player:280979	Guedes, Goncalo	sr:competitor:3	midfielder	PRT	29
sr:player:307284	Lemina, Mario	sr:competitor:3	midfielder	GAB	5
sr:player:603922	King, Tom	sr:competitor:3	goalkeeper	WAL	40
sr:player:754008	Hee-chan, Hwang	sr:competitor:3	forward	KOR	11
sr:player:1011881	Bellegarde, Jean-Ricner	sr:competitor:3	midfielder	FRA	27
sr:player:1016089	Bueno, Santiago	sr:competitor:3	defender	URY	4
sr:player:1065792	Larsen, Jorgen Strand	sr:competitor:3	forward	NOR	9
sr:player:1100395	Kalajdzic, Sasa	sr:competitor:3	forward	AUT	18
sr:player:1146986	Cunha, Matheus	sr:competitor:3	forward	BRA	10
sr:player:1299448	Doyle, Tommy	sr:competitor:3	midfielder	ENG	20
sr:player:1432949	Ait-Nouri, Rayan	sr:competitor:3	defender	DZA	3
sr:player:1687671	Gomes, Toti	sr:competitor:3	defender	PRT	24
sr:player:1737553	Traore, Boubacar	sr:competitor:3	midfielder	MLI	6
sr:player:1769162	Mosquera, Yerson	sr:competitor:3	defender	COL	14
sr:player:1831216	Cundle, Luke	sr:competitor:3	midfielder	ENG	34
sr:player:1987419	Gomes, Rodrigo	sr:competitor:3	forward	PRT	19
sr:player:2014161	Gomes, Joao	sr:competitor:3	midfielder	BRA	8
sr:player:2057387	Andre	sr:competitor:3	midfielder	BRA	7
sr:player:2194952	Pond, Alfie	sr:competitor:3	defender	ENG	46
sr:player:2269359	Borges, Carlos	sr:competitor:3	forward	PRT	26
sr:player:2434771	Gonzalez, Enso	sr:competitor:3	forward	PRY	\N
sr:player:2453609	Meupiyou, Bastien	sr:competitor:3	defender	FRA	\N
sr:player:2611297	Chiwome, Leon	sr:competitor:3	forward	ENG	84
sr:player:2714234	Lima, Pedro	sr:competitor:3	defender	BRA	37
sr:player:2745535	Sutherland, Ethan	sr:competitor:3	defender	SCO	\N
sr:player:2835169	Lochhead, Sebastian	sr:competitor:3	midfielder	SCO	\N
sr:player:2849361	Rawlings, Luke	sr:competitor:3	midfielder	ENG	62
sr:player:81992	Cabrera, Leandro	sr:competitor:2814	defender	URY	6
sr:player:125625	Gomez, Sergi	sr:competitor:2814	defender	ESP	3
sr:player:144501	Pacheco, Fernando	sr:competitor:2814	goalkeeper	ESP	13
sr:player:175185	Milla, Pere	sr:competitor:2814	midfielder	ESP	11
sr:player:258815	Sanchez, Salvi	sr:competitor:2814	midfielder	ESP	19
sr:player:351500	Olivan, Brian	sr:competitor:2814	defender	ESP	14
sr:player:605552	Cardona, Irvin	sr:competitor:2814	forward	FRA	24
sr:player:756294	Kral, Alex	sr:competitor:2814	midfielder	CZE	20
sr:player:772033	Tejero, Alvaro	sr:competitor:2814	defender	ESP	12
sr:player:934274	Kumbulla, Marash	sr:competitor:2814	defender	ALB	4
sr:player:935052	Lozano, Pol	sr:competitor:2814	midfielder	ESP	10
sr:player:1067750	Calero, Fernando	sr:competitor:2814	defender	ESP	5
sr:player:1120845	Exposito, Edu	sr:competitor:2814	midfielder	ESP	8
sr:player:1244528	Puado, Javi	sr:competitor:2814	midfielder	ESP	7
sr:player:1379145	Aguado, Alvaro	sr:competitor:2814	midfielder	ESP	18
sr:player:1428613	Garcia, Joan	sr:competitor:2814	goalkeeper	ESP	1
sr:player:1601350	Unuvar, Naci	sr:competitor:2814	midfielder	NLD	37
sr:player:1747903	Gragera, Jose	sr:competitor:2814	midfielder	ESP	15
sr:player:1861082	Cheddira, Walid	sr:competitor:2814	forward	MAR	16
sr:player:2067937	Fortuno, Angel	sr:competitor:2814	goalkeeper	ESP	33
sr:player:2067939	Carreras, Jofre	sr:competitor:2814	forward	ESP	17
sr:player:2100932	El Hilali, Omar	sr:competitor:2814	defender	MAR	23
sr:player:257993	Bettinelli, Marcus	sr:competitor:38	goalkeeper	ENG	13
sr:player:352668	Adarabioyo, Tosin	sr:competitor:38	defender	ENG	4
sr:player:754594	Chilwell, Ben	sr:competitor:38	defender	ENG	21
sr:player:769333	Nkunku, Christopher	sr:competitor:38	forward	FRA	18
sr:player:769505	Cucurella, Marc	sr:competitor:38	defender	ESP	3
sr:player:940716	Disasi, Axel	sr:competitor:38	defender	FRA	2
sr:player:1047147	Sancho, Jadon	sr:competitor:38	forward	ENG	19
sr:player:1050565	Felix, Joao	sr:competitor:38	forward	PRT	14
sr:player:1055173	Dewsbury-Hall, Kiernan	sr:competitor:38	midfielder	ENG	22
sr:player:1115761	Neto, Pedro	sr:competitor:38	forward	PRT	7
sr:player:1140070	James, Reece	sr:competitor:38	defender	ENG	24
sr:player:1299814	Badiashile, Benoit	sr:competitor:38	defender	FRA	5
sr:player:1299850	Mudryk, Mykhailo	sr:competitor:38	forward	UKR	10
sr:player:1300742	Madueke, Noni	sr:competitor:38	forward	ENG	11
sr:player:1402953	Fofana, Wesley	sr:competitor:38	defender	FRA	29
sr:player:1500083	Sanchez, Robert	sr:competitor:38	goalkeeper	ESP	1
sr:player:1630632	Jorgensen, Filip	sr:competitor:38	goalkeeper	DNK	12
sr:player:1638334	Bergstrom, Lucas	sr:competitor:38	goalkeeper	FIN	47
sr:player:1696477	Fernandez, Enzo	sr:competitor:38	midfielder	ARG	8
sr:player:1737609	Palmer, Cole	sr:competitor:38	midfielder	ENG	20
sr:player:1796106	Caicedo, Moises	sr:competitor:38	midfielder	ECU	25
sr:player:1947798	Colwill, Levi	sr:competitor:38	defender	ENG	6
sr:player:1948364	Gusto, Malo	sr:competitor:38	defender	FRA	27
sr:player:2058863	Casadei, Cesare	sr:competitor:38	midfielder	ITA	31
sr:player:2084331	Jackson, Nicolas	sr:competitor:38	forward	SEN	15
sr:player:2130086	Chukwuemeka, Carney	sr:competitor:38	midfielder	ENG	17
sr:player:2200606	Deivid Washington	sr:competitor:38	forward	BRA	36
sr:player:2221794	Lavia, Romeo	sr:competitor:38	midfielder	BEL	45
sr:player:2253863	Rak-Sakyi, Sam	sr:competitor:38	midfielder	ENG	51
sr:player:2262627	Kellyman, Omari	sr:competitor:38	forward	ENG	37
sr:player:2265643	Veiga, Renato	sr:competitor:38	defender	PRT	40
sr:player:2437829	Dyer, Kiano	sr:competitor:38	midfielder	ENG	33
sr:player:2437831	Merrick, Max	sr:competitor:38	goalkeeper	ENG	50
sr:player:2437845	George, Tyrique	sr:competitor:38	midfielder	ENG	32
sr:player:2463239	Guiu, Marc	sr:competitor:38	forward	ESP	38
sr:player:2714264	Mheuka, Shumaira	sr:competitor:38	forward	ENG	76
sr:player:2844495	Acheampong, Joshua	sr:competitor:38	defender	ENG	34
sr:player:50539	Adrian	sr:competitor:2816	goalkeeper	ESP	13
sr:player:67769	Rodriguez, Ricardo	sr:competitor:2816	defender	CHE	12
sr:player:96369	Juanmi	sr:competitor:2816	forward	ESP	7
sr:player:99519	Bartra, Marc	sr:competitor:2816	defender	ESP	5
sr:player:103417	Isco	sr:competitor:2816	midfielder	ESP	22
sr:player:111803	Sabaly, Youssouf	sr:competitor:2816	defender	SEN	23
sr:player:115665	Bakambu, Cedric	sr:competitor:2816	forward	COD	11
sr:player:137978	Carvalho, William	sr:competitor:2816	midfielder	PRT	14
sr:player:188365	Bellerin, Hector	sr:competitor:2816	defender	ESP	2
sr:player:253809	Silva, Rui	sr:competitor:2816	goalkeeper	PRT	1
sr:player:305278	Llorente, Diego	sr:competitor:2816	defender	ESP	3
sr:player:545974	Perraud, Romain	sr:competitor:2816	defender	FRA	15
sr:player:802416	Avila, Chimy	sr:competitor:2816	forward	ARG	9
sr:player:858082	Lo Celso, Giovani	sr:competitor:2816	midfielder	ARG	20
sr:player:912932	Fornals, Pablo	sr:competitor:2816	midfielder	ESP	18
sr:player:1020043	Roca, Marc	sr:competitor:2816	midfielder	ESP	21
sr:player:1137497	Ruibal, Aitor	sr:competitor:2816	forward	ESP	24
sr:player:1426797	Vieites, Fran	sr:competitor:2816	goalkeeper	ESP	25
sr:player:1660625	Cardoso, Johnny	sr:competitor:2816	midfielder	USA	4
sr:player:1859506	Losada, Iker	sr:competitor:2816	forward	ESP	19
sr:player:2014155	Natan	sr:competitor:2816	defender	BRA	6
sr:player:2054705	Ezzalzouli, Abde	sr:competitor:2816	forward	MAR	10
sr:player:2059789	Alcazar, Lucas	sr:competitor:2816	defender	ESP	43
sr:player:2270821	Altimira, Sergi	sr:competitor:2816	midfielder	ESP	16
sr:player:2332863	Roque, Vitor	sr:competitor:2816	forward	BRA	8
sr:player:2355049	Perez, Dani	sr:competitor:2816	midfielder	ESP	37
sr:player:2464929	Garcia Fernandez, German	sr:competitor:2816	goalkeeper	ESP	30
sr:player:2530597	Mendy, Nobel	sr:competitor:2816	defender	FRA	32
sr:player:2639267	Diao, Assane	sr:competitor:2816	forward	ESP	38
sr:player:2687259	Busto, Pablo	sr:competitor:2816	defender	ESP	42
sr:player:2827857	Rodriguez Caraballo, Jesus	sr:competitor:2816	forward	ESP	36
sr:player:2836771	Flores, Mateo	sr:competitor:2816	midfielder	ESP	46
sr:player:2842949	Guirao, Carlos	sr:competitor:2816	midfielder	ESP	34
sr:player:2847255	Gonzalez, Manu	sr:competitor:2816	goalkeeper	ESP	41
sr:player:2891611	Ortiz, Angel	sr:competitor:2816	midfielder	ESP	40
sr:player:2622	Pasveer, Remko	sr:competitor:2953	goalkeeper	NLD	22
sr:player:42694	Henderson, Jordan	sr:competitor:2953	midfielder	ENG	6
sr:player:97410	Klaassen, Davy	sr:competitor:2953	midfielder	NLD	18
sr:player:100386	Berghuis, Steven	sr:competitor:2953	forward	NLD	23
sr:player:139273	Rugani, Daniele	sr:competitor:2953	defender	ITA	24
sr:player:190867	Akpom, Chuba	sr:competitor:2953	forward	ENG	10
sr:player:190883	Van den Boomen, Branco	sr:competitor:2953	midfielder	NLD	21
sr:player:218160	Traore, Bertrand	sr:competitor:2953	forward	BFA	20
sr:player:252215	Weghorst, Wout	sr:competitor:2953	forward	NLD	25
sr:player:716	Carson, Scott	sr:competitor:17	goalkeeper	ENG	33
sr:player:44614	Walker, Kyle	sr:competitor:17	defender	ENG	2
sr:player:45853	Gundogan, Ilkay	sr:competitor:17	midfielder	DEU	19
sr:player:70996	De Bruyne, Kevin	sr:competitor:17	midfielder	BEL	17
sr:player:125274	Ortega, Stefan	sr:competitor:17	goalkeeper	DEU	18
sr:player:136710	Kovacic, Mateo	sr:competitor:17	midfielder	HRV	8
sr:player:149663	Ake, Nathan	sr:competitor:17	defender	NLD	6
sr:player:152077	Stones, John	sr:competitor:17	defender	ENG	5
sr:player:189061	Grealish, Jack	sr:competitor:17	midfielder	ENG	10
sr:player:254491	Ederson	sr:competitor:17	goalkeeper	BRA	31
sr:player:318941	Dias, Ruben	sr:competitor:17	defender	PRT	3
sr:player:331209	Silva, Bernardo	sr:competitor:17	midfielder	PRT	20
sr:player:383560	Akanji, Manuel	sr:competitor:17	defender	CHE	25
sr:player:844073	Rodri	sr:competitor:17	midfielder	ESP	16
sr:player:991181	Haaland, Erling	sr:competitor:17	forward	NOR	9
sr:player:1047129	Foden, Phil	sr:competitor:17	midfielder	ENG	47
sr:player:1297614	Doku, Jeremy	sr:competitor:17	forward	BEL	11
sr:player:1560920	Nunes, Matheus	sr:competitor:17	midfielder	PRT	27
sr:player:1643606	Knight, Ben	sr:competitor:17	midfielder	ENG	96
sr:player:1645860	Gvardiol, Josko	sr:competitor:17	defender	HRV	24
sr:player:1956474	Bobb, Oscar	sr:competitor:17	midfielder	NOR	52
sr:player:2057939	Savinho	sr:competitor:17	midfielder	BRA	26
sr:player:2221700	McAtee, James	sr:competitor:17	midfielder	ENG	87
sr:player:2223424	Wilson-Esbrand, Josh	sr:competitor:17	defender	ENG	97
sr:player:2246747	Grant, True	sr:competitor:17	goalkeeper	ENG	88
sr:player:2246775	Lewis, Rico	sr:competitor:17	defender	ENG	82
sr:player:2265485	O'Reilly, Nico	sr:competitor:17	midfielder	ENG	75
sr:player:2269337	Alleyne, Max	sr:competitor:17	defender	ENG	68
sr:player:2269361	Ndala, Joel	sr:competitor:17	forward	ENG	73
sr:player:2437719	Samuel, Lakyle	sr:competitor:17	defender	ENG	90
sr:player:2437723	Wright, Jacob	sr:competitor:17	midfielder	ENG	56
sr:player:2437725	Oboavwoduo, Justin	sr:competitor:17	forward	ENG	\N
sr:player:2469167	Heskey, Jaden	sr:competitor:17	forward	ENG	95
sr:player:2488527	Alfa-Ruprecht, Farid	sr:competitor:17	midfielder	DEU	98
sr:player:2568517	Simpson-Pusey, Jahmai	sr:competitor:17	defender	ENG	66
sr:player:2714276	Mfuni, Stephen	sr:competitor:17	defender	ENG	91
sr:player:2865447	Braithwaite, Kaden	sr:competitor:17	defender	ENG	61
sr:player:3041	Albiol, Raul	sr:competitor:2819	defender	ESP	3
sr:player:39182	Parejo, Dani	sr:competitor:2819	midfielder	ESP	10
sr:player:53739	Femenia, Kiko	sr:competitor:2819	defender	ESP	17
sr:player:96368	Bernat, Juan	sr:competitor:2819	defender	ESP	12
sr:player:138383	Suarez, Denis	sr:competitor:2819	midfielder	ESP	6
sr:player:146866	Moreno, Gerard	sr:competitor:2819	forward	ESP	7
sr:player:345195	Perez, Ayoze	sr:competitor:2819	forward	ESP	22
sr:player:593526	Pepe, Nicolas	sr:competitor:2819	forward	CIV	19
sr:player:606346	Bailly, Eric	sr:competitor:2819	defender	CIV	4
sr:player:844071	Pedraza, Alfonso	sr:competitor:2819	forward	ESP	24
sr:player:935116	Iker	sr:competitor:2819	goalkeeper	AND	31
sr:player:1008335	Comesana, Santi	sr:competitor:2819	midfielder	ESP	14
sr:player:1057857	Conde, Diego	sr:competitor:2819	goalkeeper	ESP	13
sr:player:1104383	Foyth, Juan	sr:competitor:2819	defender	ARG	8
sr:player:1132445	Gueye, Pape	sr:competitor:2819	midfielder	SEN	18
sr:player:1235114	Junior, Luiz	sr:competitor:2819	goalkeeper	PRT	1
sr:player:1340356	Costa, Logan	sr:competitor:2819	defender	CPV	2
sr:player:1340446	Baena, Alex	sr:competitor:2819	midfielder	ESP	16
sr:player:1609374	Cardona, Sergi	sr:competitor:2819	defender	ESP	23
sr:player:1634220	Pino, Yeremy	sr:competitor:2819	forward	ESP	21
sr:player:1948526	Sola, Arnau	sr:competitor:2819	defender	ESP	27
sr:player:2092681	Terrats, Ramon	sr:competitor:2819	midfielder	ESP	20
sr:player:2203482	Barry, Thierno	sr:competitor:2819	forward	FRA	15
sr:player:2249345	Akhomach, Ilias	sr:competitor:2819	forward	MAR	11
sr:player:2264881	Espigares, Antonio	sr:competitor:2819	defender	ESP	28
sr:player:2271033	Kambwala, Willy	sr:competitor:2819	defender	FRA	5
sr:player:2418935	Etta, Karl	sr:competitor:2819	midfielder	CMR	36
sr:player:2447155	Gomez, Ruben	sr:competitor:2819	goalkeeper	ESP	55
sr:player:2611907	Requena, Daniel	sr:competitor:2819	midfielder	ESP	30
sr:player:2670935	Navarro, Pau	sr:competitor:2819	defender	ESP	26
sr:player:2804287	Cabanes, Pau	sr:competitor:2819	forward	ESP	33
sr:player:2887539	Valou, Jean Ives	sr:competitor:2819	defender	CIV	37
sr:player:97951	Dimitrievski, Stole	sr:competitor:2828	goalkeeper	MKD	13
sr:player:151138	Foulquier, Dimitri	sr:competitor:2828	defender	GLP	20
sr:player:227922	Gaya, Jose	sr:competitor:2828	defender	ESP	14
sr:player:235386	Domenech, Jaume	sr:competitor:2828	goalkeeper	ESP	1
sr:player:355052	Canos, Sergi	sr:competitor:2828	forward	ESP	7
sr:player:769521	Pepelu	sr:competitor:2828	midfielder	ESP	18
sr:player:820984	Diakhaby, Mouctar	sr:competitor:2828	defender	GIN	4
sr:player:860904	Caufriez, Maximiliano	sr:competitor:2828	defender	BEL	2
sr:player:933416	Mir, Rafa	sr:competitor:2828	forward	ESP	11
sr:player:959760	Gomez, Dani	sr:competitor:2828	forward	ESP	17
sr:player:974213	Correia, Thierry	sr:competitor:2828	defender	PRT	12
sr:player:1012893	Almeida, Andre	sr:competitor:2828	midfielder	PRT	10
sr:player:1051067	Guillamon, Hugo	sr:competitor:2828	defender	ESP	6
sr:player:84844	Neto	sr:competitor:42	goalkeeper	BRA	32
sr:player:132874	Jorginho	sr:competitor:42	midfielder	ITA	20
sr:player:135666	Trossard, Leandro	sr:competitor:42	midfielder	BEL	19
sr:player:138534	Sterling, Raheem	sr:competitor:42	forward	ENG	30
sr:player:287643	Zinchenko, Oleksandr	sr:competitor:42	defender	UKR	17
sr:player:316148	Partey, Thomas	sr:competitor:42	midfielder	GHA	5
sr:player:366592	Tierney, Kieran	sr:competitor:42	defender	SCO	3
sr:player:547410	Odegaard, Martin	sr:competitor:42	midfielder	NOR	8
sr:player:581310	Raya, David	sr:competitor:42	goalkeeper	ESP	22
sr:player:592010	Merino, Mikel	sr:competitor:42	midfielder	ESP	23
sr:player:772819	Tomiyasu, Takehiro	sr:competitor:42	defender	JPN	18
sr:player:835751	Jesus, Gabriel	sr:competitor:42	forward	BRA	9
sr:player:934552	Rice, Declan	sr:competitor:42	midfielder	ENG	41
sr:player:937210	Havertz, Kai	sr:competitor:42	forward	DEU	29
sr:player:1015179	White, Ben	sr:competitor:42	defender	ENG	4
sr:player:1059325	Timber, Jurrien	sr:competitor:42	defender	NLD	12
sr:player:1091644	Kiwior, Jakub	sr:competitor:42	defender	POL	15
sr:player:1099395	Magalhaes, Gabriel	sr:competitor:42	defender	BRA	6
sr:player:1297524	Calafiori, Riccardo	sr:competitor:42	defender	ITA	33
sr:player:1479630	Saka, Bukayo	sr:competitor:42	forward	ENG	7
sr:player:1513599	Saliba, William	sr:competitor:42	defender	FRA	2
sr:player:1663313	Martinelli, Gabriel	sr:competitor:42	forward	BRA	11
sr:player:2244495	Oulad M Hand, Salah Eddine	sr:competitor:42	midfielder	NLD	56
sr:player:2268223	Setford, Tommy	sr:competitor:42	goalkeeper	ENG	36
sr:player:2447727	Nwaneri, Ethan	sr:competitor:42	forward	ENG	53
sr:player:2506009	Butler-Oyedeji, Nathan	sr:competitor:42	midfielder	ENG	37
sr:player:2518835	Lewis-Skelly, Myles	sr:competitor:42	midfielder	ENG	49
sr:player:2605855	Rojas, Alexei	sr:competitor:42	goalkeeper	COL	62
sr:player:2691816	Heaven, Ayden	sr:competitor:42	defender	ENG	76
sr:player:2691826	Kacurri, Maldini	sr:competitor:42	defender	ALB	47
sr:player:2691828	Nichols, Joshua	sr:competitor:42	defender	ENG	51
sr:player:2711838	Gower, Jimi	sr:competitor:42	midfielder	ENG	44
sr:player:2736309	Joshua	sr:competitor:42	defender	ENG	61
sr:player:2754921	Monlouis, Zane	sr:competitor:42	defender	ENG	50
sr:player:2758543	Kabia, Ismeal	sr:competitor:42	forward	NLD	46
sr:player:2863029	Porter, Jack	sr:competitor:42	goalkeeper	ENG	92
sr:player:41789	Lewandowski, Robert	sr:competitor:2817	forward	POL	9
sr:player:50490	Szczesny, Wojciech	sr:competitor:2817	goalkeeper	POL	25
sr:player:88625	Ter Stegen, Marc-Andre	sr:competitor:2817	goalkeeper	DEU	1
sr:player:173883	Martinez, Inigo	sr:competitor:2817	defender	ESP	5
sr:player:186795	Christensen, Andreas	sr:competitor:2817	defender	DNK	15
sr:player:800314	Olmo, Dani	sr:competitor:2817	midfielder	ESP	20
sr:player:819456	Pena, Inaki	sr:competitor:2817	goalkeeper	ESP	13
sr:player:838293	De Jong, Frenkie	sr:competitor:2817	midfielder	NLD	21
sr:player:936026	Torres, Ferran	sr:competitor:2817	forward	ESP	7
sr:player:940560	Kounde, Jules	sr:competitor:2817	defender	FRA	23
sr:player:956430	Raphinha	sr:competitor:2817	forward	BRA	11
sr:player:1115745	Garcia, Eric	sr:competitor:2817	defender	ESP	24
sr:player:1407379	Araujo, Ronald	sr:competitor:2817	defender	URY	4
sr:player:1624504	Fati, Ansu	sr:competitor:2817	forward	ESP	10
sr:player:1860180	Pedri	sr:competitor:2817	midfielder	ESP	8
sr:player:1948530	Balde, Alejandro	sr:competitor:2817	defender	ESP	3
sr:player:2045067	Victor, Pau	sr:competitor:2817	forward	ESP	18
sr:player:2112716	Torre, Pablo	sr:competitor:2817	midfielder	ESP	14
sr:player:2112836	Martin, Gerard	sr:competitor:2817	defender	ESP	35
sr:player:2203428	Gavi	sr:competitor:2817	midfielder	ESP	6
sr:player:2230208	Astralaga, Ander	sr:competitor:2817	goalkeeper	ESP	26
sr:player:2264477	Casado, Marc	sr:competitor:2817	midfielder	ESP	17
sr:player:2264489	Lopez, Fermín	sr:competitor:2817	midfielder	ESP	16
sr:player:2273853	Yaakobisvili, Aaron	sr:competitor:2817	goalkeeper	HUN	40
sr:player:2273855	Kochen, Diego	sr:competitor:2817	goalkeeper	USA	31
sr:player:2438107	Fort, Hector	sr:competitor:2817	defender	ESP	32
sr:player:2439417	Yamal, Lamine	sr:competitor:2817	forward	ESP	19
sr:player:2487317	Cubarsi, Pau	sr:competitor:2817	defender	ESP	2
sr:player:2487333	Dominguez, Sergi	sr:competitor:2817	defender	ESP	36
sr:player:2691194	Cuenca, Andres	sr:competitor:2817	defender	ESP	39
sr:player:2691234	Fernandez, Guille	sr:competitor:2817	midfielder	ESP	41
sr:player:2698884	Bernal, Marc	sr:competitor:2817	midfielder	ESP	28
sr:player:2723212	Fernandez, Toni	sr:competitor:2817	midfielder	ESP	42
sr:player:142018	Sanchez, Ivan	sr:competitor:2831	midfielder	ESP	10
sr:player:233328	De La Hoz, Cesar	sr:competitor:2831	midfielder	ESP	16
sr:player:252863	Machis, Darwin	sr:competitor:2831	midfielder	VEN	18
sr:player:338849	Kenedy, Robert	sr:competitor:2831	forward	BRA	24
sr:player:352858	Ferreira, Andre	sr:competitor:2831	goalkeeper	PRT	1
sr:player:601962	Anuar	sr:competitor:2831	midfielder	MAR	23
sr:player:605318	Ndiaye, Amath	sr:competitor:2831	forward	SEN	19
sr:player:769267	Comert, Eray	sr:competitor:2831	defender	CHE	15
sr:player:772065	Sanchez, Javi	sr:competitor:2831	defender	ESP	5
sr:player:823332	Sylla, Mamadou	sr:competitor:2831	forward	SEN	7
sr:player:862962	Amallah, Selim	sr:competitor:2831	midfielder	MAR	21
sr:player:883220	Juric, Stanko	sr:competitor:2831	midfielder	HRV	20
sr:player:2395769	Mazilu, Adrian	sr:competitor:30	forward	ROU	\N
sr:player:2429289	Minteh, Yankuba	sr:competitor:30	forward	GMB	17
sr:player:2532547	Hinshelwood, Jack	sr:competitor:30	midfielder	ENG	41
sr:player:2541095	Gruda, Brajan	sr:competitor:30	forward	DEU	8
sr:player:2680213	Cahill, Killian	sr:competitor:30	goalkeeper	IRL	38
sr:player:21949	Trejo, Oscar	sr:competitor:2818	forward	ARG	8
sr:player:41013	Hernandez, Aridane	sr:competitor:2818	defender	ESP	5
sr:player:88528	Lejeune, Florian	sr:competitor:2818	defender	FRA	24
sr:player:107414	Rodriguez, James	sr:competitor:2818	midfielder	COL	10
sr:player:138387	De Tomas, Raul	sr:competitor:2818	forward	ESP	9
sr:player:141945	Guardiola, Sergi	sr:competitor:2818	forward	ESP	12
sr:player:152446	Balliu, Ivan	sr:competitor:2818	defender	ALB	20
sr:player:326471	Gumbau, Gerard	sr:competitor:2818	midfielder	ESP	15
sr:player:345111	Garcia, Alvaro	sr:competitor:2818	midfielder	ESP	18
sr:player:346516	Embarba, Adri	sr:competitor:2818	forward	ESP	21
sr:player:358910	Batalla, Augusto	sr:competitor:2818	goalkeeper	ARG	13
sr:player:542634	Espino, Alfonso	sr:competitor:2818	defender	URY	22
sr:player:588566	Lopez, Unai	sr:competitor:2818	midfielder	ESP	17
sr:player:891282	Palazon, Isi	sr:competitor:2818	midfielder	ESP	7
sr:player:941534	Montiel, Joni	sr:competitor:2818	midfielder	ESP	25
sr:player:1015509	Mumin, Abdul	sr:competitor:2818	defender	GHA	16
sr:player:1247646	Ciss, Pathe	sr:competitor:2818	midfielder	SEN	6
sr:player:1278174	Valentin, Oscar	sr:competitor:2818	midfielder	ESP	23
sr:player:1286410	Díaz, Pedro	sr:competitor:2818	midfielder	ESP	4
sr:player:1297802	Camello, Sergio	sr:competitor:2818	forward	ESP	14
sr:player:1587596	Nteka, Randy	sr:competitor:2818	midfielder	AGO	11
sr:player:1725596	Ratiu, Andrei	sr:competitor:2818	defender	ROU	2
sr:player:1793402	De Frutos, Jorge	sr:competitor:2818	forward	ESP	19
sr:player:1955318	Cardenas, Dani	sr:competitor:2818	goalkeeper	ESP	1
sr:player:2056455	Chavarria, Pep	sr:competitor:2818	defender	ESP	3
sr:player:2418583	Mendez, Diego	sr:competitor:2818	midfielder	ESP	29
sr:player:2463163	Fernandez, Pelayo	sr:competitor:2818	defender	ESP	27
sr:player:2836741	Eto'o, Etienne	sr:competitor:2818	forward	CMR	28
sr:player:2836765	de las Sias, Marco	sr:competitor:2818	defender	ESP	26
sr:player:40963	Zoet, Jeroen	sr:competitor:2950	goalkeeper	NLD	41
sr:player:97401	Verhulst, Hobie	sr:competitor:2950	goalkeeper	NLD	12
sr:player:116946	Clasie, Jordy	sr:competitor:2950	midfielder	NLD	8
sr:player:116947	Martins Indi, Bruno	sr:competitor:2950	defender	NLD	4
sr:player:943512	De Wit, Mees	sr:competitor:2950	defender	NLD	34
sr:player:1321832	Sadiq, Ibrahim	sr:competitor:2950	forward	GHA	11
sr:player:1336444	Parrott, Troy	sr:competitor:2950	forward	IRL	9
sr:player:1396571	Koopmeiners, Peer	sr:competitor:2950	midfielder	NLD	6
sr:player:1428673	Belic, Kristijan	sr:competitor:2950	midfielder	SRB	14
sr:player:1626890	Penetra, Alexandre	sr:competitor:2950	defender	PRT	5
sr:player:1724924	Wolfe, David Moller	sr:competitor:2950	defender	NOR	18
sr:player:1726548	Mijnans, Sven	sr:competitor:2950	midfielder	NLD	10
sr:player:1978411	Kasius, Denso	sr:competitor:2950	defender	NLD	30
sr:player:2018333	Maikuma, Seiya	sr:competitor:2950	defender	JPN	16
sr:player:2052339	Lahdo, Mayckel	sr:competitor:2950	forward	SWE	23
sr:player:2068819	Deen, Daniel	sr:competitor:2950	goalkeeper	NLD	31
sr:player:2073471	Westerveld, Sem	sr:competitor:2950	goalkeeper	NLD	13
sr:player:2073473	Berkhout, Jorn	sr:competitor:2950	defender	NLD	51
sr:player:2073475	Buurmeester, Zico	sr:competitor:2950	midfielder	NLD	28
sr:player:2150366	Zeefuik, Lequincio	sr:competitor:2950	forward	NLD	25
sr:player:2152842	Dekker, Maxim	sr:competitor:2950	defender	NLD	22
sr:player:2152846	Poku, Ernest	sr:competitor:2950	forward	NLD	21
sr:player:2242611	Goes, Wouter	sr:competitor:2950	defender	NLD	3
sr:player:2275951	Owusu Oduro, Rome Jayden	sr:competitor:2950	goalkeeper	NLD	1
sr:player:2275953	Meerdink, Mexx	sr:competitor:2950	forward	NLD	35
sr:player:2288105	Schouten, Lewis	sr:competitor:2950	midfielder	NLD	24
sr:player:2297937	Kwakman, Dave	sr:competitor:2950	midfielder	NLD	33
sr:player:2297941	Addai, Jayden	sr:competitor:2950	forward	NLD	17
sr:player:2327033	Daal, Ro-Zangelo	sr:competitor:2950	defender	NLD	37
sr:player:2339601	van Bommel, Ruben	sr:competitor:2950	forward	NLD	7
sr:player:2450991	Smit, Kees	sr:competitor:2950	midfielder	NLD	26
sr:player:2450993	Mastoras, Enoch	sr:competitor:2950	midfielder	NLD	62
sr:player:2595747	Dijkstra, Elijah	sr:competitor:2950	defender	NLD	52
sr:player:35976	Pervan, Pavao	sr:competitor:2524	goalkeeper	AUT	12
sr:player:136933	Muller, Marius	sr:competitor:2524	goalkeeper	DEU	29
sr:player:147289	Arnold, Maximilian	sr:competitor:2524	midfielder	DEU	27
sr:player:164171	Behrens, Kevin	sr:competitor:2524	forward	DEU	17
sr:player:169255	Gerhardt, Yannick	sr:competitor:2524	midfielder	DEU	31
sr:player:241812	Klinger, Niklas	sr:competitor:2524	goalkeeper	DEU	30
sr:player:293127	Vavro, Denis	sr:competitor:2524	defender	SVK	18
sr:player:769115	Nmecha, Lukas	sr:competitor:2524	forward	DEU	10
sr:player:776533	Svanberg, Mattias	sr:competitor:2524	midfielder	SWE	32
sr:player:784739	Ozcan, Salih	sr:competitor:2524	midfielder	TUR	8
sr:player:858238	Zesiger, Cedric	sr:competitor:2524	defender	CHE	5
sr:player:878344	Baku, Ridle	sr:competitor:2524	midfielder	DEU	20
sr:player:918696	Rogerio	sr:competitor:2524	defender	BRA	13
sr:player:2161262	Iroegbunam, Tim	sr:competitor:48	midfielder	ENG	42
sr:player:2265047	Chermiti	sr:competitor:48	forward	PRT	28
sr:player:2611499	Sherif, Martin	sr:competitor:48	forward	NLD	67
sr:player:2836737	Dixon, Roman	sr:competitor:48	defender	ENG	75
sr:player:2836855	Armstrong, Harrison	sr:competitor:48	midfielder	ENG	45
sr:player:2861607	Butterfield, Luke	sr:competitor:48	\N	SCO	69
sr:player:2861609	Moonan, Bradley	sr:competitor:48	defender	ENG	72
sr:player:2861611	Barker, Owen	sr:competitor:48	midfielder	ENG	79
sr:player:2892413	Bates, Callum	sr:competitor:48	midfielder	ENG	92
sr:player:121588	Trauner, Gernot	sr:competitor:2959	defender	AUT	18
sr:player:253875	Wellenreuther, Timon	sr:competitor:2959	goalkeeper	DEU	22
sr:player:285999	Nieuwkoop, Bart	sr:competitor:2959	defender	NLD	2
sr:player:556696	Bijlow, Justin	sr:competitor:2959	goalkeeper	NLD	1
sr:player:796824	Hancko, David	sr:competitor:2959	defender	SVK	33
sr:player:841577	Lotomba, Jordan	sr:competitor:2959	defender	CHE	30
sr:player:918648	Ivanusec, Luka	sr:competitor:2959	forward	HRV	17
sr:player:1059323	Timber, Quinten	sr:competitor:2959	midfielder	NLD	8
sr:player:1069036	Stengs, Calvin	sr:competitor:2959	forward	NLD	10
sr:player:1103583	Carranza, Julian	sr:competitor:2959	forward	ARG	19
sr:player:1243310	In-beom, Hwang	sr:competitor:2959	midfielder	KOR	4
sr:player:1317300	Smal, Gijs	sr:competitor:2959	defender	NLD	5
sr:player:1556313	Gimenez, Santiago	sr:competitor:2959	forward	MEX	29
sr:player:1564070	Ueda, Ayase	sr:competitor:2959	forward	JPN	9
sr:player:1748469	Paixao, Igor	sr:competitor:2959	forward	BRA	14
sr:player:1836034	Zerrouki, Ramiz	sr:competitor:2959	midfielder	DZA	6
sr:player:2121872	Bueno, Hugo	sr:competitor:2959	defender	ESP	16
sr:player:2161294	Andreev, Plamen Plamenov	sr:competitor:2959	goalkeeper	BGR	21
sr:player:2190630	Milambo, Antoni	sr:competitor:2959	midfielder	NLD	27
sr:player:2297025	Gonzalez, Facundo	sr:competitor:2959	defender	URY	15
sr:player:2327639	Beelen, Thomas	sr:competitor:2959	midfielder	NLD	3
sr:player:2411727	Read, Givairo	sr:competitor:2959	defender	NLD	26
sr:player:2411801	Hartman, Quilindschy	sr:competitor:2959	defender	NLD	11
sr:player:2557933	Osman, Ibrahim	sr:competitor:2959	forward	GHA	38
sr:player:2611503	Redmond, Zepiqueno	sr:competitor:2959	forward	NLD	49
sr:player:2657511	Zechiel, Gjivai	sr:competitor:2959	midfielder	NLD	24
sr:player:2666595	Berger, Mannou	sr:competitor:2959	goalkeeper	NLD	41
sr:player:2691124	Ka, Ismail	sr:competitor:2959	goalkeeper	NLD	64
sr:player:2691134	Sliti, Aymen	sr:competitor:2959	midfielder	NLD	57
sr:player:2691136	Plug, Jan	sr:competitor:2959	midfielder	NLD	43
sr:player:2707216	Mitchell, Jeyland	sr:competitor:2959	defender	CRI	20
sr:player:2765137	Hadj Moussa, Anis	sr:competitor:2959	forward	DZA	23
sr:player:2814811	Nadje, Chris-Kevin	sr:competitor:2959	midfielder	CIV	34
sr:player:94411	Kolke, Markus	sr:competitor:2534	goalkeeper	DEU	25
sr:player:103442	Jung, Anthony	sr:competitor:2534	defender	DEU	3
sr:player:111969	Bittencourt, Leonardo	sr:competitor:2534	midfielder	DEU	10
sr:player:138150	Weiser, Mitchell	sr:competitor:2534	defender	DEU	8
sr:player:190161	Zetterer, Michael	sr:competitor:2534	goalkeeper	DEU	1
sr:player:227224	Veljkovic, Milos	sr:competitor:2534	defender	SRB	13
sr:player:229544	Stark, Niklas	sr:competitor:2534	defender	DEU	4
sr:player:258325	Ducksch, Marvin	sr:competitor:2534	forward	DEU	7
sr:player:365772	Keita, Naby	sr:competitor:2534	midfielder	GIN	18
sr:player:608362	Burke, Oliver	sr:competitor:2534	forward	SCO	15
sr:player:878304	Friedl, Marco	sr:competitor:2534	defender	AUT	32
sr:player:888660	Pieper, Amos	sr:competitor:2534	defender	DEU	5
sr:player:908660	Grull, Marco	sr:competitor:2534	forward	AUT	17
sr:player:936438	Lynen, Senne	sr:competitor:2534	midfielder	BEL	14
sr:player:952710	Schmid, Romano	sr:competitor:2534	midfielder	AUT	20
sr:player:952868	Stage, Jens	sr:competitor:2534	midfielder	DNK	6
sr:player:1021591	Agu, Felix	sr:competitor:2534	defender	DEU	27
sr:player:1021725	Kohn, Derrick	sr:competitor:2534	defender	DEU	19
sr:player:1627702	Deman, Olivier	sr:competitor:2534	midfielder	BEL	2
sr:player:1734461	Nankishi, Abdenego	sr:competitor:2534	forward	DEU	33
sr:player:1972593	Njinmah, Justin	sr:competitor:2534	forward	DEU	11
sr:player:2048429	Hansen-Aaroen, Isak	sr:competitor:2534	midfielder	NOR	21
sr:player:2090821	Malatini, Julian	sr:competitor:2534	defender	ARG	22
sr:player:2271661	Topp, Keke	sr:competitor:2534	forward	DEU	42
sr:player:2327677	Backhaus, Mio	sr:competitor:2534	goalkeeper	DEU	30
sr:player:2376103	Alvero, Skelly	sr:competitor:2534	midfielder	FRA	28
sr:player:2578977	Opitz, Leon	sr:competitor:2534	midfielder	DEU	35
sr:player:2880755	Adeh, Wesley	sr:competitor:2534	midfielder	DEU	48
sr:player:44241	Matic, Nemanja	sr:competitor:1649	midfielder	SRB	31
sr:player:48535	Lopes, Anthony	sr:competitor:1649	goalkeeper	PRT	1
sr:player:50070	Lacazette, Alexandre	sr:competitor:1649	forward	FRA	10
sr:player:111850	Zaha, Wilfried	sr:competitor:1649	forward	CIV	12
sr:player:151124	Veretout, Jordan	sr:competitor:1649	midfielder	FRA	7
sr:player:152813	Mata, Clinton	sr:competitor:1649	midfielder	AGO	22
sr:player:158243	Tagliafico, Nicolas	sr:competitor:1649	defender	ARG	3
sr:player:257091	Caleta-Car, Duje	sr:competitor:1649	defender	HRV	55
sr:player:343067	Tolisso, Corentin	sr:competitor:1649	midfielder	FRA	8
sr:player:352768	Maitland-Niles, Ainsley	sr:competitor:1649	midfielder	ENG	98
sr:player:1278086	Catena, Alejandro	sr:competitor:2820	defender	ESP	24
sr:player:1347728	Areso, Jesus	sr:competitor:2820	defender	ESP	12
sr:player:1430075	Martinez, Javi	sr:competitor:2820	midfielder	ESP	21
sr:player:1555859	Herrando, Jorge	sr:competitor:2820	defender	ESP	5
sr:player:1707861	Moncayola, Jon	sr:competitor:2820	midfielder	ESP	7
sr:player:1747899	Oroz, Aimar	sr:competitor:2820	forward	ESP	10
sr:player:1887532	Garcia, Raul	sr:competitor:2820	forward	ESP	9
sr:player:2070975	Boyomo, Flavien	sr:competitor:2820	defender	CMR	22
sr:player:2112576	Zaragoza, Bryan	sr:competitor:2820	midfielder	ESP	19
sr:player:2150782	Bretones, Abel	sr:competitor:2820	midfielder	ESP	23
sr:player:2259525	Stamatakis, Dimitrios	sr:competitor:2820	goalkeeper	GRC	32
sr:player:2283673	Benito, Iker	sr:competitor:2820	forward	ESP	27
sr:player:2380123	Ibanez, Pablo	sr:competitor:2820	midfielder	ESP	8
sr:player:2558865	Munoz, Iker	sr:competitor:2820	midfielder	ESP	18
sr:player:2776913	Osambela, Asier	sr:competitor:2820	midfielder	ESP	29
sr:player:15466	Modric, Luka	sr:competitor:2829	midfielder	HRV	10
sr:player:66492	Alaba, David	sr:competitor:2829	defender	AUT	4
sr:player:70988	Courtois, Thibaut	sr:competitor:2829	goalkeeper	BEL	1
sr:player:138572	Carvajal, Dani	sr:competitor:2829	defender	ESP	2
sr:player:142622	Rudiger, Antonio	sr:competitor:2829	defender	DEU	22
sr:player:255239	Vazquez, Lucas	sr:competitor:2829	defender	ESP	17
sr:player:355048	Vallejo, Jesus	sr:competitor:2829	defender	ESP	18
sr:player:547838	Ceballos, Dani	sr:competitor:2829	midfielder	ESP	19
sr:player:796046	Mbappe, Kylian	sr:competitor:2829	forward	FRA	9
sr:player:815912	Mendy, Ferland	sr:competitor:2829	defender	FRA	23
sr:player:918726	Militao, Eder	sr:competitor:2829	defender	BRA	3
sr:player:935122	Lunin, Andriy	sr:competitor:2829	goalkeeper	UKR	13
sr:player:937374	Diaz, Brahim	sr:competitor:2829	forward	MAR	21
sr:player:962433	Valverde, Federico	sr:competitor:2829	midfielder	URY	8
sr:player:1047507	Garcia, Francisco	sr:competitor:2829	defender	ESP	20
sr:player:1070898	Tchouameni, Aurelien	sr:competitor:2829	midfielder	FRA	14
sr:player:1134403	Junior, Vinicius	sr:competitor:2829	forward	BRA	7
sr:player:1350378	Rodrygo	sr:competitor:2829	forward	BRA	11
sr:player:1692931	Camavinga, Eduardo	sr:competitor:2829	midfielder	FRA	6
sr:player:1848612	Bellingham, Jude	sr:competitor:2829	midfielder	ENG	5
sr:player:2159140	Guler, Arda	sr:competitor:2829	forward	TUR	15
sr:player:2266503	Asencio, Raul	sr:competitor:2829	defender	ESP	35
sr:player:2269305	Jimenez Corredor, David	sr:competitor:2829	defender	ESP	38
sr:player:2438287	Ramon, Jacobo	sr:competitor:2829	defender	ESP	31
sr:player:2439597	Mestre, Sergio	sr:competitor:2829	goalkeeper	ESP	34
sr:player:2446745	Chema	sr:competitor:2829	midfielder	ESP	36
sr:player:2448043	Endrick	sr:competitor:2829	forward	BRA	16
sr:player:2615465	Gonzalez, Fran	sr:competitor:2829	goalkeeper	ESP	26
sr:player:44220	Leerdam, Kelvin	sr:competitor:2977	defender	SUR	18
sr:player:132674	Engels, Mario	sr:competitor:2977	forward	DEU	8
sr:player:146401	Bruns, Thomas	sr:competitor:2977	midfielder	NLD	17
sr:player:318575	Mirani, Damon	sr:competitor:2977	defender	NLD	4
sr:player:352550	Bruijn, Jordy	sr:competitor:2977	midfielder	NLD	5
sr:player:574488	Laursen, Nikolai	sr:competitor:2977	forward	DNK	11
sr:player:966407	Hoogma, Justin	sr:competitor:2977	defender	NLD	21
sr:player:1064550	De Keijzer, Fabian	sr:competitor:2977	goalkeeper	NLD	1
sr:player:1115937	Van Kaam, Daniel	sr:competitor:2977	midfielder	NLD	26
sr:player:1275734	Wieckhoff, Jannes	sr:competitor:2977	defender	DEU	3
sr:player:1372492	Hornkamp, Jizz	sr:competitor:2977	forward	NLD	9
sr:player:1381933	Mesik, Ivan	sr:competitor:2977	defender	SVK	24
sr:player:1424763	Podgoreanu, Suf	sr:competitor:2977	midfielder	ISR	29
sr:player:1428689	Zamburek, Jan	sr:competitor:2977	midfielder	CZE	13
sr:player:1548189	Mantel, Robin	sr:competitor:2977	goalkeeper	BEL	30
sr:player:1574244	Kulenovic, Luka	sr:competitor:2977	forward	BIH	19
sr:player:1576078	Cestic, Sava-Arangel	sr:competitor:2977	defender	SRB	6
sr:player:1730393	De Keersmaecker, Brian	sr:competitor:2977	midfielder	BEL	14
sr:player:1836938	Roosken, Ruben	sr:competitor:2977	defender	NLD	12
sr:player:1948326	Limbombe, Bryan	sr:competitor:2977	forward	BEL	7
sr:player:2059613	Milani, Lorenzo	sr:competitor:2977	defender	ITA	22
sr:player:2211236	Benita, Mimeirhel	sr:competitor:2977	defender	NLD	2
sr:player:2312839	Scheperman, Sem	sr:competitor:2977	midfielder	NLD	32
sr:player:2313213	Jansink, Timo	sr:competitor:2977	goalkeeper	NLD	16
sr:player:2419261	Talvitie, Juho	sr:competitor:2977	forward	FIN	23
sr:player:2584789	van Oorschot, Diego	sr:competitor:2977	forward	NLD	20
sr:player:2589601	Bultman, Stijn	sr:competitor:2977	defender	NLD	35
sr:player:2659929	't Zand, Shiloh	sr:competitor:2977	midfielder	SUR	10
sr:player:2762669	Geypens, Tim	sr:competitor:2977	defender	NLD	37
sr:player:2803701	Tijink, Jop	sr:competitor:2977	defender	NLD	27
sr:player:2837577	Codinha, Tiago	sr:competitor:2977	\N	\N	39
sr:player:2837581	Sambo, Giandro	sr:competitor:2977	midfielder	CUW	28
sr:player:2850607	te Fruchte, Jonah	sr:competitor:2977	goalkeeper	NLD	36
sr:player:40244	Baumann, Oliver	sr:competitor:2569	goalkeeper	DEU	1
sr:player:67647	Kramaric, Andrej	sr:competitor:2569	forward	HRV	27
sr:player:109296	Kaderabek, Pavel	sr:competitor:2569	defender	CZE	3
sr:player:168897	Lenz, Christopher	sr:competitor:2569	defender	DEU	13
sr:player:186719	Grillitsch, Florian	sr:competitor:2569	midfielder	AUT	11
sr:player:880288	Alvarez, Yeray	sr:competitor:2825	defender	ESP	5
sr:player:1347730	Vivian, Dani	sr:competitor:2825	defender	ESP	3
sr:player:1620128	Paredes, Aitor	sr:competitor:2825	defender	ESP	4
sr:player:1711299	Djalo, Alvaro	sr:competitor:2825	forward	ESP	11
sr:player:1836818	Sancet, Oihan	sr:competitor:2825	midfielder	ESP	8
sr:player:2112956	Williams, Nico	sr:competitor:2825	forward	ESP	10
sr:player:2151982	Marton, Javier	sr:competitor:2825	forward	ESP	19
sr:player:2153312	Prados, Benat	sr:competitor:2825	midfielder	ESP	24
sr:player:2202348	Agirrezabala, Julen	sr:competitor:2825	goalkeeper	ESP	13
sr:player:2203978	Serrano, Nico	sr:competitor:2825	forward	ESP	22
sr:player:2232958	Padilla, Alex	sr:competitor:2825	goalkeeper	ESP	26
sr:player:2232964	Gomez, Unai	sr:competitor:2825	midfielder	ESP	20
sr:player:2615703	Gastesi, Oier	sr:competitor:2825	goalkeeper	ESP	34
sr:player:2615711	Jauregizar, Mikel	sr:competitor:2825	midfielder	ESP	23
sr:player:2741721	Olabarrieta, Aingeru	sr:competitor:2825	forward	ESP	33
sr:player:2761777	Boiro, Adama	sr:competitor:2825	midfielder	ESP	32
sr:player:2836849	Urtasan, Peio	sr:competitor:2825	midfielder	ESP	28
sr:player:19356	Aspas, Iago	sr:competitor:2821	forward	ESP	10
sr:player:32023	Guaita, Vicente	sr:competitor:2821	goalkeeper	ESP	13
sr:player:69408	Alonso, Marcos	sr:competitor:2821	defender	ESP	20
sr:player:210082	Manquillo, Javi	sr:competitor:2821	defender	ESP	22
sr:player:355040	Villar, Ivan	sr:competitor:2821	goalkeeper	ESP	1
sr:player:360718	Starfelt, Carl	sr:competitor:2821	defender	SWE	2
sr:player:363774	Ristic, Mihailo	sr:competitor:2821	defender	SRB	21
sr:player:557008	Cervi, Franco	sr:competitor:2821	forward	ARG	11
sr:player:595576	Bamba, Jonathan	sr:competitor:2821	forward	CIV	17
sr:player:790605	Iglesias, Borja	sr:competitor:2821	forward	ESP	7
sr:player:809766	De La Torre, Luca	sr:competitor:2821	midfielder	USA	14
sr:player:815796	Aidoo, Joseph	sr:competitor:2821	defender	GHA	15
sr:player:835993	Jailson	sr:competitor:2821	midfielder	BRA	16
sr:player:944162	Vidal, Marc	sr:competitor:2821	goalkeeper	ESP	26
sr:player:973787	Beltran, Fran	sr:competitor:2821	midfielder	ESP	8
sr:player:1057441	Mingueza, Oscarla	sr:competitor:2821	defender	ESP	3
sr:player:1264266	Douvikas, Anastasios	sr:competitor:2821	forward	GRC	9
sr:player:1420677	Gonzales, Alfonso	sr:competitor:2821	forward	ESP	12
sr:player:1635770	Moriba, Ilaix	sr:competitor:2821	midfielder	GIN	6
sr:player:1743259	Carreira, Sergio	sr:competitor:2821	defender	ESP	5
sr:player:2115380	Dominguez, Carlos	sr:competitor:2821	defender	ESP	24
sr:player:2156400	Sotelo, Hugo	sr:competitor:2821	midfielder	ESP	33
sr:player:2183016	Swedberg, Williot	sr:competitor:2821	midfielder	SWE	19
sr:player:2244213	Carrillo, Coke	sr:competitor:2821	goalkeeper	ESP	35
sr:player:2244215	Alvarez, Hugo	sr:competitor:2821	midfielder	ESP	30
sr:player:2291935	Allende, Tadeo	sr:competitor:2821	forward	ARG	23
sr:player:2316763	Fernandez, Cesar	sr:competitor:2821	goalkeeper	ESP	27
sr:player:2357703	Rodriguez, Damian	sr:competitor:2821	midfielder	ESP	25
sr:player:2461423	Duran, Pablo	sr:competitor:2821	forward	ESP	18
sr:player:2502297	Roman Gonzalez, Miguel	sr:competitor:2821	midfielder	ESP	34
sr:player:2719832	Rodriguez, Javi	sr:competitor:2821	defender	ESP	32
sr:player:2806839	Lago, Yoel	sr:competitor:2821	defender	ESP	29
sr:player:2887483	Lopez Gonzalez, Fernando	sr:competitor:2821	midfielder	ESP	28
sr:player:32386	Meijers, Aaron	sr:competitor:2956	defender	NLD	28
sr:player:36781	Kramer, Michiel	sr:competitor:2956	forward	NLD	29
sr:player:318745	Zawada, Oskar	sr:competitor:2956	forward	POL	9
sr:player:339367	Houwen, Jeroen	sr:competitor:2956	goalkeeper	NLD	1
sr:player:340491	Jakobsen, Alexander	sr:competitor:2956	midfielder	EGY	11
sr:player:361764	van Osch, Yanick	sr:competitor:2956	goalkeeper	NLD	21
sr:player:783468	Van Den Buijs, Dario	sr:competitor:2956	defender	BEL	3
sr:player:856254	Lelieveld, Julian	sr:competitor:2956	defender	NLD	2
sr:player:868986	Van der Venne, Richard	sr:competitor:2956	midfielder	NLD	23
sr:player:877728	Van der Water, Silvester	sr:competitor:2956	forward	NLD	18
sr:player:934226	Roemeratoe, Godfried	sr:competitor:2956	midfielder	CUW	24
sr:player:1015577	Niemeijer, Reuven	sr:competitor:2956	midfielder	NLD	10
sr:player:1059309	Van Gelderen, Liam	sr:competitor:2956	defender	SUR	4
sr:player:1064540	Castillo, Juan	sr:competitor:2956	defender	NLD	5
sr:player:1270834	Felida, Kevin	sr:competitor:2956	midfielder	CUW	35
sr:player:1416703	Van Eijma, Roshon	sr:competitor:2956	defender	CUW	17
sr:player:1423483	Margaret, Richonell	sr:competitor:2956	midfielder	NLD	19
sr:player:1425285	Ihattaren, Mohammed	sr:competitor:2956	forward	NLD	52
sr:player:1852906	Vroegh, Patrick	sr:competitor:2956	midfielder	NLD	8
sr:player:1948318	Takidine, Ilias	sr:competitor:2956	forward	BEL	20
sr:player:1968843	Cleonise, Denilho	sr:competitor:2956	forward	NLD	7
sr:player:1983697	Oukili, Yassin	sr:competitor:2956	midfielder	NLD	6
sr:player:2064921	Wouters, Luuk	sr:competitor:2956	defender	NLD	34
sr:player:2088307	El Harmazi, Nouri	sr:competitor:2956	midfielder	NLD	15
sr:player:2256605	Weidmann, Daouda	sr:competitor:2956	midfielder	FRA	30
sr:player:2271165	Kesting, Joey	sr:competitor:2956	goalkeeper	NLD	13
sr:player:2289639	van de Loo, Tim	sr:competitor:2956	midfielder	NLD	22
sr:player:2355193	Al Mazyani, Faissal	sr:competitor:2956	defender	BEL	33
sr:player:2423157	Lokesa, Chris	sr:competitor:2956	midfielder	BEL	14
sr:player:2718994	Vogels, Luuk	sr:competitor:2956	goalkeeper	NLD	31
sr:player:116955	Niguez, Saul	sr:competitor:2833	midfielder	ESP	17
sr:player:355652	Sow, Djibril	sr:competitor:2833	midfielder	CHE	20
sr:player:359642	Iheanacho, Kelechi	sr:competitor:2833	forward	NGA	9
sr:player:369430	Lukebakio, Dodi	sr:competitor:2833	forward	BEL	11
sr:player:919706	Montiel, Gonzalo	sr:competitor:2833	defender	ARG	15
sr:player:995487	Marcao	sr:competitor:2833	defender	BRA	23
sr:player:1054945	Fernandez, Alvaro	sr:competitor:2833	goalkeeper	ESP	1
sr:player:1062142	Sambi Lokonga, Albert	sr:competitor:2833	midfielder	BEL	12
sr:player:1119215	Ejuke, Chidera	sr:competitor:2833	forward	NGA	21
sr:player:1484858	Pedrosa, Adria	sr:competitor:2833	defender	ESP	3
sr:player:1626026	Nianzou, Tanguy	sr:competitor:2833	defender	FRA	24
sr:player:1627208	Agoume, Lucien	sr:competitor:2833	midfielder	FRA	18
sr:player:1948528	Peque	sr:competitor:2833	forward	ESP	14
sr:player:1983573	Bade, Loic	sr:competitor:2833	defender	FRA	22
sr:player:2044819	Juanlu	sr:competitor:2833	defender	ESP	26
sr:player:2184512	Barco, Valentin	sr:competitor:2833	defender	ARG	19
sr:player:2203486	Carmona, Jose	sr:competitor:2833	defender	ESP	32
sr:player:2203490	Ortiz, Pedro	sr:competitor:2833	defender	ESP	8
sr:player:2265435	Flores Lopez, Alberto	sr:competitor:2833	goalkeeper	ESP	31
sr:player:2265455	Bueno, Manu	sr:competitor:2833	midfielder	ESP	28
sr:player:2265469	Rivera, Pablo	sr:competitor:2833	midfielder	ESP	37
sr:player:2268249	Idumbo-Muzambo, Stanis	sr:competitor:2833	midfielder	BEL	27
sr:player:2271137	Mejia, Mateo	sr:competitor:2833	forward	ESP	34
sr:player:2272687	Martinez Gil, Ramon	sr:competitor:2833	defender	ESP	35
sr:player:2277015	Salas, Kike	sr:competitor:2833	defender	ESP	4
sr:player:2437709	Collado, Alberto	sr:competitor:2833	midfielder	ESP	30
sr:player:2484411	Arbol, Matias	sr:competitor:2833	goalkeeper	ESP	33
sr:player:2532631	Dominguez, Isra	sr:competitor:2833	forward	ESP	41
sr:player:2549127	Romero, Isaac	sr:competitor:2833	forward	ESP	7
sr:player:2749999	Sow, Ibrahima	sr:competitor:2833	forward	SEN	\N
sr:player:32497	Bokila, Jeremy	sr:competitor:2961	forward	COD	18
sr:player:116945	Schouten, Erik	sr:competitor:2961	defender	NLD	4
sr:player:213120	Tirpan, Mickael	sr:competitor:2961	defender	BEL	25
sr:player:339809	Didillon, Thomas	sr:competitor:2961	goalkeeper	FRA	1
sr:player:793188	Joosten, Patrick	sr:competitor:2961	forward	NLD	17
sr:player:821022	Behounek, Raffael	sr:competitor:2961	defender	AUT	30
sr:player:917462	Doodeman, Nick	sr:competitor:2961	forward	NLD	7
sr:player:1115923	St. Jago, Tommy	sr:competitor:2961	defender	NLD	33
sr:player:1251134	Sigurgeirsson, Runar Thor	sr:competitor:2961	defender	ISL	5
sr:player:1360302	Vermeulen, Valentino	sr:competitor:2961	defender	NLD	20
sr:player:1488220	Lambert, Boris	sr:competitor:2961	midfielder	BEL	6
sr:player:1644564	Nizet, Rob	sr:competitor:2961	defender	BEL	22
sr:player:1795714	Kehrer, Emilio	sr:competitor:2961	forward	DEU	11
sr:player:1836030	Bosch, Jesse	sr:competitor:2961	midfielder	NLD	8
sr:player:1838512	Van Den Berg, Connor	sr:competitor:2961	goalkeeper	NLD	24
sr:player:1854512	Meerveld, Ringo	sr:competitor:2961	midfielder	NLD	16
sr:player:1884886	Vaesen, Kyan	sr:competitor:2961	forward	BEL	9
sr:player:1939306	Sandra, Cisse	sr:competitor:2961	midfielder	BEL	14
sr:player:2094746	Schut, Maarten	sr:competitor:2961	goalkeeper	NLD	41
sr:player:2188496	Pivas, Miodrag	sr:competitor:2961	midfielder	SRB	15
sr:player:2252919	Ahmed Fatah, Amar	sr:competitor:2961	midfielder	SWE	21
sr:player:2410047	Mathieu, Dani	sr:competitor:2961	midfielder	NLD	27
sr:player:2470869	Lachkar, Amine	sr:competitor:2961	defender	NLD	34
sr:player:2470871	van Berkel, Niels	sr:competitor:2961	defender	NLD	44
sr:player:2498023	Razak, Khaled	sr:competitor:2961	forward	NLD	35
sr:player:2837265	Van Loon, Per	sr:competitor:2961	forward	NLD	50
sr:player:2837267	Mathijsen, Jens	sr:competitor:2961	defender	NLD	48
sr:player:48557	Trimmel, Christopher	sr:competitor:2547	defender	AUT	28
sr:player:48660	Vogt, Kevin	sr:competitor:2547	defender	DEU	2
sr:player:117373	Volland, Kevin	sr:competitor:2547	forward	DEU	10
sr:player:134778	Schwolow, Alexander	sr:competitor:2547	goalkeeper	DEU	37
sr:player:137692	Ronnow, Frederik	sr:competitor:2547	goalkeeper	DNK	1
sr:player:146500	Roussillon, Jerome	sr:competitor:2547	defender	FRA	26
sr:player:148167	Klaus, Carl	sr:competitor:2547	goalkeeper	DEU	12
sr:player:149479	Khedira, Rani	sr:competitor:2547	midfielder	DEU	8
sr:player:168985	Haberer, Janik	sr:competitor:2547	midfielder	DEU	19
sr:player:327863	Skov, Robert	sr:competitor:2547	forward	DNK	24
sr:player:354558	Benes, Laszlo	sr:competitor:2547	midfielder	SVK	20
sr:player:795310	Tousart, Lucas	sr:competitor:2547	midfielder	FRA	29
sr:player:798000	Siebatcheu, Jordan	sr:competitor:2547	forward	USA	17
sr:player:812462	Juranovic, Josip	sr:competitor:2547	defender	HRV	18
sr:player:820932	Prtajin, Ivan	sr:competitor:2547	forward	HRV	9
sr:player:860734	Skarke, Tim	sr:competitor:2547	midfielder	DEU	21
sr:player:936362	Leite, Diogo	sr:competitor:2547	defender	PRT	4
sr:player:955782	Doekhi, Danilho	sr:competitor:2547	defender	NLD	5
sr:player:1120743	Schafer, Andras	sr:competitor:2547	midfielder	HUN	13
sr:player:1297598	Hollerbach, Benedict	sr:competitor:2547	forward	DEU	16
sr:player:1344822	Vertessen, Yorbe	sr:competitor:2547	forward	BEL	7
sr:player:1403363	Woo-yeong, Jeong	sr:competitor:2547	midfielder	KOR	11
sr:player:1599648	Ilic, Andrej	sr:competitor:2547	forward	SRB	23
sr:player:2836929	Min-su, Kim	sr:competitor:24264	forward	KOR	29
sr:player:2859611	Martinez, Raul	sr:competitor:24264	midfielder	ESP	37
sr:player:2880043	Garcia, Lucas	sr:competitor:24264	goalkeeper	ESP	42
sr:player:2882705	Garcia, Pau	sr:competitor:24264	goalkeeper	ESP	41
sr:player:2882707	Aznar, Marc	sr:competitor:24264	defender	ESP	33
sr:player:2884777	Ba, Papa Dame	sr:competitor:24264	forward	SEN	44
sr:player:2887281	Camara Sankhare, Dawda	sr:competitor:24264	forward	MRT	46
sr:player:2888019	Andreev, Aleksandar	sr:competitor:24264	goalkeeper	BGR	43
sr:player:65528	Erceg, Ante	sr:competitor:2957	forward	HRV	50
sr:player:78730	Pinto, Ivo	sr:competitor:2957	defender	PRT	12
sr:player:128992	Koopmans, Luuk	sr:competitor:2957	goalkeeper	NLD	1
sr:player:146871	Branderhorst, Mattijs	sr:competitor:2957	goalkeeper	NLD	31
sr:player:235400	Dijks, Mitchell	sr:competitor:2957	defender	NLD	35
sr:player:277331	Halilovic, Alen	sr:competitor:2957	midfielder	HRV	10
sr:player:352964	Bastien, Samuel	sr:competitor:2957	midfielder	COD	22
sr:player:366942	Peterson, Kristoffer	sr:competitor:2957	forward	SWE	7
sr:player:780206	Da Cruz, Alessio	sr:competitor:2957	midfielder	CPV	23
sr:player:943502	Sierhuis, Kaj	sr:competitor:2957	forward	NLD	9
sr:player:1050255	Embalo, Umaro	sr:competitor:2957	forward	PRT	85
sr:player:1100647	Grujcic, Darijo	sr:competitor:2957	defender	AUT	5
sr:player:1132165	Mitrovic, Josip	sr:competitor:2957	forward	HRV	28
sr:player:1323026	Guth, Rodrigo	sr:competitor:2957	defender	BRA	14
sr:player:1492684	Rosier, Loreintz	sr:competitor:2957	midfielder	FRA	32
sr:player:1627560	Bullaude, Ezequiel	sr:competitor:2957	forward	ARG	33
sr:player:1629762	Van Ottele, Syb	sr:competitor:2957	defender	NLD	6
sr:player:1833982	Adewoye, Shawn	sr:competitor:2957	defender	BEL	4
sr:player:1977313	Michut, Edouard	sr:competitor:2957	midfielder	FRA	20
sr:player:2067857	Dahlhaus, Jasper	sr:competitor:2957	forward	NLD	8
sr:player:2130728	Aiko, Makan	sr:competitor:2957	midfielder	FRA	11
sr:player:2264967	Fosso, Ryan	sr:competitor:2957	midfielder	CHE	80
sr:player:2619461	Demir, Onur	sr:competitor:2957	\N	NLD	\N
sr:player:2659973	Martens, Niels	sr:competitor:2957	goalkeeper	NLD	40
sr:player:2700606	Broekmans, Boaz	sr:competitor:2957	goalkeeper	NLD	62
sr:player:2795457	Bayram, Ramazan	sr:competitor:2957	goalkeeper	NLD	71
sr:player:2795459	Bisschops, Daan	sr:competitor:2957	defender	NLD	37
sr:player:2801441	Hermsen, Sjors-Lowis	sr:competitor:2957	forward	NLD	27
sr:player:2803699	Schenkhuizen, Tristan	sr:competitor:2957	midfielder	NLD	38
sr:player:2830681	Tunjic, Luka	sr:competitor:2957	midfielder	BIH	77
sr:player:2833593	Yilmaz, Baran	sr:competitor:2957	defender	TUR	\N
sr:player:2864605	Korkmazyrek, Hasip	sr:competitor:2957	midfielder	TUR	39
sr:player:8959	Neuer, Manuel	sr:competitor:2672	goalkeeper	DEU	1
sr:player:26768	Ulreich, Sven	sr:competitor:2672	goalkeeper	DEU	26
sr:player:35166	Muller, Thomas	sr:competitor:2672	forward	DEU	25
sr:player:108579	Kane, Harry	sr:competitor:2672	forward	ENG	9
sr:player:146101	Dier, Eric	sr:competitor:2672	defender	ENG	15
sr:player:184661	Goretzka, Leon	sr:competitor:2672	midfielder	DEU	8
sr:player:187433	Gnabry, Serge	sr:competitor:2672	forward	DEU	7
sr:player:246999	Guerreiro, Raphael	sr:competitor:2672	defender	PRT	22
sr:player:259117	Kimmich, Joshua	sr:competitor:2672	defender	DEU	6
sr:player:280441	Coman, Kingsley	sr:competitor:2672	forward	FRA	11
sr:player:293519	Sane, Leroy	sr:competitor:2672	forward	DEU	10
sr:player:355492	Laimer, Konrad	sr:competitor:2672	midfielder	AUT	27
sr:player:364612	Palhinha, Joao	sr:competitor:2672	midfielder	PRT	16
sr:player:769139	Upamecano, Dayot	sr:competitor:2672	defender	FRA	2
sr:player:1008301	Davies, Alphonso	sr:competitor:2672	defender	CAN	19
sr:player:1091596	Peretz, Daniel	sr:competitor:2672	goalkeeper	ISR	18
sr:player:1106809	Ito, Hiroki	sr:competitor:2672	defender	JPN	21
sr:player:1272814	Min-jae, Kim	sr:competitor:2672	defender	KOR	3
sr:player:1276018	Stanisic, Josip	sr:competitor:2672	defender	HRV	44
sr:player:1717779	Olise, Michael	sr:competitor:2672	forward	FRA	17
sr:player:1725458	Boey, Sacha	sr:competitor:2672	defender	FRA	23
sr:player:1939888	Musiala, Jamal	sr:competitor:2672	midfielder	DEU	42
sr:player:2059277	Tel, Mathys	sr:competitor:2672	forward	FRA	39
sr:player:2264565	Ibrahimovic, Arijon	sr:competitor:2672	midfielder	DEU	20
sr:player:2264567	Buchmann, Tarek	sr:competitor:2672	defender	DEU	28
sr:player:2271925	Irankunda, Nestory	sr:competitor:2672	forward	AUS	98
sr:player:2272579	Pavlovic, Aleksandar	sr:competitor:2672	midfielder	DEU	45
sr:player:2298677	Jensen, Jonathan Asp	sr:competitor:2672	midfielder	DNK	95
sr:player:2439009	Dettoni, Grayson	sr:competitor:2672	defender	USA	93
sr:player:2444725	Aseko Nkili, Noel	sr:competitor:2672	midfielder	DEU	36
sr:player:2592377	Pavlesic, Anthony	sr:competitor:2672	goalkeeper	AUS	99
sr:player:2610721	Schmitt, Max	sr:competitor:2672	goalkeeper	DEU	35
sr:player:2610999	Fernandez, Javier	sr:competitor:2672	midfielder	ESP	33
sr:player:2691466	Scott, Michael	sr:competitor:2672	forward	DEU	34
sr:player:2691724	Aznou, Adam	sr:competitor:2672	defender	MAR	49
sr:player:2691732	Licina, Adin	sr:competitor:2672	midfielder	DEU	32
sr:player:2691734	Sadat, Mudaser	sr:competitor:2672	midfielder	DEU	96
sr:player:121180	Bamba, Abdoulaye	sr:competitor:1684	defender	CIV	25
sr:player:156004	Aholou, Jean Eudes	sr:competitor:1684	midfielder	CIV	6
sr:player:170129	Hanin, Florent	sr:competitor:1684	defender	FRA	26
sr:player:187993	Lopy, Joseph	sr:competitor:1684	midfielder	SEN	8
sr:player:1587754	Sanchez, Antonio	sr:competitor:2826	midfielder	ESP	18
sr:player:1632206	Valery	sr:competitor:2826	defender	ESP	16
sr:player:1834966	Costa, Samu	sr:competitor:2826	midfielder	PRT	12
sr:player:1957673	Garcia, Pere	sr:competitor:2826	goalkeeper	ESP	31
sr:player:2000165	Chiquinho	sr:competitor:2826	forward	PRT	20
sr:player:2013287	Luna, Daniel	sr:competitor:2826	midfielder	COL	33
sr:player:2055565	Roman, Leo	sr:competitor:2826	goalkeeper	ESP	13
sr:player:2263465	Llabres, Javier	sr:competitor:2826	forward	ESP	19
sr:player:2274827	Wade, Sebas	sr:competitor:2826	defender	ESP	39
sr:player:2843455	Domenec, Marc	sr:competitor:2826	midfielder	ESP	30
sr:player:2846753	Salas, Jan	sr:competitor:2826	midfielder	ESP	28
sr:player:38710	Perisic, Ivan	sr:competitor:2952	forward	HRV	5
sr:player:40878	De Jong, Luuk	sr:competitor:2952	forward	NLD	9
sr:player:249859	Benitez, Walter	sr:competitor:2952	goalkeeper	ARG	1
sr:player:363792	Karsdorp, Rick	sr:competitor:2952	defender	NLD	2
sr:player:385320	Lozano, Hirving	sr:competitor:2952	forward	MEX	27
sr:player:545968	Boscagli, Olivier	sr:competitor:2952	defender	FRA	18
sr:player:610396	Drommel, Joel	sr:competitor:2952	goalkeeper	NLD	16
sr:player:934212	Obispo, Armando	sr:competitor:2952	defender	CUW	4
sr:player:1013617	Til, Guus	sr:competitor:2952	midfielder	NLD	20
sr:player:1015035	Schouten, Jerdy	sr:competitor:2952	midfielder	NLD	22
sr:player:1046071	Veerman, Joey	sr:competitor:2952	midfielder	NLD	23
sr:player:1059329	Lang, Noa	sr:competitor:2952	forward	NLD	10
sr:player:1253708	Mauro Junior	sr:competitor:2952	midfielder	BRA	17
sr:player:1322038	Dest, Sergino	sr:competitor:2952	defender	USA	8
sr:player:1641594	Oppegard, Fredrik	sr:competitor:2952	defender	NOR	35
sr:player:1699623	Tillman, Malik	sr:competitor:2952	midfielder	USA	7
sr:player:1743381	Ledezma, Richard	sr:competitor:2952	midfielder	USA	37
sr:player:1770378	Pepi, Ricardo	sr:competitor:2952	forward	USA	14
sr:player:1948316	Saibari, Ismael	sr:competitor:2952	midfielder	MAR	34
sr:player:1985261	Bakayoko, Johan	sr:competitor:2952	forward	BEL	11
sr:player:2064961	Driouech, Couhaib	sr:competitor:2952	forward	MAR	21
sr:player:2136418	Nagalo, Adamo	sr:competitor:2952	defender	BFA	39
sr:player:2152792	Van De Blaak, Emmanuel	sr:competitor:2952	defender	NLD	\N
sr:player:2153424	Babadi, Isaac	sr:competitor:2952	midfielder	NLD	26
sr:player:2204328	Schiks, Niek	sr:competitor:2952	goalkeeper	NLD	24
sr:player:2264143	Dams, Matteo	sr:competitor:2952	defender	BEL	32
sr:player:2333599	Flamingo, Ryan	sr:competitor:2952	defender	NLD	6
sr:player:2436207	Smolenaars, Tijn	sr:competitor:2952	goalkeeper	NLD	51
sr:player:2525315	Land, Tygo	sr:competitor:2952	midfielder	NLD	28
sr:player:2572143	Uneken, Jesper	sr:competitor:2952	forward	NLD	\N
sr:player:2611497	Kuhn, Wessel	sr:competitor:2952	defender	NLD	\N
sr:player:2839423	Bresser, Michael	sr:competitor:2952	defender	USA	33
sr:player:74545	Bacuna, Leandro	sr:competitor:2951	defender	CUW	7
sr:player:76160	Peersman, Marvin	sr:competitor:2951	defender	BEL	43
sr:player:125432	Van Veen, Kevin	sr:competitor:2951	forward	NLD	\N
sr:player:235404	Pelupessy, Joey	sr:competitor:2951	midfielder	NLD	4
sr:player:339941	Jurjus, Hidde	sr:competitor:2951	goalkeeper	NLD	21
sr:player:885844	Vaessen, Etienne	sr:competitor:2951	goalkeeper	SUR	1
sr:player:939960	Rente, Marco	sr:competitor:2951	defender	DEU	5
sr:player:991175	Hove, Johan	sr:competitor:2951	midfielder	NOR	8
sr:player:1021175	Mendes, Rui	sr:competitor:2951	forward	PRT	27
sr:player:1060507	Willumsson Andersen, Brynjolfur	sr:competitor:2951	midfielder	ISL	9
sr:player:1115921	Oosting, Thijs	sr:competitor:2951	midfielder	NLD	25
sr:player:1382083	Musampa, Nordin	sr:competitor:2951	defender	NLD	24
sr:player:1860050	Postema, Romano	sr:competitor:2951	forward	NLD	29
sr:player:2000415	Slor, Kian	sr:competitor:2951	forward	NLD	38
sr:player:2099304	Resink, Stije	sr:competitor:2951	defender	NLD	6
sr:player:2138128	Mortensen, Alex	sr:competitor:2951	forward	SWE	33
sr:player:2159234	Valente, Luciano	sr:competitor:2951	midfielder	ITA	10
sr:player:2159238	Blokzijl, Thijmen	sr:competitor:2951	defender	NLD	3
sr:player:2159240	De Jonge, Tika	sr:competitor:2951	midfielder	NLD	18
sr:player:2297939	Stam, Finn	sr:competitor:2951	defender	NLD	22
sr:player:2310981	Emeran, Noam	sr:competitor:2951	forward	FRA	11
sr:player:2316783	Baron, Dirk	sr:competitor:2951	goalkeeper	NLD	24
sr:player:2461033	Van Bergen, Thom	sr:competitor:2951	forward	NLD	26
sr:player:2475393	Schreuders, Jorg	sr:competitor:2951	midfielder	NLD	14
sr:player:2478067	Meijster, Jasper	sr:competitor:2951	goalkeeper	NLD	44
sr:player:2535075	Mariani, Maxim	sr:competitor:2951	defender	NLD	36
sr:player:2615845	Turay, Fofin	sr:competitor:2951	forward	NLD	23
sr:player:2686991	Prins, Wouter	sr:competitor:2951	defender	NLD	2
sr:player:2745407	Eggens, Nils	sr:competitor:2951	forward	NLD	57
sr:player:2748139	Leicester, Roy	sr:competitor:2951	defender	NLD	70
sr:player:2761031	Bouland, Sven	sr:competitor:2951	defender	NLD	67
sr:player:2836915	Speelman, Marco	sr:competitor:2951	defender	NLD	56
sr:player:24937	Riemann, Manuel	sr:competitor:2542	goalkeeper	DEU	\N
sr:player:97923	Horn, Timo	sr:competitor:2542	goalkeeper	DEU	1
sr:player:117794	Gamboa, Cristian	sr:competitor:2542	defender	CRI	2
sr:player:119179	Losilla, Anthony	sr:competitor:2542	midfielder	FRA	8
sr:player:132607	Drewes, Patrick	sr:competitor:2542	goalkeeper	DEU	27
sr:player:137673	Ordets, Ivan	sr:competitor:2542	defender	UKR	20
sr:player:2593515	Medenica, Djordjije	sr:competitor:2859	goalkeeper	CZE	35
sr:player:2788169	Risco, Alberto	sr:competitor:2859	midfielder	ESP	26
sr:player:2801755	Uche, Christantus	sr:competitor:2859	midfielder	NGA	6
sr:player:2841389	Ferrer, Diego	sr:competitor:2859	defender	ESP	40
sr:player:2859181	Trilla, Guillem	sr:competitor:2859	defender	ESP	33
sr:player:138837	Kongolo, Terence	sr:competitor:2947	defender	NLD	23
sr:player:168437	Kortsmit, Roy	sr:competitor:2947	goalkeeper	NLD	1
sr:player:187031	Omarsson, Elias Mar	sr:competitor:2947	forward	ISL	10
sr:player:215112	Boere, Tom	sr:competitor:2947	forward	NLD	19
sr:player:226762	Jensen, Fredrik	sr:competitor:2947	midfielder	NOR	20
sr:player:336811	Leemans, Clint	sr:competitor:2947	midfielder	NLD	8
sr:player:571964	Mahmutovic, Enes	sr:competitor:2947	defender	LUX	15
sr:player:584910	Van den Bergh, Jan	sr:competitor:2947	defender	BEL	5
sr:player:597298	Koscelnik, Martin	sr:competitor:2947	defender	SVK	3
sr:player:897282	Janosek, Dominik	sr:competitor:2947	midfielder	CZE	39
sr:player:1059259	Kemper, Boy	sr:competitor:2947	defender	NLD	4
sr:player:1138113	Kostorz, Kacper	sr:competitor:2947	midfielder	POL	9
sr:player:1244532	Royo, Manel	sr:competitor:2947	defender	ESP	21
sr:player:1357684	Lucassen, Boyd	sr:competitor:2947	defender	NLD	2
sr:player:1382297	Greiml, Leo	sr:competitor:2947	defender	AUT	12
sr:player:1513541	Bielica, Daniel	sr:competitor:2947	goalkeeper	POL	99
sr:player:1628994	Troost, Tein	sr:competitor:2947	goalkeeper	NLD	49
sr:player:1644836	Van Lare, Aron	sr:competitor:2947	goalkeeper	NLD	37
sr:player:1957335	Garbett, Matthew	sr:competitor:2947	midfielder	NZL	7
sr:player:2053307	Kuijpers, Roy	sr:competitor:2947	forward	NLD	17
sr:player:2067929	Staring, Casper	sr:competitor:2947	midfielder	NLD	6
sr:player:2114132	Balard, Maximilien	sr:competitor:2947	midfielder	AUS	16
sr:player:2156094	Kaied, Adam	sr:competitor:2947	forward	SWE	14
sr:player:2297861	Sauer, Leo	sr:competitor:2947	forward	SVK	77
sr:player:2330179	Paula, Raul	sr:competitor:2947	midfielder	DEU	11
sr:player:2666137	Mol, Lars	sr:competitor:2947	midfielder	NLD	28
sr:player:2670801	Rached, Mostapha	sr:competitor:2947	forward	MAR	29
sr:player:2671411	Fernandes, Sana	sr:competitor:2947	forward	PRT	19
sr:player:2680669	Jaddi, Aimane	sr:competitor:2947	midfielder	NLD	30
sr:player:2757327	Valerius, Cherrion	sr:competitor:2947	defender	NLD	25
sr:player:2843373	van Reeuwijk, Daan	sr:competitor:2947	defender	NLD	18
sr:player:37096	Gulacsi, Peter	sr:competitor:36360	goalkeeper	HUN	1
sr:player:84251	Kampl, Kevin	sr:competitor:36360	midfielder	SVN	44
sr:player:135264	Poulsen, Yussuf	sr:competitor:36360	forward	DNK	9
sr:player:136924	Orban, Willi	sr:competitor:36360	defender	HUN	4
sr:player:148263	Zingerle, Leopold	sr:competitor:36360	goalkeeper	DEU	25
sr:player:190159	Silva, Andre	sr:competitor:36360	forward	PRT	19
sr:player:319853	Klostermann, Lukas	sr:competitor:36360	defender	DEU	16
sr:player:319857	Henrichs, Benjamin	sr:competitor:36360	defender	DEU	39
sr:player:355504	Schlager, Xaver	sr:competitor:36360	midfielder	AUT	24
sr:player:820038	Raum, David	sr:competitor:36360	defender	DEU	22
sr:player:915744	Elmas, Eljif	sr:competitor:36360	midfielder	MKD	6
sr:player:919114	Haidara, Amadou	sr:competitor:36360	midfielder	MLI	8
sr:player:934870	Baumgartner, Christoph	sr:competitor:36360	midfielder	AUT	14
sr:player:973773	Openda, Lois	sr:competitor:36360	forward	BEL	11
sr:player:1064544	Geertruida, Lutsharel	sr:competitor:36360	defender	NLD	3
sr:player:1382307	Seiwald, Nicolas	sr:competitor:36360	midfielder	AUT	13
sr:player:1479828	Vandevoordt, Maarten	sr:competitor:36360	goalkeeper	BEL	26
sr:player:1632970	Sesko, Benjamin	sr:competitor:36360	forward	SVN	30
sr:player:1643388	Lukeba, Castello	sr:competitor:36360	defender	FRA	23
sr:player:1885046	Simons, Xavi	sr:competitor:36360	forward	NLD	10
sr:player:2160154	Nusa, Antonio	sr:competitor:36360	forward	NOR	7
sr:player:2180220	Bitshiabu, El Chadaille	sr:competitor:36360	defender	FRA	5
sr:player:2355167	Vermeeren, Arthur	sr:competitor:36360	midfielder	BEL	18
sr:player:2610749	Ouedraogo, Assan	sr:competitor:36360	midfielder	DEU	20
sr:player:2723206	Jatta, Nuha	sr:competitor:36360	midfielder	DEU	38
sr:player:2835173	Gebel, Viggo	sr:competitor:36360	midfielder	DEU	47
sr:player:15004	Theuerkauf, Norman	sr:competitor:5885	defender	DEU	30
sr:player:96098	Eicher, Vitus	sr:competitor:5885	goalkeeper	DEU	22
sr:player:121908	Muller, Kevin	sr:competitor:5885	goalkeeper	DEU	1
sr:player:122578	Thomalla, Denis	sr:competitor:5885	forward	DEU	11
sr:player:168861	Busch, Marnon	sr:competitor:5885	defender	DEU	2
sr:player:254429	Mainka, Patrick	sr:competitor:5885	defender	DEU	6
sr:player:311676	Fohrenbach, Jonas	sr:competitor:5885	defender	DEU	19
sr:player:548086	Gimber, Benedikt	sr:competitor:5885	defender	DEU	5
sr:player:573072	Conteh, Sirlord	sr:competitor:5885	forward	DEU	31
sr:player:575952	Honsak, Mathias	sr:competitor:5885	midfielder	AUT	17
sr:player:612642	Beck, Adrian	sr:competitor:5885	midfielder	DEU	21
sr:player:822572	Dorsch, Niklas	sr:competitor:5885	midfielder	DEU	39
sr:player:877982	Traore, Omar	sr:competitor:5885	defender	DEU	23
sr:player:1005935	Schimmer, Stefan	sr:competitor:5885	forward	DEU	9
sr:player:1256926	Maloney, Lennard	sr:competitor:5885	defender	USA	33
sr:player:1296454	Siersleben, Tim	sr:competitor:5885	defender	DEU	4
sr:player:1321932	Niehues, Julian	sr:competitor:5885	midfielder	DEU	16
sr:player:1343472	Pieringer, Marvin	sr:competitor:5885	forward	DEU	18
sr:player:1322978	Cisse, Seydouba	sr:competitor:2845	midfielder	GIN	8
sr:player:1488090	Cruz, Juan	sr:competitor:2845	forward	ESP	11
sr:player:1566732	De la Fuente, Miguel	sr:competitor:2845	forward	ESP	9
sr:player:1614320	Lopez, Roberto	sr:competitor:2845	forward	ESP	21
sr:player:1624430	Bachiller, Iker	sr:competitor:2845	defender	ESP	28
sr:player:1644298	Altimira, Adria	sr:competitor:2845	defender	ESP	2
sr:player:1720818	Porozo, Jackson	sr:competitor:2845	defender	ECU	4
sr:player:2159312	Garcia, Diego	sr:competitor:2845	forward	ESP	19
sr:player:2202910	Garcia, Naim	sr:competitor:2845	forward	ESP	27
sr:player:2266513	Fernandez, Daniel Ballesteros	sr:competitor:2845	forward	ESP	26
sr:player:2387707	Rodriguez, Fer	sr:competitor:2845	midfielder	ESP	33
sr:player:2501259	Solozabal Granados, Hugo	sr:competitor:2845	midfielder	ESP	32
sr:player:2662407	Alvin	sr:competitor:2845	goalkeeper	ESP	36
sr:player:2825741	Urbaez, Joao	sr:competitor:2845	defender	DOM	35
sr:player:2888167	El Haddadi, Suleiman	sr:competitor:2845	forward	MAR	29
sr:player:133168	Nauber, Gerrit	sr:competitor:2979	defender	DEU	3
sr:player:360006	Stokkers, Finn	sr:competitor:2979	forward	NLD	27
sr:player:823298	Kramer, Joris	sr:competitor:2979	defender	NLD	4
sr:player:824526	Deijl, Mats	sr:competitor:2979	defender	NLD	2
sr:player:860072	Edvardsen, Victor	sr:competitor:2979	forward	SWE	16
sr:player:934236	Adekanye, Bobby	sr:competitor:2979	forward	NLD	11
sr:player:979511	De Busser, Jari	sr:competitor:2979	goalkeeper	BEL	22
sr:player:1083858	Plogmann, Luca	sr:competitor:2979	goalkeeper	DEU	1
sr:player:1127829	Edvardsen, Oliver Valaker	sr:competitor:2979	forward	NOR	23
sr:player:1297602	Suray, Mathis	sr:competitor:2979	forward	BEL	17
sr:player:1382089	Llansana, Enric	sr:competitor:2979	midfielder	NLD	21
sr:player:1436960	Linthorst, Evert	sr:competitor:2979	midfielder	NLD	8
sr:player:1704363	Antman, Oliver	sr:competitor:2979	forward	FIN	19
sr:player:1730619	Amofa, Jamal	sr:competitor:2979	defender	NLD	25
sr:player:1793398	Tengstedt, Soren	sr:competitor:2979	forward	DNK	10
sr:player:1969767	Dirksen, Julius	sr:competitor:2979	defender	NLD	26
sr:player:2042789	Breum, Jakob	sr:competitor:2979	midfielder	DNK	7
sr:player:2062395	James, Dean	sr:competitor:2979	defender	NLD	5
sr:player:2084213	Twigt, Calvin	sr:competitor:2979	midfielder	NLD	6
sr:player:2099302	Jansen, Sven	sr:competitor:2979	goalkeeper	NLD	30
sr:player:2202966	Everink, Luca	sr:competitor:2979	defender	NLD	24
sr:player:2289495	Verdoni, Nando	sr:competitor:2979	goalkeeper	NLD	33
sr:player:2327749	Smit, Milan	sr:competitor:2979	forward	NLD	9
sr:player:2411899	Saathof, Pim	sr:competitor:2979	midfielder	NLD	28
sr:player:2411905	Weijenberg, Robbin	sr:competitor:2979	midfielder	NLD	15
sr:player:2411933	Adelgaard, Aske	sr:competitor:2979	defender	DNK	29
sr:player:2475373	de Lannoy, Maurilio	sr:competitor:2979	midfielder	NLD	34
sr:player:2719070	Ghafour, Dielan	sr:competitor:2979	midfielder	NLD	31
sr:player:2830657	Apinsa, Donte	sr:competitor:2979	defender	SUR	32
sr:player:8772	Sippel, Tobias	sr:competitor:2527	goalkeeper	DEU	21
sr:player:95381	Stoger, Kevin	sr:competitor:2527	midfielder	AUT	7
sr:player:113920	Lainer, Stefan	sr:competitor:2527	defender	AUT	22
sr:player:192308	Plea, Alassane	sr:competitor:2527	forward	FRA	14
sr:player:228981	Kleindienst, Tim	sr:competitor:2527	forward	DEU	11
sr:player:237068	Weigl, Julian	sr:competitor:2527	midfielder	DEU	8
sr:player:254449	Friedrich, Marvin	sr:competitor:2527	defender	DEU	5
sr:player:280453	Honorat, Franck	sr:competitor:2527	midfielder	FRA	9
sr:player:282229	Elvedi, Nico	sr:competitor:2527	defender	CHE	30
sr:player:571622	Omlin, Jonas	sr:competitor:2527	goalkeeper	CHE	1
sr:player:578166	Nicolas, Moritz	sr:competitor:2527	goalkeeper	DEU	33
sr:player:752928	Neuhaus, Florian	sr:competitor:2527	midfielder	DEU	10
sr:player:808068	Itakura, Kou	sr:competitor:2527	defender	JPN	3
sr:player:877336	Sander, Philipp	sr:competitor:2527	midfielder	DEU	16
sr:player:878110	Hack, Robin	sr:competitor:2527	midfielder	DEU	25
sr:player:1409827	Cvancara, Tomas	sr:competitor:2527	forward	CZE	31
sr:player:1428079	Scally, Joe	sr:competitor:2527	defender	USA	29
sr:player:1435485	Olschowsky, Jan	sr:competitor:2527	goalkeeper	DEU	41
sr:player:1632514	N`Goumou, Nathan	sr:competitor:2527	midfielder	FRA	19
sr:player:1652045	Brull, Maximilian	sr:competitor:2527	goalkeeper	DEU	43
sr:player:1718626	Netz, Luca	sr:competitor:2527	defender	DEU	20
sr:player:2057157	Reitz, Rocco	sr:competitor:2527	midfielder	DEU	27
sr:player:2190980	Ranos, Grant Leon	sr:competitor:2527	forward	ARM	28
sr:player:2212692	Borges Sanches, Yvandro	sr:competitor:2527	forward	LUX	38
sr:player:2234608	Chiarodia, Fabio	sr:competitor:2527	defender	ITA	2
sr:player:2354431	Walde, Simon	sr:competitor:2527	defender	DEU	45
sr:player:2412049	Ullrich, Lukas	sr:competitor:2527	defender	DEU	26
sr:player:2609359	Fukuda, Shio	sr:competitor:2527	forward	JPN	13
sr:player:2610741	Herrmann, Charles	sr:competitor:2527	midfielder	DEU	34
sr:player:155818	Minamino, Takumi	sr:competitor:1653	midfielder	JPN	18
sr:player:281277	Kehrer, Thilo	sr:competitor:1653	defender	DEU	5
sr:player:318963	Golovin, Aleksandr	sr:competitor:1653	midfielder	RUS	10
sr:player:352296	Embolo, Breel	sr:competitor:1653	forward	CHE	36
sr:player:770677	Zakaria, Denis	sr:competitor:1653	midfielder	CHE	6
sr:player:878264	Kohn, Philipp	sr:competitor:1653	goalkeeper	CHE	16
sr:player:934216	Teze, Jordan	sr:competitor:1653	defender	NLD	4
sr:player:352544	Becker, Sheraldo	sr:competitor:2824	forward	SUR	11
sr:player:353250	Odriozola, Alvaro	sr:competitor:2824	defender	ESP	2
sr:player:362014	Traore, Hamari	sr:competitor:2824	defender	MLI	18
sr:player:547254	Mendez, Brais	sr:competitor:2824	midfielder	ESP	23
sr:player:754710	Sadiq, Umar	sr:competitor:2824	forward	NGA	19
sr:player:785701	Elustondo, Aritz	sr:competitor:2824	defender	ESP	6
sr:player:791759	Remiro, Alex	sr:competitor:2824	goalkeeper	ESP	1
sr:player:924002	Oyarzabal, Mikel	sr:competitor:2824	forward	ESP	10
sr:player:982371	Zubeldia, Igor	sr:competitor:2824	midfielder	ESP	5
sr:player:1051087	Gomez, Sergio	sr:competitor:2824	forward	ESP	17
sr:player:1117645	Aguerd, Nayef	sr:competitor:2824	defender	MAR	21
sr:player:1133625	Kubo, Takefusa	sr:competitor:2824	midfielder	JPN	14
sr:player:1384079	Munoz, Aihen	sr:competitor:2824	defender	ESP	3
sr:player:1479954	Pacheco, Jon	sr:competitor:2824	defender	ESP	20
sr:player:1561854	Lopez, Javi	sr:competitor:2824	defender	ESP	12
sr:player:1581178	Sucic, Luka	sr:competitor:2824	midfielder	HRV	24
sr:player:1652621	Barrenetxea, Ander	sr:competitor:2824	forward	ESP	7
sr:player:1724782	Turrientes, Benat	sr:competitor:2824	midfielder	ESP	22
sr:player:1725982	Zubimendi, Martin	sr:competitor:2824	midfielder	ESP	4
sr:player:1748491	Oskarsson, Orri	sr:competitor:2824	forward	ISL	9
sr:player:1987765	Zakharyan, Arsen	sr:competitor:2824	midfielder	RUS	8
sr:player:2071001	Gonzalez de Zarate, Urko	sr:competitor:2824	defender	ESP	15
sr:player:2092815	Aramburu, Jon	sr:competitor:2824	defender	VEN	27
sr:player:2110752	Marrero, Unai	sr:competitor:2824	goalkeeper	ESP	13
sr:player:2144858	Olasagasti, Jon Ander	sr:competitor:2824	midfielder	ESP	16
sr:player:2202898	Magunacelaya, Jon	sr:competitor:2824	midfielder	ESP	25
sr:player:2214090	Marin, Pablo	sr:competitor:2824	midfielder	ESP	28
sr:player:2281973	Arana, Egoitz	sr:competitor:2824	goalkeeper	ESP	35
sr:player:2611395	Martin, Jon	sr:competitor:2824	defender	ESP	31
sr:player:2666237	Fraga, Aitor	sr:competitor:2824	goalkeeper	ESP	32
sr:player:27691	Tyton, Przemyslaw	sr:competitor:2955	goalkeeper	POL	22
sr:player:35193	Van Wolfswinkel, Ricky	sr:competitor:2955	forward	NLD	9
sr:player:94835	Unnerstall, Lars	sr:competitor:2955	goalkeeper	DEU	1
sr:player:339879	Kuipers, Bas	sr:competitor:2955	defender	NLD	5
sr:player:756256	Sadilek, Michal	sr:competitor:2955	midfielder	CZE	23
sr:player:758590	Eiting, Carel	sr:competitor:2955	midfielder	NLD	6
sr:player:856260	Vlap, Michel	sr:competitor:2955	midfielder	NLD	18
sr:player:870302	Lammers, Sam	sr:competitor:2955	forward	NLD	10
sr:player:942300	Van Bergen, Mitchell	sr:competitor:2955	forward	NLD	7
sr:player:1302914	El Maach, Issam	sr:competitor:2955	goalkeeper	MAR	16
sr:player:1380765	Kjolo, Mathias	sr:competitor:2955	midfielder	NOR	4
sr:player:1555399	Steijn, Sem	sr:competitor:2955	midfielder	NLD	14
sr:player:1566906	Van Rooij, Bart	sr:competitor:2955	defender	NLD	28
sr:player:1629758	Salah-Eddine, Anass	sr:competitor:2955	defender	NLD	34
sr:player:1646312	Lagerbielke, Gustaf	sr:competitor:2955	defender	SWE	3
sr:player:1695331	Van Hoorenbeeck, Alec	sr:competitor:2955	defender	BEL	17
sr:player:1884366	Regeer, Youri	sr:competitor:2955	midfielder	NLD	8
sr:player:2046909	Ltaief, Sayfallah	sr:competitor:2955	forward	TUN	30
sr:player:2078279	Hilgers, Mees	sr:competitor:2955	defender	IDN	2
sr:player:2089821	Rots, Daan	sr:competitor:2955	forward	NLD	11
sr:player:2101360	Bruns, Max	sr:competitor:2955	midfielder	NLD	38
sr:player:2231850	Taha El Idrissi, Younes	sr:competitor:2955	midfielder	NLD	19
sr:player:2331809	Karssies, Sam	sr:competitor:2955	goalkeeper	NLD	21
sr:player:2566811	Besselink, Gijs	sr:competitor:2955	midfielder	NLD	41
sr:player:2566813	Rots, Mats	sr:competitor:2955	defender	NLD	39
sr:player:2586635	Mesbahi, Julien	sr:competitor:2955	defender	NLD	24
sr:player:2837325	Kuster, Harrie	sr:competitor:2955	midfielder	NLD	29
sr:player:2880109	Panneflek, Owen	sr:competitor:2955	forward	NLD	37
sr:player:49639	Hofler, Nicolas	sr:competitor:2538	midfielder	DEU	27
sr:player:71952	Gulde, Manuel	sr:competitor:2538	defender	DEU	5
sr:player:111483	Gregoritsch, Michael	sr:competitor:2538	forward	AUT	38
sr:player:142231	Gunter, Christian	sr:competitor:2538	defender	DEU	30
sr:player:142259	Ginter, Matthias	sr:competitor:2538	defender	DEU	28
sr:player:142525	Kubler, Lukas	sr:competitor:2538	defender	DEU	17
sr:player:171927	Philipp, Maximilian	sr:competitor:2538	forward	DEU	26
sr:player:171961	Grifo, Vincenzo	sr:competitor:2538	midfielder	ITA	32
sr:player:174341	Huth, Jannik	sr:competitor:2538	goalkeeper	DEU	24
sr:player:280009	Holer, Lucas	sr:competitor:2538	forward	DEU	9
sr:player:569684	Kyereh, Daniel-Kofi	sr:competitor:2538	midfielder	GHA	11
sr:player:569784	Eggestein, Maximilian	sr:competitor:2538	midfielder	DEU	8
sr:player:576266	Lienhart, Philipp	sr:competitor:2538	defender	AUT	3
sr:player:612672	Rudlin, Fabian	sr:competitor:2538	midfielder	DEU	35
sr:player:753006	Muller, Florian	sr:competitor:2538	goalkeeper	DEU	21
sr:player:772787	Doan, Ritsu	sr:competitor:2538	midfielder	JPN	42
sr:player:916178	Muslija, Florent	sr:competitor:2538	midfielder	KOS	23
sr:player:1130699	Osterhage, Patrick	sr:competitor:2538	midfielder	DEU	6
sr:player:1302788	Adamu, Junior	sr:competitor:2538	forward	AUT	20
sr:player:1373859	Atubolu, Noah	sr:competitor:2538	goalkeeper	DEU	1
sr:player:1411321	Weisshaupt, Noah	sr:competitor:2538	midfielder	DEU	7
sr:player:1585268	Schmidt, Kenneth	sr:competitor:2538	defender	DEU	4
sr:player:2502657	Mandiang, Saliou	sr:competitor:6577	forward	SEN	34
sr:player:2612151	Rojas, Carlos	sr:competitor:6577	midfielder	ESP	\N
sr:player:2661723	Herzog, Juanma	sr:competitor:6577	defender	ESP	28
sr:player:2766925	Killane, Alvaro	sr:competitor:6577	goalkeeper	ARG	30
sr:player:2836709	Pezzolesi, Valentin	sr:competitor:6577	defender	ARG	27
sr:player:2850743	Puig, Victor	sr:competitor:6577	goalkeeper	ESP	31
sr:player:2888093	Viera, Sergio	sr:competitor:6577	midfielder	ESP	33
sr:player:2888095	Valentino	sr:competitor:6577	defender	ESP	32
sr:player:9874	Vermeer, Kenneth	sr:competitor:2971	goalkeeper	NLD	25
sr:player:235538	Namli, Younes	sr:competitor:2971	midfielder	DNK	7
sr:player:333571	Thomas, Ryan	sr:competitor:2971	midfielder	NZL	30
sr:player:376448	Hauptmeijer, Mike	sr:competitor:2971	goalkeeper	NLD	40
sr:player:758582	Floranus, Sherel	sr:competitor:2971	defender	CUW	2
sr:player:877976	Manu, Braydon	sr:competitor:2971	midfielder	DEU	77
sr:player:906702	Monteiro, Jamiro	sr:competitor:2971	midfielder	CPV	35
sr:player:934230	Vente, Dylan	sr:competitor:2971	forward	SUR	9
sr:player:1015009	Velanas, Odysseus	sr:competitor:2971	midfielder	NLD	18
sr:player:1058419	Van Den Berg, Davy	sr:competitor:2971	midfielder	NLD	10
sr:player:1062128	Lutonda, Thierry	sr:competitor:2971	defender	BEL	5
sr:player:1064538	Schendelaar, Jasper	sr:competitor:2971	goalkeeper	NLD	1
sr:player:1064556	Buitink, Thomas	sr:competitor:2971	forward	NLD	29
sr:player:1398645	Fontana, Anthony	sr:competitor:2971	midfielder	USA	17
sr:player:1402465	Mbayo, Dylan	sr:competitor:2971	forward	BEL	11
sr:player:1413687	Graves, Simon	sr:competitor:2971	defender	DNK	28
sr:player:1416361	de Rooij, Kaj	sr:competitor:2971	forward	NLD	22
sr:player:1484552	Krastev, Filip Yavorov	sr:competitor:2971	midfielder	BGR	50
sr:player:1627704	Reijnders, Eliano	sr:competitor:2971	midfielder	IDN	23
sr:player:1737565	Garcia MacNulty, Anselmo	sr:competitor:2971	defender	IRL	4
sr:player:1988321	Lagsir, Samir	sr:competitor:2971	forward	NLD	21
sr:player:2060619	Aertssen, Olivier	sr:competitor:2971	defender	NLD	3
sr:player:2200046	El Azzouzi, Anouar	sr:competitor:2971	midfielder	MAR	6
sr:player:2265645	Gooijer, Tristan	sr:competitor:2971	defender	NLD	47
sr:player:2286677	van der Haar, Damian	sr:competitor:2971	defender	NLD	33
sr:player:2412133	Verduin, Duke	sr:competitor:2971	goalkeeper	NLD	41
sr:player:2463823	Gijselhart, Teun	sr:competitor:2971	midfielder	NLD	38
sr:player:2476649	Oukhattou, Mohamed	sr:competitor:2971	midfielder	NLD	37
sr:player:2619479	Kroeze, Rodney	sr:competitor:2971	defender	NLD	\N
sr:player:2661749	Fichtinger, Nick	sr:competitor:2971	midfielder	NLD	34
sr:player:2757183	Ruward, Dylan	sr:competitor:2971	defender	NLD	35
sr:player:152463	Bredlow, Fabian	sr:competitor:2677	goalkeeper	DEU	1
sr:player:326705	Karazor, Atakan	sr:competitor:2677	midfielder	TUR	16
sr:player:352562	Stenzel, Pascal	sr:competitor:2677	defender	DEU	15
sr:player:584722	Nubel, Alexander	sr:competitor:2677	goalkeeper	DEU	33
sr:player:611022	Mittelstadt, Maximilian	sr:competitor:2677	defender	DEU	7
sr:player:769317	Demirovic, Ermedin	sr:competitor:2677	forward	BIH	9
sr:player:826647	Undav, Deniz	sr:competitor:2677	forward	DEU	26
sr:player:881112	Chabot, Julian	sr:competitor:2677	defender	DEU	24
sr:player:907834	Zagadou, Dan	sr:competitor:2677	defender	FRA	23
sr:player:1021037	Fuhrich, Chris	sr:competitor:2677	midfielder	DEU	27
sr:player:1071192	Drljaca, Stefan	sr:competitor:2677	goalkeeper	DEU	21
sr:player:1117867	Keitel, Yannik	sr:competitor:2677	midfielder	DEU	5
sr:player:1128295	Vagnoman, Josha	sr:competitor:2677	defender	DEU	4
sr:player:1128963	Nartey, Nikolas	sr:competitor:2677	midfielder	DNK	28
sr:player:1297586	Stiller, Angelo	sr:competitor:2677	midfielder	DEU	6
sr:player:1298442	Hendriks, Ramon	sr:competitor:2677	defender	NLD	3
sr:player:1373863	Leweling, Jamie	sr:competitor:2677	forward	DEU	18
sr:player:1425267	Rieder, Fabian	sr:competitor:2677	midfielder	CHE	32
sr:player:1612032	Millot, Enzo	sr:competitor:2677	midfielder	FRA	8
sr:player:1635866	Stergiou, Leonidas	sr:competitor:2677	defender	CHE	20
sr:player:1644574	Al-Dakhil, Ameen	sr:competitor:2677	defender	BEL	2
sr:player:1724622	Woltemade, Nick	sr:competitor:2677	forward	DEU	11
sr:player:1724630	Faghir, Wahid	sr:competitor:2677	forward	DNK	19
sr:player:1737557	Toure, El Bilal	sr:competitor:2677	forward	MLI	10
sr:player:1873722	Rouault, Anthony	sr:competitor:2677	defender	FRA	29
sr:player:1987749	Kastanaras, Thomas	sr:competitor:2677	forward	DEU	22
sr:player:2354421	Seimen, Dennis	sr:competitor:2677	goalkeeper	DEU	41
sr:player:2363497	Chase, Anrie	sr:competitor:2677	defender	JPN	45
sr:player:2396061	Kratzig, Frans	sr:competitor:2677	defender	DEU	13
sr:player:2543283	Diehl, Justin	sr:competitor:2677	forward	DEU	17
sr:player:2610767	Malanga, Jarzinho	sr:competitor:2677	forward	DEU	47
sr:player:2687063	Raimund, Luca	sr:competitor:2677	midfielder	DEU	40
sr:player:2828785	Olivier, Christopher	sr:competitor:2677	midfielder	AUT	31
sr:player:72818	Maubleu, Brice	sr:competitor:1678	goalkeeper	FRA	1
sr:player:123164	Appiah, Dennis	sr:competitor:1678	defender	FRA	8
sr:player:150865	Monconduit, Thomas	sr:competitor:1678	midfielder	FRA	7
sr:player:178721	Abdelhamid, Yunis	sr:competitor:1678	defender	MAR	5
sr:player:234142	Tardieu, Florian	sr:competitor:1678	midfielder	FRA	10
sr:player:352912	Batubinsika, Dylan	sr:competitor:1678	defender	COD	21
sr:player:558522	Briancon, Anthony	sr:competitor:1678	defender	FRA	23
sr:player:816580	Wadji, Ibrahima	sr:competitor:1678	forward	SEN	25
sr:player:2150446	Veliz, Alejo	sr:competitor:2814	forward	ARG	9
sr:player:2202890	Smith, Justin	sr:competitor:2814	defender	FRA	\N
sr:player:2264941	Jurado, Marc	sr:competitor:2814	defender	ESP	\N
sr:player:2415451	Romero, Carlos	sr:competitor:2814	defender	ESP	22
sr:player:2592641	Puig Mateos, Joan	sr:competitor:2814	defender	ESP	26
sr:player:2623411	Fernandez, Angel	sr:competitor:2814	defender	ESP	40
sr:player:2666285	Roca, Antoniu	sr:competitor:2814	forward	ESP	31
sr:player:2719008	Sadik, Omar	sr:competitor:2814	forward	MAR	32
sr:player:2725672	Catala, Jose Luis	sr:competitor:2814	defender	ESP	27
sr:player:2741733	Almansa, Alex	sr:competitor:2814	midfielder	ESP	39
sr:player:2777317	Serred, Llorenc	sr:competitor:2814	goalkeeper	ESP	34
sr:player:2787587	Bauza, Rafael	sr:competitor:2814	midfielder	ESP	35
sr:player:13028	De Guzman, Jonathan	sr:competitor:2960	midfielder	NLD	21
sr:player:74577	Van Aanholt, Patrick	sr:competitor:2960	defender	NLD	\N
sr:player:227192	Olij, Nick	sr:competitor:2960	goalkeeper	NLD	1
sr:player:578344	Verschueren, Arno	sr:competitor:2960	midfielder	BEL	10
sr:player:776391	Clement, Pelle	sr:competitor:2960	midfielder	NLD	6
sr:player:846119	Lauritsen, Tobias	sr:competitor:2960	forward	NOR	9
sr:player:934208	Reith, Boyd	sr:competitor:2960	defender	NLD	2
sr:player:1270832	Bakari, Said	sr:competitor:2960	midfielder	COM	5
sr:player:1298096	Rosanas, Sergi	sr:competitor:2960	defender	ESP	12
sr:player:1360578	Kitolano, Joshua	sr:competitor:2960	midfielder	NOR	8
sr:player:1573416	Eerdhuijzen, Mike	sr:competitor:2960	defender	NLD	4
sr:player:1651133	Van der Kust, Djevencio	sr:competitor:2960	defender	SUR	5
sr:player:1795142	Brym, Charles-Andreas	sr:competitor:2960	forward	CAN	19
sr:player:1840020	Schoonderwaldt, Youri	sr:competitor:2960	goalkeeper	NLD	20
sr:player:1957669	Mito, Shunsuke	sr:competitor:2960	midfielder	JPN	17
sr:player:2054699	Quintero Leon, Teo	sr:competitor:2960	defender	VEN	3
sr:player:2062335	Baas, Julian	sr:competitor:2960	midfielder	NLD	16
sr:player:2076209	Meissen, Rick	sr:competitor:2960	defender	NLD	14
sr:player:2094056	Nassoh, Mohamed	sr:competitor:2960	midfielder	NLD	18
sr:player:2094730	Neghli, Camiel	sr:competitor:2960	midfielder	NLD	11
sr:player:2145794	Kayky	sr:competitor:2960	forward	BRA	7
sr:player:2148958	Metinho	sr:competitor:2960	midfielder	BRA	15
sr:player:2319225	Kleijn, Mike	sr:competitor:2960	midfielder	NLD	13
sr:player:2659443	Reitmaier, Kaylen	sr:competitor:2960	goalkeeper	DEU	30
sr:player:2692872	De Ligt, Max	sr:competitor:2960	defender	NLD	13
sr:player:2709718	El Dahri, Hamza	sr:competitor:2960	midfielder	NLD	15
sr:player:2767083	Bais, Aymane	sr:competitor:2960	forward	NLD	17
sr:player:2837585	Young, Marvin	sr:competitor:2960	defender	NLD	3
sr:player:2842947	Oufkir, Ayoub	sr:competitor:2960	forward	NLD	12
sr:player:2847187	Tevreden, Dylan	sr:competitor:2960	goalkeeper	NLD	30
sr:player:146853	Gouweleeuw, Jeffrey	sr:competitor:2600	defender	NLD	6
sr:player:254119	Wolf, Marius	sr:competitor:2600	midfielder	DEU	11
sr:player:345035	Mounie, Steve	sr:competitor:2600	forward	BEN	15
sr:player:354878	Giannoulis, Dimitrios	sr:competitor:2600	defender	GRC	13
sr:player:361126	Jensen, Fredrik	sr:competitor:2600	midfielder	FIN	\N
sr:player:611828	Rexhbecaj, Elvis	sr:competitor:2600	midfielder	KOS	8
sr:player:755362	Okugawa, Masaya	sr:competitor:2600	midfielder	JPN	14
sr:player:768772	Tietz, Phillip	sr:competitor:2600	forward	DEU	21
sr:player:768784	Dahmen, Finn	sr:competitor:2600	goalkeeper	DEU	1
sr:player:769095	Oxford, Reece	sr:competitor:2600	defender	ENG	4
sr:player:775681	Pedersen, Mads	sr:competitor:2600	defender	DNK	3
sr:player:820376	Gumny, Robert	sr:competitor:2600	defender	POL	2
sr:player:841415	Jakic, Kristijan	sr:competitor:2600	midfielder	HRV	17
sr:player:907866	Essende, Samuel	sr:competitor:2600	forward	COD	9
sr:player:919570	Claude-Maurice, Alexis	sr:competitor:2600	forward	FRA	20
sr:player:959744	Onyeka, Frank	sr:competitor:2600	midfielder	NGA	19
sr:player:978167	Maier, Arne	sr:competitor:2600	midfielder	DEU	10
sr:player:1083860	Bauer, Maximilian	sr:competitor:2600	defender	DEU	23
sr:player:1105877	Vargas, Ruben	sr:competitor:2600	midfielder	CHE	16
sr:player:1244858	Schlotterbeck, Keven	sr:competitor:2600	defender	DEU	31
sr:player:1428387	Klein, Daniel	sr:competitor:2600	goalkeeper	DEU	25
sr:player:1493383	Labrovic, Nediljko	sr:competitor:2600	goalkeeper	HRV	22
sr:player:1591132	Koudossou, Henri	sr:competitor:2600	midfielder	DEU	44
sr:player:1624232	Matsima, Chrislain	sr:competitor:2600	defender	FRA	5
sr:player:1939896	Kabadayi, Yusuf	sr:competitor:2600	forward	TUR	7
sr:player:2091121	Breithaupt, Tim	sr:competitor:2600	midfielder	DEU	18
sr:player:2310863	Kucuksahin, Mahmut	sr:competitor:2600	midfielder	DEU	42
sr:player:2455687	Komur, Mert	sr:competitor:2600	midfielder	DEU	36
sr:player:2717260	Banks, Noahkai	sr:competitor:2600	defender	USA	40
sr:player:27029	Mandanda, Steve	sr:competitor:1658	goalkeeper	FRA	30
sr:player:74008	Lembet, Geoffrey	sr:competitor:1658	goalkeeper	CAF	40
sr:player:292665	Kamara, Glen	sr:competitor:1658	midfielder	FIN	28
sr:player:340561	Gallon, Gauthier	sr:competitor:1658	goalkeeper	FRA	23
sr:player:344751	Santamaria, Baptiste	sr:competitor:1658	midfielder	FRA	8
sr:player:356352	Hateboer, Hans	sr:competitor:1658	defender	NLD	33
sr:player:872848	Blas, Ludovic	sr:competitor:1658	midfielder	FRA	11
sr:player:904320	Jota	sr:competitor:1658	forward	PRT	27
sr:player:936650	Ostigard, Leo	sr:competitor:1658	defender	NOR	55
sr:player:1060981	Mamardashvili, Giorgi	sr:competitor:2828	goalkeeper	GEO	25
sr:player:1278078	Rioja, Luis	sr:competitor:2828	midfielder	ESP	22
sr:player:1340428	Valera, German	sr:competitor:2828	forward	ESP	30
sr:player:1342500	Duro, Hugo	sr:competitor:2828	forward	ESP	9
sr:player:1637532	Vazquez, Jesus	sr:competitor:2828	defender	ESP	21
sr:player:1637570	Perez, Fran	sr:competitor:2828	midfielder	ESP	23
sr:player:1864906	Barrenechea, Enzo	sr:competitor:2828	midfielder	ARG	5
sr:player:1949770	Lopez, Diego	sr:competitor:2828	forward	ESP	16
sr:player:2226006	Mosquera, Cristhian	sr:competitor:2828	defender	ESP	3
sr:player:2253033	Tarrega, Cesar	sr:competitor:2828	defender	ESP	15
sr:player:2287743	Guerra Moreno, Javier	sr:competitor:2828	midfielder	ESP	8
sr:player:2297027	Tejon, Martin	sr:competitor:2828	midfielder	ESP	32
sr:player:2297035	Gasiorowski, Yarek	sr:competitor:2828	defender	ESP	24
sr:player:2611391	Jimenez, Raul	sr:competitor:2828	goalkeeper	ESP	34
sr:player:2615507	Abajas, Rodrigo	sr:competitor:2828	defender	ESP	39
sr:player:2625891	Madrigal, Warren	sr:competitor:2828	forward	CRI	42
sr:player:2739699	Otorbi, David	sr:competitor:2828	forward	ESP	27
sr:player:2849251	Cordoba, Iker	sr:competitor:2828	defender	ESP	38
sr:player:242313	van der Hart, Mickey	sr:competitor:2964	goalkeeper	NLD	13
sr:player:286097	Bochniewicz, Pawel	sr:competitor:2964	defender	POL	5
sr:player:331837	Jahanbakhsh, Alireza	sr:competitor:2964	midfielder	IRN	30
sr:player:339339	Noppert, Andries	sr:competitor:2964	goalkeeper	NLD	44
sr:player:571234	Conde, Amara	sr:competitor:2964	midfielder	DEU	6
sr:player:822588	Kohlert, Mats	sr:competitor:2964	forward	DEU	11
sr:player:824528	Brouwers, Luuk	sr:competitor:2964	midfielder	NLD	8
sr:player:914088	Olsson, Simon	sr:competitor:2964	midfielder	SWE	19
sr:player:934228	Nunnely, Che	sr:competitor:2964	forward	NLD	7
sr:player:995025	Nicolaescu, Ion	sr:competitor:2964	forward	MDA	18
sr:player:1012591	Al-Saed, Danilo	sr:competitor:2964	midfielder	IRQ	24
sr:player:1015159	Bekkema, Jan	sr:competitor:2964	goalkeeper	NLD	23
sr:player:1019995	Kersten, Sam	sr:competitor:2964	defender	NLD	4
sr:player:1298446	Hall, Denzel	sr:competitor:2964	defender	NLD	2
sr:player:1630644	Ali Haidar, Hussein	sr:competitor:2964	defender	IRQ	15
sr:player:1956476	Seland Karlsbakk, Daniel	sr:competitor:2964	forward	NOR	9
sr:player:2099326	Trenskow, Jacob	sr:competitor:2964	midfielder	DNK	20
sr:player:2159052	Soyset Hopland, Nikolai	sr:competitor:2964	defender	NOR	17
sr:player:2200882	Smans, Levi	sr:competitor:2964	midfielder	NLD	14
sr:player:2243237	Sebaoui, Ilias	sr:competitor:2964	midfielder	BEL	10
sr:player:2264845	Milovanovic, Mateja	sr:competitor:2964	defender	SRB	27
sr:player:2354405	Klaverboer, Bernt	sr:competitor:2964	goalkeeper	NLD	22
sr:player:2639261	Braude, Oliver	sr:competitor:2964	midfielder	NOR	45
sr:player:2661701	Witteveen, Melle	sr:competitor:2964	midfielder	NLD	28
sr:player:2661703	Van Ee, Espen	sr:competitor:2964	midfielder	NLD	21
sr:player:2837655	Rallis, Dimitris	sr:competitor:2964	forward	NLD	26
sr:player:2837657	Ahmed, Isaiah	sr:competitor:2964	midfielder	CUW	39
sr:player:2837659	Oostra, Ties	sr:competitor:2964	midfielder	NLD	35
sr:player:2886185	Gurbuz, Eser	sr:competitor:2964	midfielder	NLD	\N
sr:player:94312	Batz, Daniel	sr:competitor:2556	goalkeeper	DEU	33
sr:player:97926	da Costa, Danny	sr:competitor:2556	defender	DEU	21
sr:player:106662	Bell, Stefan	sr:competitor:2556	defender	DEU	16
sr:player:138126	Mwene, Philipp	sr:competitor:2556	defender	AUT	2
sr:player:152206	Kohr, Dominik	sr:competitor:2556	midfielder	DEU	31
sr:player:157377	Widmer, Silvan	sr:competitor:2556	defender	CHE	30
sr:player:165413	Onisiwo, Karim	sr:competitor:2556	forward	AUT	9
sr:player:174345	Zentner, Robin	sr:competitor:2556	goalkeeper	DEU	27
sr:player:327755	Amiri, Nadiem	sr:competitor:2556	midfielder	DEU	18
sr:player:355172	Hanche-Olsen, Andreas	sr:competitor:2556	defender	NOR	25
sr:player:537552	Jae-sung, Lee	sr:competitor:2556	midfielder	KOR	7
sr:player:878250	Barkok, Aymen	sr:competitor:2556	midfielder	MAR	4
sr:player:878526	Leitsch, Maxim	sr:competitor:2556	defender	DEU	5
sr:player:1016929	Caci, Anthony	sr:competitor:2556	defender	FRA	19
sr:player:1058473	Mamutovic, David	sr:competitor:2556	forward	DEU	45
sr:player:1276120	Burkardt, Jonathan	sr:competitor:2556	forward	DEU	29
sr:player:1421115	Hyeon-seok, Hong	sr:competitor:2556	midfielder	KOR	14
sr:player:1543827	Jenz, Moritz	sr:competitor:2556	defender	DEU	3
sr:player:1652425	Nebel, Paul	sr:competitor:2556	midfielder	DEU	8
sr:player:1708465	Sano, Kaishu	sr:competitor:2556	midfielder	JPN	6
sr:player:1987605	Sieb, Armindo	sr:competitor:2556	forward	DEU	11
sr:player:2068143	Riess, Lasse	sr:competitor:2556	goalkeeper	DEU	1
sr:player:2186750	Vidovic, Gabriel	sr:competitor:2556	forward	HRV	17
sr:player:2203448	Laux, Lucas	sr:competitor:2556	defender	DEU	34
sr:player:2213946	Shabani, Eniss	sr:competitor:2556	midfielder	ALB	41
sr:player:2299993	Veratschnig, Nikolas	sr:competitor:2556	midfielder	AUT	22
sr:player:2354439	Weiper, Nelson	sr:competitor:2556	forward	DEU	44
sr:player:2361397	Schulz, Philipp	sr:competitor:2556	midfielder	DEU	46
sr:player:2610731	Dal, Maxim	sr:competitor:2556	defender	DEU	47
sr:player:2612091	Muller, Tim	sr:competitor:2556	defender	DEU	39
sr:player:2702298	Gleiber, Daniel	sr:competitor:2556	midfielder	DEU	42
sr:player:40973	Johnsson, Karl-Johan	sr:competitor:1659	goalkeeper	SWE	30
sr:player:153218	Delaine, Thomas	sr:competitor:1659	defender	FRA	3
sr:player:1268506	Tenaglia, Facundo	sr:competitor:2885	defender	ARG	14
sr:player:1567050	Abqar, Abdel	sr:competitor:2885	defender	MAR	5
sr:player:1624240	Sanchez, Manu	sr:competitor:2885	midfielder	ESP	3
sr:player:1643484	Rodriguez, Adrian	sr:competitor:2885	goalkeeper	ARG	31
sr:player:1747751	Diarra, Moussa	sr:competitor:2885	defender	MLI	22
sr:player:1974231	Novoa, Hugo	sr:competitor:2885	forward	ESP	16
sr:player:1974653	Jay Agustin, Alejandro	sr:competitor:2885	midfielder	ESP	35
sr:player:2046303	Romero, Luka	sr:competitor:2885	forward	ARG	20
sr:player:2146790	Vicente, Carlos	sr:competitor:2885	forward	ESP	7
sr:player:2155534	Ortiz, Eneko	sr:competitor:2885	midfielder	ESP	34
sr:player:2184780	Mourino, Santiago	sr:competitor:2885	defender	URY	12
sr:player:2223550	Owono, Jesus	sr:competitor:2885	goalkeeper	GNQ	13
sr:player:2248117	Martin, Carlos	sr:competitor:2885	forward	ESP	15
sr:player:2270123	Mendes, Tomas	sr:competitor:2885	midfielder	ESP	30
sr:player:2418127	Rebbach, Abde	sr:competitor:2885	forward	DZA	21
sr:player:2746701	Munoz, Egoitz	sr:competitor:2885	defender	ESP	27
sr:player:2842725	Lartitegi Ugarte, Julen	sr:competitor:2885	forward	ESP	37
sr:player:2842727	Pica, Adrian	sr:competitor:2885	defender	ESP	36
sr:player:10077	Schone, Lasse	sr:competitor:2962	midfielder	DNK	20
sr:player:70930	Nuytinck, Bram	sr:competitor:2962	defender	NLD	17
sr:player:361780	Verdonk, Calvin	sr:competitor:2962	defender	IDN	24
sr:player:367118	Van Gassel, Stijn	sr:competitor:2962	goalkeeper	NLD	1
sr:player:385708	Van Crooij, Vito	sr:competitor:2962	midfielder	NLD	32
sr:player:856258	Ouwejan, Thomas	sr:competitor:2962	defender	NLD	5
sr:player:945388	Sandler, Philippe	sr:competitor:2962	midfielder	NLD	3
sr:player:962589	Ogawa, Koki	sr:competitor:2962	forward	JPN	18
sr:player:1045873	Lyratzis, Elefterois	sr:competitor:2962	defender	GRC	19
sr:player:1083456	Marquez, Ivan	sr:competitor:2962	defender	ESP	4
sr:player:1254714	Hoedemakers, Mees	sr:competitor:2962	midfielder	NLD	6
sr:player:1340418	Rober	sr:competitor:2962	forward	ESP	7
sr:player:1601356	Hansen, Sontje	sr:competitor:2962	forward	NLD	10
sr:player:1629760	Proper, Dirk Wanner	sr:competitor:2962	midfielder	NLD	71
sr:player:1986899	Pereira, Brayann	sr:competitor:2962	defender	FRA	2
sr:player:1988303	Roefs, Robin	sr:competitor:2962	goalkeeper	NLD	22
sr:player:2271957	Janse, Rijk	sr:competitor:2962	goalkeeper	NLD	31
sr:player:2285291	Arts, D Leanu	sr:competitor:2962	defender	NLD	21
sr:player:2297559	Sano, Kodai	sr:competitor:2962	midfielder	JPN	23
sr:player:2320165	Onal, Basar	sr:competitor:2962	defender	TUR	11
sr:player:2354985	Sonmez, Selim Can	sr:competitor:2962	forward	TUR	33
sr:player:2411121	Ouaissa, Sami	sr:competitor:2962	midfielder	NLD	25
sr:player:2411813	De Wit, Kas	sr:competitor:2962	forward	NLD	29
sr:player:2497987	Darelas, Argyris	sr:competitor:2962	midfielder	GRC	8
sr:player:2766309	Shiogai, Kento	sr:competitor:2962	forward	JPN	9
sr:player:2785359	Reinders, Thomas	sr:competitor:2962	defender	NLD	15
sr:player:2818485	Nieuwenhuijs, Luc	sr:competitor:2962	forward	NLD	32
sr:player:2827761	Mohamedhoesein, Oma	sr:competitor:2962	midfielder	NLD	35
sr:player:43440	Burchert, Sascha	sr:competitor:2526	goalkeeper	DEU	30
sr:player:57627	Mets, Karol	sr:competitor:2526	defender	EST	3
sr:player:88471	Zoller, Simon	sr:competitor:2526	forward	DEU	27
sr:player:89713	Albers, Andreas	sr:competitor:2526	forward	DNK	19
sr:player:181581	Irvine, Jackson	sr:competitor:2526	midfielder	AUS	7
sr:player:243693	Maurides	sr:competitor:2526	forward	BRA	33
sr:player:252343	Dzwigala, Adam	sr:competitor:2526	defender	POL	25
sr:player:253469	Wahl, Hauke	sr:competitor:2526	defender	DEU	5
sr:player:253515	Oelschlagel, Eric	sr:competitor:2526	goalkeeper	DEU	32
sr:player:280551	Saliakas, Manolis	sr:competitor:2526	defender	GRC	2
sr:player:325061	Vasilj, Nikola	sr:competitor:2526	goalkeeper	BIH	22
sr:player:542038	Smith, Eric	sr:competitor:2526	midfielder	SWE	8
sr:player:591588	Eggestein, Johannes	sr:competitor:2526	forward	DEU	11
sr:player:877958	Ritzka, Lars	sr:competitor:2526	defender	DEU	21
sr:player:878648	Ahlers, Soren	sr:competitor:2526	goalkeeper	DEU	28
sr:player:887742	Sinani, Danel	sr:competitor:2526	forward	LUX	10
sr:player:1021421	Boukhalfa, Carlo	sr:competitor:2526	midfielder	DEU	16
sr:player:1116525	Afolayan, Oladapo	sr:competitor:2526	forward	ENG	17
sr:player:1240036	Metcalfe, Conor	sr:competitor:2526	midfielder	AUS	24
sr:player:1275998	Treu, Philipp	sr:competitor:2526	defender	DEU	23
sr:player:1411307	Gunther, Luca	sr:competitor:2526	midfielder	DEU	\N
sr:player:1554547	Banks, Scott	sr:competitor:2526	midfielder	SCO	18
sr:player:1576096	Voll, Ben	sr:competitor:2526	goalkeeper	DEU	1
sr:player:1582396	Ahlstrand, Erik	sr:competitor:2526	midfielder	SWE	20
sr:player:1652669	Nemeth, David	sr:competitor:2526	defender	AUT	4
sr:player:1744851	Guilavogui, Morgan	sr:competitor:2526	forward	GIN	29
sr:player:2077109	Stevens, Fin	sr:competitor:2526	defender	WAL	14
sr:player:2178850	Wagner, Robert	sr:competitor:2526	midfielder	DEU	39
sr:player:2199154	Saad, Elias	sr:competitor:2526	forward	TUN	26
sr:player:2732020	Dahaba, Muhammad	sr:competitor:2526	defender	DEU	34
sr:player:2836757	Schmitz, Marwin	sr:competitor:2526	midfielder	DEU	42
sr:player:2836889	Seibt, Ronny	sr:competitor:2526	goalkeeper	DEU	35
sr:player:3021	Butelle, Ludovic	sr:competitor:1682	goalkeeper	FRA	16
sr:player:357752	Buta, Aurelio	sr:competitor:1682	defender	PRT	23
sr:player:783278	Ito, Junya	sr:competitor:1682	midfielder	JPN	7
sr:player:1718658	Fraulo, Oscar	sr:competitor:2948	midfielder	DNK	6
sr:player:1840080	El Karouani, Souffian	sr:competitor:2948	defender	MAR	16
sr:player:1979549	Descotte, Anthony	sr:competitor:2948	forward	BEL	19
sr:player:2043857	Cathline, Yoann	sr:competitor:2948	forward	FRA	20
sr:player:2114250	Aaronson, Paxten	sr:competitor:2948	forward	USA	21
sr:player:2115344	Ohio, Noah	sr:competitor:2948	forward	NLD	11
sr:player:2120526	Gadellaa, Kevin	sr:competitor:2948	goalkeeper	NLD	61
sr:player:2120530	Mukeh, Joshua	sr:competitor:2948	midfielder	NLD	44
sr:player:2240473	Iqbal, Zidane	sr:competitor:2948	midfielder	IRQ	14
sr:player:2249165	de Graaff, Tom de Graaff	sr:competitor:2948	goalkeeper	NLD	32
sr:player:2253745	Dithmer, Andreas Frederik	sr:competitor:2948	goalkeeper	DNK	51
sr:player:2268745	Andersen, Silas	sr:competitor:2948	midfielder	DNK	46
sr:player:2285275	Jenner, Ivar	sr:competitor:2948	midfielder	IDN	38
sr:player:2342819	Kooy, Wessel	sr:competitor:2948	defender	NLD	33
sr:player:2349189	Blake, Adrian	sr:competitor:2948	forward	ENG	15
sr:player:2411083	Edhart, Lynden	sr:competitor:2948	midfielder	BLR	47
sr:player:2423155	Engwanda, Alonzo	sr:competitor:2948	midfielder	BEL	27
sr:player:2577031	Held, Nazjir	sr:competitor:2948	defender	CUW	45
sr:player:2660195	van Hees, Rickson	sr:competitor:2948	defender	USA	42
sr:player:149666	Haye, Thom	sr:competitor:2990	midfielder	IDN	19
sr:player:152418	Receveur, Tim	sr:competitor:2990	midfielder	NLD	28
sr:player:193462	Lawrence, Jamie	sr:competitor:2990	defender	ENG	15
sr:player:194146	Bandeira, Axel	sr:competitor:2990	midfielder	GNQ	23
sr:player:320919	Guillaume, Baptiste	sr:competitor:2990	forward	BEL	21
sr:player:352552	Dankerlui, Damil	sr:competitor:2990	defender	SUR	2
sr:player:355076	Carbonell, Alex	sr:competitor:2990	midfielder	ESP	6
sr:player:544156	Tahiri, Anas	sr:competitor:2990	midfielder	BEL	8
sr:player:806320	Robinet, Thomas	sr:competitor:2990	forward	FRA	9
sr:player:1080030	Wendlinger, Jonas	sr:competitor:2990	goalkeeper	AUT	29
sr:player:1112193	Nalic, Adi	sr:competitor:2990	midfielder	BIH	16
sr:player:1259410	Hansen, Kornelius Normann	sr:competitor:2990	forward	NOR	17
sr:player:1297460	Providence, Ruben	sr:competitor:2990	forward	FRA	7
sr:player:1340330	Barbet, Theo	sr:competitor:2990	defender	FRA	22
sr:player:1425283	Mamengi, Christopher	sr:competitor:2990	defender	NLD	25
sr:player:1430923	Jacobs, Joey	sr:competitor:2990	defender	NLD	3
sr:player:1564128	Bakker, Nordin	sr:competitor:2990	goalkeeper	NLD	1
sr:player:1738807	Akujobi, Hamdi	sr:competitor:2990	midfielder	NGA	20
sr:player:1865204	Zagaritis, Vasilios	sr:competitor:2990	defender	GRC	14
sr:player:1871482	Keller, Stijn	sr:competitor:2990	goalkeeper	CHE	26
sr:player:1951500	Kadile, Junior	sr:competitor:2990	forward	FRA	11
sr:player:1977307	Mattoir, Faiz	sr:competitor:2990	forward	COM	24
sr:player:2052687	Visus, Ricardo	sr:competitor:2990	defender	ESP	4
sr:player:2080847	Beaumont, Guus	sr:competitor:2990	midfielder	NLD	36
sr:player:2080851	Puriel, Jeffrey	sr:competitor:2990	forward	NLD	37
sr:player:2253641	Ritmeester Van De Kamp, Jochem	sr:competitor:2990	defender	NLD	5
sr:player:2282345	Delaurier Chaubet, Logan	sr:competitor:2990	midfielder	FRA	27
sr:player:2411057	Pinas, Jaden	sr:competitor:2990	defender	NLD	34
sr:player:2662165	Van der Wilt, Joel	sr:competitor:2990	goalkeeper	NLD	31
sr:player:2789313	Kuiper, Jay	sr:competitor:2990	defender	NLD	30
sr:player:2837363	Poku, Emanuel	sr:competitor:2990	forward	NLD	39
sr:player:2842743	Dors, Marley	sr:competitor:2990	forward	SUR	40
sr:player:2892687	Foah-Sam, Amoah	sr:competitor:2990	defender	NLD	34
sr:player:31921	Holtby, Lewis	sr:competitor:2573	midfielder	DEU	10
sr:player:122573	Skrzybski, Steven	sr:competitor:2573	forward	DEU	7
sr:player:126346	Dahne, Thomas	sr:competitor:2573	goalkeeper	DEU	21
sr:player:126531	Engelhardt, Marcel	sr:competitor:2573	goalkeeper	DEU	31
sr:player:254003	Erras, Patrick	sr:competitor:2573	midfielder	DEU	4
sr:player:254445	Schulz, Marvin	sr:competitor:2573	midfielder	DEU	15
sr:player:347116	Johansson, Carl	sr:competitor:2573	defender	SWE	5
sr:player:548094	Porath, Finn	sr:competitor:2573	midfielder	DEU	8
sr:player:579260	Komenda, Marco	sr:competitor:2573	defender	DEU	3
sr:player:878640	Becker, Timo	sr:competitor:2573	defender	DEU	17
sr:player:935188	Puchacz, Tymoteusz	sr:competitor:2573	defender	POL	27
sr:player:1008423	Pichler, Benedikt	sr:competitor:2573	forward	AUT	9
sr:player:1021055	Weiner, Timon	sr:competitor:2573	goalkeeper	DEU	1
sr:player:1101039	Arp, Fiete	sr:competitor:2573	forward	DEU	20
sr:player:1409981	Machino, Shuto	sr:competitor:2573	forward	JPN	18
sr:player:1498509	Bernhardsson, Alexander	sr:competitor:2573	midfielder	SWE	11
sr:player:1575366	Geschwill, Max	sr:competitor:2573	defender	DEU	14
sr:player:1575958	Remberg, Nicolai	sr:competitor:2573	midfielder	DEU	22
sr:player:1642936	Javorcek, Dominik	sr:competitor:2573	defender	SVK	33
sr:player:1722924	Knudsen, Magnus	sr:competitor:2573	midfielder	NOR	24
sr:player:1724614	Rosenboom, Lasse	sr:competitor:2573	defender	DEU	23
sr:player:1724730	Gigovic, Armin	sr:competitor:2573	midfielder	BIH	37
sr:player:1948520	Kleine-Bekel, Colin	sr:competitor:2573	defender	DEU	34
sr:player:2021883	Kelati, Andu	sr:competitor:2573	midfielder	DEU	16
sr:player:2133528	Ivezic, Marko	sr:competitor:2573	midfielder	SRB	6
sr:player:2183814	Harres, Phil	sr:competitor:2573	forward	DEU	19
sr:player:2265501	Wagbe, Aurel	sr:competitor:2573	midfielder	DEU	28
sr:player:2671399	Dogan, Tyler	sr:competitor:2573	goalkeeper	TUR	40
sr:player:1006657	Perez, Luis	sr:competitor:2831	defender	ESP	2
sr:player:1067736	Perez, Kike	sr:competitor:2831	midfielder	ESP	8
sr:player:1278438	Andre, Marcos	sr:competitor:2831	forward	BRA	9
sr:player:1381979	Hein, Karl	sr:competitor:2831	goalkeeper	EST	13
sr:player:1598602	Ozkacar, Cenk	sr:competitor:2831	defender	TUR	6
sr:player:1643482	Latasa, Juan	sr:competitor:2831	forward	ESP	14
sr:player:1644302	Moro, Raul	sr:competitor:2831	midfielder	ESP	11
sr:player:1710347	Rosa, Lucas	sr:competitor:2831	defender	BRA	22
sr:player:1998659	Meseguer, Victor	sr:competitor:2831	midfielder	ESP	4
sr:player:2264469	Arnau Rafus	sr:competitor:2831	goalkeeper	ESP	26
sr:player:2266509	Rielves, Mario Martin	sr:competitor:2831	midfielder	ESP	12
sr:player:2418483	Torres Ortiz, David	sr:competitor:2831	defender	ESP	3
sr:player:2418485	Aceves, Alvaro	sr:competitor:2831	goalkeeper	ESP	36
sr:player:2608809	Maroto, Mario	sr:competitor:2831	midfielder	ESP	34
sr:player:2615699	Chasco Ruiz, Raul	sr:competitor:2831	defender	ESP	30
sr:player:2687231	Chuki	sr:competitor:2831	midfielder	ESP	28
sr:player:2727424	Bah, Abdulay Juma	sr:competitor:2831	defender	SLE	35
sr:player:2795495	Iglesias, Koke	sr:competitor:2831	defender	ESP	32
sr:player:48480	Gross, Pascal	sr:competitor:2673	midfielder	DEU	13
sr:player:133908	Sabitzer, Marcel	sr:competitor:2673	midfielder	AUT	20
sr:player:138156	Can, Emre	sr:competitor:2673	midfielder	DEU	23
sr:player:138491	Meyer, Alexander	sr:competitor:2673	goalkeeper	DEU	33
sr:player:168937	Sule, Niklas	sr:competitor:2673	defender	DEU	25
sr:player:226978	Brandt, Julian	sr:competitor:2673	midfielder	DEU	10
sr:player:328027	Guirassy, Serhou	sr:competitor:2673	forward	GIN	9
sr:player:556866	Kobel, Gregor	sr:competitor:2673	goalkeeper	CHE	1
sr:player:570060	Anton, Waldemar	sr:competitor:2673	defender	DEU	3
sr:player:577726	Bensebaini, Ramy	sr:competitor:2673	defender	DZA	5
sr:player:815746	Malen, Donyell	sr:competitor:2673	forward	NLD	21
sr:player:862396	Ryerson, Julian	sr:competitor:2673	defender	NOR	26
sr:player:1021189	Schlotterbeck, Nico	sr:competitor:2673	defender	DEU	4
sr:player:1128279	Lotka, Marcel	sr:competitor:2673	goalkeeper	POL	35
sr:player:1337948	Nmecha, Felix	sr:competitor:2673	midfielder	DEU	8
sr:player:1421117	Adeyemi, Karim	sr:competitor:2673	forward	DEU	27
sr:player:1575902	Azhil, Ayman	sr:competitor:2673	midfielder	MAR	46
sr:player:1724610	Beier, Maximilian	sr:competitor:2673	forward	DEU	14
sr:player:1832348	Reyna, Gio	sr:competitor:2673	midfielder	USA	7
sr:player:1957237	Couto, Yan	sr:competitor:2673	defender	BRA	2
sr:player:2051467	Elongo-Yombo, Rodney	sr:competitor:2673	midfielder	DEU	36
sr:player:2206014	Jessen, Niklas	sr:competitor:2673	midfielder	DEU	40
sr:player:2211558	Luhrs, Yannik	sr:competitor:2673	defender	DEU	49
sr:player:2265039	Gittens, Jamie	sr:competitor:2673	forward	ENG	43
sr:player:2265165	Ostrzinski, Silas	sr:competitor:2673	goalkeeper	DEU	31
sr:player:2310983	Mane, Filippo	sr:competitor:2673	defender	ITA	39
sr:player:2358271	Duranville, Julien	sr:competitor:2673	forward	BEL	16
sr:player:2375541	Campbell, Cole	sr:competitor:2673	midfielder	ISL	37
sr:player:2469169	Meiser, Tyler	sr:competitor:2673	defender	DEU	45
sr:player:2488537	Watjen, Kjell	sr:competitor:2673	midfielder	DEU	38
sr:player:2610233	Kabar, Almugera	sr:competitor:2673	defender	DEU	42
sr:player:2630609	Paulina, Jordi	sr:competitor:2673	forward	NLD	32
sr:player:96544	Kondogbia, Geoffrey	sr:competitor:1641	midfielder	CAF	19
sr:player:128383	Rulli, Geronimo	sr:competitor:1641	goalkeeper	ARG	1
sr:player:149593	Hojbjerg, Pierre-Emile	sr:competitor:1641	midfielder	DNK	23
sr:player:180515	Blanco, Ruben	sr:competitor:1641	goalkeeper	ESP	36
sr:player:238612	Mbemba, Chancel	sr:competitor:1641	defender	COD	99
sr:player:250737	Rabiot, Adrien	sr:competitor:1641	midfielder	FRA	25
sr:player:268903	Maupay, Neal	sr:competitor:1641	forward	FRA	8
sr:player:558320	Garcia, Ulisses	sr:competitor:1641	defender	CHE	6
sr:player:581314	Rongier, Valentin	sr:competitor:1641	midfielder	FRA	21
sr:player:758580	De Lange, Jeffrey	sr:competitor:1641	goalkeeper	NLD	12
sr:player:792373	Murillo, Amir	sr:competitor:1641	defender	PAN	62
sr:player:864018	Cornelius, Derek	sr:competitor:1641	defender	CAN	13
sr:player:937760	Lirola, Pol	sr:competitor:1641	defender	ESP	29
sr:player:941698	Harit, Amine	sr:competitor:1641	midfielder	MAR	11
sr:player:1419559	Balerdi, Leonardo	sr:competitor:1641	defender	ARG	5
sr:player:1546543	Greenwood, Mason	sr:competitor:1641	forward	ENG	10
sr:player:1720246	Wahi, Sepe Elye	sr:competitor:1641	forward	FRA	9
sr:player:1766643	Moumbagna, Faris	sr:competitor:1641	forward	CMR	14
sr:player:1795004	Brassier, Lilian	sr:competitor:1641	defender	FRA	20
sr:player:1978119	Luis Henrique	sr:competitor:1641	forward	BRA	44
sr:player:2125448	Merlin, Quentin	sr:competitor:1641	defender	FRA	3
sr:player:2146458	Meite, Bamo	sr:competitor:1641	defender	FRA	18
sr:player:2178222	Nadir, Bilal	sr:competitor:1641	midfielder	FRA	34
sr:player:2188294	Nyakossi, Roggerio	sr:competitor:1641	defender	CHE	46
sr:player:2203058	Kone, Ismael	sr:competitor:1641	midfielder	CAN	51
sr:player:2244507	Van Neck, Jelle	sr:competitor:1641	goalkeeper	BEL	40
sr:player:2277491	Rowe, Jon	sr:competitor:1641	forward	ENG	17
sr:player:2297879	Carboni, Valentin	sr:competitor:1641	midfielder	ARG	7
sr:player:2439643	Soglo, Emran	sr:competitor:1641	midfielder	ENG	37
sr:player:2444737	Mughe, Francois	sr:competitor:1641	midfielder	CMR	\N
sr:player:978119	Wijndal, Owen	sr:competitor:2953	defender	NLD	5
sr:player:1057465	Sutalo, Josip	sr:competitor:2953	defender	HRV	37
sr:player:1283598	Mannsverk, Sivert	sr:competitor:2953	midfielder	NOR	16
sr:player:1345190	Brobbey, Brian	sr:competitor:2953	forward	NLD	9
sr:player:1575778	Ramaj, Diant	sr:competitor:2953	goalkeeper	DEU	40
sr:player:1622580	Taylor, Kenneth	sr:competitor:2953	midfielder	NLD	8
sr:player:1712569	Avila, Gaston	sr:competitor:2953	defender	ARG	30
sr:player:1722058	Rensch, Devyne	sr:competitor:2953	defender	NLD	2
sr:player:1732619	Gorter, Jay	sr:competitor:2953	goalkeeper	NLD	12
sr:player:1884452	Rasmussen, Christian	sr:competitor:2953	forward	DNK	29
sr:player:1938994	Hlynsson, Kristian	sr:competitor:2953	midfielder	ISL	38
sr:player:1969769	Fitz-Jim, Kian	sr:competitor:2953	midfielder	NLD	28
sr:player:1986033	Kaplan, Ahmetcan	sr:competitor:2953	defender	TUR	13
sr:player:1988281	Baas, Youri	sr:competitor:2953	defender	NLD	15
sr:player:2122732	Tahirovic, Benjamin	sr:competitor:2953	midfielder	BIH	33
sr:player:2142246	Setford, Charlie	sr:competitor:2953	goalkeeper	ENG	51
sr:player:2155560	van Axel Dongen, Amourricho	sr:competitor:2953	forward	NLD	27
sr:player:2221536	Rijkhoff, Julian	sr:competitor:2953	forward	NLD	19
sr:player:2239965	Banel, Jaydon	sr:competitor:2953	forward	NLD	49
sr:player:2265653	Brandes, Julian	sr:competitor:2953	midfielder	NLD	41
sr:player:2268227	Hato, Jorrel	sr:competitor:2953	defender	NLD	4
sr:player:2311483	Godts, Mika	sr:competitor:2953	forward	BEL	11
sr:player:2326725	Gaaei, Anton	sr:competitor:2953	defender	DNK	3
sr:player:2379247	Faberski, Jan Jakub	sr:competitor:2953	midfielder	POL	50
sr:player:2611495	Janse, Dies	sr:competitor:2953	defender	NLD	36
sr:player:2698898	Mokio, Jorthy	sr:competitor:2953	defender	BEL	31
sr:player:2839427	Konadu, Don-Angelo	sr:competitor:2953	forward	NLD	59
sr:player:27214	Grahl, Jens	sr:competitor:2674	goalkeeper	DEU	33
sr:player:38440	Trapp, Kevin	sr:competitor:2674	goalkeeper	DEU	1
sr:player:40239	Chandler, Timothy	sr:competitor:2674	midfielder	USA	22
sr:player:66518	Gotze, Mario	sr:competitor:2674	midfielder	DEU	27
sr:player:341589	Dahoud, Mahmoud	sr:competitor:2674	midfielder	SYR	18
sr:player:369976	Onguene, Jerome	sr:competitor:2674	defender	CMR	41
sr:player:581302	Koch, Robin	sr:competitor:2674	defender	DEU	4
sr:player:591706	Skhiri, Ellyes	sr:competitor:2674	midfielder	TUN	15
sr:player:929730	Kristensen, Rasmus	sr:competitor:2674	defender	DNK	13
sr:player:1107697	Marmoush, Omar	sr:competitor:2674	forward	EGY	7
sr:player:1297446	Ebimbe, Eric	sr:competitor:2674	midfielder	FRA	26
sr:player:1513809	Nkounkou, Niels	sr:competitor:2674	defender	FRA	29
sr:player:1643190	Tuta	sr:competitor:2674	defender	BRA	35
sr:player:1646402	Theate, Arthur	sr:competitor:2674	defender	BEL	3
sr:player:1939898	Wenig, Marcel	sr:competitor:2674	midfielder	DEU	28
sr:player:1948522	Knauff, Ansgar	sr:competitor:2674	forward	DEU	36
sr:player:1953496	Amenda, Aurele	sr:competitor:2674	defender	CHE	5
sr:player:2083977	Ekitike, Hugo	sr:competitor:2674	forward	FRA	11
sr:player:2103686	Matanovic, Igor	sr:competitor:2674	forward	HRV	9
sr:player:2264665	Larsson, Hugo	sr:competitor:2674	midfielder	SWE	16
sr:player:2265679	Collins, Nnamdi	sr:competitor:2674	defender	DEU	34
sr:player:2318377	Chaibi, Fares	sr:competitor:2674	midfielder	DZA	8
sr:player:2335179	Santos, Kaua	sr:competitor:2674	goalkeeper	BRA	40
sr:player:2347069	Lisztes, Krisztian	sr:competitor:2674	midfielder	HUN	23
sr:player:2354995	Uzun, Can	sr:competitor:2674	midfielder	TUR	20
sr:player:2355047	Hojlund, Oscar	sr:competitor:2674	midfielder	DNK	6
sr:player:2389745	Brown, Nathaniel	sr:competitor:2674	defender	DEU	21
sr:player:2410203	Bahoya, Jean Matteo	sr:competitor:2674	forward	FRA	19
sr:player:2437739	Awusi, Junior	sr:competitor:2674	forward	ESP	\N
sr:player:2437795	Fenyo, Noah	sr:competitor:2674	midfielder	HUN	47
sr:player:2437813	Alaoui, Anas	sr:competitor:2674	forward	MAR	55
sr:player:2724258	Ramming, Nils	sr:competitor:2674	goalkeeper	SWE	43
sr:player:155995	Marquinhos	sr:competitor:1644	defender	BRA	5
sr:player:187205	Skriniar, Milan	sr:competitor:1644	defender	SVK	37
sr:player:352370	Hernandez, Lucas	sr:competitor:1644	defender	FRA	21
sr:player:352916	Kimpembe, Presnel	sr:competitor:1644	defender	FRA	3
sr:player:361004	Asensio, Marco	sr:competitor:1644	forward	ESP	11
sr:player:361350	Dembele, Ousmane	sr:competitor:1644	forward	FRA	10
sr:player:756514	Donnarumma, Gianluigi	sr:competitor:1644	goalkeeper	ITA	1
sr:player:784655	Ruiz, Fabian	sr:competitor:1644	midfielder	ESP	8
sr:player:861998	Safonov, Matvey	sr:competitor:1644	goalkeeper	RUS	39
sr:player:903858	Hakimi, Achraf	sr:competitor:1644	defender	MAR	2
sr:player:1055229	Vitinha	sr:competitor:1644	midfielder	PRT	17
sr:player:1103411	Kolo Muani, Randal	sr:competitor:1644	forward	FRA	23
sr:player:1297824	Tenas, Arnau	sr:competitor:1644	goalkeeper	ESP	80
sr:player:1414159	Pacho, Willian	sr:competitor:1644	defender	ECU	51
sr:player:1479784	Ramos, Goncalo	sr:competitor:1644	forward	PRT	9
sr:player:1493461	Kang-in, Lee	sr:competitor:1644	midfielder	KOR	19
sr:player:1834794	Mendes, Nuno	sr:competitor:1644	defender	PRT	25
sr:player:1948356	Barcola, Bradley	sr:competitor:1644	forward	FRA	29
sr:player:2157426	Beraldo	sr:competitor:1644	defender	BRA	35
sr:player:2240523	Neves, Joao	sr:competitor:1644	midfielder	PRT	87
sr:player:2256499	Mouquet, Louis	sr:competitor:1644	goalkeeper	PRT	70
sr:player:2256607	Zaire-Emery, Warren	sr:competitor:1644	midfielder	FRA	33
sr:player:187423	Akpoguma, Kevin	sr:competitor:2569	defender	NGA	25
sr:player:253993	Promel, Grischa	sr:competitor:2569	midfielder	DEU	6
sr:player:254297	Bebou, Ihlas	sr:competitor:2569	forward	TGO	9
sr:player:259803	Tabakovic, Haris	sr:competitor:2569	forward	BIH	26
sr:player:378340	Bulter, Marius	sr:competitor:2569	forward	DEU	21
sr:player:756428	Bruun Larsen, Jacob	sr:competitor:2569	forward	DNK	29
sr:player:758850	Szalai, Attila	sr:competitor:2569	defender	HUN	41
sr:player:770083	Berisha, Mergim	sr:competitor:2569	forward	DEU	10
sr:player:822598	Geiger, Dennis	sr:competitor:2569	midfielder	DEU	8
sr:player:843497	Samassekou, Diadie	sr:competitor:2569	midfielder	MLI	18
sr:player:907850	Nsoki, Stanley	sr:competitor:2569	defender	FRA	34
sr:player:1021607	Stach, Anton	sr:competitor:2569	midfielder	DEU	16
sr:player:1065720	Kabak, Ozan	sr:competitor:2569	defender	TUR	5
sr:player:1256224	Philipp, Luca	sr:competitor:2569	goalkeeper	DEU	37
sr:player:1275520	Becker, Finn	sr:competitor:2569	midfielder	DEU	20
sr:player:1409893	Hranac, Robin	sr:competitor:2569	defender	CZE	2
sr:player:1410087	Jurasek, David	sr:competitor:2569	defender	CZE	19
sr:player:1412589	Hlozek, Adam	sr:competitor:2569	forward	CZE	23
sr:player:1567208	Gendrey, Valentin	sr:competitor:2569	defender	FRA	15
sr:player:1712017	Prass, Alexander	sr:competitor:2569	midfielder	AUT	22
sr:player:1724634	John, Marco	sr:competitor:2569	midfielder	DEU	24
sr:player:1987183	Petersson, Lukas	sr:competitor:2569	goalkeeper	ISL	36
sr:player:2202338	Bischof, Tom	sr:competitor:2569	midfielder	DEU	7
sr:player:2250055	Chaves, Arthur	sr:competitor:2569	defender	BRA	35
sr:player:2351169	Tohumcu, Umut	sr:competitor:2569	midfielder	DEU	17
sr:player:2520509	Drexler, Tim	sr:competitor:2569	defender	DEU	4
sr:player:2610737	Moerstedt, Max	sr:competitor:2569	forward	DEU	33
sr:player:2632365	Kalambayi, Simon	sr:competitor:2569	midfielder	FRA	30
sr:player:2842651	Micheler, Florian	sr:competitor:2569	midfielder	AUT	28
sr:player:2842665	Strobl, Lars	sr:competitor:2569	defender	DEU	31
sr:player:106496	Pallois, Nicolas	sr:competitor:1647	defender	FRA	4
sr:player:156236	Carlgren, Patrik	sr:competitor:1647	goalkeeper	SWE	30
sr:player:191204	Castelletto, Jean-Charles	sr:competitor:1647	defender	CMR	21
sr:player:234230	Mollet, Florent	sr:competitor:1647	midfielder	FRA	25
sr:player:286157	Chirivella, Pedro	sr:competitor:1647	midfielder	ESP	5
sr:player:326343	Gbamin, Jean-Philippe	sr:competitor:1647	midfielder	CIV	17
sr:player:330051	Simon, Moses	sr:competitor:1647	forward	NGA	27
sr:player:769143	Amian, Kelvin	sr:competitor:1647	defender	FRA	98
sr:player:785413	Coco, Marcus	sr:competitor:1647	defender	FRA	11
sr:player:865034	Centtonze, Fabien	sr:competitor:1647	defender	FRA	28
sr:player:884378	Douglas	sr:competitor:1647	midfielder	BRA	6
sr:player:887872	Kadewere, Tino	sr:competitor:1647	forward	ZWE	10
sr:player:936558	Lafont, Alban	sr:competitor:1647	goalkeeper	FRA	1
sr:player:1014829	Duverne, Jean-Kevin	sr:competitor:1647	defender	FRA	2
sr:player:1107677	Mohamed, Mostafa	sr:competitor:1647	forward	EGY	31
sr:player:1145950	Cozza, Nicolas	sr:competitor:1647	defender	FRA	3
sr:player:1243802	Ganago, Ignatius Kpene	sr:competitor:1647	forward	CMR	7
sr:player:1351028	Thomas, Sorba	sr:competitor:1647	midfielder	WAL	22
sr:player:1640006	Lepenant, Johann	sr:competitor:1647	midfielder	FRA	8
sr:player:1951520	Abline, Matthis	sr:competitor:1647	forward	FRA	39
sr:player:2190476	Barbet, Hugo	sr:competitor:1647	goalkeeper	FRA	50
sr:player:2256503	Doucoure, Sekou	sr:competitor:1647	defender	FRA	99
sr:player:2453615	Assoumani, Dehmaine	sr:competitor:1647	midfielder	FRA	59
sr:player:2453625	Mahamoud, Adel	sr:competitor:1647	forward	COM	\N
sr:player:2464651	Acapandie, Mathieu	sr:competitor:1647	defender	FRA	41
sr:player:2464655	Zeze, Nathan	sr:competitor:1647	defender	FRA	44
sr:player:2702172	Guirassy, Bahereba	sr:competitor:1647	midfielder	FRA	62
sr:player:2702180	Leroux, Louis	sr:competitor:1647	midfielder	FRA	66
sr:player:935172	Grabara, Kamil	sr:competitor:2524	goalkeeper	POL	1
sr:player:935554	Wind, Jonas	sr:competitor:2524	forward	DNK	23
sr:player:936428	Bornauw, Sebastiaan	sr:competitor:2524	defender	BEL	3
sr:player:997777	Maehle, Joakim	sr:competitor:2524	defender	DNK	21
sr:player:1004879	Majer, Lovro	sr:competitor:2524	midfielder	HRV	19
sr:player:1247500	Fischer, Kilian	sr:competitor:2524	defender	DEU	2
sr:player:1640692	Kaminski, Jakub	sr:competitor:2524	midfielder	POL	16
sr:player:1644554	Tomas, Tiago	sr:competitor:2524	forward	PRT	11
sr:player:1700629	Wimmer, Patrick	sr:competitor:2524	forward	AUT	39
sr:player:1831190	Vranckx, Aster	sr:competitor:2524	midfielder	BEL	6
sr:player:1880508	Bialek, Bartosz	sr:competitor:2524	forward	POL	14
sr:player:1953480	Koulierakis, Konstantinos	sr:competitor:2524	defender	GRC	4
sr:player:2000067	Paredes, Kevin	sr:competitor:2524	midfielder	USA	40
sr:player:2211494	Amoura, Mohamed	sr:competitor:2524	forward	DZA	9
sr:player:2304771	Borset, Anders	sr:competitor:2524	defender	NOR	49
sr:player:2600127	Odogu, David	sr:competitor:2524	defender	DEU	33
sr:player:2610755	Dardai, Bence	sr:competitor:2524	midfielder	DEU	24
sr:player:2716922	Neininger, Till	sr:competitor:2524	defender	DEU	44
sr:player:2781405	Angely, Mathys	sr:competitor:2524	defender	FRA	22
sr:player:2803379	Broger, Bennit	sr:competitor:2524	midfielder	DEU	38
sr:player:2844285	Akaegbobi, Jonathan	sr:competitor:2524	forward	DEU	37
sr:player:17053	Mannone, Vito	sr:competitor:1643	goalkeeper	ITA	1
sr:player:51665	Andre, Benjamin	sr:competitor:1643	midfielder	FRA	21
sr:player:72998	Cabella, Remy	sr:competitor:1643	midfielder	FRA	10
sr:player:78352	Ismaily	sr:competitor:1643	defender	BRA	31
sr:player:96547	Umtiti, Samuel	sr:competitor:1643	defender	FRA	14
sr:player:122810	Mandi, Aissa	sr:competitor:1643	defender	DZA	2
sr:player:128587	Meunier, Thomas	sr:competitor:1643	defender	BEL	12
sr:player:189859	Caillard, Marc-Aurele	sr:competitor:1643	goalkeeper	FRA	16
sr:player:235460	Gomes, Andre	sr:competitor:1643	midfielder	PRT	26
sr:player:368120	Bentaleb, Nabil	sr:competitor:1643	midfielder	DZA	6
sr:player:558524	Zedadka, Akim	sr:competitor:1643	defender	DZA	13
sr:player:971145	Gudmundsson, Gabriel	sr:competitor:1643	defender	SWE	5
sr:player:1059257	Bakker, Mitchel	sr:competitor:1643	defender	NLD	20
sr:player:1089762	Gomes, Angel	sr:competitor:1643	midfielder	ENG	8
sr:player:1236868	Zhegrova, Edon	sr:competitor:1643	forward	KOS	23
sr:player:1343040	Bayo, Mohamed	sr:competitor:1643	forward	GIN	27
sr:player:1484558	David, Jonathan	sr:competitor:1643	forward	CAN	9
sr:player:1632510	Diakite, Bafode	sr:competitor:1643	defender	FRA	18
sr:player:1646430	Sahraoui, Osame	sr:competitor:1643	midfielder	NOR	11
sr:player:1705193	Ribeiro, Alexsandro	sr:competitor:1643	defender	BRA	4
sr:player:1722070	Haraldsson, Hakon Arnar	sr:competitor:1643	midfielder	ISL	7
sr:player:1947744	Chevalier, Lucas	sr:competitor:1643	goalkeeper	FRA	30
sr:player:2274919	Faiz, Adame	sr:competitor:1643	midfielder	FRA	\N
sr:player:2276789	Toure, Ousmane	sr:competitor:1643	defender	FRA	36
sr:player:2330937	Fernandes, Rafael	sr:competitor:1643	defender	PRT	28
sr:player:2354189	Olmeta, Lisandru	sr:competitor:1643	goalkeeper	FRA	\N
sr:player:2400031	Mukau, Ngal'ayel	sr:competitor:1643	midfielder	BEL	17
sr:player:2409135	Santos, Tiago	sr:competitor:1643	defender	PRT	22
sr:player:2437781	Mbappe, Ethan	sr:competitor:1643	midfielder	FRA	29
sr:player:2565249	Fernandez, Matias	sr:competitor:1643	forward	BEL	19
sr:player:2637861	Malouda, Aaron	sr:competitor:1643	midfielder	FRA	34
sr:player:2699064	Bouaddi, Ayyoub	sr:competitor:1643	midfielder	FRA	32
sr:player:2712144	Baret, Lilian	sr:competitor:1643	midfielder	FRA	39
sr:player:2861301	Cossier, Isaac	sr:competitor:1643	defender	FRA	35
sr:player:2870551	Lachaab, Younes	sr:competitor:1643	forward	FRA	47
sr:player:2883167	Costarelli, Morgan	sr:competitor:1643	defender	FRA	37
sr:player:2088625	Querfeld, Leopold	sr:competitor:2547	defender	AUT	14
sr:player:2234712	Stein, Yannic	sr:competitor:2547	goalkeeper	DEU	39
sr:player:2265677	Rothe, Tom	sr:competitor:2547	defender	DEU	15
sr:player:2436499	Kemlein, Aljoscha	sr:competitor:2547	midfielder	DEU	36
sr:player:2631861	Preu, David	sr:competitor:2547	forward	DEU	45
sr:player:2691782	Ogbemudia, Oluwaseun	sr:competitor:2547	defender	DEU	41
sr:player:143922	Adiceam, Raphael	sr:competitor:1646	goalkeeper	FRA	37
sr:player:159837	Leon, Donovan	sr:competitor:1646	goalkeeper	GUF	16
sr:player:329195	Jubal	sr:competitor:1646	defender	BRA	4
sr:player:369546	Pellenard, Theo	sr:competitor:1646	defender	FRA	5
sr:player:489180	Onaiwu, Ado	sr:competitor:1646	forward	JPN	45
sr:player:757742	Raveloson, Rayan	sr:competitor:1646	midfielder	MDG	97
sr:player:782240	Diousse, Assane	sr:competitor:1646	midfielder	SEN	18
sr:player:863144	Aye, Florian	sr:competitor:1646	forward	FRA	19
sr:player:936078	Perrin, Gaetan	sr:competitor:1646	forward	FRA	10
sr:player:936088	Owusu, Elisha	sr:competitor:1646	midfielder	GHA	42
sr:player:1011803	Mensah, Gideon	sr:competitor:1646	defender	GHA	14
sr:player:1128145	Bair, Theo	sr:competitor:1646	forward	CAN	9
sr:player:1265202	Traore, Hamed Junior	sr:competitor:1646	midfielder	CIV	25
sr:player:1413105	Sinayoko, Lassine	sr:competitor:1646	forward	MLI	17
sr:player:1594328	Maddy, Eros	sr:competitor:1646	forward	NLD	11
sr:player:1626020	Hoever, Ki-Jana	sr:competitor:1646	defender	NLD	23
sr:player:1635002	Osho, Gabriel	sr:competitor:1646	defender	NGA	3
sr:player:1743583	Agouzoul, Saad	sr:competitor:1646	defender	MAR	6
sr:player:1948352	Diomande, Sinaly	sr:competitor:1646	defender	CIV	20
sr:player:2090891	Joly, Paul	sr:competitor:1646	defender	FRA	26
sr:player:2112946	De Percin, Theo	sr:competitor:1646	goalkeeper	FRA	40
sr:player:2187482	Coulibaly, Lasso	sr:competitor:1646	midfielder	CIV	21
sr:player:2191292	Mercier, Nicolas	sr:competitor:1646	forward	FRA	\N
sr:player:2237742	Danois, Kevin	sr:competitor:1646	midfielder	FRA	27
sr:player:2264793	Buayi-Kiala, Nathan	sr:competitor:1646	midfielder	FRA	8
sr:player:2274917	Negrel, Tom	sr:competitor:1646	goalkeeper	FRA	\N
sr:player:2650649	Akpa, Clement	sr:competitor:1646	defender	FRA	92
sr:player:2661717	N'gatta, Ange Loic	sr:competitor:1646	defender	FRA	24
sr:player:2733512	Keita, Madiou	sr:competitor:1646	defender	GIN	31
sr:player:2836669	Viadere, Ben	sr:competitor:1646	forward	FRA	29
sr:player:2859201	Zossou, Aristide	sr:competitor:1646	forward	CIV	77
sr:player:2049241	Sildillia, Kiliann	sr:competitor:2538	defender	FRA	25
sr:player:2070459	Dinkci, Eren	sr:competitor:2538	forward	TUR	18
sr:player:2102914	Rohl, Merlin	sr:competitor:2538	midfielder	DEU	34
sr:player:2178840	Makengo, Jordy	sr:competitor:2538	defender	FRA	33
sr:player:2178848	Rosenfelder, Maximilian	sr:competitor:2538	defender	DEU	37
sr:player:2178852	Sauter, Niklas	sr:competitor:2538	goalkeeper	DEU	58
sr:player:2311355	Jantunen, Jaaso	sr:competitor:2538	goalkeeper	FIN	67
sr:player:2637209	Manzambi, Johan	sr:competitor:2538	midfielder	CHE	44
sr:player:2719774	Ogbus, Bruno	sr:competitor:2538	defender	CHE	43
sr:player:20705	Petric, Denis	sr:competitor:1648	goalkeeper	SVN	1
sr:player:123166	Mendy, Nampalys	sr:competitor:1648	midfielder	SEN	26
sr:player:164055	Samba, Brice	sr:competitor:1648	goalkeeper	FRA	30
sr:player:227862	Said, Wesley	sr:competitor:1648	forward	FRA	22
sr:player:231946	Thomasson, Adrien	sr:competitor:1648	midfielder	FRA	28
sr:player:286909	Frankowski, Przemyslaw	sr:competitor:1648	defender	POL	29
sr:player:308130	Cabot, Jimmy	sr:competitor:1648	defender	FRA	19
sr:player:318649	Fulgini, Angelo	sr:competitor:1648	midfielder	FRA	11
sr:player:369650	Gradit, Jonathan	sr:competitor:1648	defender	FRA	24
sr:player:566110	Machado, Deiver	sr:competitor:1648	defender	COL	3
sr:player:579576	Aguilar, Ruben	sr:competitor:1648	defender	FRA	2
sr:player:796862	Nzola, M'bala	sr:competitor:1648	forward	AGO	8
sr:player:798584	Sotoca, Florian	sr:competitor:1648	forward	FRA	7
sr:player:803610	Danso, Kevin	sr:competitor:1648	defender	AUT	4
sr:player:936564	Sarr, Malang	sr:competitor:1648	defender	FRA	20
sr:player:1080112	Medina, Facundo	sr:competitor:1648	defender	ARG	14
sr:player:1090402	Koffi, Herve	sr:competitor:1648	goalkeeper	BFA	16
sr:player:1115965	Zaroury, Anass	sr:competitor:1648	forward	MAR	21
sr:player:1706519	Satriano, Martin	sr:competitor:1648	forward	URY	9
sr:player:1957449	Chavez, Jhoanner	sr:competitor:1648	defender	ECU	13
sr:player:1957599	Ojediran, Hamzat	sr:competitor:1648	midfielder	NGA	15
sr:player:2059275	Diouf, Andy	sr:competitor:1648	midfielder	FRA	18
sr:player:2190456	El Aynaoui, Neil	sr:competitor:1648	midfielder	FRA	23
sr:player:2197348	Da Costa, David Pereira	sr:competitor:1648	midfielder	PRT	10
sr:player:2343559	Khusanov, Abdukodir	sr:competitor:1648	defender	UZB	25
sr:player:2390393	Bane, Sidi	sr:competitor:1648	defender	SEN	27
sr:player:2431729	Lascary, Remy Labeau	sr:competitor:1648	forward	GLP	36
sr:player:2447977	Ganiou, Ismaelo	sr:competitor:1648	defender	FRA	37
sr:player:2691296	Pouilly, Tom	sr:competitor:1648	midfielder	FRA	34
sr:player:2692154	Antonio, Kyllian	sr:competitor:1648	defender	FRA	33
sr:player:2692158	Diliwidi, Kembo	sr:competitor:1648	midfielder	FRA	39
sr:player:2755333	Diallo, Alpha	sr:competitor:1648	midfielder	FRA	\N
sr:player:2758551	Delplace, Adam	sr:competitor:1648	goalkeeper	FRA	99
sr:player:15219	Hradecky, Lukas	sr:competitor:2681	goalkeeper	FIN	1
sr:player:117777	Xhaka, Granit	sr:competitor:2681	midfielder	CHE	34
sr:player:142390	Hofmann, Jonas	sr:competitor:2681	midfielder	DEU	7
sr:player:142471	Lomb, Niklas	sr:competitor:2681	goalkeeper	DEU	36
sr:player:168903	Andrich, Robert	sr:competitor:2681	midfielder	DEU	8
sr:player:177177	Grimaldo, Alex	sr:competitor:2681	defender	ESP	20
sr:player:227672	Tah, Jonathan	sr:competitor:2681	defender	DEU	4
sr:player:280609	Schick, Patrik	sr:competitor:2681	forward	CZE	14
sr:player:355066	Garcia, Aleix	sr:competitor:2681	midfielder	ESP	24
sr:player:780014	Mukiele, Nordi	sr:competitor:2681	defender	FRA	23
sr:player:918918	Palacios, Exequiel	sr:competitor:2681	midfielder	ARG	25
sr:player:936996	Tella, Nathan	sr:competitor:2681	forward	NGA	19
sr:player:1058077	Terrier, Martin	sr:competitor:2681	forward	FRA	11
sr:player:1065288	Kovar, Matej	sr:competitor:2681	goalkeeper	CZE	17
sr:player:1139100	Tapsoba, Edmond	sr:competitor:2681	defender	BFA	12
sr:player:1299404	Frimpong, Jeremie	sr:competitor:2681	defender	NLD	30
sr:player:1722726	Boniface, Victor	sr:competitor:2681	forward	NGA	22
sr:player:1850922	Adli, Amine	sr:competitor:2681	forward	MAR	21
sr:player:1852832	Hincapie, Piero	sr:competitor:2681	defender	ECU	3
sr:player:2041927	Wirtz, Florian	sr:competitor:2681	midfielder	DEU	10
sr:player:2200024	Fofana, Sadik	sr:competitor:2681	defender	TGO	39
sr:player:2286877	Arthur	sr:competitor:2681	defender	BRA	13
sr:player:2287355	Belocian, Jeanuel	sr:competitor:2681	defender	FRA	44
sr:player:2463797	Onyeka, Francis	sr:competitor:2681	forward	DEU	40
sr:player:2611485	Raterink, Othniel	sr:competitor:2681	midfielder	NLD	33
sr:player:2655823	Marsenic, Matija	sr:competitor:2681	midfielder	MNE	\N
sr:player:2804605	Stepanov, Artem	sr:competitor:2681	forward	UKR	29
sr:player:2855373	Alajbegovic, Kerim	sr:competitor:2681	\N	BIH	47
sr:player:51640	Khazri, Wahbi	sr:competitor:1642	forward	TUN	10
sr:player:68076	Maksimovic, Nikola	sr:competitor:1642	defender	SRB	52
sr:player:123207	Lecomte, Benjamin	sr:competitor:1642	goalkeeper	FRA	40
sr:player:123229	Ferri, Jordan	sr:competitor:1642	midfielder	FRA	12
sr:player:156682	Savanier, Teji	sr:competitor:1642	midfielder	FRA	11
sr:player:229598	Jullien, Christopher	sr:competitor:1642	defender	FRA	6
sr:player:246507	Toure, Birama	sr:competitor:1642	midfielder	FRA	20
sr:player:291695	Sylla, Issiaga	sr:competitor:1642	defender	GIN	3
sr:player:833253	Bertaud, Dimitry	sr:competitor:1642	goalkeeper	COD	16
sr:player:843509	Sacko, Falaye	sr:competitor:1642	defender	MLI	77
sr:player:1029283	Nordin, Arnaud	sr:competitor:1642	forward	FRA	7
sr:player:1029561	Kiki	sr:competitor:1642	defender	MLI	4
sr:player:1296142	Sainte-Luce, Theo	sr:competitor:1642	defender	FRA	17
sr:player:1319062	Sagnan, Modibo	sr:competitor:1642	defender	MLI	5
sr:player:1344918	Omeragic, Becir	sr:competitor:1642	defender	CHE	27
sr:player:1379723	Dizdarevic, Belmin	sr:competitor:1642	goalkeeper	BIH	1
sr:player:1417291	Tamari, Mousa	sr:competitor:1642	midfielder	JOR	9
sr:player:1566136	Adams, Akor	sr:competitor:1642	forward	NGA	8
sr:player:1626034	Coulibaly, Tanguy	sr:competitor:1642	midfielder	FRA	70
sr:player:1643682	Chotard, Joris	sr:competitor:1642	midfielder	FRA	13
sr:player:1727736	Bares, Gabriel	sr:competitor:1642	midfielder	CHE	15
sr:player:2282343	Mouanga, Yael	sr:competitor:1642	defender	FRA	47
sr:player:2292229	Tchato, Enzo	sr:competitor:1642	defender	CMR	29
sr:player:2353567	Gueguin, Axel	sr:competitor:1642	forward	FRA	38
sr:player:2354207	Ndiaye, Junior	sr:competitor:1642	forward	ARE	41
sr:player:2355113	Dzodic, Stefan	sr:competitor:1642	midfielder	SRB	45
sr:player:2407545	Fayad, Khalil	sr:competitor:1642	midfielder	FRA	22
sr:player:2610163	Issoufou, Yanis Ali	sr:competitor:1642	forward	FRA	39
sr:player:2662093	Mincarelli, Lucas	sr:competitor:1642	defender	FRA	21
sr:player:2724634	Maamma, Othmane	sr:competitor:1642	forward	MAR	14
sr:player:2755237	Chennahi, Theo	sr:competitor:1642	midfielder	FRA	44
sr:player:2764773	Nzingoula, Rabby	sr:competitor:1642	midfielder	FRA	19
sr:player:2836843	Mamilo, Craig	sr:competitor:1642	defender	FRA	43
sr:player:2836873	Ngosso, Glenn	sr:competitor:1642	forward	CMR	28
sr:player:2868353	Cara, Simon	sr:competitor:1642	forward	FRA	99
sr:player:1382035	Kaufmann, Mikkel	sr:competitor:5885	forward	DNK	29
sr:player:1475188	Schoppner, Jan	sr:competitor:5885	midfielder	DEU	3
sr:player:1484014	Breunig, Maximilian	sr:competitor:5885	forward	DEU	14
sr:player:1508031	Keller, Thomas	sr:competitor:5885	midfielder	DEU	27
sr:player:1724590	Tschernuth, Paul	sr:competitor:5885	goalkeeper	AUT	34
sr:player:1870330	Scienza, Leo	sr:competitor:5885	forward	BRA	8
sr:player:2116054	Kerber, Luca	sr:competitor:5885	midfielder	DEU	20
sr:player:2264579	Wanner, Paul	sr:competitor:5885	midfielder	DEU	10
sr:player:2289205	Feller, Frank	sr:competitor:5885	goalkeeper	DEU	40
sr:player:2453901	Negele, Christopher	sr:competitor:5885	midfielder	DEU	25
sr:player:2513097	Janes, Luka	sr:competitor:5885	midfielder	DEU	36
sr:player:3577	Dante	sr:competitor:1661	defender	BRA	4
sr:player:96542	Dupe, Maxime	sr:competitor:1661	goalkeeper	FRA	31
sr:player:144864	Clauss, Jonathan	sr:competitor:1661	defender	FRA	92
sr:player:149730	Laborde, Gaetan	sr:competitor:1661	forward	FRA	24
sr:player:250133	Sanson, Morgan	sr:competitor:1661	midfielder	FRA	11
sr:player:367056	Boga, Jeremie	sr:competitor:1661	midfielder	CIV	7
sr:player:543760	Mendy, Antoine	sr:competitor:1661	defender	FRA	33
sr:player:868968	Rosario, Pablo	sr:competitor:1661	midfielder	NLD	8
sr:player:1012411	Ndombele, Tanguy	sr:competitor:1661	midfielder	FRA	22
sr:player:1134899	Abdi, Ali	sr:competitor:1661	defender	TUN	2
sr:player:1243200	Bulka, Marcin	sr:competitor:1661	goalkeeper	POL	1
sr:player:1261810	Moffi, Terem	sr:competitor:1661	forward	NGA	9
sr:player:1322900	Bard, Melvin	sr:competitor:1661	defender	FRA	26
sr:player:1428491	Guessand, Evann	sr:competitor:1661	forward	CIV	29
sr:player:1508075	Diop, Sofiane	sr:competitor:1661	forward	MAR	10
sr:player:1745371	Ndayishimiye, Youssouf	sr:competitor:1661	midfielder	BDI	55
sr:player:1748615	Boudaoui, Hichem	sr:competitor:1661	midfielder	DZA	6
sr:player:1948506	Moukoko, Youssoufa	sr:competitor:1661	forward	DEU	15
sr:player:2049255	Boulhendi, Teddy	sr:competitor:1661	goalkeeper	DZA	77
sr:player:2062163	Cho, Mohamed-Ali	sr:competitor:1661	forward	FRA	25
sr:player:2100868	Ilie, Rares	sr:competitor:1661	forward	ROU	18
sr:player:2276815	Bouanani, Badredine	sr:competitor:1661	midfielder	DZA	19
sr:player:2551583	Bombito, Moise	sr:competitor:1661	defender	CAN	64
sr:player:2592851	Louchet, Tom	sr:competitor:1661	midfielder	FRA	20
sr:player:2631709	Mohamed, Abdelmonem	sr:competitor:1661	defender	EGY	5
sr:player:2682719	Doumbouya, Amidou	sr:competitor:1661	defender	FRA	44
sr:player:2755221	Camara, Issiaga	sr:competitor:1661	midfielder	GIN	36
sr:player:2781411	Salhi, Iliesse	sr:competitor:1661	midfielder	FRA	41
sr:player:2837631	Nandjou, Yael	sr:competitor:1661	defender	FRA	42
sr:player:2837633	Orakpo, Victor	sr:competitor:1661	forward	NGA	45
sr:player:187207	Bero, Matus	sr:competitor:2542	midfielder	SVK	19
sr:player:253517	Holtmann, Gerrit	sr:competitor:2542	forward	PHL	21
sr:player:254125	Wittek, Maximilian	sr:competitor:2542	defender	DEU	32
sr:player:340719	Hofmann, Philipp	sr:competitor:2542	forward	DEU	33
sr:player:355644	Loosli, Noah	sr:competitor:2542	defender	CHE	41
sr:player:358984	Miyoshi, Koji	sr:competitor:2542	midfielder	JPN	23
sr:player:758642	Masovic, Erhan	sr:competitor:2542	defender	SRB	4
sr:player:822562	Passlack, Felix	sr:competitor:2542	midfielder	DEU	15
sr:player:878728	Daschner, Lukas	sr:competitor:2542	midfielder	DEU	7
sr:player:902432	Kwarteng, Moritz	sr:competitor:2542	midfielder	DEU	11
sr:player:943504	De Wit, Dani	sr:competitor:2542	midfielder	NLD	10
sr:player:947668	Bernardo	sr:competitor:2542	defender	BRA	5
sr:player:950204	Sissoko, Ibrahima	sr:competitor:2542	midfielder	FRA	6
sr:player:1064548	Boadu, Myron	sr:competitor:2542	forward	NLD	9
sr:player:1101201	Grave, Paul	sr:competitor:2542	goalkeeper	DEU	34
sr:player:1104619	Medic, Jakov	sr:competitor:2542	defender	HRV	13
sr:player:1131853	Elezi, Agon	sr:competitor:2542	midfielder	MKD	17
sr:player:1403565	Broschinski, Moritz	sr:competitor:2542	forward	DEU	29
sr:player:1957933	Balde, Aliou	sr:competitor:2542	forward	GIN	22
sr:player:2221526	Bamba, Samuel	sr:competitor:2542	forward	DEU	18
sr:player:2387345	Oermann, Tim	sr:competitor:2542	defender	DEU	14
sr:player:2395523	Jahn, Niklas	sr:competitor:2542	midfielder	DEU	16
sr:player:2400939	Tolba, Mohammed	sr:competitor:2542	defender	DEU	25
sr:player:2650709	Pannewig, Mats	sr:competitor:2542	midfielder	DEU	24
sr:player:2812117	Koerdt, Lennart	sr:competitor:2542	midfielder	DEU	28
sr:player:100390	Bizot, Marco	sr:competitor:1715	goalkeeper	NLD	40
sr:player:123264	Martin, Jonas	sr:competitor:1715	midfielder	FRA	28
sr:player:141080	Lala, Kenny	sr:competitor:1715	defender	FRA	7
sr:player:143344	Haidara, Massadio	sr:competitor:1715	defender	MLI	22
sr:player:328035	Chardonnet, Brendan	sr:competitor:1715	defender	FRA	5
sr:player:330099	Fernandes, Edimilson	sr:competitor:1715	defender	CHE	6
sr:player:342915	Amavi, Jordan	sr:competitor:1715	defender	FRA	23
sr:player:343971	Ajorque, Ludovic	sr:competitor:1715	forward	FRA	19
sr:player:557166	Balde, Mama	sr:competitor:1715	forward	GNB	14
sr:player:863224	Lees-Melou, Pierre	sr:competitor:1715	midfielder	FRA	20
sr:player:933148	Del Castillo, Romain	sr:competitor:1715	midfielder	FRA	10
sr:player:960554	Pereira Lage, Mathias	sr:competitor:1715	midfielder	FRA	26
sr:player:1079858	Magnetti, Hugo	sr:competitor:1715	midfielder	FRA	8
sr:player:1244592	Coudert, Gregorie	sr:competitor:1715	goalkeeper	FRA	30
sr:player:1368608	Faivre, Romain	sr:competitor:1715	midfielder	FRA	21
sr:player:1378987	Camara, Mahdi	sr:competitor:1715	midfielder	FRA	45
sr:player:1744149	Ndiaye, Niakhate	sr:competitor:1715	defender	SEN	3
sr:player:1965535	Coulibaly, Soumaila	sr:competitor:1715	defender	FRA	44
sr:player:2073733	Sima, Abdallah	sr:competitor:1715	forward	SEN	17
sr:player:2146366	Le Cardinal, Julien	sr:competitor:1715	defender	FRA	25
sr:player:2200276	Locko, Bradley	sr:competitor:1715	defender	FRA	2
sr:player:2206092	Camblan, Axel	sr:competitor:1715	forward	FRA	11
sr:player:2267807	Doumbia, Kamory	sr:competitor:1715	midfielder	MLI	9
sr:player:2400111	Salah, Ibrahim	sr:competitor:1715	forward	MAR	34
sr:player:2712528	Zogbe, Luck	sr:competitor:1715	defender	CIV	12
sr:player:2781385	Kante, Ibrahim	sr:competitor:1715	forward	FRA	\N
sr:player:2836727	Jauny, Noah	sr:competitor:1715	goalkeeper	IRL	50
sr:player:2842935	Botz, Leo	sr:competitor:1715	forward	FRA	\N
sr:player:2850287	Diop, Saliou	sr:competitor:1715	forward	SEN	33
sr:player:935174	Majecki, Radoslaw	sr:competitor:1653	goalkeeper	POL	1
sr:player:1011757	Henrique, Caio	sr:competitor:1653	defender	BRA	12
sr:player:1107621	Diatta, Krepin	sr:competitor:1653	midfielder	SEN	27
sr:player:1479646	Balogun, Folarin	sr:competitor:1653	forward	USA	9
sr:player:1566730	Salisu, Mohammed	sr:competitor:1653	defender	GHA	22
sr:player:1624468	Matazo, Eliot	sr:competitor:1653	midfielder	BEL	8
sr:player:1712423	Singo, Wilfried	sr:competitor:1653	defender	CIV	17
sr:player:2110120	Vanderson	sr:competitor:1653	defender	BRA	2
sr:player:2208758	Lienard, Yann	sr:competitor:1653	goalkeeper	FRA	50
sr:player:2238030	Akliouche, Maghnes	sr:competitor:1653	midfielder	FRA	11
sr:player:2282397	Magassa, Soungoutou	sr:competitor:1653	defender	FRA	88
sr:player:2354201	Mawissa, Christian	sr:competitor:1653	defender	FRA	13
sr:player:2401679	Ouattara, Kassoum	sr:competitor:1653	defender	FRA	20
sr:player:2411243	Ben Seghir, Eliesse	sr:competitor:1653	forward	MAR	7
sr:player:2536187	Ilenikhena, George	sr:competitor:1653	forward	FRA	21
sr:player:2563389	Diop, Edan	sr:competitor:1653	midfielder	FRA	37
sr:player:2592623	Camara, Lamine	sr:competitor:1653	midfielder	SEN	15
sr:player:2610839	Bouabre, Saimon	sr:competitor:1653	midfielder	FRA	42
sr:player:2728100	Nibombe, Samuel Kondi	sr:competitor:1653	midfielder	BEL	44
sr:player:2762649	Michal, Lucas	sr:competitor:1653	forward	FRA	41
sr:player:2771137	Benama, Mayssam	sr:competitor:1653	midfielder	FRA	33
sr:player:100621	King, Joshua	sr:competitor:1681	forward	NOR	13
sr:player:123388	Sidibe, Djibril	sr:competitor:1681	defender	FRA	19
sr:player:139256	Zajc, Miha	sr:competitor:1681	midfielder	SVN	21
sr:player:784043	Schmidt, Niklas	sr:competitor:1681	midfielder	DEU	20
sr:player:833189	Sierro, Vincent	sr:competitor:1681	midfielder	CHE	8
sr:player:855438	Nicolaisen, Rasmus	sr:competitor:1681	defender	DNK	2
sr:player:958476	Suazo, Gabriel	sr:competitor:1681	defender	CHL	17
sr:player:1064542	Aboukhlal, Zakaria	sr:competitor:1681	forward	MAR	7
sr:player:1083808	Genreau, Denis	sr:competitor:1681	midfielder	AUS	5
sr:player:1085110	Donnum, Aron	sr:competitor:1681	forward	NOR	15
sr:player:1135147	Casseres Jr, Cristian	sr:competitor:1681	midfielder	VEN	23
sr:player:1340338	Gboho, Yann	sr:competitor:1681	midfielder	FRA	10
sr:player:1399755	McKenzie, Mark	sr:competitor:1681	defender	USA	3
sr:player:1484868	Dominguez, Alex	sr:competitor:1681	goalkeeper	ESP	30
sr:player:1728701	Kamanzi, Waren	sr:competitor:1681	defender	NOR	12
sr:player:2074547	Cresswell, Charlie	sr:competitor:1681	defender	ENG	4
sr:player:2199870	Babicka, Shavy	sr:competitor:1681	forward	GAB	80
sr:player:2280611	Magri, Frank	sr:competitor:1681	forward	CMR	9
sr:player:2352353	Akdag, Umit	sr:competitor:1681	defender	ROU	6
sr:player:2532173	Aradj, Ylies	sr:competitor:1681	defender	FRA	26
sr:player:2543681	Restes, Guillaume	sr:competitor:1681	goalkeeper	FRA	50
sr:player:2651977	Lacombe, Justin	sr:competitor:1681	goalkeeper	FRA	40
sr:player:2691640	Saka, Mathis	sr:competitor:1681	midfielder	FRA	39
sr:player:2691642	Edjouma, Noah	sr:competitor:1681	forward	FRA	31
sr:player:2757347	Wasbauer, Nicolas	sr:competitor:1681	defender	FRA	32
sr:player:2795443	Messali, Rafik	sr:competitor:1681	midfielder	DZA	22
sr:player:2839263	Canvot, Jaydee	sr:competitor:1681	defender	FRA	39
sr:player:2839271	Methalie, Dayann	sr:competitor:1681	defender	FRA	33
sr:player:352908	Descamps, Remy	sr:competitor:1649	goalkeeper	FRA	40
sr:player:354808	Benrahma, Said	sr:competitor:1649	forward	DZA	17
sr:player:758168	Niakhate, Moussa	sr:competitor:1649	defender	SEN	19
sr:player:984769	Akouokou, Paul	sr:competitor:1649	midfielder	CIV	4
sr:player:1057291	Caqueret, Maxence	sr:competitor:1649	midfielder	FRA	6
sr:player:1121667	Perri, Lucas	sr:competitor:1649	goalkeeper	BRA	23
sr:player:1601352	Cherki, Rayan	sr:competitor:1649	midfielder	FRA	18
sr:player:1617214	Vinicius, Abner	sr:competitor:1649	defender	BRA	16
sr:player:1635908	Da Silva, Florent	sr:competitor:1649	midfielder	FRA	28
sr:player:1951498	Omari, Warmed	sr:competitor:1649	defender	FRA	27
sr:player:1981109	Mikautadze, Georges	sr:competitor:1649	forward	GEO	69
sr:player:2024883	Tessmann, Tanner	sr:competitor:1649	midfielder	USA	15
sr:player:2059767	Bengui Joao, Justin	sr:competitor:1649	goalkeeper	FRA	30
sr:player:2059769	Lomami, Irvyn	sr:competitor:1649	defender	FRA	\N
sr:player:2144308	Lega, Sekou	sr:competitor:1649	forward	FRA	36
sr:player:2284237	Kumbedi, Sael	sr:competitor:1649	defender	FRA	20
sr:player:2332013	Nuamah, Ernest	sr:competitor:1649	midfielder	GHA	37
sr:player:2346779	Fofana, Malick	sr:competitor:1649	forward	BEL	11
sr:player:2358229	Orban, Gift	sr:competitor:1649	forward	NGA	9
sr:player:2387499	El Djebali, Chaim	sr:competitor:1649	midfielder	TUN	33
sr:player:2437785	Diawara, Mahamadou	sr:competitor:1649	forward	FRA	34
sr:player:2805301	Honore Molebe, Enzo Anthony	sr:competitor:1649	forward	FRA	29
sr:player:2256609	Kari, Ayman	sr:competitor:1644	midfielder	FRA	44
sr:player:2304851	Doue, Desire	sr:competitor:1644	forward	FRA	14
sr:player:2437775	Zague, Yoram	sr:competitor:1644	defender	FRA	42
sr:player:2568589	Mayulu, Senny	sr:competitor:1644	midfielder	FRA	24
sr:player:2691336	El Hannach, Naoufel	sr:competitor:1644	defender	MAR	45
sr:player:2716386	Mbaye, Ibrahim	sr:competitor:1644	forward	FRA	49
sr:player:2470041	Lafont, Gael	sr:competitor:1641	midfielder	FRA	47
sr:player:2781393	Bakola, Darryl	sr:competitor:1641	midfielder	FRA	50
sr:player:2781403	Sternal, Enzo	sr:competitor:1641	forward	FRA	22
sr:player:2790933	Abdallah, Keyliane	sr:competitor:1641	forward	FRA	48
sr:player:2837625	Koum, Alexi	sr:competitor:1641	defender	FRA	43
sr:player:186017	Sobol, Eduard	sr:competitor:1659	defender	UKR	77
sr:player:1060571	Petrovic, Djordje	sr:competitor:1659	goalkeeper	SRB	1
sr:player:1422017	Bakwa, Dilane	sr:competitor:1659	forward	FRA	26
sr:player:1630670	Nanasi, Sebastian	sr:competitor:1659	midfielder	SWE	15
sr:player:1974919	Doue, Guela	sr:competitor:1659	defender	CIV	22
sr:player:2058611	Mara, Sekou	sr:competitor:1659	forward	FRA	14
sr:player:2059791	Doukoure, Ismael	sr:competitor:1659	defender	FRA	29
sr:player:2064967	Emegha, Emanuel	sr:competitor:1659	forward	NLD	10
sr:player:2126276	Senaya, Marvin	sr:competitor:1659	defender	FRA	28
sr:player:2142560	Sahi, Moise	sr:competitor:1659	forward	CIV	11
sr:player:2197344	Lemarechal, Felix	sr:competitor:1659	midfielder	FRA	6
sr:player:2202982	Diarra, Habib	sr:competitor:1659	midfielder	SEN	19
sr:player:2206840	Sow, Saidou	sr:competitor:1659	defender	GIN	4
sr:player:2211338	Kandil, Nordine	sr:competitor:1659	midfielder	MAR	21
sr:player:2217066	Bellaarouch, Alaa	sr:competitor:1659	goalkeeper	MAR	36
sr:player:2240507	Moreira, Diego	sr:competitor:1659	forward	PRT	7
sr:player:2284455	Santos, Andrey	sr:competitor:1659	midfielder	BRA	8
sr:player:2288363	Wiley, Caleb	sr:competitor:1659	defender	USA	12
sr:player:2313399	Ouattara, Abdoul	sr:competitor:1659	midfielder	FRA	42
sr:player:2314177	Perea, Oscar	sr:competitor:1659	forward	COL	20
sr:player:2337739	Sylla, Abakar	sr:competitor:1659	defender	CIV	5
sr:player:2343283	Mwanga, Junior	sr:competitor:1659	midfielder	FRA	18
sr:player:2354191	Sarr, Mamadou	sr:competitor:1659	defender	FRA	23
sr:player:2411237	Risser, Robin	sr:competitor:1659	goalkeeper	FRA	16
sr:player:2430527	Lukovic, Milos	sr:competitor:1659	forward	SRB	9
sr:player:2610833	Ferro, Nolan	sr:competitor:1659	midfielder	FRA	38
sr:player:2622377	Gomis, Yoni	sr:competitor:1659	defender	FRA	25
sr:player:2718702	Diallo, Tidiane	sr:competitor:1659	midfielder	FRA	35
sr:player:2720512	Sebas, Jeremy	sr:competitor:1659	forward	FRA	40
sr:player:2721820	Diong, Pape	sr:competitor:1659	midfielder	SEN	17
sr:player:2748609	El Mourabet, Samir	sr:competitor:1659	midfielder	MAR	39
sr:player:2755831	Bechikh, Mohamed	sr:competitor:1659	forward	FRA	37
sr:player:2773127	Ali Abdallah, Aboubacar	sr:competitor:1659	forward	FRA	34
sr:player:2835221	Hasbi, Walid	sr:competitor:1659	goalkeeper	MAR	50
sr:player:2837403	Tutu Mayangila, Ryan	sr:competitor:1659	goalkeeper	COD	60
sr:player:2880133	Messi, Rayane	sr:competitor:1659	forward	FRA	47
sr:player:27035	Ayew, Andre	sr:competitor:1662	midfielder	GHA	28
sr:player:54308	Nego, Loic	sr:competitor:1662	defender	HUN	7
sr:player:123226	Gorgelin, Mathieu	sr:competitor:1662	goalkeeper	FRA	1
sr:player:149732	Toure, Abdoulaye	sr:competitor:1662	midfielder	GIN	94
sr:player:287887	Lloris, Gautier	sr:competitor:1662	defender	FRA	4
sr:player:335865	Kuzyaev, Daler	sr:competitor:1662	midfielder	RUS	14
sr:player:363532	El Hajjam, Oualid	sr:competitor:1662	defender	MAR	17
sr:player:789253	Salmier, Yoann	sr:competitor:1662	defender	GUF	22
sr:player:832895	Confais, Alois	sr:competitor:1662	midfielder	FRA	25
sr:player:856950	Desmas, Arthur	sr:competitor:1662	goalkeeper	FRA	30
sr:player:936060	Kitala, Yann	sr:competitor:1662	forward	FRA	9
sr:player:986289	Grandsir, Samuel	sr:competitor:1662	forward	FRA	29
sr:player:1071258	Operi, Christopher	sr:competitor:1662	midfielder	CIV	27
sr:player:1134259	Sabbi, Emmanuel	sr:competitor:1662	midfielder	USA	11
sr:player:1626024	Pembele, Timothee	sr:competitor:1662	defender	FRA	32
sr:player:1724740	Youte Kinkoue, Etienne	sr:competitor:1662	defender	FRA	6
sr:player:1744845	Zouaoui, Yanis	sr:competitor:1662	midfielder	FRA	18
sr:player:1834298	N'Diaye, Rassoul	sr:competitor:1662	midfielder	FRA	19
sr:player:1953886	Soumare, Issa	sr:competitor:1662	forward	SEN	45
sr:player:2081461	Targhalline, Oussama	sr:competitor:1662	midfielder	MAR	5
sr:player:2087975	Casimir, Josue	sr:competitor:1662	forward	GLP	10
sr:player:2147004	Sangante, Arouna	sr:competitor:1662	defender	SEN	93
sr:player:2159148	Kechta, Yassine	sr:competitor:1662	midfielder	MAR	8
sr:player:2159158	Bodmer, Matheo	sr:competitor:1662	midfielder	FRA	12
sr:player:2256621	Housni, Ilyes	sr:competitor:1662	forward	MAR	46
sr:player:2402611	Logbo, Andy	sr:competitor:1662	forward	FRA	20
sr:player:2411273	Ngoura, Steve	sr:competitor:1662	forward	FRA	77
sr:player:2538403	Joujou, Antoine	sr:competitor:1662	midfielder	FRA	21
sr:player:2610827	Argney, Paul	sr:competitor:1662	goalkeeper	FRA	50
sr:player:2610841	Bouneb, Ismail	sr:competitor:1662	midfielder	FRA	44
sr:player:2836751	Londja, Ruben	sr:competitor:1662	forward	CHE	\N
sr:player:2836783	Mosengo, Daren Nbenbege	sr:competitor:1662	midfielder	FRA	78
sr:player:209768	Capelle, Pierrick	sr:competitor:1684	midfielder	FRA	15
sr:player:283083	Hunou, Adrien	sr:competitor:1684	forward	FRA	23
sr:player:294641	Diony, Lois	sr:competitor:1684	forward	FRA	9
sr:player:342911	Hountondji, Cedric	sr:competitor:1684	defender	BEN	22
sr:player:363042	Lefort, Jordan	sr:competitor:1684	defender	FRA	21
sr:player:580642	Belkebla, Haris	sr:competitor:1684	midfielder	DZA	93
sr:player:832897	Carlens, Arcus	sr:competitor:1684	defender	HTI	2
sr:player:1002659	Ferhat, Zinedine	sr:competitor:1684	midfielder	DZA	20
sr:player:1057369	Lepaul, Esteban	sr:competitor:1684	forward	FRA	19
sr:player:1118039	Fofana, Yahia	sr:competitor:1684	goalkeeper	CIV	30
sr:player:1134283	Niane, Ibrahima	sr:competitor:1684	forward	SEN	7
sr:player:1393257	Sabanovic, Halid	sr:competitor:1684	defender	BIH	4
sr:player:1492708	El Melali, Farid	sr:competitor:1684	midfielder	DZA	28
sr:player:1564748	Abdelli, Himad	sr:competitor:1684	midfielder	DZA	10
sr:player:1638948	Zinga, Melvin	sr:competitor:1684	goalkeeper	FRA	16
sr:player:1700577	Allevinah, Jim	sr:competitor:1684	forward	GAB	18
sr:player:1973105	Khaled, Zinedine Ould	sr:competitor:1684	midfielder	FRA	12
sr:player:2060135	Camara, Ousmane	sr:competitor:1684	midfielder	FRA	29
sr:player:2081459	Dieng, Bamba	sr:competitor:1684	forward	SEN	99
sr:player:2282335	Ekomie, Jacques	sr:competitor:1684	defender	GAB	3
sr:player:2320821	Belkhdim, Yassin	sr:competitor:1684	midfielder	FRA	14
sr:player:2530543	Biumla, Emmanuel	sr:competitor:1684	midfielder	FRA	24
sr:player:2536749	Raolisoa, Lilian	sr:competitor:1684	defender	FRA	27
sr:player:2586747	Kalumba, Justin-Noel	sr:competitor:1684	forward	FRA	17
sr:player:2647471	Courcoul, Marius	sr:competitor:1684	defender	FRA	5
sr:player:2653811	Cherif, Sidiki	sr:competitor:1684	forward	FRA	11
sr:player:2763671	Pona, Oumar	sr:competitor:1684	goalkeeper	FRA	40
sr:player:2805305	Louer, Marius	sr:competitor:1684	defender	FRA	33
sr:player:2880713	Moussaoui, Amine	sr:competitor:1684	forward	FRA	34
sr:player:902524	Olliero, Alexandre	sr:competitor:1682	goalkeeper	FRA	20
sr:player:935680	De Smet, Thibault	sr:competitor:1682	defender	BEL	25
sr:player:945906	Akieme, Sergio	sr:competitor:1682	defender	ESP	18
sr:player:951508	Teuma, Teddy	sr:competitor:1682	midfielder	MLT	10
sr:player:1011783	Diouf, Yehvann	sr:competitor:1682	goalkeeper	FRA	94
sr:player:1137863	Okumu, Joseph	sr:competitor:1682	defender	KEN	2
sr:player:1233088	Kipre, Cedric	sr:competitor:1682	defender	CIV	21
sr:player:1257248	Munetsi, Marshall	sr:competitor:1682	midfielder	ZWE	15
sr:player:1322510	Nakamura, Keito	sr:competitor:1682	midfielder	JPN	17
sr:player:1554411	Busi, Maxime	sr:competitor:1682	defender	BEL	4
sr:player:1575916	Khadra, Reda	sr:competitor:1682	midfielder	DEU	14
sr:player:1649060	Daramy, Mohammed	sr:competitor:1682	forward	DNK	9
sr:player:2062765	Agbadou, Emmanuel	sr:competitor:1682	defender	CIV	5
sr:player:2125354	De La Cruz, Maiky	sr:competitor:1682	defender	ECU	\N
sr:player:2286363	Diakite, Oumar	sr:competitor:1682	midfielder	CIV	22
sr:player:2295401	Salama, Amine	sr:competitor:1682	midfielder	FRA	11
sr:player:2354193	Atangana, Valentin	sr:competitor:1682	midfielder	FRA	6
sr:player:2431731	Fofana, Yaya	sr:competitor:1682	midfielder	MLI	71
sr:player:2607567	Moscardo, Gabriel	sr:competitor:1682	midfielder	BRA	19
sr:player:2610831	Sangui, Nhoa	sr:competitor:1682	defender	FRA	55
sr:player:2615511	Diakhon, Mamadou	sr:competitor:1682	forward	FRA	67
sr:player:2709632	Kone, Amadou	sr:competitor:1682	midfielder	MLI	72
sr:player:2800797	Kone, Abdoul	sr:competitor:1682	defender	FRA	92
sr:player:2836969	Sissoko, Niama Pape	sr:competitor:1682	forward	MLI	74
sr:player:2850747	Bamba, Mohamed	sr:competitor:1682	midfielder	CIV	63
sr:player:2859647	Henry, Kobi Joseph	sr:competitor:1682	defender	USA	44
sr:player:887838	Larsonneur, Gautier	sr:competitor:1678	goalkeeper	FRA	30
sr:player:912940	Cafaro, Mathieu	sr:competitor:1678	midfielder	FRA	18
sr:player:919572	Fomba, Lamine	sr:competitor:1678	midfielder	FRA	26
sr:player:941560	Petrot, Leo	sr:competitor:1678	defender	FRA	19
sr:player:950814	Sissoko, Ibrahim	sr:competitor:1678	forward	MLI	9
sr:player:973965	Davitashvili, Zuriko	sr:competitor:1678	forward	GEO	22
sr:player:1122629	Nade, Mickael	sr:competitor:1678	defender	FRA	3
sr:player:1295636	Cornud, Pierre	sr:competitor:1678	defender	FRA	17
sr:player:1882264	Macon, Yvann	sr:competitor:1678	defender	FRA	27
sr:player:1957349	Old, Ben	sr:competitor:1678	midfielder	NZL	11
sr:player:1993897	Moueffek, Aimen	sr:competitor:1678	midfielder	FRA	29
sr:player:2062383	Bouchouari, Benjamin	sr:competitor:1678	midfielder	MAR	6
sr:player:2120430	Fall, Boubacar	sr:competitor:1678	goalkeeper	SEN	16
sr:player:2122194	Boakye, Augustine	sr:competitor:1678	midfielder	GHA	20
sr:player:2161304	Saban, Mathys	sr:competitor:1678	midfielder	FRA	44
sr:player:2161306	Lhery, Yanis	sr:competitor:1678	forward	FRA	\N
sr:player:2200338	Nokoue, Bryan	sr:competitor:1678	defender	CMR	48
sr:player:2285697	Ekwah, Pierre	sr:competitor:1678	midfielder	FRA	4
sr:player:2286903	Mouton, Louis	sr:competitor:1678	midfielder	FRA	14
sr:player:2354205	Aiki, Ayman	sr:competitor:1678	forward	FRA	39
sr:player:2366235	Miladinovic, Igor	sr:competitor:1678	midfielder	SRB	28
sr:player:2423163	Stassin, Lucas	sr:competitor:1678	forward	BEL	32
sr:player:2430401	Gauthier, Antoine	sr:competitor:1678	midfielder	FRA	34
sr:player:2470891	Othman, Jibril	sr:competitor:1678	forward	TUN	41
sr:player:2619577	Fall, Cheikh	sr:competitor:1678	midfielder	SEN	31
sr:player:2650975	Amougou, Mathis	sr:competitor:1678	midfielder	FRA	37
sr:player:2772675	Mayilla, Enzo	sr:competitor:1678	forward	FRA	65
sr:player:2803137	Toure, Issiaka	sr:competitor:1678	goalkeeper	FRA	40
sr:player:2837627	Pedro, Kevin	sr:competitor:1678	defender	FRA	45
sr:player:2837629	N'Zuzi, Marwann	sr:competitor:1678	defender	FRA	35
sr:player:945386	Matusiwa, Azor	sr:competitor:1658	midfielder	NLD	6
sr:player:1057341	Gouiri, Amine	sr:competitor:1658	forward	DZA	10
sr:player:1428487	Wooh, Christopher	sr:competitor:1658	defender	CMR	4
sr:player:1600884	Kalimuendo, Arnaud	sr:competitor:1658	forward	FRA	9
sr:player:1631946	Alemdar, Dogan	sr:competitor:1658	goalkeeper	TUR	80
sr:player:1644134	Ahamada, Naouirou	sr:competitor:1658	midfielder	FRA	32
sr:player:1951496	Truffert, Adrien	sr:competitor:1658	defender	FRA	3
sr:player:1957959	Faye, Mikayil	sr:competitor:1658	defender	SEN	15
sr:player:1984875	Assignon, Lorenz	sr:competitor:1658	defender	FRA	22
sr:player:2032795	Gronbaek, Albert	sr:competitor:1658	midfielder	DNK	7
sr:player:2059985	Seidu, Alidu	sr:competitor:1658	defender	GHA	36
sr:player:2219974	Meister, Henrik	sr:competitor:1658	forward	DNK	19
sr:player:2249523	James, Jordan	sr:competitor:1658	midfielder	WAL	17
sr:player:2258009	Gomez, Andres	sr:competitor:1658	midfielder	COL	20
sr:player:2709602	Nagida, Mahamadou	sr:competitor:1658	defender	CMR	18
sr:player:2714096	Ait Boudlal, Abdelhamid	sr:competitor:1658	defender	MAR	\N
sr:player:2759981	Cisse, Djaoui	sr:competitor:1658	midfielder	FRA	38
sr:player:2781379	Meite, Mohamed Kader	sr:competitor:1658	forward	FRA	62
sr:player:2098688	Abrego, Gonzalo	sr:competitor:6074	midfielder	ARG	32
sr:player:2100976	Torres, Cristian Gonzalo	sr:competitor:6074	midfielder	ARG	28
sr:player:2108234	Ardiles, Facundo	sr:competitor:6074	defender	ARG	30
sr:player:2113382	Ulariaga, Nahuel	sr:competitor:6074	forward	ARG	9
sr:player:2113472	Cingolani, Luciano	sr:competitor:6074	forward	ARG	17
sr:player:2116760	Pino, Martin	sr:competitor:6074	forward	ARG	22
sr:player:2147214	Luciano, Martin	sr:competitor:6074	defender	ARG	37
sr:player:2188610	Villalobos, Manuel Agustín	sr:competitor:6074	defender	ARG	29
sr:player:2188620	Leyes, Bruno	sr:competitor:6074	midfielder	ARG	5
sr:player:2204002	Altamira, Facundo	sr:competitor:6074	defender	ARG	41
sr:player:2336465	Moreyra, Gaston Emanuel	sr:competitor:6074	midfielder	ARG	11
sr:player:2342533	Salinas, Edilson	sr:competitor:6074	goalkeeper	ARG	40
sr:player:2448181	Santiago, Mariano	sr:competitor:6074	midfielder	ARG	16
sr:player:2477601	Falasco, Lucio	sr:competitor:6074	midfielder	ARG	33
sr:player:2534511	Arce, Ismael Lucas Ariel	sr:competitor:6074	defender	ARG	4
sr:player:2548607	Barrea, Daniel	sr:competitor:6074	forward	ARG	36
sr:player:2549303	Mendoza	sr:competitor:6074	defender	ARG	26
sr:player:2558479	Perez, Juan	sr:competitor:6074	midfielder	COL	50
sr:player:2593511	Valverde, Claudio	sr:competitor:6074	defender	ARG	8
sr:player:2760035	Butti, Facundo Martin	sr:competitor:6074	defender	ARG	20
sr:player:2777683	Martinez, Santiago	sr:competitor:6074	midfielder	ARG	\N
sr:player:2790189	Briones, Enzo	sr:competitor:6074	midfielder	ARG	43
sr:player:2828899	Pascual, Luciano	sr:competitor:6074	midfielder	ARG	35
sr:player:2857939	Gonzalez, Alexis	sr:competitor:6074	forward	ARG	42
sr:player:2859679	Andino Valencia, Santino	sr:competitor:6074	forward	ARG	27
sr:player:2863857	Moran, Juan	sr:competitor:6074	defender	ARG	43
sr:player:135256	Norgaard, Christian	sr:competitor:50	midfielder	DNK	6
sr:player:137774	Mee, Ben	sr:competitor:50	defender	ENG	16
sr:player:171919	Flekken, Mark	sr:competitor:50	goalkeeper	NLD	1
sr:player:576384	Ajer, Kristoffer	sr:competitor:50	defender	NOR	20
sr:player:599128	Henry, Rico	sr:competitor:50	defender	ENG	3
sr:player:775687	Jensen, Mathias	sr:competitor:50	midfielder	DNK	8
sr:player:796084	Da Silva, Josh	sr:competitor:50	midfielder	ENG	10
sr:player:822586	Janelt, Vitaly	sr:competitor:50	midfielder	DEU	27
sr:player:871210	Wissa, Yoane	sr:competitor:50	midfielder	COD	11
sr:player:935526	Roerslev, Mads	sr:competitor:50	defender	DNK	30
sr:player:1056935	Pinnock, Ethan	sr:competitor:50	defender	JAM	5
sr:player:1058769	Maghoma, Edmond-Paris	sr:competitor:50	midfielder	ENG	32
sr:player:1069190	Collins, Nathan	sr:competitor:50	defender	IRL	22
sr:player:1141630	Valdimarsson, Hakon	sr:competitor:50	goalkeeper	ISL	12
sr:player:1336192	Damsgaard, Mikkel	sr:competitor:50	forward	DNK	24
sr:player:1404425	Van den Berg, Sepp	sr:competitor:50	defender	NLD	4
sr:player:1413499	Mbeumo, Bryan	sr:competitor:50	forward	CMR	19
sr:player:1575774	Schade, Kevin	sr:competitor:50	forward	DEU	7
sr:player:1652589	Hickey, Aaron	sr:competitor:50	midfielder	SCO	2
sr:player:1662121	Lewis-Potter, Keane	sr:competitor:50	forward	ENG	23
sr:player:1858626	Yarmoliuk, Yehor	sr:competitor:50	midfielder	UKR	18
sr:player:2065067	Cox, Matthew	sr:competitor:50	goalkeeper	ENG	13
sr:player:2074545	Carvalho, Fabio	sr:competitor:50	midfielder	PRT	14
sr:player:2232678	Thiago, Igor	sr:competitor:50	forward	BRA	9
sr:player:2296809	Ji-soo, Kim	sr:competitor:50	defender	KOR	36
sr:player:2375191	Nunes, Gustavo	sr:competitor:50	forward	BRA	\N
sr:player:2426355	Trevitt, Ryan	sr:competitor:50	midfielder	ENG	28
sr:player:2610775	Morgan, Iwan	sr:competitor:50	forward	WAL	40
sr:player:2611327	Meghoma, Jayden	sr:competitor:50	defender	ENG	21
sr:player:2657821	Konak, Yunus Emre	sr:competitor:50	midfielder	TUR	26
sr:player:2836739	Yogane, Tony	sr:competitor:50	midfielder	ENG	42
sr:player:10589	Young, Ashley	sr:competitor:48	defender	ENG	18
sr:player:13918	Begovic, Asmir	sr:competitor:48	goalkeeper	BIH	31
sr:player:76632	Coleman, Seamus	sr:competitor:48	defender	IRL	23
sr:player:96535	Doucoure, Abdoulaye	sr:competitor:48	midfielder	MLI	16
sr:player:106337	Gueye, Idrissa Gana	sr:competitor:48	midfielder	SEN	27
sr:player:110846	Keane, Michael	sr:competitor:48	defender	ENG	5
sr:player:138530	Pickford, Jordan	sr:competitor:48	goalkeeper	ENG	1
sr:player:145188	Tarkowski, James	sr:competitor:48	defender	ENG	6
sr:player:198028	Alli, Dele	sr:competitor:48	midfielder	ENG	20
sr:player:372344	Calvert-Lewin, Dominic	sr:competitor:48	forward	ENG	9
sr:player:815708	Mangala, Orel	sr:competitor:48	midfielder	BEL	8
sr:player:935132	Mykolenko, Vitaliy	sr:competitor:48	defender	UKR	19
sr:player:936352	Virginia, Joao	sr:competitor:48	goalkeeper	PRT	12
sr:player:951350	Harrison, Jack	sr:competitor:48	midfielder	ENG	11
sr:player:1297412	Garner, James	sr:competitor:48	midfielder	ENG	37
sr:player:1297776	Broja, Armando	sr:competitor:48	forward	ALB	\N
sr:player:1381883	Patterson, Nathan	sr:competitor:48	defender	SCO	2
sr:player:1484502	McNeil, Dwight	sr:competitor:48	midfielder	ENG	7
sr:player:1574022	Lindstrom, Jesper	sr:competitor:48	midfielder	DNK	29
sr:player:1645136	O'Brien, Jake	sr:competitor:48	defender	IRL	15
sr:player:1658367	Beto	sr:competitor:48	forward	PRT	14
sr:player:1720484	Branthwaite, Jarrad	sr:competitor:48	midfielder	ENG	32
sr:player:2120122	Ndiaye, Iliman	sr:competitor:48	forward	SEN	10
sr:player:2125558	Tyrer, Harry	sr:competitor:48	goalkeeper	ENG	53
\.


--
-- Data for Name: Stadium; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Stadium" (id, name, city, country, capacity) FROM stdin;
sr:venue:8249	Estadio do CD das Aves	Vila das Aves	Portugal	8560
sr:venue:910	Estadio Jose Alvalade	Lisbon	Portugal	50044
sr:venue:14556	Estadio do Bessa XXI	Porto	Portugal	28263
sr:venue:8289	Estadio Municipal de Arouca	Arouca	Portugal	5600
sr:venue:1199	Estadio Algarve	Algarve	Portugal	30305
sr:venue:2539	Estadio Cidade de Barcelos	Barcelos	Portugal	12504
sr:venue:2178	Kenilworth Road	Luton	England	10226
sr:venue:1138	MKM Stadium	Hull	England	25400
sr:venue:598	Bramall Lane	Sheffield	England	32702
sr:venue:2547	Hillsborough Stadium	Sheffield	England	39812
sr:venue:638	Fratton Park	Portsmouth	England	21100
sr:venue:2223	Elland Road	Leeds	England	40242
sr:venue:2194	Ricoh Arena	Coventry	England	32753
sr:venue:806	Turf Moor	Burnley	England	21401
sr:venue:613	Diego Armando Maradona	Buenos Aires	Argentina	26000
sr:venue:1567	Estadio Marcelo Bielsa	Rosario	Argentina	38095
sr:venue:17150	Estadio Guillermo Laza	Flores	Argentina	3000
sr:venue:69401	Estadio Claudio Chiqui Tapia	Barracas	Argentina	4400
sr:venue:1009	Estadio Monumental Antonio Vespucio Liberti	Buenos Aires	Argentina	61321
sr:venue:12033	Estadio Presidente Peron	Cordoba	Argentina	26535
sr:venue:1007	Estadio Ciudad de La Plata	La Plata	Argentina	32530
sr:venue:634	Florencio Sola	Buenos Aires	Argentina	34901
sr:venue:4754	Estadio 15 de Abril	Santa Fe de la Vera Cruz	Argentina	28000
sr:venue:4750	Estadio Julio Cesar Villagra	Cordoba	Argentina	30500
sr:venue:1079	Jose Amalfitani	Buenos Aires	Argentina	45540
sr:venue:57376	Estadio Unico Madre De Ciudades	Santiago del Estero	Argentina	30000
sr:venue:9	Old Trafford	Manchester	England	75635
sr:venue:624	Emirates Stadium	London	England	60272
sr:venue:53349	Brentford Community Stadium	London	England	17250
sr:venue:2231	St. Mary's Stadium	Southampton	England	32505
sr:venue:2443	American Express Community Stadium	Falmer	England	30750
sr:venue:2183	King Power Stadium	Leicester	England	32312
sr:venue:815	Villa Park	Birmingham	England	42682
sr:venue:10	Selhurst Park	London	England	25073
sr:venue:1272	Molineux Stadium	Wolverhampton	England	30852
sr:venue:606	Etihad Stadium	Manchester	England	53400
sr:venue:579	Anfield	Liverpool	England	60000
sr:venue:760	Visit Mallorca Estadi	Palma	Spain	26000
sr:venue:21414	Riyadh Air Metropolitano	Madrid	Spain	67942
sr:venue:608	Coliseum Alfonso Pérez	Getafe	Spain	17393
sr:venue:9311	Estadio de Mendizorroza	Vitoria-Gasteiz	Spain	19840
sr:venue:739	Estadio El Sadar	Pamplona	Spain	19800
sr:venue:730	Ramon Sanchez Pizjuan	Seville	Spain	45500
sr:venue:726	Philips Stadion	Eindhoven	Netherlands	35000
sr:venue:3261	Yanmar Stadion	Almere	Netherlands	3000
sr:venue:689	Goffertstadion	Nijmegen	Netherlands	12500
sr:venue:615	AFAS Stadion	Alkmaar	Netherlands	17023
sr:venue:584	Grolsch Veste Stadium	Enschede	Netherlands	30205
sr:venue:685	Mandemakers Stadion	Waalwijk	Netherlands	7500
sr:venue:759	Signal Iduna Park	Dortmund	Germany	81365
sr:venue:648	MHP Arena	Stuttgart	Germany	60449
sr:venue:578	An der alten Forsterei	Berlin	Germany	22012
sr:venue:738	Vonovia Ruhrstadion	Bochum	Germany	27559
sr:venue:46514	Stade Oceane	Le Havre	France	25181
sr:venue:850	Red Bull Arena	Leipzig	Germany	42558
sr:venue:593	BayArena	Leverkusen	Germany	30210
sr:venue:1275	Stade de la Mosson	Montpellier	France	22000
sr:venue:831	Stade Louis II	Fontvieille	Monaco	18523
sr:venue:19889	Stade Raymond Kopa	Angers	France	17835
sr:venue:13184	Allianz Rivera	Nice	France	36178
sr:venue:951	Braga Municipal	Braga	Portugal	30286
sr:venue:813	Vicarage Road	Watford	England	21400
sr:venue:1082	Estadio Juan Domingo Peron	Buenos Aires	Argentina	51389
sr:venue:18379	London Stadium	London	England	66000
sr:venue:611	Craven Cottage	London	England	25700
sr:venue:974	Gran Canaria	Las Palmas de Gran Canaria	Spain	32400
sr:venue:754	Santiago Bernabeu	Madrid	Spain	81044
sr:venue:612	Stadion Feijenoord	Rotterdam	Netherlands	51177
sr:venue:788	Borussia-Park	Monchengladbach	Germany	54057
sr:venue:835	Stade Bollaert-Delelis	Lens	France	38223
sr:venue:43626	Estadio Pina Manique	Lisbon	Portugal	5000
sr:venue:1135	bet365 Stadium	Stoke	England	30089
sr:venue:12021	Estadio Tomas Adolfo Duco	Buenos Aires	Argentina	48314
sr:venue:2188	Portman Road Stadium	Ipswich	England	30311
sr:venue:765	St. James' Park	Newcastle upon Tyne	England	52338
sr:venue:1307	RCDE Stadium	Cornella	Spain	40500
sr:venue:11380	Estadi Montilivi	Girona	Spain	14286
sr:venue:574	Allianz Arena	Munich	Germany	75000
sr:venue:17406	Groupama Stadium	Lyon	France	59186
sr:venue:843	Parc des Princes	Paris	France	47929
sr:venue:5312	Parque de Jogos Comendador Joaquim de Almeida Freitas	Moreira de Conegos	Portugal	6153
sr:venue:631	Ewood Park	Blackburn	England	31367
sr:venue:1099	Libertadores de America	Buenos Aires	Argentina	52595
sr:venue:1329	Estadio Dr. Lisandro de la Torre	Rosario	Argentina	41654
sr:venue:44628	Alberto Jose Armando	Buenos Aires	Argentina	49000
sr:venue:799	Stamford Bridge	London	England	41798
sr:venue:697	Municipal de Balaidos	Vigo	Spain	31800
sr:venue:35438	Hitachi Capital Mobility Stadium	Groningen	Netherlands	22579
sr:venue:2406	Mewa Arena	Mainz	Germany	34000
sr:venue:844	Roazhon Park	Rennes	France	29778
sr:venue:5318	Estadio de Sao Miguel	Ponta Delgada	Portugal	13277
sr:venue:2221	Carrow Road	Norwich	England	27244
sr:venue:851	Stadium of Light	Sunderland	England	48707
sr:venue:15676	Estadio Malvinas Argentinas	Mendoza	Argentina	40268
sr:venue:12025	Estadio Norberto Tomaghello	Gobernador Julio A. Costa	Argentina	12000
sr:venue:28762	Tottenham Hotspur Stadium	London	England	60463
sr:venue:691	Mestalla	Valencia	Spain	55000
sr:venue:2440	Estadio de Vallecas	Madrid	Spain	14708
sr:venue:18994	Mac3Park Stadion	Zwolle	Netherlands	14000
sr:venue:659	Holstein-Stadion	Kiel	Germany	11386
sr:venue:1871	Stade Auguste-Delaune	Reims	France	21029
sr:venue:907	Estadio do Dragao	Porto	Portugal	50033
sr:venue:2505	Ashton Gate	Bristol	England	21497
sr:venue:14324	Estadio Pedro Bidegain	Flores	Argentina	39494
sr:venue:12	Goodison Park	Liverpool	England	39571
sr:venue:714	Estadi Olimpic Lluis Companys	Barcelona	Spain	54367
sr:venue:14888	Estadio Municipal de Butarque	Leganes	Spain	11454
sr:venue:2081	Rat Verlegh Stadion	Breda	Netherlands	19000
sr:venue:1089	PreZero Arena	Sinsheim	Germany	30150
sr:venue:953	Stade de la Beaujoire	Nantes	France	37473
sr:venue:2645	Estadio Municipal de Rio Maior	Rio Maior	Portugal	6500
sr:venue:1335	Estadio da Madeira	Funchal	Portugal	5132
sr:venue:660	Home Park	Plymouth	England	18000
sr:venue:981	Estadio Ciudad de Lanus	Buenos Aires	Argentina	47027
sr:venue:12031	Estadio Bautista Gargantini	Mendoza	Argentina	18000
sr:venue:1045	Benito Villamarin	Seville	Spain	60721
sr:venue:729	Erve Asito	Almelo	Netherlands	8500
sr:venue:577	Johan Cruijff ArenA	Amsterdam	Netherlands	54000
sr:venue:61056	Europa-Park-Stadion	Freiburg im Breisgau	Germany	34700
sr:venue:848	Stadium de Toulouse	Toulouse	France	33150
sr:venue:12069	Estadio de Sao Luis	Faro	Portugal	12000
sr:venue:3002	Deepdale	Preston	England	23408
sr:venue:12712	Estadio Ciudad de Vicente Lopez	Florida	Argentina	31000
sr:venue:880	Jose Zorrilla	Valladolid	Spain	27846
sr:venue:619	Estadio de la Ceramica	Villarreal	Spain	23500
sr:venue:2769	Fortuna Sittard Stadion	Sittard-Geleen	Netherlands	12500
sr:venue:1655	WWK ARENA	Augsburg	Germany	30660
sr:venue:767	Stade de l'Abbe-Deschamps	Auxerre	France	23467
sr:venue:16520	Estadio Municipal de Famalicao	Vila Nova de Famalicao	Portugal	5307
sr:venue:2352	The Den	London	England	20146
sr:venue:1693	Loftus Road Stadium	London	England	18439
sr:venue:2388	Estadio Mario Alberto Kempes	Cordoba	Argentina	57000
sr:venue:751	San Mames Stadium	Bilbao	Spain	53000
sr:venue:656	Sparta Stadium Het Kasteel	Rotterdam	Netherlands	11026
sr:venue:791	Millerntor-Stadion	Hamburg	Germany	29546
sr:venue:847	Stade de la Meinau	Strasbourg	France	29200
sr:venue:2013	Estadio dos Arcos	Vila do Conde	Portugal	12815
sr:venue:1136	The Hawthorns	West Bromwich	England	26445
sr:venue:1514	Cardiff City Stadium	Cardiff	Wales	26828
sr:venue:49307	Estadio Alfredo Terrera	Santiago del Estero	Argentina	20000
sr:venue:3293	De Adelaarshorst	Deventer	Netherlands	8000
sr:venue:816	Volkswagen Arena	Wolfsburg	Germany	30000
sr:venue:1858	Stade Francis-Le Ble	Brest	France	15097
sr:venue:1137	Dom Afonso Henriques	Guimaraes	Portugal	30008
sr:venue:743	Riverside	Middlesbrough	England	34988
sr:venue:8975	Estadio Eva Peron	Junin	Argentina	22000
sr:venue:826	Willem II Stadion	Tilburg	Netherlands	14637
sr:venue:821	Weserstadion	Bremen	Germany	42100
sr:venue:837	Stade Pierre Mauroy	Lille	France	50186
sr:venue:5326	Estadio Antonio Coimbra da Mota	Estoril	Portugal	8000
sr:venue:2366	Kassam Stadium	Oxford	England	12500
sr:venue:1689	Liberty Stadium	Swansea	Wales	20827
sr:venue:12017	Estadio Monumental Jose Fierro	San Miguel de Tucuman	Argentina	32700
sr:venue:569	Abe Lenstra Stadion	Heerenveen	Netherlands	26100
sr:venue:34054	Voith-Arena	Heidenheim an der Brenz	Germany	15000
sr:venue:845	Stade Geoffroy Guichard	Saint Etienne	France	42000
sr:venue:53523	Estadio Jose Gomes	Amadora	Portugal	9288
sr:venue:902	Estadio do Sport Lisboa e Benfica	Lisbon	Portugal	64642
sr:venue:852	Pride Park Stadium	Derby	England	33597
sr:venue:4738	Estadio Jose Dellagiovanna	Buenos Aires	Argentina	26282
sr:venue:12003	Estadio Juan Carmelo Zerillo	La Plata	Argentina	24544
sr:venue:2230	City Ground	Nottingham	England	30603
sr:venue:2990	Vitality Stadium	Bournemouth	England	11700
sr:venue:581	Reale Arena	San Sebastian	Spain	32076
sr:venue:786	Stadion Galgenwaard	Utrecht	Netherlands	24500
sr:venue:67707	Deutsche Bank Park	Frankfurt	Germany	48000
sr:venue:839	Orange Velodrome	Marseille	France	67000
\.


--
-- Data for Name: Standings; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Standings" (id, "competitionId", "teamId", "position", played, win, loss, draw, goals_for, goals_against, points, form) FROM stdin;
5645	sr:season:118689	sr:competitor:44	1	11	9	1	1	21	6	28	WWDWW
5647	sr:season:119799	sr:competitor:2952	1	12	11	1	0	40	9	33	WWWLW
5650	sr:season:119799	sr:competitor:2948	2	11	9	1	1	20	11	28	WWLWW
5651	sr:season:119799	sr:competitor:2953	3	11	8	1	2	25	11	26	WWWWD
5646	sr:season:119847	sr:competitor:3001	1	11	11	0	0	39	5	33	WWWWW
5653	sr:season:119847	sr:competitor:3002	2	11	9	2	0	28	8	27	WWWWL
5654	sr:season:119847	sr:competitor:3006	3	10	8	1	1	28	7	25	WWWWW
5655	sr:season:119847	sr:competitor:3011	4	11	7	4	0	14	12	21	WLWLW
5656	sr:season:119847	sr:competitor:2999	5	11	6	3	2	19	11	20	WLWWL
5657	sr:season:119847	sr:competitor:3009	6	11	5	3	3	12	11	18	DDDWL
5658	sr:season:119847	sr:competitor:49531	7	11	4	2	5	12	9	17	DDLWD
5659	sr:season:119847	sr:competitor:3014	8	11	5	4	2	15	14	17	LWWLW
5660	sr:season:119847	sr:competitor:36365	9	11	3	4	4	10	14	13	DLWDD
5661	sr:season:119847	sr:competitor:3036	10	11	3	5	3	10	20	12	LDLDW
5662	sr:season:119847	sr:competitor:3010	11	11	2	5	4	14	19	10	LWLLL
5663	sr:season:119847	sr:competitor:4500	12	11	2	5	4	8	16	10	LLWLD
5664	sr:season:119847	sr:competitor:1031053	13	11	2	5	4	9	19	10	DDLLD
5648	sr:season:114317	sr:competitor:3208	1	22	12	3	7	35	15	43	DDDWD
5666	sr:season:118689	sr:competitor:17	2	11	7	2	2	22	13	23	WWWLL
5667	sr:season:118689	sr:competitor:38	3	11	5	2	4	21	13	19	DLWDD
5668	sr:season:118689	sr:competitor:42	4	11	5	2	4	18	12	19	WLDLD
5669	sr:season:118689	sr:competitor:14	5	11	5	2	4	15	10	19	DWWWL
5670	sr:season:118689	sr:competitor:30	6	11	5	2	4	19	15	19	WWDLW
5671	sr:season:118689	sr:competitor:43	7	11	5	3	3	16	13	18	LLDWW
5672	sr:season:118689	sr:competitor:39	8	11	5	3	3	13	11	18	DLLWW
5673	sr:season:118689	sr:competitor:40	9	11	5	3	3	17	17	18	DWDLL
5674	sr:season:118689	sr:competitor:33	10	11	5	5	1	23	13	16	LWLWL
5675	sr:season:118689	sr:competitor:50	11	11	5	5	1	22	22	16	WLWLW
5676	sr:season:118689	sr:competitor:60	12	11	4	4	3	15	15	15	LWDWL
5677	sr:season:118689	sr:competitor:35	13	11	4	4	3	12	12	15	DWLDW
5678	sr:season:118689	sr:competitor:37	14	11	3	5	3	13	19	12	WLWLD
5679	sr:season:118689	sr:competitor:31	15	11	2	5	4	14	21	10	WWLDL
5680	sr:season:118689	sr:competitor:48	16	11	2	5	4	10	17	10	DWDLD
5681	sr:season:118689	sr:competitor:32	17	11	1	5	5	12	22	8	LLLDW
5682	sr:season:118689	sr:competitor:7	18	11	1	6	4	8	15	7	LLWDL
5683	sr:season:118689	sr:competitor:3	19	11	1	7	3	16	27	6	LLDDW
5685	sr:season:118689	sr:competitor:45	20	11	1	9	1	7	21	4	LLLWL
5652	sr:season:119799	sr:competitor:2959	4	12	7	1	4	28	13	25	WWLWW
5686	sr:season:119799	sr:competitor:2955	5	12	6	2	4	24	11	22	LDWWD
5687	sr:season:119799	sr:competitor:2950	6	12	5	5	2	23	14	17	LLDLL
5688	sr:season:119799	sr:competitor:2957	7	12	5	5	2	13	16	17	WDWWL
5689	sr:season:119847	sr:competitor:2995	14	11	2	6	3	7	15	9	LDLWL
5692	sr:season:114317	sr:competitor:7629	2	22	11	2	9	25	11	42	WDDWW
5694	sr:season:114317	sr:competitor:3215	3	22	11	7	4	32	21	37	WLWWW
5695	sr:season:114317	sr:competitor:3211	4	22	9	4	9	30	16	36	DDWWW
5696	sr:season:114317	sr:competitor:3210	5	22	9	4	9	26	22	36	LDDLW
5697	sr:season:114317	sr:competitor:3204	6	22	10	6	6	24	21	36	LWWLW
5698	sr:season:114317	sr:competitor:36833	7	22	9	7	6	21	22	33	LWDWL
5705	sr:season:119847	sr:competitor:744135	15	11	2	6	3	10	20	9	WLDLW
5707	sr:season:119847	sr:competitor:25777	16	11	2	7	2	6	19	8	LDLLD
5708	sr:season:119847	sr:competitor:3013	17	10	2	6	2	6	15	8	LDLWL
5709	sr:season:119799	sr:competitor:2962	8	12	5	6	1	19	10	16	LWLWW
5710	sr:season:119847	sr:competitor:2998	18	11	1	8	2	5	18	5	DWLLD
5711	sr:season:119799	sr:competitor:2961	9	12	4	5	3	13	12	15	WDLLW
5712	sr:season:119799	sr:competitor:2979	10	12	4	5	3	15	20	15	WLDDL
5706	sr:season:114317	sr:competitor:3202	8	22	8	7	7	27	23	31	LDLWW
5716	sr:season:114317	sr:competitor:191648	9	22	8	7	7	23	23	31	WDDDD
5718	sr:season:114317	sr:competitor:3209	10	22	6	4	12	19	14	30	WDDWL
5720	sr:season:114317	sr:competitor:3203	11	22	7	6	9	27	25	30	LDLDW
5722	sr:season:114317	sr:competitor:3206	12	22	7	6	9	25	23	30	WDDDD
5724	sr:season:114317	sr:competitor:36837	13	22	7	6	9	17	16	30	WWDDD
5726	sr:season:114317	sr:competitor:4937	14	22	8	9	5	28	25	29	LDLLL
5728	sr:season:114317	sr:competitor:3205	15	22	7	7	8	20	19	29	DLDDW
5730	sr:season:114317	sr:competitor:6074	16	22	6	6	10	23	24	28	WDDLL
5732	sr:season:114317	sr:competitor:3201	17	22	7	8	7	18	19	28	WLWDW
5734	sr:season:114317	sr:competitor:3218	18	22	6	7	9	22	28	27	LLWWD
5736	sr:season:114317	sr:competitor:7628	19	22	6	8	8	25	28	26	WDDLL
5738	sr:season:114317	sr:competitor:3216	20	22	7	10	5	18	22	26	WLDLW
5740	sr:season:114317	sr:competitor:3217	21	22	6	9	7	23	22	25	DDLDL
5644	sr:season:118693	sr:competitor:2672	1	10	8	0	2	33	7	26	DWWWW
5690	sr:season:118693	sr:competitor:36360	2	10	6	1	3	15	5	21	WWWLD
5691	sr:season:118693	sr:competitor:2674	3	10	6	2	2	26	16	20	DLDWW
5693	sr:season:118693	sr:competitor:2681	4	10	4	1	5	21	16	17	DWDDD
5649	sr:season:118691	sr:competitor:2817	1	13	11	2	0	40	12	33	WWWWL
5665	sr:season:119835	sr:competitor:1644	1	11	9	0	2	33	10	29	DWWWW
5684	sr:season:118699	sr:competitor:41	1	15	9	2	4	25	11	31	WWDDD
5699	sr:season:118693	sr:competitor:2538	5	10	5	3	2	13	11	17	WWLDD
5700	sr:season:119835	sr:competitor:1653	2	11	7	2	2	18	8	23	WDLLW
5701	sr:season:118693	sr:competitor:2547	6	10	4	2	4	9	8	16	WWDLD
5702	sr:season:119835	sr:competitor:1641	3	11	6	3	2	24	15	20	DWLWL
5703	sr:season:118693	sr:competitor:2673	7	10	5	4	1	18	18	16	LWLWL
5704	sr:season:119835	sr:competitor:1643	4	11	5	2	4	18	11	19	WDWDD
5713	sr:season:118693	sr:competitor:2534	8	10	4	3	3	17	21	15	LWDLW
5714	sr:season:118693	sr:competitor:2527	9	10	4	4	2	15	14	14	LWDWD
5715	sr:season:119835	sr:competitor:1649	5	11	5	3	3	18	15	18	WWDDW
5717	sr:season:118691	sr:competitor:2829	2	12	8	1	3	25	11	27	DWWLW
5719	sr:season:118691	sr:competitor:2836	3	13	7	1	5	19	7	26	DWLWW
5721	sr:season:118691	sr:competitor:2819	4	12	7	2	3	23	19	24	WLDWW
5723	sr:season:118691	sr:competitor:2820	5	13	6	4	3	17	20	21	DLWWL
5725	sr:season:118691	sr:competitor:2825	6	13	5	3	5	19	13	20	LWDDD
5727	sr:season:118691	sr:competitor:2816	7	13	5	3	5	14	12	20	LWWDD
5729	sr:season:118691	sr:competitor:2824	8	13	5	5	3	11	10	18	DWLWW
5731	sr:season:118691	sr:competitor:2826	9	13	5	5	3	10	10	18	LWDLL
5733	sr:season:118691	sr:competitor:24264	10	13	5	5	3	16	17	18	WLLWW
5735	sr:season:118691	sr:competitor:2821	11	13	5	6	2	20	22	17	WLLWD
5737	sr:season:118691	sr:competitor:2818	12	12	4	4	4	13	13	16	DWLWL
5739	sr:season:118691	sr:competitor:2833	13	13	4	6	3	12	18	15	WLWLL
5741	sr:season:118691	sr:competitor:2845	14	13	3	5	5	13	16	14	DLWLW
5743	sr:season:118691	sr:competitor:2885	15	13	4	8	1	14	22	13	LLLWL
5744	sr:season:118691	sr:competitor:6577	16	13	3	7	3	16	22	12	LWWLW
5745	sr:season:118691	sr:competitor:2859	17	13	1	5	7	8	11	10	DDDLL
5746	sr:season:118691	sr:competitor:2814	18	12	3	8	1	11	22	10	LWLLL
5747	sr:season:118691	sr:competitor:2831	19	13	2	8	3	10	25	9	LWLLD
5748	sr:season:118691	sr:competitor:2828	20	11	1	6	4	8	17	7	DLDLD
5750	sr:season:118693	sr:competitor:2556	10	10	3	3	4	15	14	13	WLDDW
5751	sr:season:118693	sr:competitor:2677	11	10	3	3	4	19	19	13	DLWDL
5752	sr:season:118693	sr:competitor:2524	12	10	3	4	3	19	18	12	WLDDW
5753	sr:season:118693	sr:competitor:2600	13	10	3	4	3	13	20	12	WLWDD
5754	sr:season:118693	sr:competitor:5885	14	10	3	6	1	13	15	10	LLDLL
5755	sr:season:118693	sr:competitor:2569	15	10	2	5	3	13	19	9	DWDLD
5756	sr:season:118693	sr:competitor:2526	16	10	2	6	2	7	12	8	LLDWL
5757	sr:season:118693	sr:competitor:2573	17	10	1	7	2	12	25	5	DLLWL
5758	sr:season:118693	sr:competitor:2542	18	10	0	8	2	10	30	2	LLLLD
5765	sr:season:118699	sr:competitor:15	2	15	10	2	3	19	7	31	LWWWW
5766	sr:season:118699	sr:competitor:34	3	15	8	2	5	24	9	29	WDWLW
5767	sr:season:118699	sr:competitor:6	4	15	7	2	6	18	6	27	DDLDW
5768	sr:season:118699	sr:competitor:8	5	15	6	2	7	16	9	25	DDDDW
5769	sr:season:118699	sr:competitor:24	6	15	8	6	1	23	22	25	LWWLW
5770	sr:season:118699	sr:competitor:36	7	15	7	5	3	23	17	24	WDLWW
5771	sr:season:118699	sr:competitor:25	8	15	6	4	5	18	13	23	WWWWD
5773	sr:season:118699	sr:competitor:46	9	15	6	5	4	19	17	22	DLLLW
5772	sr:season:119835	sr:competitor:1661	6	11	4	2	5	21	11	17	DDWWD
5774	sr:season:118699	sr:competitor:58	10	15	5	3	7	20	19	22	DDWLW
5775	sr:season:119835	sr:competitor:1682	7	11	5	4	2	19	15	17	WLLLW
5776	sr:season:119835	sr:competitor:1648	8	11	4	2	5	12	9	17	DWLLW
5777	sr:season:118699	sr:competitor:74	11	15	5	6	4	11	10	19	DLWWL
5778	sr:season:119835	sr:competitor:1646	9	11	5	5	1	20	19	16	LWDWW
5779	sr:season:118699	sr:competitor:27	12	15	5	6	4	19	19	19	DDLWD
5780	sr:season:118699	sr:competitor:29	13	15	5	6	4	18	19	19	DLWWD
5781	sr:season:119835	sr:competitor:1681	10	11	4	4	3	13	11	15	LDWWW
5782	sr:season:118699	sr:competitor:263	14	15	4	5	6	23	22	18	DDLLL
5783	sr:season:119835	sr:competitor:1659	11	11	3	4	4	20	22	13	DLWLL
5784	sr:season:118699	sr:competitor:12	15	15	5	7	3	17	25	18	DWLWL
5785	sr:season:119835	sr:competitor:1715	12	11	4	6	1	14	19	13	WDWLL
5786	sr:season:118699	sr:competitor:95	16	15	4	6	5	17	18	17	DLLWL
5787	sr:season:119835	sr:competitor:1658	13	11	3	6	2	13	18	11	LDWLL
5788	sr:season:119835	sr:competitor:1647	14	11	2	5	4	14	17	10	LDLLL
5789	sr:season:119835	sr:competitor:1684	15	11	2	5	4	13	20	10	DDWWL
5790	sr:season:119835	sr:competitor:1678	16	11	3	7	1	10	25	10	WLLWL
5742	sr:season:114317	sr:competitor:65676	22	22	6	9	7	23	28	25	WDLDD
5759	sr:season:114317	sr:competitor:36839	23	22	6	9	7	23	30	25	LDWWW
5760	sr:season:114317	sr:competitor:36842	24	22	6	9	7	15	23	25	LWDDL
5761	sr:season:114317	sr:competitor:3219	25	22	5	10	7	20	28	22	DWLDL
5762	sr:season:114317	sr:competitor:42338	26	22	4	9	9	15	23	21	DDDLL
5763	sr:season:114317	sr:competitor:3212	27	22	5	11	6	15	29	21	LDLLL
5764	sr:season:114317	sr:competitor:65668	28	22	3	12	7	10	29	16	LDWLL
5791	sr:season:119835	sr:competitor:1662	17	11	3	8	0	8	23	9	LLLWL
5793	sr:season:119835	sr:competitor:1642	18	11	2	8	1	11	31	7	LLLLW
5792	sr:season:118699	sr:competitor:11	17	15	4	7	4	20	21	16	DWWLD
5794	sr:season:118699	sr:competitor:71	18	15	4	7	4	15	26	16	LDLWD
5795	sr:season:118699	sr:competitor:96	19	15	3	6	6	16	20	15	DDDLL
5796	sr:season:118699	sr:competitor:21	20	15	3	6	6	15	23	15	DDLDL
5797	sr:season:118699	sr:competitor:72	21	15	4	8	3	17	26	15	LLDWL
5798	sr:season:118699	sr:competitor:61	22	15	4	8	3	14	23	15	WDWLL
5799	sr:season:118699	sr:competitor:2	23	15	2	7	6	16	28	12	LLDLW
5800	sr:season:118699	sr:competitor:1	24	15	1	7	7	12	25	10	DDDLL
5749	sr:season:119799	sr:competitor:2947	11	12	5	7	0	12	21	15	WWWLL
5801	sr:season:119799	sr:competitor:2964	12	12	4	6	2	13	23	14	DLWLW
5802	sr:season:119799	sr:competitor:2951	13	12	3	6	3	12	19	12	LLLLW
5803	sr:season:119799	sr:competitor:2971	14	12	3	6	3	14	22	12	DLLDW
5804	sr:season:119799	sr:competitor:2977	15	12	3	6	3	12	23	12	LLLWL
5805	sr:season:119799	sr:competitor:2960	16	12	2	5	5	12	18	11	LDLLL
5806	sr:season:119799	sr:competitor:2990	17	12	1	8	3	6	27	6	LDWLL
5807	sr:season:119799	sr:competitor:2956	18	12	1	10	1	10	31	4	LDLWL
\.


--
-- Data for Name: Team; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."Team" (id, name, city, country, "managerName", "stadiumId", logo, "shortName") FROM stdin;
sr:competitor:42	Arsenal FC	London	ENG	Arteta, Mikel	sr:venue:624	https://crests.football-data.org/57.png	ARS
sr:competitor:48	Everton FC	Liverpool	ENG	Dyche, Sean	sr:venue:12	https://crests.football-data.org/62.png	EVE
sr:competitor:43	Fulham FC	London	ENG	Silva, Marco	sr:venue:611	https://crests.football-data.org/63.png	FUL
sr:competitor:17	Manchester City	Manchester	ENG	Guardiola, Pep	sr:venue:606	https://crests.football-data.org/65.png	MCI
sr:competitor:35	Manchester United	Manchester	ENG	Amorim, Ruben	sr:venue:9	https://crests.football-data.org/66.png	MUN
sr:competitor:33	Tottenham Hotspur	London	ENG	Postecoglou, Ange	sr:venue:28762	https://crests.football-data.org/73.png	TOT
sr:competitor:3	Wolverhampton Wanderers	Wolverhampton	ENG	O'Neil, Gary	sr:venue:1272	https://crests.football-data.org/76.png	WOL
sr:competitor:31	Leicester City	Leicester	ENG	Cooper, Steve	sr:venue:2183	https://crests.football-data.org/338.png	LEI
sr:competitor:32	Ipswich Town	Ipswich	ENG	McKenna, Kieran	sr:venue:2188	https://crests.football-data.org/349.png	IPS
sr:competitor:7	Crystal Palace	London	ENG	Glasner, Oliver	sr:venue:10	https://crests.football-data.org/354.png	CRY
sr:competitor:37	West Ham United	London	ENG	Lopetegui, Julen	sr:venue:18379	https://crests.football-data.org/563.png	WHU
sr:competitor:60	AFC Bournemouth	Bournemouth	ENG	Iraola, Andoni	sr:venue:2990	https://crests.football-data.org/bournemouth.png	BOU
sr:competitor:2825	Athletic Bilbao	Bilbao	ESP	Valverde, Ernesto	sr:venue:751	https://crests.football-data.org/77.png	ATH
sr:competitor:2820	CA Osasuna	Pamplona	ESP	Moreno, Vicente	sr:venue:739	https://crests.football-data.org/79.png	OSA
sr:competitor:2859	Getafe CF	Getafe	ESP	Bordalas, Pepe	sr:venue:608	https://crests.football-data.org/82.png	GET
sr:competitor:2826	RCD Mallorca	Palma	ESP	Arrasate, Jagoba	sr:venue:760	https://crests.football-data.org/89.png	MAL
sr:competitor:2824	Real Sociedad San Sebastian	San Sebastian	ESP	Alguacil, Imanol	sr:venue:581	https://crests.football-data.org/92.png	RSO
sr:competitor:2885	Deportivo Alaves	Vitoria-Gasteiz	ESP	Garcia, Luis	sr:venue:9311	https://crests.football-data.org/263.png	ALA
sr:competitor:6577	UD Las Palmas	Las Palmas de Gran Canaria	ESP	Martinez, Diego	sr:venue:974	https://crests.football-data.org/275.png	LPA
sr:competitor:24264	Girona FC	Girona	ESP	Michel	sr:venue:11380	https://crests.football-data.org/298.png	GIR
sr:competitor:2845	CD Leganes	Leganes	ESP	Jimenez, Borja	sr:venue:14888	https://crests.football-data.org/745.png	LEG
sr:competitor:2971	PEC Zwolle	Zwolle	NLD	Jansen, Johnny	sr:venue:18994	https://crests.football-data.org/684.png	ZWO
sr:competitor:30	Brighton & Hove Albion	Falmer	ENG	Hurzeler, Fabian	sr:venue:2443	https://crests.football-data.org/387.png	BRI
sr:competitor:3011	Santa Clara Azores	Ponta Delgada	PRT	Matos, Vasco	sr:venue:5318	https://crests.football-data.org/5530.png	SCL
sr:competitor:14	Nottingham Forest	Nottingham	ENG	Espirito Santo, Nuno	sr:venue:2230	https://crests.football-data.org/351.png	NFO
sr:competitor:2816	Real Betis Seville	Seville	ESP	Pellegrini, Manuel	sr:venue:1045	https://crests.football-data.org/90.png	RBB
sr:competitor:2818	Rayo Vallecano	Madrid	ESP	Perez, Inigo	sr:venue:2440	https://crests.football-data.org/87.png	RVC
sr:competitor:2821	RC Celta de Vigo	Vigo	ESP	Giraldez, Claudio	sr:venue:697	https://crests.football-data.org/558.png	RCC
sr:competitor:2828	Valencia CF	Valencia	ESP	Baraja, Ruben	sr:venue:691	https://crests.football-data.org/95.png	VCF
sr:competitor:2836	Atletico Madrid	Madrid	ESP	Simeone, Diego	sr:venue:21414	https://crests.football-data.org/78.png	ATM
sr:competitor:2677	VfB Stuttgart	Stuttgart	DEU	Hoeness, Sebastian	sr:venue:648	https://crests.football-data.org/10.png	VFB
sr:competitor:2524	VfL Wolfsburg	Wolfsburg	DEU	Hasenhuttl, Ralph	sr:venue:816	https://crests.football-data.org/11.png	WOB
sr:competitor:2534	Werder Bremen	Bremen	DEU	Werner, Ole	sr:venue:821	https://crests.football-data.org/12.png	SVW
sr:competitor:2538	SC Freiburg	Freiburg im Breisgau	DEU	Schuster, Julian	sr:venue:61056	https://crests.football-data.org/17.png	SCF
sr:competitor:2526	FC St. Pauli	Hamburg	DEU	Blessin, Alexander	sr:venue:791	https://crests.football-data.org/20.png	STP
sr:competitor:36360	RB Leipzig	Leipzig	DEU	Rose, Marco	sr:venue:850	https://crests.football-data.org/721.png	RBL
sr:competitor:2814	Espanyol Barcelona	Cornella	ESP	Gonzalez, Manolo	sr:venue:1307	https://crests.football-data.org/80.png	ESP
sr:competitor:2977	Heracles Almelo	Almelo	NLD	Van de Looi, Erwin	sr:venue:729	https://crests.football-data.org/671.png	HER
sr:competitor:2964	SC Heerenveen	Heerenveen	NLD	van Persie, Robin	sr:venue:569	https://crests.football-data.org/673.png	HEE
sr:competitor:2952	PSV Eindhoven	Eindhoven	NLD	Bosz, Peter	sr:venue:726	https://crests.football-data.org/674.png	PSV
sr:competitor:2951	FC Groningen	Groningen	NLD	Lukkien, Dick	sr:venue:35438	https://crests.football-data.org/677.png	GRO
sr:competitor:1643	Lille OSC	Lille	FRA	Genesio, Bruno	sr:venue:837	https://crests.football-data.org/521.png	LIL
sr:competitor:2960	Sparta Rotterdam	Rotterdam	NLD	Steijn, Maurice	sr:venue:656	https://crests.football-data.org/6806.png	SPA
sr:competitor:2947	NAC Breda	Breda	NLD	Hoefkens, Carl	sr:venue:2081	https://crests.football-data.org/512.png	BRE
sr:competitor:2953	Ajax Amsterdam	Amsterdam	NLD	Farioli, Francesco	sr:venue:577	https://crests.football-data.org/519.png	AJA
sr:competitor:1644	Paris Saint-Germain	Paris	FRA	Enrique, Luis	sr:venue:843	https://crests.football-data.org/524.png	PSG
sr:competitor:1658	Stade Rennes	Rennes	FRA	Sampaoli, Jorge	sr:venue:844	https://crests.football-data.org/529.png	REN
sr:competitor:1648	RC Lens	Lens	FRA	Still, Will	sr:venue:835	https://crests.football-data.org/546.png	RCL
sr:competitor:1653	AS Monaco	Fontvieille	FRA	Hutter, Adi	sr:venue:831	https://crests.football-data.org/548.png	ASM
sr:competitor:263	Norwich City	Norwich	ENG	Thorup, Johannes	sr:venue:2221	https://crests.football-data.org/68.png	NOR
sr:competitor:29	Stoke City	Stoke	ENG	Pelach, Narcis	sr:venue:1135	https://crests.football-data.org/70.png	STK
sr:competitor:41	Sunderland AFC	Sunderland	ENG	Le Bris, Regis	sr:venue:851	https://crests.football-data.org/71.png	SUN
sr:competitor:8	West Bromwich Albion	West Bromwich	ENG	Corberan, Carlos	sr:venue:1136	https://crests.football-data.org/74.png	WBA
sr:competitor:96	Hull City	Hull	ENG	Walter, Tim	sr:venue:1138	https://crests.football-data.org/322.png	HUL
sr:competitor:6	Burnley FC	Burnley	ENG	Parker, Scott	sr:venue:806	https://crests.football-data.org/328.png	BUR
sr:competitor:34	Leeds United	Leeds	ENG	Farke, Daniel	sr:venue:2223	https://crests.football-data.org/341.png	LEE
sr:competitor:24	Watford FC	Watford	ENG	Cleverley, Tom	sr:venue:813	https://crests.football-data.org/346.png	WAT
sr:competitor:72	Luton Town	Luton	ENG	Edwards, Rob	sr:venue:2178	https://crests.football-data.org/389.png	LUT
sr:competitor:3002	FC Porto	Porto	PRT	Vitor Bruno	sr:venue:907	https://crests.football-data.org/503.png	FCP
sr:competitor:4500	Estoril Praia	Estoril	PRT	Cathro, Ian	sr:venue:5326	https://crests.football-data.org/582.png	EST
sr:competitor:3013	Nacional da Madeir	Funchal	PRT	Margarido, Tiago	sr:venue:1335	https://crests.football-data.org/5529.png	CDN
sr:competitor:49531	FC Famalicao	Vila Nova de Famalicao	PRT	Evangelista, Armando	sr:venue:16520	https://crests.football-data.org/5531.png	FAM
sr:competitor:3010	Gil Vicente Barcelos	Barcelos	PRT	Pinheiro, Bruno	sr:venue:2539	https://crests.football-data.org/5533.png	GIL
sr:competitor:2672	Bayern Munich	Munich	DEU	Kompany, Vincent	sr:venue:574	https://crests.football-data.org/5.png	BMU
sr:competitor:2681	Bayer Leverkusen	Leverkusen	DEU	Alonso, Xabi	sr:venue:593	https://crests.football-data.org/3.png	LEV
sr:competitor:2547	Union Berlin	Berlin	DEU	Svensson, Bo	sr:venue:578	https://crests.football-data.org/28.png	UNI
sr:competitor:12	Sheffield Wednesday	Sheffield	ENG	Rohl, Danny	sr:venue:2547	https://crests.football-data.org/345.png	SHW
sr:competitor:1642	Montpellier HSC	Montpellier	FRA	Gasset, Jean-Louis	sr:venue:1275	https://crests.football-data.org/518.png	MHS
sr:competitor:1647	FC Nantes	Nantes	FRA	Kombouare, Antoine	sr:venue:953	https://crests.football-data.org/543.png	FCN
sr:competitor:1659	Strasbourg Alsace	Strasbourg	FRA	Rosenior, Liam	sr:venue:847	https://crests.football-data.org/576.png	RCS
sr:competitor:1678	AS Saint-Etienne	Saint Etienne	FRA	Dall'Oglio, Oliver	sr:venue:845	https://crests.football-data.org/527.png	STE
sr:competitor:1715	Stade Brest 29	Brest	FRA	Roy, Eric	sr:venue:1858	https://crests.football-data.org/512.png	STB
sr:competitor:25777	FC Arouca	Arouca	PRT	Seabra, Vasco	sr:venue:8289	https://crests.football-data.org/712.png	ARO
sr:competitor:2961	Willem II Tilburg	Tilburg	NLD	Maes, Peter	sr:venue:826	https://crests.football-data.org/672.png	WIL
sr:competitor:2962	NEC Nijmegen	Nijmegen	NLD	Meijer, Rogier	sr:venue:689	https://crests.football-data.org/1915.png	NIJ
sr:competitor:2979	Go Ahead Eagles	Deventer	NLD	Simonis, Paul	sr:venue:3293	https://crests.football-data.org/718.png	GAE
sr:competitor:3009	Vitoria SC Guimaraes	Guimaraes	PRT	Borges, Rui	sr:venue:1137	https://crests.football-data.org/5543.png	VIT
sr:competitor:3036	Rio Ave FC	Vila do Conde	PRT	Petit	sr:venue:2013	https://crests.football-data.org/496.png	RAV
sr:competitor:58	Bristol City	Bristol	ENG	Hogg, Chris	sr:venue:2505	https://crests.football-data.org/387.png	BRC
sr:competitor:61	Cardiff City	Cardiff	WAL	Riza, Omer	sr:venue:1514	https://crests.football-data.org/715.png	CAC
sr:competitor:95	Oxford United	Oxford	ENG	Buckingham, Des	sr:venue:2366	https://crests.football-data.org/1082.png	OXU
sr:competitor:40	Aston Villa	Birmingham	ENG	Emery, Unai	sr:venue:815	https://crests.football-data.org/58.png	AVL
sr:competitor:38	Chelsea FC	London	ENG	Maresca, Enzo	sr:venue:799	https://crests.football-data.org/61.png	CHE
sr:competitor:44	Liverpool FC	Liverpool	ENG	Slot, Arne	sr:venue:579	https://crests.football-data.org/64.png	LIV
sr:competitor:39	Newcastle United	Newcastle upon Tyne	ENG	Howe, Eddie	sr:venue:765	https://crests.football-data.org/67.png	NEW
sr:competitor:45	Southampton FC	Southampton	ENG	Martin, Russell	sr:venue:2231	https://crests.football-data.org/340.png	SOU
sr:competitor:50	Brentford FC	London	ENG	Frank, Thomas	sr:venue:53349	https://crests.football-data.org/402.png	BRE
sr:competitor:2569	TSG Hoffenheim	Sinsheim	DEU	Ilzer, Christian	sr:venue:1089	https://crests.football-data.org/2.png	TSG
sr:competitor:2673	Borussia Dortmund	Dortmund	DEU	Sahin, Nuri	sr:venue:759	https://crests.football-data.org/4.png	BVB
sr:competitor:2556	FSV Mainz	Mainz	DEU	Henriksen, Bo	sr:venue:2406	https://crests.football-data.org/15.png	M05
sr:competitor:3006	SL Benfica	Lisbon	PRT	Lage, Bruno	sr:venue:902	https://crests.football-data.org/1903.png	BEN
sr:competitor:2527	Borussia Monchengladbach	Monchengladbach	DEU	Seoane, Gerardo	sr:venue:788	https://crests.football-data.org/18.png	BMG
sr:competitor:2674	Eintracht Frankfurt	Frankfurt	DEU	Toppmoller, Dino	sr:venue:67707	https://crests.football-data.org/19.png	SGE
sr:competitor:2829	Real Madrid	Madrid	ESP	Ancelotti, Carlo	sr:venue:754	https://crests.football-data.org/86.png	RMA
sr:competitor:2819	Villarreal CF	Villarreal	ESP	Marcelino	sr:venue:619	https://crests.football-data.org/94.png	VIL
sr:competitor:2833	Sevilla FC	Seville	ESP	Pimienta, Garcia	sr:venue:730	https://crests.football-data.org/559.png	SEV
sr:competitor:2955	FC Twente Enschede	Enschede	NLD	Oosting, Joseph	sr:venue:584	https://crests.football-data.org/666.png	TWE
sr:competitor:2959	Feyenoord Rotterdam	Rotterdam	NLD	Priske, Brian	sr:venue:612	https://crests.football-data.org/675.png	FEY
sr:competitor:2990	Almere City FC	Almere	NLD	Maduro, Hedwiges	sr:venue:3261	https://crests.football-data.org/1911.png	ALM
sr:competitor:1661	OGC Nice	Nice	FRA	Haise, Franck	sr:venue:13184	https://crests.football-data.org/522.png	NIC
sr:competitor:1684	Angers SCO	Angers	FRA	Dujeux, Alexandre	sr:venue:19889	https://crests.football-data.org/532.png	ANG
sr:competitor:1662	Le Havre AC	Le Havre	FRA	Digard, Didier	sr:venue:46514	https://crests.football-data.org/533.png	HAC
sr:competitor:1682	Stade Reims	Reims	FRA	Elsner, Luka	sr:venue:1871	https://crests.football-data.org/547.png	SDR
sr:competitor:46	Blackburn Rovers	Blackburn	ENG	Eustace, John	sr:venue:631	https://crests.football-data.org/59.png	BLA
sr:competitor:1	Queens Park Rangers	London	ENG	Cifuentes, Marti	sr:venue:1693	https://crests.football-data.org/69.png	QPR
sr:competitor:74	Swansea City	Swansea	WAL	Williams, Luke	sr:venue:1689	https://crests.football-data.org/72.png	SWA
sr:competitor:2	Portsmouth FC	Portsmouth	ENG	Mousinho, John	sr:venue:638	https://crests.football-data.org/325.png	POR
sr:competitor:27	Derby County	Derby	ENG	Warne, Paul	sr:venue:852	https://crests.football-data.org/342.png	DER
sr:competitor:36	Middlesbrough FC	Middlesbrough	ENG	Carrick, Michael	sr:venue:743	https://crests.football-data.org/343.png	MID
sr:competitor:25	Millwall FC	London	ENG	Harris, Neil	sr:venue:2352	https://crests.football-data.org/384.png	MIL
sr:competitor:11	Coventry City	Coventry	ENG	Carr, Rhys	sr:venue:2194	https://crests.football-data.org/1076.png	COV
sr:competitor:21	Preston North End	Preston	ENG	Heckingbottom, Paul	sr:venue:3002	https://crests.football-data.org/1081.png	PNE
sr:competitor:3001	Sporting Lisbon	Lisbon	PRT	Pereira, Joao	sr:venue:910	https://crests.football-data.org/498.png	SPO
sr:competitor:3014	Moreirense FC	Moreira de Conegos	PRT	Peixoto, Cesar	sr:venue:5312	https://crests.football-data.org/583.png	MOR
sr:competitor:2600	FC Augsburg	Augsburg	DEU	Thorup, Jess	sr:venue:1655	https://crests.football-data.org/712.png	FCA
sr:competitor:2998	SC Farense	Faro	PRT	Marreco, Toze	sr:venue:12069	https://crests.football-data.org/5602.png	FAR
sr:competitor:1031053	AVS Futebol SAD	Vila das Aves	PRT	Ramos, Daniel	sr:venue:8249	https://crests.football-data.org/10340.png	AVS
sr:competitor:2542	VfL Bochum	Bochum	DEU	Hecking, Dieter	sr:venue:738	https://crests.football-data.org/36.png	BOC
sr:competitor:2573	Holstein Kiel	Kiel	DEU	Rapp, Marcel	sr:venue:659	https://crests.football-data.org/720.png	HOK
sr:competitor:5885	1. FC Heidenheim	Heidenheim an der Brenz	DEU	Schmidt, Frank	sr:venue:34054	https://crests.football-data.org/44.png	FCH
sr:competitor:2817	FC Barcelona	Barcelona	ESP	Flick, Hansi	sr:venue:714	https://crests.football-data.org/81.png	BAR
sr:competitor:2831	Real Valladolid	Valladolid	ESP	Pezzolano, Paulo	sr:venue:880	https://crests.football-data.org/250.png	VLL
sr:competitor:3204	Union de Santa Fe	Santa Fe de la Vera Cruz	ARG	Gonzalez, Kily	sr:venue:4754	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7c/Escudo_club_Atl%C3%A9tico_Uni%C3%B3n_de_santa_fe.svg/512px-Escudo_club_Atl%C3%A9tico_Uni%C3%B3n_de_santa_fe.svg.png	UNI
sr:competitor:3208	Velez Sarsfield	Buenos Aires	ARG	Quinteros, Gustavo	sr:venue:1079	https://upload.wikimedia.org/wikipedia/commons/thumb/2/21/Escudo_del_Club_Atl%C3%A9tico_V%C3%A9lez_Sarsfield.svg/140px-Escudo_del_Club_Atl%C3%A9tico_V%C3%A9lez_Sarsfield.svg.png	VEL
sr:competitor:15	Sheffield United	Sheffield	ENG	Wilder, Chris	sr:venue:598	https://crests.football-data.org/356.png	SHU
sr:competitor:1646	AJ Auxerre	Auxerre	FRA	Pelissier, Christophe	sr:venue:767	https://crests.football-data.org/519.png	AUX
sr:competitor:2948	FC Utrecht	Utrecht	NLD	Jans, Ron	sr:venue:786	https://crests.football-data.org/676.png	FCU
sr:competitor:2956	RKC Waalwijk	Waalwijk	NLD	Fraser, Henk	sr:venue:685	https://crests.football-data.org/683.png	WAA
sr:competitor:2995	Boavista Porto	Porto	PRT	Bacci, Cristiano	sr:venue:14556	https://crests.football-data.org/810.png	BFC
sr:competitor:744135	Estrela Amadora	Amadora	PRT	Ze Augusto	sr:venue:53523	https://crests.football-data.org/9136.png	ESA
sr:competitor:3206	Estudiantes de La Plata	La Plata	ARG	Dominguez, Eduardo	sr:venue:1007	https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Escudo_de_Estudiantes_de_La_Plata.svg/125px-Escudo_de_Estudiantes_de_La_Plata.svg.png	ELP
sr:competitor:191648	Deportivo Riestra	Flores	ARG	Fabbiani, Cristian	sr:venue:17150	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Escudo_del_Club_Deportivo_Riestra.svg/138px-Escudo_del_Club_Deportivo_Riestra.svg.png	RIE
sr:competitor:3215	Racing Club Avellaneda	Buenos Aires	ARG	Costas, Gustavo	sr:venue:1082	https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/Escudo_de_Racing_Club_%282014%29.svg/132px-Escudo_de_Racing_Club_%282014%29.svg.png	RAC
sr:competitor:7629	CA Huracan	Buenos Aires	ARG	Kudelka, Frank	sr:venue:12021	https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Emblema_oficial_del_Club_Atl%C3%A9tico_Hurac%C3%A1n.svg/98px-Emblema_oficial_del_Club_Atl%C3%A9tico_Hurac%C3%A1n.svg.png	HUR
sr:competitor:3209	CA Independiente Avellaneda	Buenos Aires	ARG	Vaccari, Julio	sr:venue:1099	https://upload.wikimedia.org/wikipedia/commons/thumb/d/db/Escudo_del_Club_Atl%C3%A9tico_Independiente.svg/152px-Escudo_del_Club_Atl%C3%A9tico_Independiente.svg.png	CAI
sr:competitor:3212	Newell's Old Boys	Rosario	ARG	Lunari, Ricardo	sr:venue:1567	https://upload.wikimedia.org/wikipedia/commons/thumb/6/69/Escudo_del_Club_Atl%C3%A9tico_Newell%27s_Old_Boys_de_Rosario.svg/130px-Escudo_del_Club_Atl%C3%A9tico_Newell%27s_Old_Boys_de_Rosario.svg.png	NOB
sr:competitor:3203	CA Belgrano de Cordoba	Cordoba	ARG	Cruz Real, Juan	sr:venue:4750	https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Escudo_Oficial_del_Club_Atl%C3%A9tico_Belgrano.png/190px-Escudo_Oficial_del_Club_Atl%C3%A9tico_Belgrano.png	BEL
sr:competitor:6074	CD Godoy Cruz	Mendoza	ARG	Oldra, Daniel	sr:venue:15676	https://upload.wikimedia.org/wikipedia/commons/thumb/8/89/Logo_of_CD_Godoy_Cruz_Antonio_Tomba.png/161px-Logo_of_CD_Godoy_Cruz_Antonio_Tomba.png	GOD
sr:competitor:65668	Barracas Central	Barracas	ARG	Insua, Ruben Dario	sr:venue:69401	https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/Barracas_central_logo.svg/124px-Barracas_central_logo.svg.png	BAR
sr:competitor:3201	CA San Lorenzo de Almagro	Flores	ARG	Russo, Miguel Angel	sr:venue:14324	https://upload.wikimedia.org/wikipedia/commons/thumb/7/77/Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.svg/160px-Escudo_del_Club_Atl%C3%A9tico_San_Lorenzo_de_Almagro.svg.png	SLO
sr:competitor:3218	Atletico Lanus	Buenos Aires	ARG	Zielinski, Ricardo	sr:venue:981	https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Escudo_de_Lan%C3%BAs.14.png/150px-Escudo_de_Lan%C3%BAs.14.png	LAN
sr:competitor:36837	CA Platense	Florida	ARG	Gomez, Sergio	sr:venue:12712	https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Escudo_del_Club_Alt%C3%A9tico_Platense.svg/127px-Escudo_del_Club_Alt%C3%A9tico_Platense.svg.png	PLA
sr:competitor:3217	CA Rosario Central	Rosario	ARG	Holan, Ariel	sr:venue:1329	https://seeklogo.com/images/R/Rosario_Central-logo-024B403654-seeklogo.com.png	ROS
sr:competitor:3205	Gimnasia Y Esgrima La Plata	La Plata	ARG	Mendez, Marcelo	sr:venue:12003	https://logodownload.org/wp-content/uploads/2020/05/gimnasia-y-esgrima-de-la-plata-logo.png	GLP
sr:competitor:3211	River Plate	Buenos Aires	ARG	Gallardo, Marcelo	sr:venue:1009	https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/Escudo_del_C_A_River_Plate.svg/129px-Escudo_del_C_A_River_Plate.svg.png	RIV
sr:competitor:3216	Argentinos Juniors	Buenos Aires	ARG	Zermatten, Cristian	sr:venue:613	https://upload.wikimedia.org/wikipedia/commons/thumb/5/57/Asociacion_Atletica_Argentinos_Juniors.svg/160px-Asociacion_Atletica_Argentinos_Juniors.svg.png	ARG
sr:competitor:36842	Independiente Rivadavia	Mendoza	ARG	Berti, Alfredo Jesus	sr:venue:12031	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Escudo_del_Club_Independiente_Rivadavia.svg/159px-Escudo_del_Club_Independiente_Rivadavia.svg.png	IRM
sr:competitor:36839	Defensa y Justicia	Gobernador Julio A. Costa	ARG	De Muner, Pablo Daniel	sr:venue:12025	https://upload.wikimedia.org/wikipedia/commons/thumb/7/70/Escudo_del_Club_Social_y_Deportivo_Defensa_y_Justicia.svg/160px-Escudo_del_Club_Social_y_Deportivo_Defensa_y_Justicia.svg.png	DYJ
sr:competitor:7628	CA Tigre	Buenos Aires	ARG	Dominguez, Sebastian	sr:venue:4738	https://upload.wikimedia.org/wikipedia/commons/thumb/4/47/Escudo_del_Club_Atl%C3%A9tico_Tigre_-_2019.svg/125px-Escudo_del_Club_Atl%C3%A9tico_Tigre_-_2019.svg.png	TIG
sr:competitor:3210	CA Talleres de Cordoba	Cordoba	ARG	Medina, Alexander	sr:venue:2388	https://upload.wikimedia.org/wikipedia/commons/thumb/9/9b/Escudo_Talleres_2015.svg/154px-Escudo_Talleres_2015.svg.png	CAT
sr:competitor:4937	Instituto AC Cordoba	Cordoba	ARG	Dabove, Diego	sr:venue:12033	https://upload.wikimedia.org/wikipedia/commons/thumb/6/6d/Escudo_Instituto_Atletico_Central_Cordoba.png/157px-Escudo_Instituto_Atletico_Central_Cordoba.png	IAC
sr:competitor:3219	CA Banfield	Buenos Aires	ARG	Munua, Gustavo	sr:venue:634	https://upload.wikimedia.org/wikipedia/commons/thumb/1/16/CA_Banfield_%282014%29.svg/98px-CA_Banfield_%282014%29.svg.png	BAN
sr:competitor:65676	CA Central Cordoba SE	Santiago del Estero	ARG	De Felippe, Omar	sr:venue:49307	https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Escudo_del_Club_Central_C%C3%B3rdoba_de_Santiago_del_Estero.svg/150px-Escudo_del_Club_Central_C%C3%B3rdoba_de_Santiago_del_Estero.svg.png	CC
sr:competitor:36833	Atletico Tucuman	San Miguel de Tucuman	ARG	Sava, Facundo	sr:venue:12017	https://upload.wikimedia.org/wikipedia/commons/thumb/b/b4/Escudo_del_Club_Atletico_Tucuman.svg/136px-Escudo_del_Club_Atletico_Tucuman.svg.png	CAT
sr:competitor:42338	CA Sarmiento Junin	Junin	ARG	Funes, Martin	sr:venue:8975	https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Escudo_del_Club_Atl%C3%A9tico_Sarmiento_de_Jun%C3%ADn.svg/163px-Escudo_del_Club_Atl%C3%A9tico_Sarmiento_de_Jun%C3%ADn.svg.png	CAS
sr:competitor:3202	Boca Juniors	Buenos Aires	ARG	Gago, Fernando	sr:venue:44628	https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/CABJ70.png/138px-CABJ70.png	BOC
sr:competitor:1641	Olympique Marseille	Marseille	FRA	De Zerbi, Roberto	sr:venue:839	https://crests.football-data.org/516.png	OM
sr:competitor:1649	Olympique Lyon	Lyon	FRA	Sage, Pierre	sr:venue:17406	https://crests.football-data.org/523.png	OL
sr:competitor:1681	Toulouse FC	Toulouse	FRA	Martinez, Carles	sr:venue:848	https://crests.football-data.org/511.png	TFC
sr:competitor:2950	AZ Alkmaar	Alkmaar	NLD	Martens, Maarten	sr:venue:615	https://crests.football-data.org/682.png	AZA
sr:competitor:2957	Fortuna Sittard	Sittard-Geleen	NLD	Buijs, Danny	sr:venue:2769	https://crests.football-data.org/1920.png	FOR
sr:competitor:2999	SC Braga	Braga	PRT	Carvalhal, Carlos	sr:venue:951	https://crests.football-data.org/5613.png	BRA
sr:competitor:36365	Casa Pia Lisbon	Lisbon	PRT	Pereira, Joao	sr:venue:43626	https://crests.football-data.org/6618.png	CAS
sr:competitor:71	Plymouth Argyle	Plymouth	ENG	Rooney, Wayne	sr:venue:660	https://crests.football-data.org/1138.png	PA
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."User" (id, email, "createdAt", password, username) FROM stdin;
9	panchos@gmail.com	2024-11-30 16:27:27.122	$2b$10$bLhPBWg/D7nmsIB.MjoRCuBgbMm0Jlv0bHtihvDnNB9V65JZYlbCa	panchos
10	hola@gmail.com	2024-11-30 17:06:00.578	$2b$10$sDncc8mu.gfwXPfHmlBsfOF84TwyBQiHgxEeorwSmwz.x4OZ6b8J2	hola
13	hola123@gmail.com	2024-12-01 10:42:05.947	$2b$10$buX8nSm5ZzkgyJDC5grFvekDC.MnYo7ZYtUCpZ57Qshbek3BQ95La	chopan
8	panchoseijas@gmail.com	2024-11-26 18:23:13.405	$2b$10$hggPgk1OMoyr2xs9yCji6uo6XM8ioiQqLJrC0N.fjz/9FWP8s65lS	pancho
\.


--
-- Data for Name: _CompetitionToTeam; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."_CompetitionToTeam" ("A", "B") FROM stdin;
sr:season:114317	sr:competitor:3206
sr:season:114317	sr:competitor:3211
sr:season:114317	sr:competitor:3208
sr:season:114317	sr:competitor:191648
sr:season:114317	sr:competitor:3204
sr:season:114317	sr:competitor:3205
sr:season:114317	sr:competitor:3215
sr:season:114317	sr:competitor:7629
sr:season:114317	sr:competitor:3212
sr:season:114317	sr:competitor:3203
sr:season:114317	sr:competitor:3209
sr:season:118689	sr:competitor:42
sr:season:114317	sr:competitor:65668
sr:season:118689	sr:competitor:44
sr:season:114317	sr:competitor:6074
sr:season:114317	sr:competitor:3201
sr:season:118689	sr:competitor:14
sr:season:118689	sr:competitor:43
sr:season:118689	sr:competitor:17
sr:season:118689	sr:competitor:30
sr:season:118689	sr:competitor:39
sr:season:114317	sr:competitor:3218
sr:season:118689	sr:competitor:35
sr:season:118689	sr:competitor:38
sr:season:118689	sr:competitor:50
sr:season:118689	sr:competitor:40
sr:season:118689	sr:competitor:33
sr:season:118689	sr:competitor:60
sr:season:118689	sr:competitor:3
sr:season:114317	sr:competitor:3217
sr:season:118689	sr:competitor:31
sr:season:118689	sr:competitor:37
sr:season:118689	sr:competitor:48
sr:season:114317	sr:competitor:36837
sr:season:114317	sr:competitor:3216
sr:season:114317	sr:competitor:36839
sr:season:118689	sr:competitor:32
sr:season:118689	sr:competitor:45
sr:season:118689	sr:competitor:7
sr:season:114317	sr:competitor:36842
sr:season:114317	sr:competitor:7628
sr:season:114317	sr:competitor:4937
sr:season:114317	sr:competitor:3210
sr:season:114317	sr:competitor:3219
sr:season:118691	sr:competitor:2829
sr:season:114317	sr:competitor:3202
sr:season:118691	sr:competitor:2817
sr:season:118691	sr:competitor:2819
sr:season:118691	sr:competitor:24264
sr:season:118691	sr:competitor:2836
sr:season:118691	sr:competitor:2820
sr:season:118691	sr:competitor:2816
sr:season:118691	sr:competitor:2826
sr:season:118691	sr:competitor:2818
sr:season:118691	sr:competitor:2824
sr:season:114317	sr:competitor:42338
sr:season:114317	sr:competitor:65676
sr:season:114317	sr:competitor:36833
sr:season:118691	sr:competitor:6577
sr:season:118691	sr:competitor:2833
sr:season:118691	sr:competitor:2885
sr:season:118691	sr:competitor:2821
sr:season:118691	sr:competitor:2825
sr:season:118691	sr:competitor:2845
sr:season:118691	sr:competitor:2831
sr:season:118691	sr:competitor:2859
sr:season:118691	sr:competitor:2828
sr:season:119799	sr:competitor:2952
sr:season:119799	sr:competitor:2953
sr:season:118691	sr:competitor:2814
sr:season:119799	sr:competitor:2955
sr:season:119799	sr:competitor:2948
sr:season:119799	sr:competitor:2962
sr:season:119799	sr:competitor:2950
sr:season:119799	sr:competitor:2961
sr:season:119799	sr:competitor:2959
sr:season:119799	sr:competitor:2979
sr:season:119799	sr:competitor:2951
sr:season:119799	sr:competitor:2964
sr:season:119799	sr:competitor:2947
sr:season:119799	sr:competitor:2960
sr:season:119799	sr:competitor:2977
sr:season:119799	sr:competitor:2971
sr:season:119799	sr:competitor:2956
sr:season:119799	sr:competitor:2957
sr:season:119799	sr:competitor:2990
sr:season:118693	sr:competitor:2672
sr:season:118693	sr:competitor:36360
sr:season:118693	sr:competitor:2681
sr:season:118693	sr:competitor:2674
sr:season:118693	sr:competitor:2527
sr:season:118693	sr:competitor:2534
sr:season:118693	sr:competitor:2547
sr:season:118693	sr:competitor:2573
sr:season:118693	sr:competitor:2556
sr:season:118693	sr:competitor:2569
sr:season:118693	sr:competitor:2526
sr:season:118693	sr:competitor:2524
sr:season:118693	sr:competitor:5885
sr:season:118693	sr:competitor:2538
sr:season:118693	sr:competitor:2542
sr:season:118693	sr:competitor:2673
sr:season:118693	sr:competitor:2677
sr:season:119835	sr:competitor:1653
sr:season:119835	sr:competitor:1644
sr:season:118693	sr:competitor:2600
sr:season:119835	sr:competitor:1641
sr:season:119835	sr:competitor:1648
sr:season:119835	sr:competitor:1682
sr:season:119835	sr:competitor:1643
sr:season:119835	sr:competitor:1659
sr:season:119835	sr:competitor:1661
sr:season:119835	sr:competitor:1647
sr:season:119835	sr:competitor:1715
sr:season:119835	sr:competitor:1658
sr:season:119835	sr:competitor:1684
sr:season:119835	sr:competitor:1678
sr:season:119835	sr:competitor:1662
sr:season:119835	sr:competitor:1681
sr:season:119835	sr:competitor:1642
sr:season:119835	sr:competitor:1646
sr:season:119847	sr:competitor:2998
sr:season:118699	sr:competitor:21
sr:season:119835	sr:competitor:1649
sr:season:119847	sr:competitor:36365
sr:season:118699	sr:competitor:29
sr:season:119847	sr:competitor:3006
sr:season:119847	sr:competitor:744135
sr:season:118699	sr:competitor:27
sr:season:119847	sr:competitor:2999
sr:season:119847	sr:competitor:3009
sr:season:118699	sr:competitor:24
sr:season:118699	sr:competitor:36
sr:season:119847	sr:competitor:3011
sr:season:119847	sr:competitor:49531
sr:season:118699	sr:competitor:41
sr:season:118699	sr:competitor:25
sr:season:118699	sr:competitor:263
sr:season:118699	sr:competitor:1
sr:season:119847	sr:competitor:2995
sr:season:118699	sr:competitor:15
sr:season:118699	sr:competitor:11
sr:season:119847	sr:competitor:3014
sr:season:118699	sr:competitor:46
sr:season:119847	sr:competitor:3002
sr:season:118699	sr:competitor:58
sr:season:119847	sr:competitor:3036
sr:season:118699	sr:competitor:8
sr:season:118699	sr:competitor:61
sr:season:119847	sr:competitor:3010
sr:season:118699	sr:competitor:34
sr:season:118699	sr:competitor:96
sr:season:119847	sr:competitor:4500
sr:season:118699	sr:competitor:74
sr:season:118699	sr:competitor:95
sr:season:119847	sr:competitor:1031053
sr:season:118699	sr:competitor:12
sr:season:119847	sr:competitor:25777
sr:season:118699	sr:competitor:72
sr:season:119847	sr:competitor:3013
sr:season:118699	sr:competitor:71
sr:season:119847	sr:competitor:3001
sr:season:118699	sr:competitor:6
sr:season:118699	sr:competitor:2
\.


--
-- Data for Name: _CompetitionToUser; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."_CompetitionToUser" ("A", "B") FROM stdin;
sr:season:119847	13
sr:season:119799	13
sr:season:118699	8
\.


--
-- Data for Name: _TeamToUser; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public."_TeamToUser" ("A", "B") FROM stdin;
sr:competitor:2556	13
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: avnadmin
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
d917c517-b805-4c18-9e8d-90461c0a1959	0c9ad546f7977f001a9e9b48c3bfbc6100d831db6916e5e655efe98b33de4fca	2024-10-14 19:46:43.598152-03	20241009222124_initial	\N	\N	2024-10-14 19:46:43.5886-03	1
3888079c-efc6-484c-affb-0fa883022487	e19027c33b2081040e5fff8498503ec864d8b7ce1a7058553f205f76ef705e60	2024-10-16 10:25:37.372386-03	20241016132537_jerseys	\N	\N	2024-10-16 10:25:37.361497-03	1
fdfd4935-d1db-48cc-9d30-06a66eb09073	df79f9284f3c3e5eb6953272af6477925dce5a4455f7696ef2b8a50635da42f9	2024-10-14 19:46:48.910481-03	20241014224648_a	\N	\N	2024-10-14 19:46:48.890388-03	1
af4d6430-8390-4762-9119-eba3f726be58	9afa02e539b66d3d8d8546a94edc2c317db7b74d276509ea456a1ba174fc0615	2024-10-14 22:21:03.46908-03	20241015012103_dev	\N	\N	2024-10-14 22:21:03.467132-03	1
3432e207-a559-461e-8c61-5d9b49c8e1e8	ab1b2e353fbc3d8603131703f74be65071a1d11bf583f34d196986dc08141cc2	2024-10-14 23:53:11.461364-03	20241015025311_competition	\N	\N	2024-10-14 23:53:11.441398-03	1
cf5f9571-b40d-422b-b52c-e3767f850456	1123f521db4a3307d9d1ab19bc2269d85df1ce9a256ce142c28440fcb3d25fb5	2024-10-16 10:31:49.229701-03	20241016133149_jerseys	\N	\N	2024-10-16 10:31:49.220401-03	1
96bc5639-06a0-4cd3-8f9f-9b8bff5097d1	cc1ef92fdc877f8a9f6b8d6fcf7fb42d99a0b677c6e3fe054af7172b96f20eca	2024-10-15 00:33:13.951958-03	20241015033313_b	\N	\N	2024-10-15 00:33:13.944151-03	1
0296f800-3571-4aa1-bc48-237c1988a19d	ea03e20063581a610ab4bae3b15814db5e63610818db1bc3414a6c845604af6a	2024-10-15 01:02:06.494306-03	20241015040206_a	\N	\N	2024-10-15 01:02:06.487991-03	1
d0f136a6-9a38-43a0-a64c-58220355f6d0	a4fd9f4621fa46e2be8ff82d08b3772ce18473ea1ee16cb3b6bd50561c4d50af	2024-10-15 01:52:34.244145-03	20241015045234_b	\N	\N	2024-10-15 01:52:34.241488-03	1
a9910b2b-e016-4d53-b414-156867ce4b7b	797148544f6ef567ebcc7a4c082b92c3bd72d1e8fca9b5a3a405b425db93ab8a	2024-10-16 10:32:44.872573-03	20241016133244_jerseys	\N	\N	2024-10-16 10:32:44.864656-03	1
bea72aa8-4d9a-42de-ae66-29531705286a	a5f00a40c73d671a60d51592133d34a4458bf7c510f0b66691f6fec19741a155	2024-10-15 12:54:03.187421-03	20241015155403_a	\N	\N	2024-10-15 12:54:03.18221-03	1
49c93794-914c-4a87-a6ca-64793c45e9a6	f991a13eac0555a7cc9240eb4ad9e5cc701c136b387649afe4dbc2dcbd99638c	2024-10-15 13:06:51.778952-03	20241015160651_a	\N	\N	2024-10-15 13:06:51.761594-03	1
f831b6a5-fd4e-4bcd-bfac-12a3c1900ac1	618504127ba6ce39b6baeff4b25891d9471327d7b143aad2a90b35e014755458	2024-10-15 14:42:18.864229-03	20241015174218_	\N	\N	2024-10-15 14:42:18.858055-03	1
a1374140-0c9d-4c5c-8315-26dd0b808313	5db25459f40af66fcc80677ace3f5a1e2760d259978065b22a37421458c759d2	2024-10-16 10:42:16.000013-03	20241016134215_jerseys	\N	\N	2024-10-16 10:42:15.9928-03	1
661024e7-8f96-41d5-b10e-08749b0d157d	7fedda3f7c52dcf57a7793d2b08e80c6d548abb0ec6dbe62d7225d50f48a211e	2024-10-15 15:57:34.748438-03	20241015185734_a	\N	\N	2024-10-15 15:57:34.73663-03	1
5ff33cc1-11b7-4111-b04b-02d2ab9e6141	6e97534cce31bb28cb5e20985ae561b1847017e32b755e63f0c0ac456a10f75f	2024-10-15 20:56:28.831041-03	20241015235628_deleted	\N	\N	2024-10-15 20:56:28.82724-03	1
7aebaef4-fe39-4655-a1a1-d805884d91c3	08f5d129f965a1f1c2762d64e9756438e607635ac132f924505546019e4f3ea3	2024-10-15 21:01:23.399312-03	20241016000123_remove_unique	\N	\N	2024-10-15 21:01:23.395874-03	1
48823257-9b75-43ce-85de-0fce9af9aae9	c1dffb16dd40402ff2df72d8d1a8dc2b7057614d6568122d7e24b51a986b8c10	2024-10-16 10:14:49.240142-03	20241016131449_players	\N	\N	2024-10-16 10:14:49.236824-03	1
5af05091-3acc-460b-a6e7-f2d4ee08c140	25a119bb681d4df8f097f184bbf28c5a79a198c6d05aa15f7f0ffee95f1c2d1a	2024-11-17 13:19:08.025099-03	20241117160236_team_to_competition	\N	\N	2024-11-17 13:19:07.018627-03	1
1c9aa7ed-783f-48cd-abd9-db53f8f72aa5	5b4ff161b8a6fc8d3285ed4bb201cb31c6835f88c07cb32fbc1490cd2dab7ef9	2024-11-26 15:13:48.637421-03	20241126181348_fixed_username_field	\N	\N	2024-11-26 15:13:48.632488-03	1
\.


--
-- Name: Jersey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public."Jersey_id_seq"', 4264, true);


--
-- Name: Standings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public."Standings_id_seq"', 5807, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avnadmin
--

SELECT pg_catalog.setval('public."User_id_seq"', 13, true);


--
-- Name: Competition Competition_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Competition"
    ADD CONSTRAINT "Competition_pkey" PRIMARY KEY (id);


--
-- Name: Jersey Jersey_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Jersey"
    ADD CONSTRAINT "Jersey_pkey" PRIMARY KEY (id);


--
-- Name: Match Match_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Match"
    ADD CONSTRAINT "Match_pkey" PRIMARY KEY (id);


--
-- Name: Player Player_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Player"
    ADD CONSTRAINT "Player_pkey" PRIMARY KEY (id);


--
-- Name: Stadium Stadium_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Stadium"
    ADD CONSTRAINT "Stadium_pkey" PRIMARY KEY (id);


--
-- Name: Standings Standings_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Standings"
    ADD CONSTRAINT "Standings_pkey" PRIMARY KEY (id);


--
-- Name: Team Team_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Team"
    ADD CONSTRAINT "Team_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: Jersey_teamId_type_key; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "Jersey_teamId_type_key" ON public."Jersey" USING btree ("teamId", type);


--
-- Name: Match_competitionId_homeTeamId_awayTeamId_start_time_key; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "Match_competitionId_homeTeamId_awayTeamId_start_time_key" ON public."Match" USING btree ("competitionId", "homeTeamId", "awayTeamId", start_time);


--
-- Name: Player_id_teamId_key; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "Player_id_teamId_key" ON public."Player" USING btree (id, "teamId");


--
-- Name: Standings_competitionId_teamId_key; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "Standings_competitionId_teamId_key" ON public."Standings" USING btree ("competitionId", "teamId");


--
-- Name: User_email_key; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "User_email_key" ON public."User" USING btree (email);


--
-- Name: _CompetitionToTeam_AB_unique; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "_CompetitionToTeam_AB_unique" ON public."_CompetitionToTeam" USING btree ("A", "B");


--
-- Name: _CompetitionToTeam_B_index; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX "_CompetitionToTeam_B_index" ON public."_CompetitionToTeam" USING btree ("B");


--
-- Name: _CompetitionToUser_AB_unique; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "_CompetitionToUser_AB_unique" ON public."_CompetitionToUser" USING btree ("A", "B");


--
-- Name: _CompetitionToUser_B_index; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX "_CompetitionToUser_B_index" ON public."_CompetitionToUser" USING btree ("B");


--
-- Name: _TeamToUser_AB_unique; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE UNIQUE INDEX "_TeamToUser_AB_unique" ON public."_TeamToUser" USING btree ("A", "B");


--
-- Name: _TeamToUser_B_index; Type: INDEX; Schema: public; Owner: avnadmin
--

CREATE INDEX "_TeamToUser_B_index" ON public."_TeamToUser" USING btree ("B");


--
-- Name: Jersey Jersey_teamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Jersey"
    ADD CONSTRAINT "Jersey_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Match Match_awayTeamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Match"
    ADD CONSTRAINT "Match_awayTeamId_fkey" FOREIGN KEY ("awayTeamId") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Match Match_competitionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Match"
    ADD CONSTRAINT "Match_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES public."Competition"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Match Match_homeTeamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Match"
    ADD CONSTRAINT "Match_homeTeamId_fkey" FOREIGN KEY ("homeTeamId") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Match Match_stadiumId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Match"
    ADD CONSTRAINT "Match_stadiumId_fkey" FOREIGN KEY ("stadiumId") REFERENCES public."Stadium"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Player Player_teamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Player"
    ADD CONSTRAINT "Player_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Standings Standings_competitionId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Standings"
    ADD CONSTRAINT "Standings_competitionId_fkey" FOREIGN KEY ("competitionId") REFERENCES public."Competition"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Standings Standings_teamId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Standings"
    ADD CONSTRAINT "Standings_teamId_fkey" FOREIGN KEY ("teamId") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Team Team_stadiumId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."Team"
    ADD CONSTRAINT "Team_stadiumId_fkey" FOREIGN KEY ("stadiumId") REFERENCES public."Stadium"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _CompetitionToTeam _CompetitionToTeam_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."_CompetitionToTeam"
    ADD CONSTRAINT "_CompetitionToTeam_A_fkey" FOREIGN KEY ("A") REFERENCES public."Competition"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _CompetitionToTeam _CompetitionToTeam_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."_CompetitionToTeam"
    ADD CONSTRAINT "_CompetitionToTeam_B_fkey" FOREIGN KEY ("B") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _CompetitionToUser _CompetitionToUser_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."_CompetitionToUser"
    ADD CONSTRAINT "_CompetitionToUser_A_fkey" FOREIGN KEY ("A") REFERENCES public."Competition"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _CompetitionToUser _CompetitionToUser_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."_CompetitionToUser"
    ADD CONSTRAINT "_CompetitionToUser_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _TeamToUser _TeamToUser_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."_TeamToUser"
    ADD CONSTRAINT "_TeamToUser_A_fkey" FOREIGN KEY ("A") REFERENCES public."Team"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _TeamToUser _TeamToUser_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: avnadmin
--

ALTER TABLE ONLY public."_TeamToUser"
    ADD CONSTRAINT "_TeamToUser_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: avnadmin
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT CREATE ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

