-- Database: bakery

-- DROP DATABASE IF EXISTS bakery;

CREATE DATABASE bakery
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Table: public.products

-- DROP TABLE IF EXISTS public.products;

CREATE TABLE IF NOT EXISTS public.products
(
    "ID" bigint NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    price real,
    CONSTRAINT products_pkey PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.products
    OWNER to postgres;


-- Table: public.warehouse

-- DROP TABLE IF EXISTS public.warehouse;

CREATE TABLE IF NOT EXISTS public.warehouse
(
    "ID" bigint NOT NULL,
    name text COLLATE pg_catalog."default" NOT NULL,
    location text COLLATE pg_catalog."default",
    CONSTRAINT warehouse_pkey PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.warehouse
    OWNER to postgres;


-- Table: public.request

-- DROP TABLE IF EXISTS public.request;

CREATE TABLE IF NOT EXISTS public.request
(
    "ID" bigint NOT NULL,
    date_create date NOT NULL,
    date_end date NOT NULL,
    CONSTRAINT request_pkey PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.request
    OWNER to postgres;


-- Table: public.сondition

-- DROP TABLE IF EXISTS public."сondition";

CREATE TABLE IF NOT EXISTS public."сondition"
(
    "ID" bigint NOT NULL,
    type_cond text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "сondition_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."сondition"
    OWNER to postgres;


-- Table: public.prod_ware

-- DROP TABLE IF EXISTS public.prod_ware;

CREATE TABLE IF NOT EXISTS public.prod_ware
(
    "ID_prod" bigint NOT NULL,
    "ID_ware" bigint NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT "ID_prod" FOREIGN KEY ("ID_prod")
        REFERENCES public.products ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ID_ware" FOREIGN KEY ("ID_ware")
        REFERENCES public.warehouse ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.prod_ware
    OWNER to postgres;


-- Table: public.prod_req

-- DROP TABLE IF EXISTS public.prod_req;

CREATE TABLE IF NOT EXISTS public.prod_req
(
    "ID_prod" bigint NOT NULL,
    "ID_req" bigint NOT NULL,
    quantity integer NOT NULL,
    CONSTRAINT "ID_prod" FOREIGN KEY ("ID_prod")
        REFERENCES public.products ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ID_req" FOREIGN KEY ("ID_req")
        REFERENCES public.request ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.prod_req
    OWNER to postgres;


-- Table: public.req_cond

-- DROP TABLE IF EXISTS public.req_cond;

CREATE TABLE IF NOT EXISTS public.req_cond
(
    "ID_req" bigint NOT NULL,
    "ID_cond" bigint NOT NULL,
    date_change date NOT NULL,
    CONSTRAINT "ID_cond" FOREIGN KEY ("ID_cond")
        REFERENCES public."сondition" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "ID_req" FOREIGN KEY ("ID_req")
        REFERENCES public.request ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.req_cond
    OWNER to postgres;