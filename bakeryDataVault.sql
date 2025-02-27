-- Database: bakeryDataVault

-- DROP DATABASE IF EXISTS "bakeryDataVault";

CREATE DATABASE "bakeryDataVault"
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    LOCALE_PROVIDER = 'libc'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;


-- Table: public.Hub_Client

-- DROP TABLE IF EXISTS public."Hub_Client";

CREATE TABLE IF NOT EXISTS public."Hub_Client"
(
    "ID" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "Hub_Client_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Hub_Client"
    OWNER to postgres;


-- Table: public.Hub_Employee

-- DROP TABLE IF EXISTS public."Hub_Employee";

CREATE TABLE IF NOT EXISTS public."Hub_Employee"
(
    "ID" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "Hub_Employee_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Hub_Employee"
    OWNER to postgres;


-- Table: public.Hub_Order

-- DROP TABLE IF EXISTS public."Hub_Order";

CREATE TABLE IF NOT EXISTS public."Hub_Order"
(
    "ID" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "Hub_Order_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Hub_Order"
    OWNER to postgres;


-- Table: public.Hub_OrderStatus

-- DROP TABLE IF EXISTS public."Hub_OrderStatus";

CREATE TABLE IF NOT EXISTS public."Hub_OrderStatus"
(
    "ID" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "Hub_OrderStatus_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Hub_OrderStatus"
    OWNER to postgres;


-- Table: public.Hub_Product

-- DROP TABLE IF EXISTS public."Hub_Product";

CREATE TABLE IF NOT EXISTS public."Hub_Product"
(
    "ID" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "Hub_Product_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Hub_Product"
    OWNER to postgres;


-- Table: public.Hub_Warehouse

-- DROP TABLE IF EXISTS public."Hub_Warehouse";

CREATE TABLE IF NOT EXISTS public."Hub_Warehouse"
(
    "ID" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "Hub_Warehouse_pkey" PRIMARY KEY ("ID")
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Hub_Warehouse"
    OWNER to postgres;


-- Table: public.Link_Order_Client_Employee

-- DROP TABLE IF EXISTS public."Link_Order_Client_Employee";

CREATE TABLE IF NOT EXISTS public."Link_Order_Client_Employee"
(
    "ID_Order" bigint NOT NULL,
    "ID_Client" bigint NOT NULL,
    "ID_Employee" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Client" FOREIGN KEY ("ID_Client")
        REFERENCES public."Hub_Client" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ID_Employee" FOREIGN KEY ("ID_Employee")
        REFERENCES public."Hub_Employee" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ID_Order" FOREIGN KEY ("ID_Order")
        REFERENCES public."Hub_Order" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Link_Order_Client_Employee"
    OWNER to postgres;


-- Table: public.Link_Order_Product

-- DROP TABLE IF EXISTS public."Link_Order_Product";

CREATE TABLE IF NOT EXISTS public."Link_Order_Product"
(
    "ID_Order" bigint NOT NULL,
    "ID_Product" bigint NOT NULL,
    "Quantity" double precision,
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Order" FOREIGN KEY ("ID_Order")
        REFERENCES public."Hub_Order" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ID_Product" FOREIGN KEY ("ID_Product")
        REFERENCES public."Hub_Product" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Link_Order_Product"
    OWNER to postgres;


-- Table: public.Link_Order_Status

-- DROP TABLE IF EXISTS public."Link_Order_Status";

CREATE TABLE IF NOT EXISTS public."Link_Order_Status"
(
    "ID_Order" bigint NOT NULL,
    "ID_Status" bigint NOT NULL,
    "Load_date" date NOT NULL,
    CONSTRAINT "ID_Order" FOREIGN KEY ("ID_Order")
        REFERENCES public."Hub_Order" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ID_Status" FOREIGN KEY ("ID_Status")
        REFERENCES public."Hub_OrderStatus" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Link_Order_Status"
    OWNER to postgres;


-- Table: public.Link_Product_Warehouse

-- DROP TABLE IF EXISTS public."Link_Product_Warehouse";

CREATE TABLE IF NOT EXISTS public."Link_Product_Warehouse"
(
    "ID_Product" bigint NOT NULL,
    "ID_Werehouse" bigint NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Product" FOREIGN KEY ("ID_Product")
        REFERENCES public."Hub_Product" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "ID_Werehouse" FOREIGN KEY ("ID_Werehouse")
        REFERENCES public."Hub_Warehouse" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Link_Product_Warehouse"
    OWNER to postgres;


-- Table: public.Sat_Client

-- DROP TABLE IF EXISTS public."Sat_Client";

CREATE TABLE IF NOT EXISTS public."Sat_Client"
(
    "ID_Client" bigint NOT NULL,
    "Client_Name" text COLLATE pg_catalog."default",
    "Address" text COLLATE pg_catalog."default",
    "Phone" integer,
    "Email" text COLLATE pg_catalog."default",
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Client" FOREIGN KEY ("ID_Client")
        REFERENCES public."Hub_Client" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sat_Client"
    OWNER to postgres;


-- Table: public.Sat_Employee

-- DROP TABLE IF EXISTS public."Sat_Employee";

CREATE TABLE IF NOT EXISTS public."Sat_Employee"
(
    "ID_Employee" bigint NOT NULL,
    "First_Name" text COLLATE pg_catalog."default",
    "Last_Name" text COLLATE pg_catalog."default",
    "Position" text COLLATE pg_catalog."default" NOT NULL,
    "Phone" integer,
    "Email" text COLLATE pg_catalog."default",
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Employee" FOREIGN KEY ("ID_Employee")
        REFERENCES public."Hub_Employee" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sat_Employee"
    OWNER to postgres;


-- Table: public.Sat_Order

-- DROP TABLE IF EXISTS public."Sat_Order";

CREATE TABLE IF NOT EXISTS public."Sat_Order"
(
    "ID_Order" bigint NOT NULL,
    "Order_Date" date NOT NULL,
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Order" FOREIGN KEY ("ID_Order")
        REFERENCES public."Hub_Order" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sat_Order"
    OWNER to postgres;


-- Table: public.Sat_OrderStatus

-- DROP TABLE IF EXISTS public."Sat_OrderStatus";

CREATE TABLE IF NOT EXISTS public."Sat_OrderStatus"
(
    "ID_Status" bigint NOT NULL,
    "Status_name" text COLLATE pg_catalog."default",
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Status" FOREIGN KEY ("ID_Status")
        REFERENCES public."Hub_OrderStatus" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sat_OrderStatus"
    OWNER to postgres;


-- Table: public.Sat_Product

-- DROP TABLE IF EXISTS public."Sat_Product";

CREATE TABLE IF NOT EXISTS public."Sat_Product"
(
    "ID_Product" bigint NOT NULL,
    "Product_Name" text COLLATE pg_catalog."default" NOT NULL,
    "Unit_Price" money,
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Product" FOREIGN KEY ("ID_Product")
        REFERENCES public."Hub_Product" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sat_Product"
    OWNER to postgres;


-- Table: public.Sat_Warehouse

-- DROP TABLE IF EXISTS public."Sat_Warehouse";

CREATE TABLE IF NOT EXISTS public."Sat_Warehouse"
(
    "ID_Werehouse" bigint NOT NULL,
    "Werehouse_Name" text COLLATE pg_catalog."default",
    "Address" text COLLATE pg_catalog."default",
    "Load_Date" date NOT NULL,
    CONSTRAINT "ID_Werehouse" FOREIGN KEY ("ID_Werehouse")
        REFERENCES public."Hub_Warehouse" ("ID") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public."Sat_Warehouse"
    OWNER to postgres;
