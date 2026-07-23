-- -------------------------------------------------------------
-- TablePlus 6.6.8(632)
--
-- https://tableplus.com/
--
-- Database: doorworld_db
-- Generation Time: 2025-08-20 20:50:42.4650
-- -------------------------------------------------------------


DROP TABLE IF EXISTS "public"."bulletproofmodel";
-- Table Definition
CREATE TABLE "public"."bulletproofmodel" (
    "id" text NOT NULL,
    "en" text,
    "fits" jsonb,
    "lt" text,
    "name" text,
    "price" jsonb,
    "order" int4,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."mainlocks";
-- Table Definition
CREATE TABLE "public"."mainlocks" (
    "id" text NOT NULL,
    "accessories" jsonb,
    "collection" text,
    "custom_price" bool,
    "en" text,
    "fits" jsonb,
    "image" text,
    "locking_directions" text,
    "lt" text,
    "maker" text,
    "name" text,
    "order" int4,
    "price" numeric(10,2),
    "security_class" text,
    "template" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."hinges";
-- Table Definition
CREATE TABLE "public"."hinges" (
    "id" text NOT NULL,
    "default" bool,
    "name" text,
    "price" numeric(10,2) NOT NULL,
    "quantity" int4 NOT NULL,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."pvccolors";
-- Table Definition
CREATE TABLE "public"."pvccolors" (
    "id" text NOT NULL,
    "color_type" text,
    "image" text,
    "name" text,
    "order" int4,
    "type" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."finishings";
-- Table Definition
CREATE TABLE "public"."finishings" (
    "id" text NOT NULL,
    "carvings" bool,
    "colors" text,
    "default" bool,
    "en" text,
    "lt" text,
    "millings" text,
    "name" text,
    "order" int4,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."cylinders";
-- Table Definition
CREATE TABLE "public"."cylinders" (
    "id" text NOT NULL,
    "en" text,
    "fits" jsonb,
    "group" text,
    "image" text,
    "lt" text,
    "make" text,
    "name" text,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."specifications";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS specifications_id_seq;

-- Table Definition
CREATE TABLE "public"."specifications" (
    "id" int4 NOT NULL DEFAULT nextval('specifications_id_seq'::regclass),
    "access" jsonb,
    "createdAt" timestamptz NOT NULL DEFAULT now(),
    "createdBy" text NOT NULL DEFAULT ''::text,
    "lastUpdated" timestamptz NOT NULL DEFAULT now(),
    "name" text NOT NULL,
    "specification" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."drafts";
-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS id_seq;

-- Table Definition
CREATE TABLE "public"."drafts" (
    "access" jsonb,
    "createdAt" timestamptz,
    "createdBy" text,
    "lastSaved" timestamptz,
    "name" text,
    "draft" jsonb,
    "autoSave" bool,
    "isActive" bool,
    "id" int4 DEFAULT nextval('id_seq'::regclass)
);

DROP TABLE IF EXISTS "public"."doortypeprices";
-- Table Definition
CREATE TABLE "public"."doortypeprices" (
    "id" text NOT NULL,
    "en" text,
    "hasExternal" bool,
    "hasInternal" bool,
    "isPassive" bool,
    "lt" text,
    "name" text,
    "position" text,
    "price" numeric(10,2),
    "prices" jsonb,
    "type" text,
    "fixed" numeric,
    "alt_prices" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."logos";
-- Table Definition
CREATE TABLE "public"."logos" (
    "id" text NOT NULL,
    "image" text,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."standardmetalcolors";
-- Table Definition
CREATE TABLE "public"."standardmetalcolors" (
    "id" text NOT NULL,
    "color_type" text,
    "name" text,
    "order" int4,
    "ral" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glassnew";
-- Table Definition
CREATE TABLE "public"."glassnew" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    "price" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."millings";
-- Table Definition
CREATE TABLE "public"."millings" (
    "id" text NOT NULL,
    "en" text,
    "items" jsonb,
    "lt" text,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."dimensionsmax";
-- Table Definition
CREATE TABLE "public"."dimensionsmax" (
    "id" text NOT NULL,
    "heights" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."doorfinishingsandmillings";
-- Table Definition
CREATE TABLE "public"."doorfinishingsandmillings" (
    "id" text NOT NULL,
    "carvings" bool,
    "colors" text,
    "currency" text,
    "default" bool,
    "finishing" text,
    "key" text,
    "millings" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."dooropenings";
-- Table Definition
CREATE TABLE "public"."dooropenings" (
    "id" text NOT NULL,
    "image" text,
    "key" text,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."electricstrikes";
-- Table Definition
CREATE TABLE "public"."electricstrikes" (
    "id" text NOT NULL,
    "en" text,
    "fits" jsonb,
    "image" text,
    "lt" text,
    "maker" text,
    "name" text,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."exploitationconditions";
-- Table Definition
CREATE TABLE "public"."exploitationconditions" (
    "id" text NOT NULL,
    "default" bool,
    "en" text,
    "lt" text,
    "name" text,
    "prices" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."extracylinders";
-- Table Definition
CREATE TABLE "public"."extracylinders" (
    "id" text NOT NULL,
    "en" text,
    "fits" jsonb,
    "group" text,
    "image" text,
    "lt" text,
    "make" text,
    "name" text,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."extralocks";
-- Table Definition
CREATE TABLE "public"."extralocks" (
    "id" text NOT NULL,
    "door_model" jsonb,
    "en" text,
    "image" text,
    "locking_directions" text,
    "lt" text,
    "maker" text,
    "name" text,
    "price" numeric(10,2),
    "security_class" text,
    "template" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glassaddontypes";
-- Table Definition
CREATE TABLE "public"."glassaddontypes" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."thresholds";
-- Table Definition
CREATE TABLE "public"."thresholds" (
    "id" text NOT NULL,
    "door_type" jsonb,
    "en" text,
    "group" text,
    "image" text,
    "lt" text,
    "name" text,
    "options" jsonb,
    "order" int4,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."carvings";
-- Table Definition
CREATE TABLE "public"."carvings" (
    "id" text NOT NULL,
    "glazings" jsonb,
    "image" text,
    "name" text,
    "custom_glazings" bool,
    "en" text,
    "lt" text,
    "order" text,
    "default" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."doortypesactual";
-- Table Definition
CREATE TABLE "public"."doortypesactual" (
    "id" text NOT NULL,
    "default" bool,
    "description" text,
    "double" bool,
    "image" text,
    "name" text,
    "prices" jsonb,
    "wider" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."categories";
-- Table Definition
CREATE TABLE "public"."categories" (
    "id" text NOT NULL,
    "adjustable" bool,
    "collections" jsonb,
    "en" text,
    "lt" text,
    "order" int4,
    "slug" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."doormodels";
-- Table Definition
CREATE TABLE "public"."doormodels" (
    "id" text NOT NULL,
    "image" text,
    "key" text,
    "en" text,
    "order" int4,
    "price" numeric(10,2),
    "lt" varchar(255),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."architraves";
-- Table Definition
CREATE TABLE "public"."architraves" (
    "id" text NOT NULL,
    "alt_price" text,
    "colors" text,
    "custom_price" bool,
    "default" bool,
    "double" bool,
    "en" text,
    "fits" jsonb,
    "group" text,
    "image" text,
    "image_" bool,
    "lt" text,
    "multiplier" text,
    "name" text,
    "order" int4,
    "price" numeric(10,2),
    "side" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."users";
-- Table Definition
CREATE TABLE "public"."users" (
    "id" text NOT NULL,
    "email" text NOT NULL,
    "password" text,
    "displayName" text,
    "canChangePrice" text,
    "isAdmin" bool,
    "logos" jsonb,
    "markup" text,
    "selected_logo" text,
    "user_markup" numeric(5,2),
    "created_at" timestamp DEFAULT now(),
    "updated_at" timestamp DEFAULT now(),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."translations";
-- Table Definition
CREATE TABLE "public"."translations" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."dimensionsclassic";
-- Table Definition
CREATE TABLE "public"."dimensionsclassic" (
    "id" text NOT NULL,
    "heights" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."handles";
-- Table Definition
CREATE TABLE "public"."handles" (
    "id" text NOT NULL,
    "custom_price" bool,
    "en" text,
    "group" text,
    "image" text,
    "inside" bool,
    "lt" text,
    "maker" text,
    "name" text,
    "order" int4,
    "price" numeric(10,2),
    "set" bool,
    "default" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glass";
-- Table Definition
CREATE TABLE "public"."glass" (
    "id" text NOT NULL,
    "default" bool,
    "en" text,
    "lt" text,
    "name" text,
    "prices" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glassaddon";
-- Table Definition
CREATE TABLE "public"."glassaddon" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    "price" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glassbulletproofsizes";
-- Table Definition
CREATE TABLE "public"."glassbulletproofsizes" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    "size" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glassfilm";
-- Table Definition
CREATE TABLE "public"."glassfilm" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    "price" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glassshapebulletproof";
-- Table Definition
CREATE TABLE "public"."glassshapebulletproof" (
    "id" text NOT NULL,
    "name" text,
    "price" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glasstypenew";
-- Table Definition
CREATE TABLE "public"."glasstypenew" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    "price" jsonb,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."glasstype";
-- Table Definition
CREATE TABLE "public"."glasstype" (
    "id" text NOT NULL,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."hingeaccessories";
-- Table Definition
CREATE TABLE "public"."hingeaccessories" (
    "id" text NOT NULL,
    "en" text,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    "quantifiable" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."hingecapfinishings";
-- Table Definition
CREATE TABLE "public"."hingecapfinishings" (
    "id" text NOT NULL,
    "default" bool,
    "en" text,
    "image" text,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."hingecaps";
-- Table Definition
CREATE TABLE "public"."hingecaps" (
    "id" text NOT NULL,
    "caps" bool,
    "default" bool,
    "en" text,
    "lt" text,
    "name" text,
    "order" int4,
    "price" numeric(10,2),
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."lockseasyaccessories";
-- Table Definition
CREATE TABLE "public"."lockseasyaccessories" (
    "id" text NOT NULL,
    "collection" text,
    "en" text,
    "image" text,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    "quantifiable" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."lockseasy";
-- Table Definition
CREATE TABLE "public"."lockseasy" (
    "id" text NOT NULL,
    "accessories" jsonb,
    "collection" text,
    "en" text,
    "image" text,
    "lt" text,
    "maker" text,
    "name" text,
    "price" numeric(10,2),
    "set" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."lockssmartaccessories";
-- Table Definition
CREATE TABLE "public"."lockssmartaccessories" (
    "id" text NOT NULL,
    "collection" text,
    "en" text,
    "image" text,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    "quantifiable" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."lockssmart";
-- Table Definition
CREATE TABLE "public"."lockssmart" (
    "id" text NOT NULL,
    "accessories" jsonb,
    "collection" text,
    "en" text,
    "image" text,
    "lt" text,
    "maker" text,
    "name" text,
    "price" numeric(10,2),
    "set" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."mainlocksadditionalaccessories";
-- Table Definition
CREATE TABLE "public"."mainlocksadditionalaccessories" (
    "id" text NOT NULL,
    "collection" text,
    "en" text,
    "image" text,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    "quantifiable" bool,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."millingimages";
-- Table Definition
CREATE TABLE "public"."millingimages" (
    "id" text NOT NULL,
    "image" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."stainedcolors";
-- Table Definition
CREATE TABLE "public"."stainedcolors" (
    "id" text NOT NULL,
    "color_type" text,
    "image" text,
    "name" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."thresholdoptions";
-- Table Definition
CREATE TABLE "public"."thresholdoptions" (
    "id" text NOT NULL,
    "alt_price" text,
    "double_leaf_en" text,
    "double_leaf_lt" text,
    "double_leaf_name" text,
    "double_leaf_price" numeric(10,2),
    "en" text,
    "has_double_leaf" bool,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    "image" text,
    PRIMARY KEY ("id")
);

DROP TABLE IF EXISTS "public"."otheraccessories";
-- Table Definition
CREATE TABLE "public"."otheraccessories" (
    "id" text NOT NULL,
    "en" text,
    "group" text,
    "image" text,
    "lt" text,
    "name" text,
    "price" numeric(10,2),
    "quantifiable" bool,
    "umbrella" text,
    "quantity" numeric,
    PRIMARY KEY ("id")
);

INSERT INTO "public"."bulletproofmodel" ("id", "en", "fits", "lt", "name", "price", "order") VALUES
('0', 'None', '["classic", "max"]', 'Nera', 'None', '{"max": "0", "classic": "0"}', NULL),
('FB4', 'FB4', '["classic", "max"]', 'FB4', 'FB4', '{"max": "657", "classic": "657"}', NULL),
('FB6', 'FB6', '["max"]', 'FB6', 'FB6', '{"max": "1740"}', NULL);

INSERT INTO "public"."mainlocks" ("id", "accessories", "collection", "custom_price", "en", "fits", "image", "locking_directions", "lt", "maker", "name", "order", "price", "security_class", "template") VALUES
('2T43nQJAIhaXo1NXUQN', '["1", "2"]', 'main_locks', NULL, '8765, cylinder 1301 with twister, 3 keys, chrome', '["classic", "true"]', '/main_locks/assa_565.png', '1', '8765, cilindras 1301 su suktuvu, 3 raktais, chromas', 'ASSA', '8765, cylinder 1301 with twister, 3 keys, chrome', 4, 57.00, '4', NULL),
('6wr3ZBuBObCQWYU4xpRV', '["3", "4"]', 'main_locks', NULL, '678 GF, with DEFENDER, without cylinder, mat chrome or mat. brass', NULL, '/main_locks/Fiam_678.png', '3', '678 GF, su DEFENDER, be cilindro, matinis chromas arba matinis žalvaris', 'FIAM', '678 GF, with DEFENDER, without cylinder, mat chrome or mat. brass', 12, 88.00, '7', NULL),
('7lRrXVEjplEYAmEQQeJr', '["3", "4"]', 'main_locks', NULL, '87977, without cylinder, with defender and accessories, no handles, Mat Chrome or mat. brass', '["classic", "true"]', '/main_locks/mottura_87977.png', '3', '87977, be cilindro su DEFENDER ir aksesuarais, be rankenų, matinis chromas arba matinis žalvaris', 'MOTTURA', '87977, without cylinder, with defender and accessories, no handles, Mat Chrome or mat. brass', 14, 140.00, '7', NULL),
('Bm5qkpD7nbCjmHFScoWh', '["1", "2"]', 'main_locks', NULL, '565, cylinder 1302 (key+key), 5 Keys, chrome', '["classic", "true"]', '/main_locks/assa_565.png', '1', '565, cilindras 1302 (raktas+raktas), 5 raktai, chromas', 'ASSA', '565, cylinder 1302 (key+key), 5 Keys, chrome', 3, 74.00, '2', NULL),
('CmVbZtSSVsVv4TFzRKW', NULL, 'main_locks', NULL, 'EL582, cylinder CYD13D with twister, 3 keys (solenoid lock), chrome', '["classic", "true"]', '/main_locks/abloy_EL582.png', '1', 'EL582, cilindras CYD13D su suktuvu, 3 raktai (solenoidinis užraktas), chromas', 'Abloy', 'EL582, cylinder CYD13D with twister, 3 keys (solenoid lock), chrome', 6, 438.00, '5', NULL),
('E9OhvfMQ2Q1HA7pZ2F5B', '["3", "4"]', 'main_locks', NULL, '678 GF, with DEFENDER, without cylinder, chrome', NULL, '/main_locks/Fiam_678.png', '3', '678 GF, su DEFENDER, be cilindro, chromas', 'FIAM', '678 GF, with DEFENDER, without cylinder, chrome', 11, 81.00, '7', NULL),
('GwPzVTswhLJdsPLhaVWH', '["3", "4"]', 'main_locks', NULL, '678 GF, ISEO R6 cylinder (key+key), 1+5 keys, chrome', '["classic", "true"]', '/main_locks/FIAM_678_GF_CYL.png', '3', '678 GF, ISEO R6 cilindras (raktas+raktas), 1+5 raktai, chromas', 'FIAM', '678 GF, ISEO R6 cylinder (key+key), 1+5 keys, chrome', NULL, 93.00, '6', NULL),
('GzDZO9E1Js6XPPA20qxf', '["3", "4"]', 'main_locks', NULL, '678 clack, with DEFENDER, without cylinder, mat chrome', '["classic", "true"]', '/main_locks/fiam_clack.png', '3', '678 clack, su DEFENDER, be cilindro, matinis chromas', 'FIAM', '678 clack, with DEFENDER, without cylinder, mat chrome', NULL, 81.00, '6', NULL),
('HXcTOl6hNvS8TEXGQFP', '["3", "4"]', 'main_locks', NULL, '52771, 5 keys, chrome', '["classic", "true"]', '/main_locks/mottura_52771.png', '3', '52771, 5 raktai, chromas', 'MOTTURA', '52771, 5 keys, chrome', 13, 73.00, '7', NULL),
('K8D7VUoREU581RRRQ2QP', '["1", "2"]', 'main_locks', NULL, '712, oval cyl. Dorma 3003 with twister, 5 patented keys, handle 17099 New York Black finish', '["classic", "true"]', '/main_locks/dorma_new_york.png', '1', '712, ovalus cilindras Dorma 3003 su suktuvu, 5 patentuoti raktai, rankena 17099 New York juoda', 'DORMA', '712, oval cyl. Dorma 3003 with twister, 5 patented keys, handle 17099 New York Black finish', 10, 90.00, '3', NULL),
('NQLFXZXmBlBl7BhVDpUn', '["3", "4"]', 'main_locks', NULL, '85771 with DEFENDER, without cylinder, mat. chrome or mat. brass', '["classic", "true"]', '/main_locks/mottura_85771.png', '3', '85771 su DEFENDER, be cilindro, matinis chromas ar matinis žalvaris', 'MOTTURA', '85771 with DEFENDER, without cylinder, mat. chrome or mat. brass', 16, 107.00, NULL, NULL),
('OLo2cNjcOclzaokddZUK', NULL, 'main_locks', NULL, '8561-50 lock case', NULL, '/main_locks/ASSA_8561.png', '1', '8561-50 spynos dėklas', 'ASSA', '8561-50 lock case', NULL, 58.00, '2', NULL),
('RSLKmTyGkuXDP7L4s2xT', '["1", "2"]', 'main_locks', NULL, '912, oval cyl. Evva EPS, with twister, Danish key profile, 3 keys, chrome', NULL, '/main_locks/EVVA.png', '1', '912, ovalus cilindras Evva EPS, su suktuvu, Danish rakto profilis, 3 raktai, chromas', 'DORMA', '912, oval cyl. Evva EPS, with twister, Danish key profile, 3 keys, chrome', NULL, 48.00, '4', NULL),
('SAH6oFcpkk3XJiiZmf3l', NULL, 'main_locks', NULL, 'CFMA 10328 (1+3+1 patented keys), chrome', NULL, '/main_locks/MULTLOCK_10328.png', '3', 'CFMA 10328 (1+3+1 patentuoti raktai), chromas', 'Mul-T-Lock', 'CFMA 10328 (1+3+1 patented keys), chrome', NULL, 122.00, '6', NULL),
('bzxao9TBaTK4MKxfNXdN', NULL, 'main_locks', 't', 'Customer lock', NULL, NULL, NULL, 'Kliento spyna', NULL, 'Customer lock', NULL, 53.00, NULL, NULL),
('cB4AnbSAFSwF34hGsz35', '["1", "2"]', 'main_locks', NULL, '712, oval cyl. Dorma 3003 with twister, 5 patented keys, chrome', '["classic", "true"]', '/main_locks/dorma_3003.png', '1', '712, ovalus cilindras Dorma 3003 su suktuvu, 5 patentuoti raktai, chromas', 'DORMA', '712, oval cyl. Dorma 3003 with twister, 5 patented keys, chrome', 8, 41.00, '3', NULL),
('cr25uzxBue2hnCAmiOV4', '["3", "4"]', 'main_locks', NULL, '678 GF, ISEO R6 cylinder (key+key), 1+5 keys, mat. chrome', '["classic", "true"]', '/main_locks/FIAM_678_GF_CYL.png', '3', '678 GF, ISEO R6 cilindras (raktas+raktas), 1+5 raktai, matinis chromas', 'FIAM', '678 GF, ISEO R6 cylinder (key+key), 1+5 keys, mat. chrome', NULL, 106.00, '6', NULL),
('f625mV5EpQmWws0BUFZI', '["3", "4"]', 'main_locks', NULL, '87977, without cylinder, with defender and accessories, no handles, chrome', '["classic", "true"]', '/main_locks/mottura_87977.png', '3', '87977, be cilindro, su defender ir aksesuarais, be rankenų, chromas', 'MOTTURA', '87977, without cylinder, with defender and accessories, no handles, chrome', 13, 127.00, NULL, NULL),
('fdPeV4pRF3gd6HhnKs8T1', '["3", "4"]', 'main_locks', NULL, '678 clack, with DEFENDER, without cylinder, chrome', '["classic", "true"]', '/main_locks/fiam_clack.png', '3', '678 clack, su DEFENDER, be cilindro, chromas', 'FIAM', '678 clack, with DEFENDER, without cylinder, chrome', NULL, 68.00, '6', NULL),
('guFER2E4Cb67MDltNBr', '["1", "2"]', 'main_locks', NULL, '565, cylinder 1301 with twister, 3 keys, chrome', '["classic", "true"]', '/main_locks/assa_565.png', '1', '565, cilindras 1301 su suktuvu, 3 raktai, chromas', 'ASSA', '565, cylinder 1301 with twister, 3 keys, chrome', NULL, 40.00, '2', NULL),
('hGSY9EIGpu86sVP374uT', '["1", "2"]', 'main_locks', NULL, '712/ 03/ MULTICODE/ K27 (1+5keys) chrome', '["classic", "true"]', '/main_locks/dorma_712.png', '1', '712/ 03/ MULTICODE/ K27 (1+5 raktai) chromas', 'DORMA', '712/ 03/ MULTICODE/ K27 (1+5keys) chrome', NULL, 29.00, '2', NULL),
('llB6X5DJ7KoYf1XlRPEG', '["1", "2"]', 'main_locks', NULL, '912, oval cyl. Dorma 3003 with twister, 5 patented keys, chrome', '["classic", "true"]', '/main_locks/dorma_3003.png', '1', '912, ovalus cilindras Dorma 3003 su suktuvu, 5 patentuoti raktai, chromas', 'DORMA', '912, oval cyl. Dorma 3003 with twister, 5 patented keys, chrome', 9, 52.00, '4', NULL),
('ntAPiMd6wibaCvnGbT4', '["3", "4"]', 'main_locks', NULL, '85771 with DEFENDER, without cylinder, chrome', '["classic", "true"]', '/main_locks/mottura_85771.png', '3', '85771 su DEFENDER, be cilindro, chromas', 'MOTTURA', '85771 with DEFENDER, without cylinder, chrome', 15, 94.00, '7', NULL),
('oTo79BmfZzC4Qh2HmB3G', NULL, 'main_locks', NULL, 'Only drilling to Abloy lock EL596 motor lock, without cylinder, without lock', '["classic", "true", "max", "true"]', NULL, NULL, 'Tik grėžimas į Abloy spyna EL596 motorinis užraktas, be cilindro, be spynos', NULL, 'Only drilling to Abloy lock EL596 motor lock, without cylinder, without lock', NULL, 25.00, NULL, 't'),
('sbqTbKHyC9JJlnWULlN7', NULL, 'main_locks', NULL, '2000, cylinder 1312 (key+key), 3 keys, chrome', '["classic", "true"]', '/main_locks/assa_2000.png', '1', '2000, cilindras 1312 (raktas+raktas), 3 raktai, chromas', 'ASSA', '2000, cylinder 1312 (key+key), 3 keys, chrome', 5, 151.00, '5', NULL),
('xknQ0BzKQahviFB42nQ', '["1", "2"]', 'main_locks', NULL, '565, cylinder 1301 with twister, 5 keys, chrome', '["classic", "true"]', '/main_locks/assa_565.png', '1', '565, cilindras 1301 su suktuvu, 5 raktai, chromas', 'ASSA', '565, cylinder 1301 with twister, 5 keys, chrome', 2, 52.00, '2', NULL),
('zHKnkRZBvD1zPu4qUYx', NULL, 'main_locks', NULL, 'CFMA 10328 (1+3+1 patented keys), mat chrome', NULL, '/main_locks/MULTLOCK_10328.png', '3', 'CFMA 10328 (1+3+1 patentuoti raktai), matinis chromas', 'Mul-T-Lock', 'CFMA 10328 (1+3+1 patented keys), mat chrome', NULL, 140.00, '6', NULL);

INSERT INTO "public"."hinges" ("id", "default", "name", "price", "quantity") VALUES
('W7BuTxBrHa6PRdIST2Fff', 't', '2', 0.00, 0),
('f3nhdrhiJxqnZfqTTbkK', NULL, '3', 11.00, 0),
('vJVZ8wsT5rGIZpTTetNF', NULL, '4', 21.00, 0);

INSERT INTO "public"."pvccolors" ("id", "color_type", "image", "name", "order", "type") VALUES
('2pOWltjRnlHfvHP9T8TK', 'pvc', '/pvc_colors/ger33.png', 'Country Oak F 504ST (GER33)', 21, 'ger33'),
('3W74KmDoww6qYxVQ1Huf6', 'pvc', '/pvc_colors/mu3_ral9016.png', 'White Mini RB1155-68 (MU3)', 26, 'mu3'),
('4ucWnFaqjC3FpJxBl6w', 'pvc', '/pvc_colors/ger9.png', 'Aluminum Structure S6T (GER9)', 7, 'ger9'),
('6T6p4ZnrHJIgIevRjq0', 'pvc', '/pvc_colors/mu2.png', 'ANTRACYT (Grey) RB 8811-06 (MU2)', 28, 'mu2'),
('A3pRhO7FcSchTfUMYDs', 'pvc', '/pvc_colors/ger11.png', 'Natural Beech 33 (GER11)', 8, 'ger11'),
('BeMXmyL7SFKuM6nT8gl', 'pvc', '/pvc_colors/ger26.png', 'Dark Plum RB 237-6 (GER26)', 14, 'ger26'),
('EW0CrqRk18ls1FPVKop', 'pvc', '/pvc_colors/ger30.png', 'Hungarian Plum RB 269-2 (GER30)', 19, 'ger30'),
('FSA8jS0I2W561IuKAhTp', 'pvc', '/pvc_colors/ger27.png', 'Milk Wenge RB 194-7 (GER27)', 15, 'ger27'),
('FoMo8Z3RAbrdJEXVbdRs', 'pvc', '/pvc_colors/ger1.png', 'Natural Oak 13T (GER 1)', 1, 'ger1'),
('K1T2TauqBMHpnO3hyf4b', 'pvc', '/pvc_colors/ger6.png', 'Dark apple 41T (GER6)', 5, 'ger6'),
('MY52WzJmkiFec3bXTjGo', 'pvc', '/pvc_colors/ger7.png', 'Mini vanilla 791-S39 (GER7)', 6, 'ger7'),
('MjN7m4DrpgBemlkT9y5mv', 'pvc', '/pvc_colors/ger38.png', 'Light Oak VF 2615-22 (GER38)', 25, 'ger38'),
('NdXO9oZWE7h7iSfrCK', 'pvc', '/pvc_colors/ger21.png', 'Sokal Oak 20141-4 (GER21)', 12, 'ger21'),
('QZNWhcESBkk8zFBXc3Kp', 'pvc', '/pvc_colors/ger13.png', 'Lanzado Walnut RB 214-7 (GER13)', 10, 'ger13'),
('WAXSmjn7qsE7HIBJddL', 'pvc', '/pvc_colors/ger42.png', 'Black Mate RB2005-06 (GER42)', 29, 'ger42'),
('Y36ESMfjvsBGcqSLHUN7', 'pvc', '/pvc_colors/ger3.png', 'Mahogany 1T (GER3)', 3, 'ger3'),
('b5SYqhHBKbj2IZWSsTs', 'pvc', '/pvc_colors/mu1_ral9010.png', 'Jasmin mate ARTP-147 (MU1)', 27, 'mu1'),
('gK743EDqdH7bpJmBHAZM', 'pvc', '/pvc_colors/ger35.png', 'Gnarled Oak NY 4802-60M (GER35)', 22, 'ger35'),
('gKXrclveMNSspMxal1l', 'pvc', '/pvc_colors/ger43.png', 'Osaka Oak RB 295-17 (GER43)', 30, 'ger43'),
('hrCUdHA2EYhPvr0tswB', 'pvc', '/pvc_colors/ger2.png', 'Rust oak 156T (GER2)', 2, 'ger2'),
('jAcaLWBb1mPddVUMERR', 'pvc', '/pvc_colors/ger32.png', 'Trak Clone M 2413-22 (GER32)', 20, 'ger32'),
('jukFCXGaWU8jS48qA', 'pvc', '/pvc_colors/ger25.png', 'Antique oak RB 246-2T (GER25)', 13, 'ger25'),
('kiH5SUNeqK9IUdPUT', 'pvc', '/pvc_colors/ger18.png', 'Rustic Oak 11T (GER18)', 11, 'ger18'),
('qX2FS8DQ6ATh8X8lRZo', 'pvc', '/pvc_colors/ger5.png', 'Alder 29 (GER5)', 4, 'ger5'),
('sQ6DuaA8chZCnvX2kLfQ', 'pvc', '/pvc_colors/ger37.png', 'Thru Grooved VF 2642-22 (GER37)', 24, 'ger37'),
('trhSEd83e4kBXXEwVaY', 'pvc', '/pvc_colors/ger45.png', 'Tabasco Walnut RB 152-8 (GER45)', 32, 'ger45'),
('uwdHVn4FVhvTQ88jRsLN', 'pvc', '/pvc_colors/ger28.png', 'Tatra Spruce RB 203-6T (GER28)', 16, 'ger28'),
('xb5aksevaGliy8ilsxAwt', 'pvc', '/pvc_colors/ger44.png', 'Calvados 54 (GER44)', 31, 'ger44'),
('yOo7DB9fKDJlqT7rP9fC', 'pvc', '/pvc_colors/ger36.png', 'Wenge Board VF 2655-22 (GER36)', 23, 'ger36'),
('yQGjaVDP3vcLDhpEvlk2', 'pvc', '/pvc_colors/ger12.png', 'White Wood 3T (GER12)', 9, 'ger12');

INSERT INTO "public"."finishings" ("id", "carvings", "colors", "default", "en", "lt", "millings", "name", "order", "price") VALUES
('4uEs8YnvuASBDSIexFX5', 't', 'ral_all', NULL, 'Umdax HLS painted RAL', 'Umdax HLS dažyta RAL', 'Gl3G3E68P77hJjqotScm', 'Umdax HLS painted RAL', 3, 112.00),
('6SMkwsILC6U8UXyfZE4j', 't', 'ral_all', NULL, 'EDM architraves 18mm (using 3050 mm EDM)', 'EDM apvadai 18mm (naudojant 3050mm EDM)', 'aUTxpcxKykigqKUmAKIg', 'EDM architraves 18mm (using 3050 mm EDM)', 10, 69.00),
('CNqfGXgbraGr42UKivll', 't', 'ral_all', NULL, 'EDM 3050x1220x12mm', 'EDM 3050x1220x12mm', 'aUTxpcxKykigqKUmAKIg', 'EDM 3050x1220x12mm', 8, 366.00),
('CS58IkqAvqzPuSftQrZ', 'f', 'ral_all', NULL, '2 mm Ruukki sheet', '2mm Rukki lakštas', 'aUTxpcxKykigqKUmAKIg', '2 mm Ruukki sheet', 11, 180.00),
('CX1A2ohWDlFKqGztJcW2', 'f', 'ral_all', NULL, '2 mm cold rolled steel sheet', '2mm šalto valcavimo lakštas', 'aUTxpcxKykigqKUmAKIg', '2 mm cold rolled steel sheet', 12, 127.00),
('JwdfdepBPQTZBSNStiUn', 't', 'ral_all', NULL, 'EDM 3050x1220x18mm', 'EDM 3050x1220x18mm', 'aUTxpcxKykigqKUmAKIg', 'EDM 3050x1220x18mm', 9, 451.00),
('L72NoQXbaHJmrpN1gZ0', 't', 'pvc', 't', 'MDF laminated with PVC', 'MDF laminuotas PVC', 'jIMeyHWCtXp532HbHTx', 'MDF laminated with PVC', 1, 0.00),
('LswppFIU3Sn2E6idtPG0', 't', 'ral_all', NULL, 'EDM (Extreme Durable MDF)', 'EDM (Ekstremaliai patvarus MDF)', 'aUTxpcxKykigqKUmAKIg', 'EDM (Extreme Durable MDF)', 6, 263.00),
('QouXNWbClfhTmrXq7L6', 't', 'ral_all', NULL, 'EDM 2440x1220x18mm', 'EDM 2440x1220x18mm', 'aUTxpcxKykigqKUmAKIg', 'EDM 2440x1220x18mm', 7, 316.00),
('hw5YZ1BrZ8lWzaAhJWYJ', NULL, 'ral_all', NULL, 'WRB 18mm', 'WRB 18mm', '7ygG1wl2YSWToTRdnFvz', 'WRB 18mm', 5, 195.00),
('lkeJHBfDLFrjg7beYQf', 't', 'pvc', NULL, 'Umdax HLS board laminated PVC', 'Umdax HLS lenta laminuota PVC', '6oSjFS3PfI20lyZnVpvz', 'Umdax HLS board laminated PVC', 2, 35.00),
('sGWI8wd3bKAy5qpIXtla', 't', 'ral_and_stained', NULL, 'Okume (Water Resistance Board) (stained)', 'Okume (Vandeniui atsparaus) (dažyta)', '7ygG1wl2YSWToTRdnFvz', 'Okume (Water Resistance Board) (stained)', 4, 142.00);

INSERT INTO "public"."cylinders" ("id", "en", "fits", "group", "image", "lt", "make", "name", "price") VALUES
('1T7qZjbTWMsqKTVSPNqA', 'DIN 41x46 eurocylinder, (5 keys), key/key', '["classic"]', NULL, '/champions_pro/champions_pro_key_key.png', 'DIN 41x46 eurocilindrás, (5 raktai), raktas/raktas', 'CHAMPIONS PRO', 'DIN 41x46 eurocylinder, (5 keys), key/key', 83.00),
('COH0U42vFWTAorVZadQY', 'DIN 41x rod eurocylinder, (5 keys), key/twister', '["classic"]', NULL, '/champions_pro/champions_pro_key_twister.png', 'DIN 41x rod eurocilindrás, (5 raktai), raktas/suktukas', 'CHAMPIONS PRO', 'DIN 41x rod eurocylinder, (5 keys), key/twister', 100.00),
('FFUgqLqrpXKTvpjLtZzY', 'DIN 102 eurocylinder, (5 keys), key/twister', '["max"]', NULL, NULL, 'DIN 102 eurocilindrás, (5 raktai), raktas/suktukas', 'CHAMPIONS PRO', 'DIN 102 eurocylinder, (5 keys), key/twister', 102.00),
('IDfwFugvgkIeyNKSZKQY', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/key', '["classic"]', NULL, '/mti/mti_key_key.png', 'Interactive" DIN 40x45 eurocilindrás 115S 1+3+1, (5 raktai), raktas/raktas', 'Mul-T-Lock', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/key', 78.00),
('JMelZ5IHSCmbDbz9KAWt', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/twister', '["classic"]', NULL, '/mti/mti_key_twister.png', 'Interactive" DIN 40x45 eurocilindrás, 115S 1+3+1, (5 raktai), raktas/suktukas', 'Mul-T-Lock', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/twister', 95.00),
('SRaneCKyejHJOJujE9W8', 'DIN 102 eurocylinder, (5 keys), key/key', '["max"]', NULL, NULL, 'DIN 102 eurocilindrás, (5 raktai), raktas/raktas', 'CHAMPIONS PRO', 'DIN 102 eurocylinder, (5 keys), key/key', 87.00),
('TDJCrXaBfgWqVYZvtUji', 'Customer cylinder', '["classic", "max"]', 'b', NULL, 'Kliento cilindras', NULL, 'Customer cylinder', 0.00),
('TeQlwVjQcP84CwotToj', 'None', '["classic", "max"]', 'a', NULL, 'Nera', NULL, 'None', 0.00),
('XPLOEEHgQHcEqHDAbXZ6f', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/twister', '["max"]', NULL, NULL, 'Interactive" DIN 100 eurocilindrás, 115S 1+3+1, (5 raktai), raktas/suktukas', 'Mul-T-Lock', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/twister', 104.00),
('YsFaIyYMoJgbGLIt272R7', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/key', '["max"]', NULL, NULL, 'Interactive" DIN 100 eurocilindrás, 115S 1+3+1, (5 raktai), raktas/raktas', 'Mul-T-Lock', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/key', 87.00),
('dz9psHrJEwy3mGVWGsrlim', 'R6 eurocylinder DIN 40x45 (1+5 keys) key/key', '["classic"]', NULL, '/cylinders/iseo_key_key.png', 'R6 eurocilindrás DIN 40x45 (1+5 raktai) raktas/raktas', 'ISEO', 'R6 eurocylinder DIN 40x45 (1+5 keys) key/key', 24.00),
('er9zmipKBDfUQNNx3BnQ', 'R6 eurocylinder DIN 40x rod(1+5 keys) key/twister', '["classic"]', NULL, '/cylinders/iseo_key_twister.png', 'R6 eurocilindrás DIN 40x rod(1+5 raktai) raktas/suktukas', 'ISEO', 'R6 eurocylinder DIN 40x rod(1+5 keys) key/twister', 41.00),
('tec3Vl4CvDStwMrcotHr6', 'EPS 40/45 mm (5 keys) Danish key profile, key/twister', '["classic"]', NULL, '/cylinders/danish_key.png', 'EPS 40/45 mm (5 raktai) Daniškas rakto profilis, raktas/suktukas', 'EVVA', 'EPS 40/45 mm (5 keys) Danish key profile, key/twister', 55.00);

INSERT INTO "public"."doortypeprices" ("id", "en", "hasExternal", "hasInternal", "isPassive", "lt", "name", "position", "price", "prices", "type", "fixed", "alt_prices") VALUES
('1TLtUkvyhYEvafQlxwE3', 'Fixed side panel', 't', 't', 'f', 'Fiksuota šoninė dalis', 'Fixed side panel', 'side', NULL, '[{"price": 58, "size_to": 350, "size_from": 0}, {"price": 69, "size_to": 500, "size_from": 350}, {"price": 90, "size_to": 1000, "size_from": 500}]', 'percentage_size', NULL, NULL),
('S10jePN4ZJcBAis2uPu8', 'Upper panel', 't', 't', 'f', 'Viršutinė dalis', 'Upper panel', 'top', NULL, '[{"price": 42, "size_to": 350, "size_from": 0}, {"price": 48, "size_to": 500, "size_from": 350}, {"price": 58, "size_to": 1000, "size_from": 500}]', 'percentage_size', NULL, '[{"price": 58, "size_to": 350, "size_from": 0}, {"price": 69, "size_to": 500, "size_from": 350}, {"price": 90, "size_to": 1000, "size_from": 500}]'),
('UMP8gi13Wv3tsXg8Hohv', 'Passive door leaf', 't', 't', 't', 'Pasyvi varstis', 'Passive door leaf', 'side', NULL, '[{"price": 74, "size_to": 350, "size_from": 0}, {"price": 90, "size_to": 500, "size_from": 350}, {"price": 106, "size_to": 1000, "size_from": 500}]', 'percentage_size', NULL, NULL),
('ee5wGPhBzqH8bUf9oTxH', 'Arch upper panel', 't', 't', 'f', 'Viršutinė arka', 'Arch upper panel', 'top', NULL, '[{"price": 74, "size_to": 350, "size_from": 0}, {"price": 90, "size_to": 500, "size_from": 350}, {"price": 106, "size_to": 1000, "size_from": 500}]', 'percentage_size_fixed', 182, '[{"price": 74, "size_to": 350, "size_from": 0}, {"price": 90, "size_to": 500, "size_from": 350}, {"price": 106, "size_to": 1000, "size_from": 500}]'),
('hPoJm4Y9ZSDDTavB08qE', 'Main door', 't', 't', 'f', 'Pagrindinės durys', 'Main door', NULL, NULL, NULL, 'none', NULL, NULL),
('jmbbDeNBiNSmYtjCQBGh', 'Passive door leaf', 't', 't', 't', 'Pasyvi varstis', 'Passive door leaf', 'side', NULL, '[{"price": 74, "size_to": 350, "size_from": 0}, {"price": 90, "size_to": 500, "size_from": 350}, {"price": 106, "size_to": 1000, "size_from": 500}]', 'percentage_size', NULL, NULL),
('lyXqtiHnJXG9kHZjfncD', 'Arch door leaf and frame', 't', 't', 'f', 'Arka su duru rėmu', 'Arch door leaf and frame', 'top', NULL, NULL, 'fixed', 445, NULL);

INSERT INTO "public"."logos" ("id", "image", "name") VALUES
('2oEmcKeyKuzJoHoX6Qt8', '/logos/7f6B02eb-282b-4424-97bd-e2aae7e98bce.png', 'Megatestas'),
('DFSU49kio9LJKGlSxQ', '/logos/02794017-1ba0-453a-b814-324955f2ff62.png', '02794017-1ba0-453a-b814-324955f2ff62.png'),
('L5884IpjnfqG5fqRJDjQ', '/logos/24a41173-d5be-4f31-9755-9ac7b4d10b15.png', 'Testas23'),
('LKpaTQhsJmQVbFv281jL', '/logos/8c00e99a-1ab5-4ce9-a7fa-4b13d540cdd4.png', 'Testas'),
('LldNKwXLwbY2OvZFvw5', '/logos/299a4547-1017-49b1-855d-3bcc812c01ef.png', 'hurrali'),
('geUxpNRHybObwiyRfQ73', '/logos/bae25c74-0459-4c0b-b329-6f2d79c7255f.jpg', 'kaufmans'),
('q2mMSaLjuhW4mwFhUbcS', '/logos/ff7ebdfc-bab8-409a-b022-41c5b0381bd1.png', 'Potato'),
('vR6ckZzSpQS7HZ8cEnDt', '/logos/21881250-891e-4c8c-a486-862d3b3f3008.png', 'Holapola');

INSERT INTO "public"."standardmetalcolors" ("id", "color_type", "name", "order", "ral") VALUES
('0R8BeFy9jsmgvxQAzM5gM', 'ral', 'Black red RAL3007', NULL, '3007'),
('27AMLc6RWjuqMm3TEh', 'ral', 'Grass green RAL6010', NULL, '6010'),
('2eXLmB5DRycOepJDU8qO', 'ral', 'Zinc yellow RAL1018', NULL, '1018'),
('36l6xxTMxPeZOCJ9Wha', 'ral', 'Slate grey RAL7015', NULL, '7015'),
('5Yca56bKu3tupzKNepMb', 'ral', 'Prepared for painting', 1, 'Prepared for painting'),
('5cxr32HfexXNlKTH04TD', 'ral', 'Pebble grey RAL7032', NULL, '7032'),
('6arsw2BRpW73pJ3Ar', 'ral', 'Ruby red RAL3003', NULL, '3003'),
('E7ArFd6CZf2HpaHCawB', 'ral', 'Traffic green RAL6024', NULL, '6024'),
('EVZpxX4iSG2NyjJ7FF8E', 'ral', 'Jet black RAL9005', NULL, '9005'),
('FXFXbc4bSFnTRTUCFhT', 'ral', 'Gentian blue RAL5010', NULL, '5010'),
('IQec22PB4fc1XOmbyeXf', 'ral', 'Traffic red RAL3020', NULL, '3020'),
('J57IYFZN5DSbJOXoycd', 'ral', 'Beige RAL1001', NULL, '1001'),
('LXTausSps34bC7ATYNJO', 'ral', 'Heather violet RAL4003', NULL, '4003'),
('Me8IqtSzNDR8Q2T1otfz', 'ral', 'Agate grey RAL7038', NULL, '7038'),
('Nhs4EKV7snLjGqxCh95Z', 'ral', 'Copper brown RAL8004', NULL, '8004'),
('Orn58dpkb89q1EbhCZen', 'ral', 'Melon yellow RAL1028', NULL, '1028'),
('QTCszXBkwhrVt5LJd4tby', 'ral', 'Clay brown RAL8003', NULL, '8003'),
('S5LLrzaTaoDo4LlNHXf', 'ral', 'Pale brown RAL8025', NULL, '8025'),
('SakRAprCT8m7EqVu48Y', 'ral', 'Telegrey 4 RAL7047', NULL, '7047'),
('UMZvxD16NqNWrs17hfVZ', 'ral', 'Mint green RAL6029', NULL, '6029'),
('UWCOM4MOKUeR0mfLsQ', 'ral', 'Traffic white RAL9016', NULL, '9016'),
('Uagp7M4MknKYD8nrcNNT', 'ral', 'White aluminium RAL9006', NULL, '9006'),
('VtEmUjN2HXqzd73xHn1S', 'ral', 'Ultramarine blue RAL5002', NULL, '5002'),
('jx1b2z5QtMlwSqcJvxhv', 'ral', 'Colza yellow RAL1021', NULL, '1021'),
('klrzsXnQ8xFMBkYuMb2s', 'ral', 'Chocolate brown RAL8017', NULL, '8017'),
('knTJDGN80uWVFkJaVsYH', 'ral', 'Red brown RAL8012', NULL, '8012'),
('tRdZH3ddLkL0uZ9WoNLK', 'ral', 'Violet blue RAL5000', NULL, '5000'),
('vKEzPTd1Gc5eC8iQCmcF', 'ral', 'Window grey RAL7040', NULL, '7040'),
('wpB8s5IAZhyy4FCr65L', 'ral', 'Wine red RAL3005', NULL, '3005'),
('xcHOaYGNT8z6STVxLSI7', 'ral', 'Traffic grey A RAL7042', NULL, '7042'),
('y0WeDcM2ULSahjXitY0aF', 'ral', 'Ocean blue RAL5020', NULL, '5020'),
('y6TU68JLJi3h5D6NhI8', 'ral', 'Brown beige RAL1011', NULL, '1011'),
('zQ8AHAjgoEEWs9MquZU9', 'ral', 'Signal blue RAL5005', NULL, '5005'),
('zmuxaEBQ9VsG3zusi97m', 'ral', 'Pure white RAL9010', NULL, '9010');

INSERT INTO "public"."glassnew" ("id", "en", "lt", "name", "price") VALUES
('GLASS1', 'None', 'Nera', 'None', '{"G1": "0", "G2": "0", "G3": "0", "G4": "0", "G5": "0", "G6": "0"}'),
('GLASS3', NULL, NULL, 'P6B', '{"G1": "101", "G2": "101", "G3": "201", "G4": "201"}'),
('GLASS4', NULL, NULL, 'P8B', '{"G1": "159", "G2": "159", "G3": "318", "G4": "318"}'),
('GLASS5', NULL, NULL, 'BR2', '{"G1": "152", "G2": "152", "G3": "254", "G4": "254", "G5": "254", "G6": "254"}'),
('GLASS6', NULL, NULL, 'BR3', '{"G1": "311", "G2": "311", "G3": "517", "G4": "517", "G5": "517", "G6": "517"}'),
('GLASS7', NULL, NULL, 'BR4', '{"G1": "358", "G2": "358", "G3": "597", "G4": "597", "G5": "597", "G6": "597"}'),
('GLASS8', NULL, NULL, 'BR6', '{"G1": "461", "G2": "461", "G3": "769", "G4": "769", "G5": "769", "G6": "769"}');

INSERT INTO "public"."millings" ("id", "en", "items", "lt", "name") VALUES
('6oSjFS3PfI20lyZnVpvz', 'Umidax HLS board laminated PVC', '[{"en": "VF", "lt": "VF", "name": "VF", "image": "/millings/VF.png", "price": "13"}, {"en": "5F", "lt": "5F", "name": "5F", "image": "/millings/5F.png", "price": "13"}, {"en": "10F", "lt": "10F", "name": "10F", "image": "/millings/10F.png", "price": "13"}, {"en": "DF", "lt": "DF", "name": "DF", "image": "/millings/DF.png", "price": "27"}, {"en": "MF", "lt": "MF", "name": "MF", "image": "/millings/MF.png", "price": "63"}, {"en": "AF", "lt": "AF", "name": "AF", "image": "/millings/AF.png", "price": "63"}, {"en": "AR", "lt": "AR", "name": "AR", "image": "/millings/AR.png", "price": "63"}, {"en": "MF with baguettes", "lt": "MF su bagetėmis", "name": "MF with baguettes", "image": "/millings/MF_baguettes.png", "price": "178"}, {"en": "MF with sharp corners", "lt": "MF su ašrtiais kampais", "name": "MF with sharp corners", "image": "", "price": "90"}, {"en": "AF with sharp corners", "lt": "AF su aštriais kampais", "name": "AF with sharp corners", "image": "", "price": "90"}, {"en": "MF with baguettes and sharp corners", "lt": "MF su bagetėmis ir aštriais kampais", "name": "MF with baguettes and sharp corners", "image": "", "price": "205"}]', 'Umdax HLS plokšte laminuota PVC', 'Umdax HLS board laminated PVC'),
('7ygG1wl2YSWToTRdnFvz', 'Okume (Water Resistance Board) (stained)', '[{"en": "VF", "lt": "VF", "name": "VF", "image": "/millings/VF.png", "price": "23"}, {"en": "5F", "lt": "5F", "name": "5F", "image": "/millings/5F.png", "price": "23"}, {"en": "10F", "lt": "10F", "name": "10F", "image": "/millings/10F.png", "price": "23"}, {"en": "DF", "lt": "DF", "name": "DF", "image": "/millings/DF.png", "price": "38"}, {"en": "MF", "lt": "MF", "name": "MF", "image": "/millings/MF.png", "price": "104"}, {"en": "AF", "lt": "AF", "name": "AF", "image": "/millings/AF.png", "price": "104"}, {"en": "AR", "lt": "AR", "name": "AR", "image": "/millings/AR.png", "price": "104"}, {"en": "MF with baguettes", "lt": "MF su bagetėmis", "name": "MF with baguettes", "image": "/millings/MF_baguettes.png", "price": "206"}, {"en": "MF with sharp corners", "lt": "MF with sharp corners", "name": "MF with sharp corners", "image": "", "price": "130"}, {"en": "AF with sharp corners", "lt": "AF su aštriais kampais", "name": "AF with sharp corners", "image": "", "price": "130"}, {"en": "MF with baguettes and sharp corners", "lt": "MF su bagetėmis ir aštriais kampais", "name": "MF with baguettes and sharp corners", "image": "", "price": "232"}]', 'Okume (Vandeniui atsparus Board) (stained)', 'Okume (Water Resistance Board) (stained)'),
('Gl3G3E68P77hJjqotScm', 'Umdax HLS painted RAL', '[{"en": "VF", "lt": "VF", "name": "VF", "image": "/millings/VF.png", "price": "13"}, {"en": "5F", "lt": "5F", "name": "5F", "image": "/millings/5F.png", "price": "13"}, {"en": "10F", "lt": "10F", "name": "10F", "image": "/millings/10F.png", "price": "13"}, {"en": "DF", "lt": "DF", "name": "DF", "image": "/millings/DF.png", "price": "27"}, {"en": "MF", "lt": "MF", "name": "MF", "image": "/millings/MF.png", "price": "64"}, {"en": "AF", "lt": "AF", "name": "AF", "image": "/millings/AF.png", "price": "64"}, {"en": "AR", "lt": "AR", "name": "AR", "image": "/millings/AR.png", "price": "64"}, {"en": "MF with baguettes", "lt": "MF su bagetėmis", "name": "MF with baguettes", "image": "/millings/MF_baguettes.png", "price": "178"}, {"en": "Victoria milling", "lt": "Victoria frezavimas", "name": "Victoria milling", "image": "/millings/victoria.png", "price": "302"}, {"en": "MF with sharp corners", "lt": "MF su aštriais kampais", "name": "MF with sharp corners", "image": "", "price": "90"}, {"en": "AF with sharp corners", "lt": "AF su aštriais kampais", "name": "AF with sharp corners", "image": "", "price": "90"}, {"en": "MF with baguettes and sharp corners", "lt": "MF su bagetėmis ir aštriais kampais", "name": "MF with baguettes and sharp corners", "image": "", "price": "205"}]', 'Umdax HLS dažyta RAL', 'Umdax HLS painted RAL'),
('aUTxpcxKykigqKUmAKIg', 'EDM (Extreme Durable MDF)', '[{"en": "VF", "lt": "VF", "name": "VF", "image": "/millings/VF.png", "price": "13"}, {"en": "5F", "lt": "5F", "name": "5F", "image": "/millings/5F.png", "price": "13"}, {"en": "10F", "lt": "10F", "name": "10F", "image": "/millings/10F.png", "price": "13"}, {"en": "DF", "lt": "DF", "name": "DF", "image": "/millings/DF.png", "price": "27"}, {"en": "MF", "lt": "MF", "name": "MF", "image": "/millings/MF.png", "price": "64"}, {"en": "AF", "lt": "AF", "name": "AF", "image": "/millings/AF.png", "price": "64"}, {"en": "AR", "lt": "AR", "name": "AR", "image": "/millings/AR.png", "price": "64"}, {"en": "MF with baguettes", "lt": "MF su bagetėmis", "name": "MF with baguettes", "image": "/millings/MF_baguettes.png", "price": "178"}, {"en": "MF with sharp corners", "lt": "MF su aštriais kampais", "name": "MF with sharp corners", "image": "", "price": "90"}, {"en": "AF with sharp corners", "lt": "AF su aštriais kampais", "name": "AF with sharp corners", "image": "", "price": "90"}, {"en": "MF with baguettes and sharp corners", "lt": "MF su bagetėmis ir aštriais kampais", "name": "MF with baguettes and sharp corners", "image": "", "price": "205"}]', 'EDM (Ekstremaliai patvarus MDF)', 'EDM (Extreme Durable MDF)'),
('jIMeyHWCtXp532HbHTx', 'MDF laminated with PVC', '[{"en": "VF", "lt": "VF", "name": "VF", "image": "/millings/VF.png", "price": "13"}, {"en": "5F", "lt": "5F", "name": "5F", "image": "/millings/5F.png", "price": "13"}, {"en": "10F", "lt": "10F", "name": "10F", "image": "/millings/10F.png", "price": "13"}, {"en": "DF", "lt": "DF", "name": "DF", "image": "/millings/DF.png", "price": "27"}, {"en": "MF", "lt": "MF", "name": "MF", "image": "/millings/MF.png", "price": "64"}, {"en": "AF", "lt": "AF", "name": "AF", "image": "/millings/AF.png", "price": "64"}, {"en": "AR", "lt": "AR", "name": "AR", "image": "/millings/AR.png", "price": "64"}, {"en": "MF with baguettes", "lt": "MF su bagetėmis", "name": "MF with baguettes", "image": "/millings/MF_baguettes.png", "price": "178"}, {"en": "MF with sharp corners", "lt": "MF su aštriais kampais", "name": "MF with sharp corners", "image": "", "price": "90"}, {"en": "AF with sharp corners", "lt": "AF su aštriais kampais", "name": "AF with sharp corners", "image": "", "price": "90"}, {"en": "MF with baguettes and sharp corners", "lt": "MF su bagetėmis ir aštriais kampais", "name": "MF with baguettes and sharp corners", "image": "", "price": "205"}]', 'MDF laminuota PVC', 'MDF laminated with PVC');

INSERT INTO "public"."dimensionsmax" ("id", "heights") VALUES
('1000', '[{"id": 2550, "price": 559}, {"id": 2500, "price": 513}, {"id": 2450, "price": 182}, {"id": 2300, "price": 112}, {"id": 2200, "price": 67}, {"id": 2100, "price": 0}]'),
('1100', '[{"id": 2550, "price": 696}, {"id": 2500, "price": 648}, {"id": 2450, "price": 271}, {"id": 2300, "price": 210}, {"id": 2200, "price": 162}, {"id": 2100, "price": 112}]'),
('1250', '[{"id": 2550, "price": 979}, {"id": 2500, "price": 926}, {"id": 2450, "price": 401}, {"id": 2300, "price": 336}, {"id": 2200, "price": 293}, {"id": 2100, "price": 261}]');

INSERT INTO "public"."dooropenings" ("id", "image", "key", "name") VALUES
('Mwj6n7mCS4TTzRhRycRk', '/opening_types/hinge_inwards_right.png', 'hingeInwardsRight', 'Inwards right hinged door'),
('NH4NmtQCcJV90QAuEzbF', '/opening_types/hinge_outwards_left.png', 'hingeOutwardsLeft', 'Outwards left hinged door'),
('vKKNzhPvjz3E3PQWt29N', '/opening_types/hinge_outwards_right.png', 'hingeOutwardsRight', 'Outwards right hinged door'),
('yPmh8rWa1CdqDibWxCru', '/opening_types/hinge_inwards_left.png', 'hingeInwardsLeft', 'Inwards left hinged door');

INSERT INTO "public"."electricstrikes" ("id", "en", "fits", "image", "lt", "maker", "name", "price") VALUES
('26JOXJeVYHBdTaVtqej', 'Assa Solid 75 su 750 remo plokšte 12-24V DC tiesiogins / atvirkštinis', '["Bm5qkpD7nbCjmHFScoWh", "cB4AnbSAFSwF34hGsz35", "K80VJUoREU581RRRQ2QP", "hGSY9EIGpu86sVP374uT"]', '/other-accessories/strike3.png', 'Assa Solid 75 su 750 remo plokšte 12-24V DC Voltage, Direct / Reverse 6P', 'ASSA', 'Assa Solid 75 su 750 remo plokšte 12-24V DC Voltage, Direct / Reverse 6P', 199.00),
('GTreyBQYfQXxqDDVwTN', '920, fire resistance rating Et-60, with frame plate, 12-24V AC / DC voltage, Direct,10 kN', '["guFER2E4Cb67MDltNBr", "xknQ0BzKQahviFB42nQ", "Bm5qkpD7nbCjmHFScoWh", "cB4AnbSAFSwF34hGsz35", "K80VJUoREU581RRRQ2QP", "hGSY9EIGpu86sVP374uT"]', '/other-accessories/strike4.png', '920, ugniess atsparumas reitingas Et-60, su remo plokšte, 12-24V AC / DC voltage, tiesiogins, 10 kN', 'ASSA', '920, ugniess atsparumas reitingas Et-60, su remo plokšte, 12-24V AC / DC voltage, Direct,10 kN', 439.00),
('QtB7GHrPmgTkld6h4crN', '6300 Power supply 4-12V DC Voltage, Direct', '["fyAPiMd6wibaCvnGbT4", "d9rxv4dqFSqdkhrnk8T1", "uTFdrSKkIjmWgrQK6Rs", "tBhebXG9Ec3t4WxGuYev"]', '/other-accessories/strike1.png', '6300 Power supply 4-12V DC tiesiogins', 'FIAM', '6300 Power supply 4-12V DC Voltage, Direct', 74.00),
('UQLBt5ehfnBxclTW7cp1', '135E electric strike 6-12V AC/DC, Reverse action', '["fyAPiMd6wibaCvnGbT4", "NQLFXZXmBlBl7BhVDpUn", "HXcTOl6hNvS8TEXGQFP", "d9rxv4dqFSqdkhrnk8T1", "GZUZO94EdJ8V4PAZUQKF", "uTFdrSKkIjmWgrQK6Rs", "tBhebXG9Ec3t4WxGuYev"]', '/other-accessories/strike2.png', '135E elektrinė skende 6-12V AC/DC, atvirkštinio veikimo', 'Effeff', '135E electric strike 6-12V AC/DC, Reverse action', 128.00),
('ZnsLWVZow4rusKey1UTS', '910, with frame plate, (12-24V AC / DC voltage, Direct, 8 kN', '["xknQ0BzKQahviFB42nQ", "guFER2E4Cb67MDltNBr", "Bm5qkpD7nbCjmHFScoWh", "cB4AnbSAFSwF34hGsz35", "K80VJUoREU581RRRQ2QP", "hGSY9EIGpu86sVP374uT"]', '/other-accessories/strike4.png', '910, su remo plokšte, (12-24V AC / DC tiesiogins, 8 kN', 'ASSA', '910, with frame plate, (12-24V AC / DC voltage, Direct, 8 kN', 261.00),
('fv3K4F4obch603AfTVBr', '115 elektrinė skende 6-12V AC/DC tiesoginio veikimo', '["ntAPiMd6wibaCvnGbT4", "NQLFXZXmBlBl7BhVDpUn", "HXcTOl6hNvS8TEXGQFP", "d9rxv4dqFSqdkhrnk8T1", "uTFdrSKkIjmWgrQK6Rs", "tBhebXG9Ec3t4WxGuYev"]', '/other-accessories/strike2.png', '115 electric strike 6-12V AC/DC Direct action', 'Effeff', '115 electric strike 6-12V AC/DC Direct action', 95.00),
('hJuPBvethS4is4quCfUk', 'Assa 900 su remo plokšte, 12-24V DC tiesiogins / atvirkštinis 6,5 kN', '["guFER2E4Cb67MDltNBr", "xknQ0BzKQahviFB42nQ", "Bm5qkpD7nbCjmHFScoWh", "cB4AnbSAFSwF34hGsz35", "K80VJUoREU581RRRQ2QP", "hGSY9EIGpu86sVP374uT"]', '/other-accessories/strike4.png', 'Assa 900 su remo plokšte, 12-24V DC Voltage, Direct / Reverse, 6,5 kN', 'ASSA', 'Assa 900 su remo plokšte, 12-24V DC Voltage, Direct / Reverse, 6,5 kN', 217.00),
('oNOvRrFDgCK02EwSsk1', 'None', '[]', NULL, 'Nera', NULL, 'None', 0.00);

INSERT INTO "public"."exploitationconditions" ("id", "default", "en", "lt", "name", "prices") VALUES
('exterior', NULL, 'Exterior (RUUKKI)', 'Išores (RUUKKI)', 'Exterior (RUUKKI)', '{"double_leaf": {"name": "All metal construction - from galvanized RUUKKI metal for double-leaf door", "price": 146}, "single_leaf": {"name": "All metal construction - from galvanized RUUKKI metal for one-leaved door", "price": 73}}'),
('interior', 't', 'Interior', 'Vidaus', 'Interior', NULL);

INSERT INTO "public"."extracylinders" ("id", "en", "fits", "group", "image", "lt", "make", "name", "price") VALUES
('4JKgQeJVILoR6QAwsNjy7', 'None', '["classic", "max"]', 'a', NULL, 'Nera', NULL, 'None', 0.00),
('5vRNLkmxtWLZm2PofP4l', 'EPS 40/45 mm (5 keys) Danish key profile, key/twister', '["classic"]', NULL, '/cylinders/danish_key.png', 'EPS 40/45 mm (5 raktai) Danisko profilio raktas, key/twister', 'EVVA', 'EPS 40/45 mm (5 keys) Danish key profile, key/twister', 55.00),
('7ILGqZ26Lr72MTTUClap', 'R6 eurocylinder DIN 40x45 (1+5 keys) key/key', '["classic"]', NULL, '/cylinders/iseo_key_key.png', 'R6 eurocilindrás DIN 40x45 (1+5 raktai) raktas/raktas', 'ISEO', 'R6 eurocylinder DIN 40x45 (1+5 keys) key/key', 24.00),
('7WTyuecZ3ACgaigA6NRr', 'DIN 41x rod eurocylinder, (5 keys), key/twister', '["classic"]', NULL, '/champions_pro/champions_pro_key_twister.png', 'DIN 41x rod eurocilindrás, (5 raktai), raktas/suktukas', 'CHAMPIONS PRO', 'DIN 41x rod eurocylinder, (5 keys), key/twister', 100.00),
('9zAOVciS8DIQKP66JF8R', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/key', '["classic"]', NULL, '/mti/mti_key_key.png', 'Interactive" DIN 40x45 eurocilindrás, 115S 1+3+1, (5 raktai), raktas/raktas', 'Mul-T-Lock', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/key', 78.00),
('D5ytztPvJSv43EfnGpa8', 'Customer cylinder', '["classic", "max"]', 'b', NULL, 'Kliento cilindrás', NULL, 'Customer cylinder', 0.00),
('Errma3brRSXIKPDlCjY', 'DIN 102 eurocylinder, (5 keys), key/twister', '["max"]', NULL, NULL, 'DIN 102 eurocilindrás, (5 raktai), raktas/suktukas', 'CHAMPIONS PRO', 'DIN 102 eurocylinder, (5 keys), key/twister', 102.00),
('SlJlK3ReRjQv267LJYe0', 'R6 eurocylinder DIN 40x rod(1+5 keys) key/twister', '["classic"]', NULL, '/cylinders/iseo_key_twister.png', 'R6 eurocilindrás DIN 40x rod(1+5 raktai) raktas/suktukas', 'ISEO', 'R6 eurocylinder DIN 40x rod(1+5 keys) key/twister', 41.00),
('jnlahaT57SWERtv7OMWY', 'DIN 102 eurocylinder, (5 keys), key/key', '["max"]', NULL, NULL, 'DIN 102 eurocilindrás, (5 raktai), raktas/raktas', 'CHAMPIONS PRO', 'DIN 102 eurocylinder, (5 keys), key/key', 87.00),
('krPPp1QBszBzegKEG3dC', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/key', '["max"]', NULL, NULL, 'Interactive" DIN 100 eurocilindrás 115S 1+3+1, (5 raktai), raktas/raktas', 'Mul-T-Lock', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/key', 87.00),
('reqo0lllFecXl6eOwm5', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/twister', '["max"]', NULL, NULL, 'Interactive" DIN 100 eurocilindrás, 115S 1+3+1, (5 keys), raktas/suktukas', 'Mul-T-Lock', 'Interactive" DIN 100 eurocylinder, 115S 1+3+1, (5 keys), key/twister', 104.00),
('uanJaEVaRpdyeTbupYQX', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/twister', '["classic"]', NULL, '/mti/mti_key_twister.png', 'Interactive" DIN 40x45 eurocilindrás, 115S 1+3+1, (5 raktai), raktas/suktukas', 'Mul-T-Lock', 'Interactive" DIN 40x45 eurocylinder, 115S 1+3+1, (5 keys), key/twister', 95.00),
('vZDgGhRoedcuBcTTQPuQ', 'DIN 41x46 eurocylinder, (5 keys), key/key', '["classic"]', NULL, '/champions_pro/champions_pro_key_key.png', 'DIN 41x46 eurocilindrás, (5 raktai), raktas/raktas', 'CHAMPIONS PRO', 'DIN 41x46 eurocylinder, (5 keys), key/key', 83.00);

INSERT INTO "public"."extralocks" ("id", "door_model", "en", "image", "locking_directions", "lt", "maker", "name", "price", "security_class", "template") VALUES
('33BIVEQMIV78rfIphXQ', '["classic", "fe5"]', 'CAMBIO 57675 (1+5 keys) chrome', '/extra_locks/CAMBIO_57675.png', '1', 'CAMBIO 57675 (1+5 raktai) chromas', 'CISA', 'CAMBIO 57675 (1+5 keys) chrome', 68.00, '4', NULL),
('8wbKlA8XUibcdYNqXHZl', '["max", "fe15"]', '85783, with DEFENDER, without cylinder, mat. chrome or mat brass', '/extra_locks/mottura_85783.png', '3', '85783, su DEFENDER, be cilindro, matinis chromas arba matinis žalvaris', 'MOTTURA', '85783, with DEFENDER, without cylinder, mat. chrome or mat brass', 59.00, '7', NULL),
('BM40rnt8aPqty4TULWlWX', '["max", "fe15"]', '672 GF, without DEFENDER, without cylinder mat. chrome or mat brass', '/extra_locks/fiam_672.png', '3', '672 GF, su DEFENDER, be cilindro matinis chromas arba matinis žalvaris', 'FIAM', '672 GF, without DEFENDER, without cylinder mat. chrome or mat brass', 74.00, '7', NULL),
('JwfQlDSyuWauJat1NV5', '["classic", "fe5"]', '85783, cylinder Champions, 5 keys, chrome', '/extra_locks/mottura_85783.png', '3', '85783, cilindras Champions, 5 raktai, chromas', 'MOTTURA', '85783, cylinder Champions, 5 keys, chrome', 144.00, '7', NULL),
('N4rGbD4qt0fgMcP5HvSR', '["classic", "fe5"]', '672 GF, ISEO R6 cylinder (key+key), 1+5 keys (mat. brass)', '/main_locks/FIAM_678_GF_CYL.png', '3', '672 GF, ISEO R6 cilindras (key+key), 1+5 raktai (matinis žalvaris)', 'FIAM', '672 GF, ISEO R6 cylinder (key+key), 1+5 keys (mat. brass)', 95.00, '5', NULL),
('OaY7ucMrCcrLbZ0tqU2w', '["max", "fe15"]', '85783, with DEFENDER, without cylinder, chrome', '/extra_locks/mottura_85783.png', '3', '85783, su DEFENDER, be cilindro, chromas', 'MOTTURA', '85783, with DEFENDER, without cylinder, chrome', 87.00, '7', NULL),
('P5ycS2NT4UiKRpjBLvRG', '["classic", "fe5"]', '672 GF, ISEO R6 cylinder (key+key), 1+5 keys, chrome', '/extra_locks/iseo_r6.png', '3', '672 GF, ISEO R6 cilindras (raktas+raktas), 1+5 raktai, chromas', 'FIAM', '672 GF, ISEO R6 cylinder (key+key), 1+5 keys, chrome', 83.00, '5', NULL),
('PNivuAS9EmSi9VHEzTel', '["classic", "max", "fe5", "fe15"]', '8788, cylinder 1302 (key+key), 3 keys, chrome', '/extra_locks/assa_8788.png', '1', '8788, cilindras 1302 (raktas+raktas), 3 raktai, chromas', 'ASSA', '8788, cylinder 1302 (key+key), 3 keys, chrome', 85.00, '3', NULL),
('Ta86amaCSwefwe0XiLlA', '["classic", "fe5"]', 'CFMA 0328 (1+3+1 patented keys), chrome', '/extra_locks/CFMA_0328.png', '3', 'CFMA 0328 (1+3+1 patentuoti raktai), chromas', 'MUL-T-LOCK', 'CFMA 0328 (1+3+1 patented keys), chrome', 110.00, '7', NULL),
('UT6NmUcBC1gkmc1e4Ox1', '["classic", "fe5"]', '502, oval cyl. Dorma su03 with twister, 5 patented keys, chrome', '/extra_locks/doorma_502.png', '1', '502, ovalus cil. Dorma su03 su suktuvu, 5 patentuoti raktai, chromas', 'DORMA', '502, oval cyl. Dorma su03 with twister, 5 patented keys, chrome', 36.00, '2', NULL),
('V8WyxJJFZDvKPRXqfBwX', '["classic", "max", "fe5", "fe15"]', '52783, 5 keys, chrome', '/extra_locks/mottura_52783.png', '3', '52783, 5 raktai, chromas', 'MOTTURA', '52783, 5 keys, chrome', 56.00, '7', NULL),
('XXPegg7BVDZyG4vJggXs', '["classic", "fe5"]', '672 GF, ISEO R6 cylinder (key+key), 1+5 keys (mat. chrome)', '/extra_locks/iseo_r6.png', '3', '672 GF, ISEO R6 cilindras (raktas+raktas), 1+5 raktai matinis chromas', 'FIAM', '672 GF, ISEO R6 cylinder (key+key), 1+5 keys (mat. chrome)', 95.00, '5', NULL),
('ZxtMZpguE16VU5GxqxW3', '["max", "fe15"]', '672 GF, with DEFENDER, without cylinder, chrome', '/extra_locks/fiam_672.png', '3', '672 GF, su DEFENDER, be cilindro chromas', 'FIAM', '672 GF, with DEFENDER, without cylinder, chrome', 63.00, '7', NULL),
('mmvPtMdGN243ErqqbSW5', '["EL578", "classic", "max", "fe5", "fe15"]', 'Only drilling to Abloy lock EL578 motor lock, without cylinder, without lock. Distance of Abloy from the top edge of the door should be 400 mm, as described in the drawing below', NULL, NULL, 'Tik gręžimas į Abloy spyną EL578 motorinis užraktas, be cilindro, be spynos. Abloy atstumas nuo viršutinio durų krašto turėtų būti 400 mm, kaip aprašyta brėžinyje', NULL, 'Only drilling to Abloy lock EL578 motor lock, without cylinder, without lock. Distance of Abloy from the top edge of the door should be 400 mm, as described in the drawing below', 25.00, NULL, 'true'),
('tQSyayf3wHPvbkEmycu', '["classic", "fe5"]', '85783, cylinder Champions, 5 keys, Mat. chrome or mat brass', '/extra_locks/mottura_85783.png', '3', '85783, cilindras Champions, 5 keys, matinis chromas arba matinis žalvaris', 'MOTTURA', '85783, cylinder Champions, 5 keys, Mat. chrome or mat brass', 157.00, '7', NULL),
('xMmjjHbjpKKrCvdTggrN', '["classic", "fe5"]', 'CFMA 0328 (1+3+1 patented keys), mat. chrome', '/extra_locks/CFMA_0328.png', '3', 'CFMA 0328 (1+3+1 patentuoti raktai), matinis chromas', 'MUL-T-LOCK', 'CFMA 0328 (1+3+1 patented keys), mat. chrome', 128.00, '6', NULL);

INSERT INTO "public"."glassaddontypes" ("id", "en", "lt", "name") VALUES
('GLASS_ADDON_TYPE_2', 'Normal', 'Normalus', 'Normal'),
('GLASS_ADDON_TYPE_3', 'Bulletproof/anti-vandal', 'Neperšaunamas/anti-vandalinis', 'Bulletproof/anti-vandal'),
('GLASS_ADDON_TYPE_4', 'Thick', 'Storas', 'Thick');

INSERT INTO "public"."thresholds" ("id", "door_type", "en", "group", "image", "lt", "name", "options", "order", "price") VALUES
('4ZFcEVwLRSktWmvNBJGc', '["classic", "fe5"]', 'Oak 20x35x100 L shape', 'oak', '/thresholds/classic20x35x100.png', 'Oak 20x35x100 L formos', 'Oak 20x35x100 L shape', NULL, 2, 35.00),
('6RmrXdufPySbiHxs9gEp', '["max", "fe15"]', 'Stainless steel 15x20x100 (sloping)', 'ss', '/thresholds/max15x20x100.png', 'Nerūdijančio plieno 15x20x100 (su nuolydžiu)', 'Stainless steel 15x20x100 (sloping)', NULL, 3, 16.00),
('9SRbZayHWDHpqYeAm6Er', '["max", "fe15"]', 'Stainless steel 24x39x115 L shape', 'ss', '/thresholds/max24x39x115.png', 'Nerūdijančio plieno 24x39x115 L formos', 'Stainless steel 24x39x115 L shape', NULL, 2, 16.00),
('AyUH7TYzxJZpUz4uK8ll', '["classic", "fe5"]', 'Oak 20x100', 'oak', '/thresholds/classic20x100.png', 'Ąžuolas 20x100', 'Oak 20x100', NULL, 1, 23.00),
('LSbDAGvNbrgzE5gCkJrG', '["max", "fe15"]', 'Oak 24x39x115 L shape', 'oak', '/thresholds/max24x39x115.png', 'Ąžuolas 24x39x115 L formos', 'Oak 24x39x115 L shape', NULL, 2, 35.00),
('VDHc49PiVWqTFs8kOcy', '["max", "fe15"]', 'Oak 24x115', 'oak', '/thresholds/max24x115.png', 'Ąžuolas 24x115', 'Oak 24x115', NULL, 1, 23.00),
('WHd520b6xMkKmeBwdqZW', '["max", "fe15"]', 'Oak 24x115 (sloping)', 'oak', '/thresholds/max24x39x115.png', 'Ąžuolas 24x115 (su nuolydžiu)', 'Oak 24x115 (sloping)', NULL, 3, 35.00),
('k1bhtbb6lQ9JM3Xarlk', '["classic", "fe5"]', 'Stainless steel 15x20x100 (sloping)', 'ss', '/thresholds/classic15x20x100.png', 'Nerūdijančio plieno 15x20x100 (su nuolydžiu)', 'Stainless steel 15x20x100 (sloping)', NULL, 3, 16.00),
('pDNuLv5I6TqV7f5aQp8S', '["classic", "fe5"]', 'Stainless steel 20x35x100 L shape', 'ss', '/thresholds/classic20x35x100.png', 'Nerūdijančio plieno 20x35x100 L formos', 'Stainless steel 20x35x100 L shape', NULL, 2, 16.00),
('sqUo4tcVPyurU9J5yJF', NULL, 'None', 'x', NULL, 'Nera', 'None', '[{"en": "Down sliding door seal for single-leaf door", "lt": "Žemyn slankiojantis kištukas vienvyrėm durims", "_id": "1", "name": "Down sliding door seal for single-leaf door", "image": "/other_accessories/door-lock.png", "price": "96", "alt_price": "193", "double_leaf_en": "Down sliding door seal for double-leaf door", "double_leaf_lt": "Žemyn slankiojantis kištukas dvivyrėm durims", "has_double_leaf": true, "double_leaf_name": "Down sliding door seal for double-leaf door", "double_leaf_price": "193"}, {"en": "No lock pin into the bottom", "lt": "Jokio kištuko apačioje", "_id": "2", "name": "No lock pin into the bottom", "price": "0", "alt_price": "0"}, {"en": "Bolt into the floor, sleeve for bolt supplied by client", "lt": "Varžtas į grindis, rankovė kliento", "_id": "3", "name": "Bolt into the floor, sleeve for bolt supplied by client", "price": 0, "alt_price": 0}]', NULL, 0.00),
('tVB3uG6wkL573h8Qq7k', '["classic", "fe5"]', 'Oak 15x20x100 (sloping)', 'oak', '/thresholds/classic15x20x100.png', 'Ąžuolas 15x20x100 (su nuolydžiu)', 'Oak 15x20x100 (sloping)', NULL, 3, 35.00),
('um9htMuFbWmRrYjxjSBl', '["classic", "fe5"]', 'Stainless steel 20x100', 'ss', '/thresholds/classic20x100.png', 'Nerūdijančio plieno 20x100', 'Stainless steel 20x100', NULL, 1, 16.00),
('zNsMrYySn0pbcNPfktu', '["max", "fe15"]', 'Stainless steel 24x115', 'ss', '/thresholds/max24x115.png', 'Nerūdijančio plieno 24x115', 'Stainless steel 24x115', NULL, 1, 16.00);

INSERT INTO "public"."carvings" ("id", "glazings", "image", "name", "custom_glazings", "en", "lt", "order", "default") VALUES
('00bBRWnPMMrG8ZFxc5', '["G2", "G3", "G2", "G2"]', '/carvings/c123.png', 'C123', NULL, NULL, NULL, NULL, NULL),
('07TTIPGYJ6qbvPvm880', '["G2", "G1", "G1", "G1", "G1", "G1", "G3", "G3"]', '/carvings/c129.png', 'C129', NULL, NULL, NULL, NULL, NULL),
('0CQUMbYZJRWSH8aTUGz', '["G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c60.png', 'C60', NULL, NULL, NULL, NULL, NULL),
('0KGuZvUkXDhkqQ4GuW', '["G2", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c69.png', 'C69', NULL, NULL, NULL, NULL, NULL),
('0OmvQBnFGU2sqNktlw', '[]', '/carvings/c206.png', 'C206', NULL, NULL, NULL, NULL, NULL),
('0WOPFu3XFqWbohnTTdp', '["G9"]', '/carvings/c72.png', 'C72', NULL, NULL, NULL, NULL, NULL),
('0pqfVWxh3PFzqCiDSMy', '["G4", "G4", "G4"]', '/carvings/c133.png', 'C133', NULL, NULL, NULL, NULL, NULL),
('10V2QMhBi6SoENl0Qa4', '[]', '/carvings/c198.png', 'C198', NULL, NULL, NULL, NULL, NULL),
('13eNe8ucVksMcYpXq80h', '[]', '/carvings/c128.png', 'C128', NULL, NULL, NULL, NULL, NULL),
('1WiCYQFgvP8x83pezd72', '["G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c48.png', 'C48', NULL, NULL, NULL, NULL, NULL),
('2KzqGUDMOH0xmBBVndTV', '["G9", "G2", "G2"]', '/carvings/c75.png', 'C75', NULL, NULL, NULL, NULL, NULL),
('2Sam5Qg8ni4BFCuJxyJJ', '["G3", "G1", "G3"]', '/carvings/c4.png', 'C4', NULL, NULL, NULL, NULL, NULL),
('2fanISQYTVspjlK5SQnG', '["2", "1", "2"]', '/carvings/c113.png', 'C113', NULL, NULL, NULL, NULL, NULL),
('2pUqqHcRNMXUDf949B', '[]', '/carvings/c194.png', 'C194', NULL, NULL, NULL, NULL, NULL),
('3TfPqhXZ69ZMFaN9fdmp', '["G6", "G2", "G2"]', '/carvings/c33.png', 'C33', NULL, NULL, NULL, NULL, NULL),
('46k8LmayZlqITZzhVE', '["G2", "G2", "G2"]', '/carvings/c53.png', 'C53', NULL, NULL, NULL, NULL, NULL),
('4ATLTPd4x8e8TIVQF6v', '["G3"]', '/carvings/c90.png', 'C90', NULL, NULL, NULL, NULL, NULL),
('4XLUXSN10bTXDwr2rwHr', '[]', '/carvings/c126.png', 'C126', NULL, NULL, NULL, NULL, NULL),
('59RQtsLktIPQFSECUd', '["G3"]', '/carvings/c89.png', 'C89', NULL, NULL, NULL, NULL, NULL),
('5ieKXbhkaNWo0A3kcgfcY', '["G1", "G1", "G1", "G1"]', '/carvings/c23.png', 'C23', NULL, NULL, NULL, NULL, NULL),
('5s0TBhkTZ5hVQ2DbxJ', '[]', '/carvings/c136.png', 'C136', NULL, NULL, NULL, NULL, NULL),
('6AWGNfu7ppJquevFEZZ', '["G3", "G1"]', '/carvings/c144.png', 'C144', NULL, NULL, NULL, NULL, NULL),
('6TTL7Se3kqFpfxLnuUb', '["G6"]', '/carvings/c41.png', 'C41', NULL, NULL, NULL, NULL, NULL),
('6bDEvjohBAE2JMIDuvmc', '[]', '/carvings/c221.png', 'C221', NULL, NULL, NULL, NULL, NULL),
('6qvFdJnhFAP3iF9KbI4y', '[]', '/carvings/c171.png', 'C171', NULL, NULL, NULL, NULL, NULL),
('6uU6FR7SARWA2gnM79P6', '[]', '/carvings/c182.png', 'C182', NULL, NULL, NULL, NULL, NULL),
('73oJarmoLs0GXAAFCW', '["G6", "G9", "G4"]', '/carvings/c105.png', 'C105', NULL, NULL, NULL, NULL, NULL),
('7ZysKGSwbhoqqsbrAab', '["G1", "G1", "G1"]', '/carvings/c112.png', 'C112', NULL, NULL, NULL, NULL, NULL),
('7nPWLVIfg93KEHKRZXL', '[]', '/carvings/c174.png', 'C174', NULL, NULL, NULL, NULL, NULL),
('7tVYAWENIPohxEl2Ud4Q', '[]', '/carvings/c125.png', 'C125', NULL, NULL, NULL, NULL, NULL),
('8Ekxnc5lqpBqlnanncTO', '["G10"]', '/carvings/c124.png', 'C124', NULL, NULL, NULL, NULL, NULL),
('8X6C7KSHEl7yq8KqGAct', '[]', '/carvings/c147.png', 'C147', NULL, NULL, NULL, NULL, NULL),
('8X9KPpKekv1sKYGpcULw', '["G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c31.png', 'C31', NULL, NULL, NULL, NULL, NULL),
('8ZDOymlAt9khsNVSnSr9', '[]', '/carvings/c179.png', 'C179', NULL, NULL, NULL, NULL, NULL),
('8hlRRldWhbTmPxO94s7', '["G2"]', '/carvings/c165.png', 'C165', NULL, NULL, NULL, NULL, NULL),
('8hsXKHsZ6eVpswm2b4', '["G1", "G9"]', '/carvings/c208.png', 'C208', NULL, NULL, NULL, NULL, NULL),
('8ps5QZPerMWcRTZ33EMN', '["G1", "G1"]', '/carvings/c130.png', 'C130', NULL, NULL, NULL, NULL, NULL),
('8vyJUSdee9fYfcwHreA', '["G6", "G9", "G2", "G6"]', '/carvings/c185.png', 'C185', NULL, NULL, NULL, NULL, NULL),
('9BCE545hf5qBMASEil', '["G3"]', '/carvings/c71.png', 'C71', NULL, NULL, NULL, NULL, NULL),
('A57Vsg5z7Tu8ouJ8K6np', '["G1", "G1", "G1"]', '/carvings/c197.png', 'C197', NULL, NULL, NULL, NULL, NULL),
('A6K4bIAVD6jTfhTPHov', '["G6", "G6"]', '/carvings/c27.png', 'C27', NULL, NULL, NULL, NULL, NULL),
('B4MJZmDUENiBsMJ8HNY', '["G1", "G1", "G1", "G1"]', '/carvings/c3.png', 'C3', NULL, NULL, NULL, NULL, NULL),
('BeSKaqZTDKIt6SAAGEz', '["G8", "G1"]', '/carvings/c12.png', 'C12', NULL, NULL, NULL, NULL, NULL),
('CX0f6LXrnemhTTRKGlcw', '["G3"]', '/carvings/c65.png', 'C65', NULL, NULL, NULL, NULL, NULL),
('CcEpkZZxM5FKDVNxOF2S', '["G4", "G2", "G2", "G2"]', '/carvings/c150.png', 'C150', NULL, NULL, NULL, NULL, NULL),
('CpNdahM347lK77hBqeaP', '["G1"]', '/carvings/c117.png', 'C117', NULL, NULL, NULL, NULL, NULL),
('CvFKgqNTQuyeyKXs2xau', '["G2"]', '/carvings/c177.png', 'C177', NULL, NULL, NULL, NULL, NULL),
('CxFfrneqAPkWoCM1QPXN', '["G2", "G2", "G1", "G1", "G1", "G1"]', '/carvings/c25.png', 'C25', NULL, NULL, NULL, NULL, NULL),
('DoS59hVoF785VEKpXT', '["G4", "G1"]', '/carvings/c213.png', 'C213', NULL, NULL, NULL, NULL, NULL),
('DqQlb8IE8hxDd5OHTy', '["G9", "G2"]', '/carvings/c82.png', 'C82', NULL, NULL, NULL, NULL, NULL),
('E96KGaLh8sLdlKduBs3', '["G2", "G1"]', '/carvings/c61.png', 'C61', NULL, NULL, NULL, NULL, NULL),
('EE1eBn0OtAZFpzshrJJl', '[]', '/carvings/c140.png', 'C140', NULL, NULL, NULL, NULL, NULL),
('EMJxBWsU59NzTWJcpX3', '["G8"]', '/carvings/c62.png', 'C62', NULL, NULL, NULL, NULL, NULL),
('ET8UNWVLKGHp76hjxjUVW', '["G6", "G2", "G2"]', '/carvings/c35.png', 'C35', NULL, NULL, NULL, NULL, NULL),
('EzPqVoFRw8bhfLBob42', '["G6", "G6"]', '/carvings/c8.png', 'C8', NULL, NULL, NULL, NULL, NULL),
('F698045cmTgfG744jd2', '[]', '/carvings/c192.png', 'C192', NULL, NULL, NULL, NULL, NULL),
('F8y4YEijQCHI06KmUfG', '["G1", "G1", "G1", "G1"]', '/carvings/c169.png', 'C169', NULL, NULL, NULL, NULL, NULL),
('FI6xG9mThwrxZLB8HAMx', '["G2", "G1", "G3"]', '/carvings/c156.png', 'C156', NULL, NULL, NULL, NULL, NULL),
('FYPYShMarFJE1lsKFW1M', '[]', '/carvings/c87.png', 'C87', NULL, NULL, NULL, NULL, NULL),
('FrnK7vpPJvp8ll0NGctK', '["G2", "G2", "G9", "G2", "G2", "G1", "G1"]', '/carvings/c186.png', 'C186', NULL, NULL, NULL, NULL, NULL),
('GMPRpdRKR1vdiSvxTDs2k', '["3"]', '/carvings/c88.png', 'C88', NULL, NULL, NULL, NULL, NULL),
('GVCHL7APRC36ULQX1lJp', '["G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c26.png', 'C26', NULL, NULL, NULL, NULL, NULL),
('GWIqnGQK7Lx7IMrtJokro', '["G3"]', '/carvings/c74.png', 'C74', NULL, NULL, NULL, NULL, NULL),
('GeFHHn0Ugxp2C4esl0GJr', '["G7"]', '/carvings/c1.png', 'C1', NULL, NULL, NULL, NULL, NULL),
('GpRpwKjpZ5qbJeCiGee', '["G1", "G1", "G1", "G1"]', '/carvings/c115.png', 'C115', NULL, NULL, NULL, NULL, NULL),
('GwDjhkLl8qetGlGWVC6uk', '["G2"]', '/carvings/c204.png', 'C204', NULL, NULL, NULL, NULL, NULL),
('H8rQ7GYvETa5xdNnM7F4', '[]', '/carvings/c187.png', 'C187', NULL, NULL, NULL, NULL, NULL),
('I2bHnZAdQR4gG33DNN', '["G2"]', '/carvings/c188.png', 'C188', NULL, NULL, NULL, NULL, NULL),
('IARFyagzGFTGVVieKTR7', '["G10", "G9"]', '/carvings/c181.png', 'C181', NULL, NULL, NULL, NULL, NULL),
('IDcT2NmfDVqhPrh6cxkB9', '["G2", "G1", "G1"]', '/carvings/c211.png', 'C211', NULL, NULL, NULL, NULL, NULL),
('ITaFqEeuqAgxK3ExTv1', '[]', '/carvings/c200.png', 'C200', NULL, NULL, NULL, NULL, NULL),
('IsmwKDuqVkmBsAP4VD', '["G9"]', '/carvings/c167.png', 'C167', NULL, NULL, NULL, NULL, NULL),
('JD3uBMEqQDVWoZXsFi', '[]', '/carvings/c78.png', 'C78', NULL, NULL, NULL, NULL, NULL),
('JcCfg6jEnTmZAnO5rT', '["G5", "G1", "G1", "G1", "G1"]', '/carvings/c14.png', 'C14', NULL, NULL, NULL, NULL, NULL),
('JzCmBzYxzEniIzN1jcfH', '["G1", "G1", "G1", "G1", "G1"]', '/carvings/c168.png', 'C168', NULL, NULL, NULL, NULL, NULL),
('K0A0TxYMcMSnN3XvSjpz', '["G4", "G4", "G4", "G4", "G4", "G4"]', '/carvings/c54.png', 'C54', NULL, NULL, NULL, NULL, NULL),
('K4aC4MJGq3qNRU8wEfrp', '["G3"]', '/carvings/c89.png', 'C89', NULL, NULL, NULL, NULL, NULL),
('K7I1zlm5LwQFFSNYKNq7', '["G5", "G5"]', '/carvings/c37.png', 'C37', NULL, NULL, NULL, NULL, NULL),
('KHr2vrZzRDdiljnmSKWh', '["G2", "G2", "G1", "G1", "G2", "G2", "G2", "G2", "G1", "G1"]', '/carvings/c17.png', 'C17', NULL, NULL, NULL, NULL, NULL),
('KTp3NDo0U6U7UO74lkDD', '["G1", "G1", "G1", "G1"]', '/carvings/c170.png', 'C170', NULL, NULL, NULL, '', NULL),
('KU3cHvLmBLNsxQYfGaQ', '["C4", "C4", "G2", "G2"]', '/carvings/c24.png', 'C24', NULL, NULL, NULL, '', NULL),
('KZsKEYDullmlAxqzJINs', '[]', '/carvings/c168.png', 'C168', NULL, NULL, NULL, '', NULL),
('KkEtdrY1WzZACQzdoLyp', '[]', '/carvings/c110.png', 'C110', NULL, NULL, NULL, NULL, NULL),
('KmvbzAp0nkdAPtxe5PQE', '["G8"]', '/carvings/c65.png', 'C65', NULL, NULL, NULL, NULL, NULL),
('Kq3DpctkGnZ4Pa47ZjbX', '["G1"]', '/carvings/c146.png', 'C146', NULL, NULL, NULL, NULL, NULL),
('Kya7TDhNnsaZoqVUqSD', '[]', '/carvings/c81.png', 'C81', NULL, NULL, NULL, '', NULL),
('L19TfN8xj7Ssg9pVZpZp', '["G9"]', '/carvings/c61.png', 'C61', NULL, NULL, NULL, NULL, NULL),
('L6aAb0F5dWZpOIC4qz8X', '[]', '/carvings/c97.png', 'C97', NULL, NULL, NULL, NULL, NULL),
('Lk6tU6imR1lpN6E5nZmv', '["G5"]', '/carvings/c28.png', 'C28', NULL, NULL, NULL, NULL, NULL),
('LnscQX41ELV2HRm4BBCO', '["G5", "G5"]', '/carvings/c56.png', 'C56', NULL, NULL, NULL, '', NULL),
('Lr0wC7JovJXe3rFskkY7', '["G1"]', '/carvings/c30.png', 'C30', NULL, NULL, NULL, NULL, NULL),
('M1j5oQPtZhxAlzskFxjc', '["G6"]', '/carvings/c51.png', 'C51', NULL, NULL, NULL, NULL, NULL),
('M9Zb6Z2zYkD5ZC9lxHnc', '["G2"]', '/carvings/c187.png', 'C187', NULL, NULL, NULL, NULL, NULL),
('MBHqxxqJeOH4dHIYS8E', '[]', '/carvings/c157.png', 'C157', NULL, NULL, NULL, '', NULL),
('MCMuY2XTXBdCU6Qt6K7F', '["G4"]', '/carvings/c33.png', 'C33', NULL, NULL, NULL, NULL, NULL),
('MI576bkl4mHznYaXSda', '["G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c30.png', 'C30', NULL, NULL, NULL, '', NULL),
('MJq6UjGyAdkFE8SnpbmK', '["G1", "G1", "G1"]', '/carvings/c22.png', 'C22', NULL, NULL, NULL, NULL, NULL),
('MSfGl6qKJlONgySr7ltl', '["C6", "C6"]', '/carvings/c18.png', 'C18', NULL, NULL, NULL, '', NULL),
('MZnF6xEpV4uHjCVQZ0Ex', '["G2"]', '/carvings/c175.png', 'C175', NULL, NULL, NULL, NULL, NULL),
('McgM9zli6jPvM1lQ1cBB', '["G1"]', '/carvings/c90.png', 'C90', NULL, NULL, NULL, NULL, NULL),
('Mghw2u7XvTt5vJpNxtO9', '["G6"]', '/carvings/c131.png', 'C131', NULL, NULL, NULL, NULL, NULL),
('MiqKbblnYZDyfIKdKVGw', '["G2", "G2", "G2"]', '/carvings/c216.png', 'C216', NULL, NULL, NULL, '', NULL),
('N4yplQdStKkGmDzVQtYl', '["G1", "G1"]', '/carvings/c18.png', 'C18', NULL, NULL, NULL, NULL, NULL),
('N64TnQI2sZRRBKyKMLJ', '["G1", "G1"]', '/carvings/c131.png', 'C131', NULL, NULL, NULL, '', NULL),
('N8xn5yTSB0Pa5nZjOTrh', '["G3"]', '/carvings/c139.png', 'C139', NULL, NULL, NULL, NULL, NULL),
('NC0p1uP8xjQ4oJcYpEjc', '["G9"]', '/carvings/c67.png', 'C67', NULL, NULL, NULL, NULL, NULL),
('NEpRmriZ7ZwU6f9RppJq', '["G1", "G2"]', '/carvings/c182.png', 'C182', NULL, NULL, NULL, NULL, NULL),
('NJZehzSZqCQa8FJtqHZ', '["C4", "G1", "G1"]', '/carvings/c119.png', 'C119', NULL, NULL, NULL, '', NULL),
('NQvM8cEdP3f7dPLtTxYy', '["G1"]', '/carvings/c102.png', 'C102', NULL, NULL, NULL, NULL, NULL),
('NYoK7r6Gqj3oWmfsRclu', '["G8"]', '/carvings/c47.png', 'C47', NULL, NULL, NULL, NULL, NULL),
('NaCm3TgGpWxvNf4k1hF3', '[]', '/carvings/c95.png', 'C95', NULL, NULL, NULL, NULL, NULL),
('NgZQiiPpQ0eGpQIvRtbbK', '[]', '/carvings/custom.png', 'Pagal užsakymą', 't', 'Custom', NULL, 'Custom', NULL),
('NkLxE5lVhrP5aHc2eY2D', '["G1", "G1"]', '/carvings/c203.png', 'C203', NULL, NULL, NULL, NULL, NULL),
('NrPv1cXq7BdZC0fM2wTq', '["G1"]', '/carvings/c160.png', 'C160', NULL, NULL, NULL, NULL, NULL),
('NsKGAQaqNoCFWKEmJZlo', '["G1", "G1", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c145.png', 'C145', NULL, NULL, NULL, '', NULL),
('Nv7fQ3vJcM8KfJ4LQj8n', '["G3"]', '/carvings/c212.png', 'C212', NULL, NULL, NULL, NULL, NULL),
('O1g6tZpDqXbQv7sNf8qJ', '["G2"]', '/carvings/c170.png', 'C170', NULL, NULL, NULL, NULL, NULL),
('O4uJ6nFcq0rN2yH1x8Wv', '["G5"]', '/carvings/c24.png', 'C24', NULL, NULL, NULL, NULL, NULL),
('O6a1B7hTnFTQbo9MbHXf9', '["G2", "G2", "G3", "G4", "G5", "G1"]', '/carvings/c54.png', 'C54', NULL, NULL, NULL, '', NULL),
('O8D1DDTcJqVnSGV44oc3', '[]', '/carvings/c139.png', 'C139', NULL, NULL, NULL, '', NULL),
('O8bN9fG6yHjQ7vHcRkDj', '["G1", "G1"]', '/carvings/c142.png', 'C142', NULL, NULL, NULL, NULL, NULL),
('OGNuvvWKZsplbZ9h6abu', '["C6", "G3"]', '/carvings/c116.png', 'C116', NULL, NULL, NULL, '', NULL),
('OK2m7VgLxJpZs9nQx7cM', '["G2"]', '/carvings/c174.png', 'C174', NULL, NULL, NULL, NULL, NULL),
('OLZTNfmr3SzzU4Az3oWd', '["G6", "G2", "G2", "G1", "G1"]', '/carvings/c70.png', 'C70', NULL, NULL, NULL, '', NULL),
('OQ4xJ8nKv3bP6mZjYp9X', '["G1"]', '/carvings/c206.png', 'C206', NULL, NULL, NULL, NULL, NULL),
('OYiQ7bM8jPcLzvB9kMnX', '["G4"]', '/carvings/c41.png', 'C41', NULL, NULL, NULL, NULL, NULL),
('OfFq9jYcQj5nKtR2xFpL', '["G3"]', '/carvings/c211.png', 'C211', NULL, NULL, NULL, NULL, NULL),
('OrkN9fP0aWmS4xNf3pPj', '["G1", "G1", "G1"]', '/carvings/c12.png', 'C12', NULL, NULL, NULL, NULL, NULL),
('OuGmb1l3nWNZ4TqSsAY', '["G1", "G1", "G1"]', '/carvings/c19.png', 'C19', NULL, NULL, NULL, '', NULL),
('OzVq7sXj4nXyM9rKp0Wl', '["G2"]', '/carvings/c180.png', 'C180', NULL, NULL, NULL, NULL, NULL),
('P3zB1yQjD0fQvHcLwE9t', '["G5"]', '/carvings/c36.png', 'C36', NULL, NULL, NULL, NULL, NULL),
('P7nF4cJrS9zYqB2tLf0s', '["G1"]', '/carvings/c155.png', 'C155', NULL, NULL, NULL, NULL, NULL),
('P8LBNqLu6ogQGk2hMZ7', '["C4", "C4", "C4", "C4"]', '/carvings/c15.png', 'C15', NULL, NULL, NULL, '', NULL),
('P9bM6vG7zXnQ8pHjCqJc', '["G4", "G4", "G4"]', '/carvings/c32.png', 'C32', NULL, NULL, NULL, NULL, NULL),
('PBvT8xQyZ1nS4pNmJr9L', '["G1"]', '/carvings/c84.png', 'C84', NULL, NULL, NULL, NULL, NULL),
('PJfM1zXnR9qD2vKjLh3c', '["G4", "G4"]', '/carvings/c40.png', 'C40', NULL, NULL, NULL, NULL, NULL),
('PS1nAaoJKJEJaopb4v6', '[]', '/carvings/c207.png', 'C207', NULL, NULL, NULL, '', NULL),
('PZjK7cLxQ0oM2dHnWb6v', '["G4"]', '/carvings/c43.png', 'C43', NULL, NULL, NULL, NULL, NULL),
('PgKc7nTmQ1aZ4mWb3v9l', '["G1", "G1", "G1", "G1"]', '/carvings/c15.png', 'C15', NULL, NULL, NULL, NULL, NULL),
('PrbM9zTqQ5lS7nXjYk0p', '["G2"]', '/carvings/c179.png', 'C179', NULL, NULL, NULL, NULL, NULL),
('PwLx2sCvT6mF4bXnLq7z', '["G9"]', '/carvings/c64.png', 'C64', NULL, NULL, NULL, NULL, NULL),
('Q4bM1cDqW7pN8rXjLk5s', '["G1"]', '/carvings/c85.png', 'C85', NULL, NULL, NULL, NULL, NULL),
('Q7nX2cLqP4mZ6vWb1h8t', '["G1", "G1", "G1", "G1"]', '/carvings/c13.png', 'C13', NULL, NULL, NULL, NULL, NULL),
('QCpF9zDnW8rL7mXjNk2s', '["G6"]', '/carvings/c59.png', 'C59', NULL, NULL, NULL, NULL, NULL),
('QKwL6zCmV5pN3yXjMr8t', '["G2"]', '/carvings/c172.png', 'C172', NULL, NULL, NULL, NULL, NULL),
('QNkC8vLwZ3oJ1dKmQb5s', '["G8"]', '/carvings/c63.png', 'C63', NULL, NULL, NULL, NULL, NULL),
('QTpN4xCmK2pJ6yVjMr8l', '["G3"]', '/carvings/c136.png', 'C136', NULL, NULL, NULL, NULL, NULL),
('QYiJ7bMxV3cL0pNkWq9s', '["G3"]', '/carvings/c88.png', 'C88', NULL, NULL, NULL, NULL, NULL),
('QbPdELb8EvVqT4l74p', '["C9"]', '/carvings/c98.png', 'C98', NULL, NULL, NULL, '', NULL),
('QdZb7cNxW5pM1yJkLr0s', '["G7"]', '/carvings/c78.png', 'C78', NULL, NULL, NULL, NULL, NULL),
('QjNf4xKpW6oL2pNmRb8s', '["G1"]', '/carvings/c201.png', 'C201', NULL, NULL, NULL, NULL, NULL),
('QmLx2vBwZ7pN4yJkRk6s', '["G1", "G1", "G1", "G1"]', '/carvings/c14.png', 'C14', NULL, NULL, NULL, NULL, NULL),
('QpZf8xCvW9mL3yNkSj7s', '["G7"]', '/carvings/c77.png', 'C77', NULL, NULL, NULL, NULL, NULL),
('QyLk3xBwX0pN5yJmTk8s', '["G4"]', '/carvings/c39.png', 'C39', NULL, NULL, NULL, NULL, NULL),
('R4jN6cBwY1pL8yKjUl9s', '["G1"]', '/carvings/c153.png', 'C153', NULL, NULL, NULL, NULL, NULL),
('R6LAiIoCQ1m6nR9AqsF', '["G2"]', '/carvings/c93.png', 'C93', NULL, NULL, NULL, '', NULL),
('R7mX2bLqY3nJ9zKpVl0s', '["G1"]', '/carvings/c154.png', 'C154', NULL, NULL, NULL, NULL, NULL),
('R9cM2xDqZ5pL1yJmWn7s', '["G1", "G1"]', '/carvings/c19.png', 'C19', NULL, NULL, NULL, NULL, NULL),
('RCqF5xDnY7pL2yKmXp8s', '["G1"]', '/carvings/c150.png', 'C150', NULL, NULL, NULL, NULL, NULL),
('RJlN8xBwZ9pM3yKnYq9s', '["G9"]', '/carvings/c62.png', 'C62', NULL, NULL, NULL, NULL, NULL),
('RKwL0xCmX1pN4yLpZr0s', '["G5"]', '/carvings/c26.png', 'C26', NULL, NULL, NULL, NULL, NULL),
('RSGEBpConnYIvasFSiZaR', '[]', '/carvings/c201.png', 'C201', NULL, NULL, NULL, '', NULL),
('RSWsk5Mzb4DrvuftM3WGw', '[]', '/carvings/c184.png', 'C184', NULL, NULL, NULL, '', NULL),
('RZjL2xDnY3pM5yLqAt1s', '["G5"]', '/carvings/c35.png', 'C35', NULL, NULL, NULL, NULL, NULL),
('RgNf4xEpY5pL6yMrBt2s', '["G2"]', '/carvings/c178.png', 'C178', NULL, NULL, NULL, NULL, NULL),
('RjZl6xFmZ7pN8yNsCt3s', '["G1", "G1", "G1", "G1", "G1"]', '/carvings/c17.png', 'C17', NULL, NULL, NULL, NULL, NULL),
('RkLx8xGnY9pM0yOtDu4s', '["G1"]', '/carvings/c151.png', 'C151', NULL, NULL, NULL, NULL, NULL),
('RmNf0xHpZ1pN2yPuEv5s', '["G2"]', '/carvings/c177.png', 'C177', NULL, NULL, NULL, NULL, NULL),
('RpZl2xIqY3pM4yQvFw6s', '["G1"]', '/carvings/c152.png', 'C152', NULL, NULL, NULL, NULL, NULL),
('RqLx4xJrZ5pN6yRwGx7s', '["G1"]', '/carvings/c83.png', 'C83', NULL, NULL, NULL, NULL, NULL),
('RrNf6xKsY7pM8yStHy8s', '["G1"]', '/carvings/c200.png', 'C200', NULL, NULL, NULL, NULL, NULL),
('RtZl8xLtZ9pN0yTuIz9s', '["G3"]', '/carvings/c135.png', 'C135', NULL, NULL, NULL, NULL, NULL),
('RvLx0xMnZ1pN2yUvJz0s', '["G7"]', '/carvings/c75.png', 'C75', NULL, NULL, NULL, NULL, NULL),
('RxNf2xOpZ3pN4yVwKa1s', '["G2"]', '/carvings/c171.png', 'C171', NULL, NULL, NULL, NULL, NULL),
('RyZl4xPqZ5pN6yWxLb2s', '["G1"]', '/carvings/c202.png', 'C202', NULL, NULL, NULL, NULL, NULL),
('RzLx6xQrZ7pN8yXyMc3s', '["G3"]', '/carvings/c138.png', 'C138', NULL, NULL, NULL, NULL, NULL),
('RzTmwkdxCRYWfdbzKips', '["C9"]', '/carvings/c175.png', 'C175', NULL, NULL, NULL, '', NULL),
('S0Nf8xRsZ9pN0yYzNd4s', '["G3"]', '/carvings/c213.png', 'C213', NULL, NULL, NULL, NULL, NULL),
('S2Zl0xStZ1pN2yZzOe5s', '["G6"]', '/carvings/c130.png', 'C130', NULL, NULL, NULL, NULL, NULL),
('S4Lx2xTuZ3pN4yAzPf6s', '["G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c21.png', 'C21', NULL, NULL, NULL, NULL, NULL),
('S6Nf4xUvZ5pN6yBzQg7s', '["G7"]', '/carvings/c74.png', 'C74', NULL, NULL, NULL, NULL, NULL),
('S8Zl6xVwZ7pN8yCzRh8s', '["G4", "G4"]', '/carvings/c31.png', 'C31', NULL, NULL, NULL, NULL, NULL),
('SA3zPGtQdO1hK4lYFJX5', '["G2"]', '/carvings/c173.png', 'C173', NULL, NULL, NULL, NULL, NULL),
('SB7fQLxRcM5vH9tKXqJ2', '["G6"]', '/carvings/c57.png', 'C57', NULL, NULL, NULL, NULL, NULL),
('SC2yNmLqW1rD7vJpYsZ8', '["G5"]', '/carvings/c23.png', 'C23', NULL, NULL, NULL, NULL, NULL),
('SD9kXwJfL3mH5qVrTpY4', '["G2"]', '/carvings/c184.png', 'C184', NULL, NULL, NULL, NULL, NULL),
('SE5pKoXuM9qZ8wBjRnL7', '["G1"]', '/carvings/c157.png', 'C157', NULL, NULL, NULL, NULL, NULL),
('SF1nTjYnK7pQ4vGkXpM3', '["G1", "G1"]', '/carvings/c11.png', 'C11', NULL, NULL, NULL, NULL, NULL),
('SG8vNzYrQ5mU7xPlYqR6', '["G4"]', '/carvings/c38.png', 'C38', NULL, NULL, NULL, NULL, NULL),
('SH4oPxYsN9tR6wQmZsU1', '["G7"]', '/carvings/c79.png', 'C79', NULL, NULL, NULL, NULL, NULL),
('SI7qQlZtM2vX9pAnRtJ4', '["G4"]', '/carvings/c55.png', 'C55', NULL, NULL, NULL, NULL, NULL),
('SJ9rRmZuP4oS2wBqStK5', '["G4"]', '/carvings/c56.png', 'C56', NULL, NULL, NULL, NULL, NULL),
('SK2sSnAvQ6pT3xCrTuL6', '["G4"]', '/carvings/c34.png', 'C34', NULL, NULL, NULL, NULL, NULL),
('SL5tToBwR8qU5yDsUvN7', '["G1", "G1", "G1"]', '/carvings/c10.png', 'C10', NULL, NULL, NULL, NULL, NULL),
('SM8uUpCxS0rV6zEtVwO8', '["G1", "G1", "G1", "G1"]', '/carvings/c9.png', 'C9', NULL, NULL, NULL, NULL, NULL),
('SN1vVqDyU2sW7aFuWxP9', '["G1"]', '/carvings/c158.png', 'C158', NULL, NULL, NULL, NULL, NULL),
('SO4wWrEzV4tX8bGvXyQ0', '["G1", "G1"]', '/carvings/c8.png', 'C8', NULL, NULL, NULL, NULL, NULL),
('SP7xXsFaW6uY9cHwYzR1', '["G2"]', '/carvings/c181.png', 'C181', NULL, NULL, NULL, NULL, NULL),
('SQ0yYtGbX8vZ0dIxZaS2', '["G2"]', '/carvings/c185.png', 'C185', NULL, NULL, NULL, NULL, NULL),
('SR3zZuHcY0wA1eJyAbT3', '["G1"]', '/carvings/c156.png', 'C156', NULL, NULL, NULL, NULL, NULL),
('SS6aAvIdZ2xB3fKzBcU4', '["G1"]', '/carvings/c82.png', 'C82', NULL, NULL, NULL, NULL, NULL),
('ST9bBwJeZ4yC5gLaCdV5', '["G4"]', '/carvings/c53.png', 'C53', NULL, NULL, NULL, NULL, NULL),
('SU2cCxKfX6zD7hMbDeW6', '["G1"]', '/carvings/c159.png', 'C159', NULL, NULL, NULL, NULL, NULL),
('SV5dDyLgY8aF9jNcEfX7', '["G1", "G1", "G1"]', '/carvings/c7.png', 'C7', NULL, NULL, NULL, NULL, NULL),
('SW8eEzMhZ0cG1kOdFgY8', '["G3"]', '/carvings/c140.png', 'C140', NULL, NULL, NULL, NULL, NULL),
('SkInCGdo2GTbDJWZcwt', '["G6", "G6"]', '/carvings/c6.png', 'C6', NULL, NULL, NULL, NULL, NULL),
('SpIvSeqVIozzjmA8xsd', '["G4", "G4"]', '/carvings/c55.png', 'C55', NULL, NULL, NULL, NULL, NULL),
('TSqMIDDZyQqh2DRe8qa1', '["G5", "G2"]', '/carvings/c122.png', 'C122', NULL, NULL, NULL, NULL, NULL),
('UEterVm67d4r57qVqWsR', '["G2", "G2"]', '/carvings/c138.png', 'C138', NULL, NULL, NULL, NULL, NULL),
('UnZojRIH4tAhmkLTjvZ', '["G4"]', '/carvings/c57.png', 'C57', NULL, NULL, NULL, NULL, NULL),
('UvjXbc2bcLbLIV6LXEclJd', '["G4", "G2", "G4", "G2", "G2"]', '/carvings/c148.png', 'C148', NULL, NULL, NULL, NULL, NULL),
('VTu94pLAQYhgdYarP5L', '["G7", "G1"]', '/carvings/c22.png', 'C22', NULL, NULL, NULL, NULL, NULL),
('WAneRbqJHSPNhsYKmPS', '["G6", "G2", "G2"]', '/carvings/c120.png', 'C120', NULL, NULL, NULL, NULL, NULL),
('WDtRqLBEZZEhWoK0hp', '["G3", "G5"]', '/carvings/c97.png', 'C97', NULL, NULL, NULL, NULL, NULL),
('WfqJXTSsRsAFIZnTScF', '["G6"]', '/carvings/c162.png', 'C162', NULL, NULL, NULL, NULL, NULL),
('WoWPnC3mBhJyx4UXQJHZP', '["G2", "G1", "G1", "G2"]', '/carvings/c86.png', 'C86', NULL, NULL, NULL, NULL, NULL),
('WofnRzSST4AXVXrTx7bCbH', '["G6"]', '/carvings/c132.png', 'C132', NULL, NULL, NULL, NULL, NULL),
('Wox2RICXhgba6qsVPtj', '["G2", "G2"]', '/carvings/c73.png', 'C73', NULL, NULL, NULL, NULL, NULL),
('XXYraaiGR74MJiwBZUq', '[]', '/carvings/c164.png', 'C164', NULL, NULL, NULL, NULL, NULL),
('XbHqwXYCPqSYGVULJHM', '["G2", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c99.png', 'C99', NULL, NULL, NULL, NULL, NULL),
('XbJJkMZow53cZWHse3Dy', '[]', '/carvings/c178.png', 'C178', NULL, NULL, NULL, NULL, NULL),
('YehTFLxmGEXYqK3DqhJx', '["G9"]', '/carvings/c172.png', 'C172', NULL, NULL, NULL, NULL, NULL),
('ZAwZCYR9ddxJyKTnVW-kKj', '["G2", "G1", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c68.png', 'C68', NULL, NULL, NULL, NULL, NULL),
('ZDNyPnv3LlKMNeSwC1sd', '["G1", "G3"]', '/carvings/c191.png', 'C191', NULL, NULL, NULL, NULL, NULL),
('ZEoLbKvY9maimuKvb9t', '["G4"]', '/carvings/c190.png', 'C190', NULL, NULL, NULL, NULL, NULL),
('ZNGMR2YqGap0ZqT01EH', '["G6", "G1", "G1", "G1"]', '/carvings/c45.png', 'C45', NULL, NULL, NULL, NULL, NULL),
('abrM0uuveC5TnonJgnG', '[]', NULL, 'None', NULL, 'None', 'Nera', '1', 't'),
('apA1qTycNeHJb4bIzZDeX', '["G6"]', '/carvings/c79.png', 'C79', NULL, NULL, NULL, NULL, NULL),
('b3TVCPGCSTMcx6LXVetB', '["G2", "G2", "G1", "G1", "G3", "G3", "G1", "G1"]', '/carvings/c103.png', 'C103', NULL, NULL, NULL, NULL, NULL),
('c7L84nVjYzq9NeGYVArV', '["G6", "G4", "G4"]', '/carvings/c44.png', 'C44', NULL, NULL, NULL, NULL, NULL),
('rjixpBdm5NClI3Yt9IqS', '[]', '/carvings/c196.png', 'C196', NULL, NULL, NULL, NULL, NULL),
('sKpbl4N8jYTmBct0PQ4v', '["G3"]', '/carvings/c209.png', 'C209', NULL, NULL, NULL, NULL, NULL),
('sMNZb1FNWPDka1x3l6by', '["G10"]', '/carvings/c137.png', 'C137', NULL, NULL, NULL, NULL, NULL),
('soFpnrcV68gvC7BKMyqK', '[]', '/carvings/c163.png', 'C163', NULL, NULL, NULL, NULL, NULL),
('tBQnH0xVgKpaJgQCiimS', '["G1", "G1", "G1"]', '/carvings/c193.png', 'C193', NULL, NULL, NULL, NULL, NULL),
('tMct5wJeKTm2WGdcaGsR', '["G3"]', '/carvings/c141.png', 'C141', NULL, NULL, NULL, NULL, NULL),
('vQsLRYImNE0wUC9okHiM', '["G1", "G1", "G1", "G1", "G1"]', '/carvings/c20.png', 'C20', NULL, NULL, NULL, NULL, NULL),
('vmUbPuX8kaOYw3PcDCKq', '["G2", "G2", "G1", "G1", "G1", "G1", "G1", "G1", "G1"]', '/carvings/c52.png', 'C52', NULL, NULL, NULL, NULL, NULL),
('wICnHcdmYJ5dWTbAQy85', '["G4", "G1", "G4", "G4", "G1", "G4"]', '/carvings/c16.png', 'C16', NULL, NULL, NULL, NULL, NULL),
('wMgnhLEyAvq4Ihfbd2Yl', '["G2", "G2", "G2"]', '/carvings/c210.png', 'C210', NULL, NULL, NULL, NULL, NULL),
('wP1sGByCwByNJ7VIikVe', '["G4", "G4", "G2", "G2"]', '/carvings/c104.png', 'C104', NULL, NULL, NULL, NULL, NULL),
('wtpzRLNQ4tBzzldKNsU2', '["G1", "G1", "G1", "G1", "G1"]', '/carvings/c143.png', 'C143', NULL, NULL, NULL, NULL, NULL),
('xPV30qawhAO0gHIfn1JO', '["G9"]', '/carvings/c91.png', 'C91', NULL, NULL, NULL, NULL, NULL),
('xQTg7FFdMPFS3ZL2Kt0X', '["G5", "G1", "G1"]', '/carvings/c29.png', 'C29', NULL, NULL, NULL, NULL, NULL),
('xaBNUVtwz4uCz4p3tiWQ', '["G6"]', '/carvings/c58.png', 'C58', NULL, NULL, NULL, NULL, NULL),
('xqz3TdUyl9hqsDXfNs0H', '["G2"]', '/carvings/c176.png', 'C176', NULL, NULL, NULL, NULL, NULL),
('yq4T4aoYsjYbxsJk7gsL', '["G1", "G3"]', '/carvings/c195.png', 'C195', NULL, NULL, NULL, NULL, NULL),
('z319LAp3xVMi3KLXbtIR', '["G8"]', '/carvings/c42.png', 'C42', NULL, NULL, NULL, NULL, NULL),
('zdrZhJxIka6EU7JVkmrC', '["G4", "G4", "G9", "G4", "G4"]', '/carvings/c134.png', 'C134', NULL, NULL, NULL, NULL, NULL);

INSERT INTO "public"."doortypesactual" ("id", "default", "description", "double", "image", "name", "prices", "wider") VALUES
('87fL7HQ4uEnEZZqsLqed', NULL, 'Two fixed side panels with fixed top arch panel', 'f', '/door_types/16.png', '16', '["1TLtUkvyhYErafQIxwE3", "9sCFUQnfU2sHVzEXW4Rv", "S10jePNAZJcBAlsZuPu8"]', 't'),
('BzGUx38dtfLQaGYaof', NULL, 'Two fixed side panels and passive side panel with top fixed arch', 't', '/door_types/19.png', '19', '["1TLtUkvyhYErafQIxwE3", "9sCFUQnfU2sHVzEXW4Rv", "jmbbbDeNBtNSmYljCQBGh", "S10jePNAZJcBAlsZuPu8"]', 't'),
('C2KX2sE4MNlGEMgppD4O', NULL, 'Passive side panel with top fixed arch', 't', '/door_types/17.png', '17', '["jmbbbDeNBtNSmYljCQBGh", "S10jePNAZJcBAlsZuPu8"]', 't'),
('ER7PX7rmGfdxDVmUSGRn', NULL, 'Passive arch side panel with arch door leaf and frame', 't', '/door_types/20.png', '20', '["jmbbbDeNBtNSmYljCQBGh", "yXqtrHrJXG9kHJZfncD"]', NULL),
('EyGQYsMJulkJC7BKYDVHC', NULL, 'One fixed side panel and passive panel with top fixed arch', 't', '/door_types/18.png', '18', '["1TLtUkvyhYErafQIxwE3", "jmbbbDeNBtNSmYljCQBGh", "eeSwGPhBzqH8bU9oTxH"]', 't'),
('FpmKgqY1tsXsQhJ4R6RY', NULL, 'One fixed side panel with top fixed panel', 'f', '/door_types/5.png', '5', '["1TLtUkvyhYErafQIxwE3", "S10jePNAZJcBAlsZuPu8"]', 't'),
('I57fBe9mKdrM28IlM6', NULL, 'One fixed side panel with top fixed arch panel', 'f', '/door_types/15.png', '15', '["1TLtUkvyhYErafQIxwE3", "eeSwGPhBzqH8bU9oTxH"]', 't'),
('MPduyLZvQTrzfirflaZY', NULL, 'Two fixed side panels', 'f', '/door_types/4.png', '4', '["1TLtUkvyhYErafQIxwE3", "9sCFUQnfU2sHVzEXW4Rv"]', NULL),
('UEudPHfRlu7usGaaGPM8', NULL, 'One fixed side panel and passive panel with top fixed panel', 't', '/door_types/11.png', '11', '["1TLtUkvyhYErafQIxwE3", "jmbbbDeNBtNSmYljCQBGh", "S10jePNAZJcBAlsZuPu8"]', 't'),
('VWH1KmPVhSQIssnuCvcL', NULL, 'One passive side panel', 't', '/door_types/7.png', '7', '["jmbbbDeNBtNSmYljCQBGh"]', NULL),
('dzusF7RkfRFyJQ9hz5j', NULL, 'Top fixed arch panel', 'f', '/door_types/14.png', '14', '["eeSwGPhBzqH8bU9oTxH"]', NULL),
('lnEWvuBsyFmrhbiaCi8', NULL, 'One fixed side panel and passive side panel', 't', '/door_types/8.png', '8', '["1TLtUkvyhYErafQIxwE3", "jmbbbDeNBtNSmYljCQBGh"]', NULL),
('mrUMxAQjsnJzAprwUTP', NULL, 'One fixed side panel', 'f', '/door_types/3.png', '3', '["1TLtUkvyhYErafQIxwE3"]', NULL),
('rOmLDq0MmbjYCCRjJz', NULL, 'One passive side panel with top fixed panel', 't', '/door_types/10.png', '10', '["jmbbbDeNBtNSmYljCQBGh", "S10jePNAZJcBAlsZuPu8"]', 't'),
('rYF1J9vs8MesYzgWpKVe', 't', 'Door leaf', 'f', '/door_types/1.png', '1', '[]', NULL),
('rwJbA3Yd6BdRyp3toc25', NULL, 'Arch door leaf and frame', 'f', '/door_types/13.png', '13', '["yXqtrHrJXG9kHJZfncD"]', NULL),
('taYmfJx4wcWnlxG08GQ', NULL, 'Two fixed side panels and top fixed panel', 'f', '/door_types/6.png', '6', '["1TLtUkvyhYErafQIxwE3", "9sCFUQnfU2sHVzEXW4Rv", "S10jePNAZJcBAlsZuPu8"]', 't'),
('wEdlUysGWazawlaJ1HFN', NULL, 'Two fixed side panels and one passive side panel', 't', '/door_types/9.png', '9', '["1TLtUkvyhYErafQIxwE3", "9sCFUQnfU2sHVzEXW4Rv", "jmbbbDeNBtNSmYljCQBGh"]', NULL),
('wFh3r1u8ewlQ6EfZis1', NULL, 'Two fixed side panels and one passive panel with top fixed panel', 't', '/door_types/12.png', '12', '["1TLtUkvyhYErafQIxwE3", "9sCFUQnfU2sHVzEXW4Rv", "jmbbbDeNBtNSmYljCQBGh", "S10jePNAZJcBAlsZuPu8"]', 't'),
('y6LUSzl72Lq7B710SAS', NULL, 'Top fixed panel', 'f', '/door_types/2.png', '2', '["S10jePNAZJcBAlsZuPu8"]', NULL);

INSERT INTO "public"."categories" ("id", "adjustable", "collections", "en", "lt", "order", "slug") VALUES
('accessories', 't', '[{"id": "otheraccessories", "translation": "accessories"}]', 'Accessories', 'Priedai', 12, 'accessories'),
('architraves', 't', '[{"id": "architraves", "translation": "architraves"}]', 'Architraves', 'Apvadai', 7, 'architraves'),
('bulletproofmodel', 't', '[{"id": "bulletproofmodel", "translation": "bulletproof_options"}]', 'Bulletproof Model', 'Nepersaunamas Modelis', 15, 'bulletproofmodel'),
('color', 't', '[]', 'Color', 'Spalva', 4, 'color'),
('dimensions', 't', '[{"id": "dimensionsmax", "translation": "max"}, {"id": "dimensionsclassic", "translation": "classic"}]', 'Dimensions', 'Ismatavimal', 3, 'dimensions'),
('doormodels', 't', '[{"id": "doormodels", "translation": "model"}, {"id": "bulletproofmodel", "translation": "bulletproof_options"}]', 'Model', 'Modelis', 1, 'model'),
('dooropenings', 'f', '[{"id": "dooropenings", "translation": "door_openings"}]', 'Door openings', 'Duru atidarymas', 16, 'dooropenings'),
('exploitationconditions', 'f', '[{"id": "exploitationconditions", "translation": "exploitation_conditions"}]', 'Exploitation conditions', 'Naudojimo salygos', 17, NULL),
('extra_locks', 't', '[{"id": "extralocks", "translation": "extra_locks"}, {"id": "extracylinders", "translation": "extra_cylinders"}]', 'Extra locks', 'Papildomos spynos', 10, 'extralocks'),
('finishing', 't', '[{"id": "finishings", "translation": "finishing"}, {"id": "millings", "translation": "milling"}]', 'Finishing', 'Apdaila', 6, 'finishing'),
('glass', 't', '[]', 'Glass', 'Stiklas', 13, 'glass'),
('handles', 't', '[{"id": "handles", "translation": "handles"}]', 'Handles', 'Rankenos', 11, 'hanldes'),
('hinges', 't', '[{"id": "hinges", "translation": "hinges"}, {"id": "hingecaps", "translation": "hinge_caps"}, {"id": "hingecapfinishings", "translation": "hingecapfinishings"}, {"id": "hingeaccessories", "translation": "hinge_accessories"}]', 'Hinges', 'Vyrai', 5, 'hinges'),
('locks', 't', '[{"id": "lockseasy", "translation": "easy_locks"}, {"id": "lockssmart", "translation": "smartlocks"}, {"id": "mainlocks", "translation": "locks"}, {"id": "cylinders", "translation": "cylinders"}, {"id": "electricstrikes", "translation": "electricstrikes"}, {"id": "lockssmartaccessories", "translation": "lockssmartaccessories"}, {"id": "lockseasyaccessories", "translation": "lockseasyaccessories"}, {"id": "mainlocksadditionalaccessories", "translation": "main_locks_additional_accessories"}]', 'Locks', 'Spynos', 9, 'locks'),
('price', 'f', '[]', 'Price', 'Kaina', 14, 'price'),
('thresholds', 't', '[{"id": "thresholds", "translation": "..."}]', 'Thresholds', 'Slenksciai', 8, 'thresholds'),
('type', 't', '[]', 'Type', 'Tipas', 2, 'type');

INSERT INTO "public"."doormodels" ("id", "image", "key", "en", "order", "price", "lt") VALUES
('4tvMblSwgL7NR2dxODFQ', '/door_models/FE15.png', 'fe15', 'Munitus FE15', 4, 1355.00, 'Munitus FE15'),
('4yMxNHDZHoTpbKo6f3f', '/door_models/FE5.png', 'fe5', 'Munitus FE5', 3, 720.00, 'Munitus FE5'),
('9qPeoHog3xFYpxRkeNkb', '/door_models/door_classic_new.png', 'classic', 'DoorWorld CLASSIC', 1, 530.00, 'DoorWorld CLASSIC'),
('lBehJMKQqchRuSAXuySCl', '/door_models/door_max_new.png', 'max', 'DoorWorld MAX', 2, 1105.00, 'DoorWorld MAX');

INSERT INTO "public"."architraves" ("id", "alt_price", "colors", "custom_price", "default", "double", "en", "fits", "group", "image", "image_", "lt", "multiplier", "name", "order", "price", "side") VALUES
('1eMaplqoZQqjIA08QkHB', 'pvc', NULL, NULL, NULL, NULL, 'Hinge sides architraves 80 mm x18 mm, laminated with PVC', '["classic", "max"]', 'hinge', '/architraves/HINGE_ARCHITRAVE.png', NULL, 'Vyriu puses apvadai 80mm x 18mm, laminuote PVC', 'L formos apvadai Umdax, dazyti RAL', 'Hinge sides architraves 80 mm x18 mm, laminated with PVC', 1, 13.00, 'hinge'),
('SjAWpd1aKj2n3gNBTO', 'RAL', NULL, NULL, NULL, NULL, 'L shape architraves Umdax, painted RAL', '["classic", "max"]', 'lshape', NULL, NULL, 'L formos apvadai Umdax, dazyti RAL', NULL, 'Opposite sides architraves 80 mm x12 mm, laminated with PVC', 1, 75.00, 'opposite'),
('TlbQrjXpV7VU3DPBg83p', '11', 'pvc', NULL, NULL, NULL, 'Opposite sides architraves 80 mm x12 mm, laminated with PVC', '["classic", "max"]', 'opposite', NULL, NULL, 'Kitos puses apvadai 80mm x 12mm, laminuoti PVC', NULL, 'Opposite sides architraves 80 mm x12 mm, laminated with PVC', 3, 0.00, 'opposite'),
('YZ4u1JkNYGTXPRjQDhbH1', 'none', NULL, 't', NULL, NULL, 'Special design', '["classic", "max"]', 'x', NULL, NULL, 'Specialus dizainas', 'L formos apvadai EDM, dazyti RAL', 'Special design', NULL, NULL, 'both'),
('cMmBklNDKmnMeRosasgt', 'RAL', NULL, NULL, NULL, NULL, 'L shape architraves EDM painted RAL', '["classic", "max"]', 'lshape', NULL, NULL, 'L formos apvadai EDM, dazyti RAL', NULL, 'L shape architraves EDM painted RAL', 2, 109.00, 'opposite'),
('eQTmaVL71ecGW9ckx7p', 'none', NULL, 't', NULL, NULL, 'None', '["classic", "max"]', '0', NULL, NULL, 'Nera', NULL, 'None', NULL, 0.00, 'both'),
('f8TFauRRdGRkT7iS4FjL', 'none', NULL, NULL, NULL, NULL, 'Wider architraves 100-180mm', '["classic", "max"]', 'w', NULL, 't', 'Platesni apvadai 100-180mm', 'Vyriu puses apvadai 80mm x 18mm, Okume (WRB) densed', 'Wider architraves 100-180mm', NULL, NULL, 'both'),
('glKmGWIItAESjGjmGVS', 'wrb', NULL, NULL, NULL, NULL, 'Hinge sides architraves 80 mm x18 mm, Okume (WRB) stained', '["classic", "max"]', 'hinge', '/architraves/HINGE_ARCHITRAVE.png', NULL, 'Vyriu puses apvadai 80mm x 18mm, Okume (WRB) densed', NULL, 'Hinge sides architraves 80 mm x18 mm, Okume (WRB) stained', 2, 25.00, 'hinge'),
('h8Wm2Z9z41h0WSZVvxF', '24', 'wrb', NULL, NULL, NULL, 'Opposite sides architraves 80 mm x12 mm, Okume (WRB)', '["classic", "max"]', 'opposite', NULL, NULL, 'Kilos puses apvadai 80mm x 12mm, Okume (WRB)', NULL, 'Opposite sides architraves 80 mm x12 mm, Okume (WRB)', 4, 0.00, 'opposite'),
('hlLlz1lomeTz5R8uZTsB', NULL, 'RAL', NULL, NULL, NULL, 'Hinge sides architraves 80 mm x18 mm, EDM painted RAL', '["classic", "max"]', 'hinge', '/architraves/HINGE_ARCHITRAVE.png', NULL, 'Vyriu puses apvadai 80mm x 18mm EDM dazyti RAL', NULL, 'Hinge sides architraves 80 mm x18 mm, EDM painted RAL', 4, 64.00, 'hinge'),
('kExMjdLkh3XNJ8nchTT', 'RAL', NULL, NULL, NULL, NULL, 'Hinge sides architraves 80 mm x18 mm, Umdax, painted RAL', '["classic", "max"]', 'hinge', '/architraves/HINGE_ARCHITRAVE.png', NULL, 'Vyriu puses apvadai 80mm x 18mm Umdax, dazyti RAL', 'Kilos puses apvadai 80mm x 12mm, Okume (WRB)', 'Hinge sides architraves 80 mm x18 mm, Umdax, painted RAL', 3, 21.00, 'hinge'),
('moGSTJN2Nc0hGbYpLn', '20', 'RAL', NULL, NULL, NULL, 'Opposite sides architraves 80 mm x12 mm, Umdax, painted RAL', '["classic", "max"]', 'opposite', NULL, NULL, 'Kilos puses apvadai 80mm x 12mm, Umdax, dazyti RAL', 'Hinge sides architraves 80 mm x18 mm, EDM painted RAL', 'Opposite sides architraves 80 mm x12 mm, Umdax, painted RAL', 5, 0.00, 'opposite'),
('pBOjSmvZzQTQCeuVjn0', '0', 'RAL', NULL, NULL, NULL, 'Opposite sides architraves 80 mm x12 mm, EDM painted RAL', '["classic", "max"]', 'opposite', NULL, NULL, 'Kilos puses apvadai 80mm x 12mm, EDM dazyti RAL', NULL, 'Opposite sides architraves 80 mm x12 mm, EDM painted RAL', 6, 0.00, 'opposite'),
('pDpmhRzwJjQGlPtzaZC', '172', NULL, 't', NULL, NULL, 'Exterior standard metal architraves welded to frame, width from the frame outer edge to the list edge is 70 mm', '["max"]', 'opposite', NULL, NULL, 'Isoriniai standartiniai metaliniai apvadai privirinti prie remo, plotis nuo remo iki krasto 70mm', NULL, 'Exterior standard metal architraves welded to frame, width from the frame outer edge to the list edge is 70 mm', 7, 107.00, 'opposite'),
('plqemTTaVHAKQPQUT0v', '94', NULL, 't', NULL, NULL, 'Exterior standard metal architraves welded to frame, width from the frame outer edge to the list edge is 70 mm', '["classic"]', 'opposite', NULL, NULL, 'Isoriniai standartiniai metaliniai apvadai privirinti prie remo, plotis nuo remo iki krasto 70mm', NULL, 'Exterior standard metal architraves welded to frame, width from the frame outer edge to the list edge is 70 mm', 8, 59.00, 'opposite');

INSERT INTO "public"."users" ("id", "email", "password", "displayName", "canChangePrice", "isAdmin", "logos", "markup", "selected_logo", "user_markup", "created_at", "updated_at") VALUES
('1', 'kipras.sarapas@gmail.com', '$2y$10$.lXJWysqbRLcTSj8IYMsAur2SOOQym5XVz1boGbw7DoXdCgxbz8E.', 'Kip', 'true', 't', NULL, NULL, NULL, NULL, '2025-08-13 18:15:03.45512', '2025-08-13 18:15:03.45512');

INSERT INTO "public"."translations" ("id", "en", "lt") VALUES
('accessories', 'Accessories', 'Priedai'),
('accessory', 'Accessory', 'Priedas'),
('add', 'Add', 'Pridėti'),
('addon', 'Addon', 'Papildomas'),
('addons', 'Addons', 'Papildomi'),
('architraves', 'Architraves', 'Apvadai'),
('are_you_sure_new_spec', 'Are you sure you want to create new specification?', 'Ar tikrai norite kurti naują specifikaciją?'),
('back', 'Back', 'Atgal'),
('base_price', 'Base price', 'Bazinė kaina'),
('bulletproof_options', 'Bulletproof options', 'Neperšaunuomas'),
('cancel', 'Cancel', 'Atšaukti'),
('carving', 'Carving', 'Raižinys'),
('category', 'Category', 'Kategorija'),
('classic', 'Classic and FE5', 'Classic ir FE5'),
('close', 'Close', 'Uždaryti'),
('color', 'Color', 'Spalva'),
('copy', 'Copy', 'Kopijuoti'),
('copy_specification', 'Copy specification', 'Kopijuoti specifikaciją'),
('copyright', 'All rights reserved', 'Visos teisės saugomos'),
('create', 'Create', 'Sukurti'),
('create_new', 'Create new', 'Sukurti naują'),
('created_at', 'Created at', 'Sukurta'),
('current_price', 'Current price', 'Dabartinė kaina'),
('custom', 'Custom', 'Pagal užsakymą'),
('custom_color', 'Custom color', 'Spalva pagal užsakymą'),
('custom_price', 'Custom price', 'Kaina'),
('cylinder', 'Cylinder', 'Cilindras'),
('cylinders', 'Cylinders', 'Cilindrai'),
('delete', 'Delete', 'Ištrinti'),
('dimensions', 'Dimensions', 'Išmatavimai'),
('door', 'Door', 'Durys'),
('door_color', 'Door color', 'Durų spalva'),
('door_dimensions', 'Door dimensions', 'Durų išmatavimai'),
('door_leaf_dimensions', 'Door leaf dimensions', 'Durų plokštės išmatavimai'),
('door_type', 'Door type', 'Durų tipas'),
('draft_name', 'Draft name', 'Dokumento pavadinimas'),
('draft_saved', 'Draft saved', 'Dokumentas išsaugotas'),
('draft_updated', 'Draft updated', 'Dokumentas atnaujintas'),
('easy_locks', 'Easy locks', 'Spynos "Easy"'),
('easy_locks_accessories', 'Easy locks accessories', 'Spynų "Easy" priedai'),
('edit', 'Edit', 'Tvarkyti'),
('editing', 'Editing', 'Tvarkoma'),
('electric_strike', 'Electric strike', 'Elektrinė skendė'),
('electric_strikes', 'Electric strikes', 'Elektrinės skendės'),
('email', 'Email', 'El. paštas'),
('enabled', 'Enabled', 'Įjungta'),
('error', 'Error', 'Klaida'),
('excel', 'Excel', 'Excel'),
('exploitation', 'Exploitation', 'Sąlygos'),
('exploitation_conditions', 'Exploitation conditions', 'Eksploatavimo sąlygos'),
('exterior', 'Exterior', 'Išorės'),
('exterior_handle', 'Exterior handle', 'Išorės rankena'),
('external', 'External', 'Išorės'),
('extra', 'Extra', 'Papildoma'),
('extra_cylinder', 'Extra lock cylinder', 'Papildomos spynos cilindras'),
('extra_lock', 'Extra lock', 'Papildoma spyna'),
('extra_locks', 'Extra locks', 'Papildomos spynos'),
('eyespots', 'Eyespots', 'Akutės'),
('film', 'Film', 'Plėvelė'),
('finishing', 'Finishing', 'Apdaila'),
('glass', 'Glass', 'Stiklas'),
('handle_height', 'Handle height', 'Rankenos aukštis'),
('handle_note', 'Handle note', 'Komentaras apie rankeną'),
('handles', 'Handles', 'Rankenos'),
('height', 'Height', 'Aukštis'),
('height_of_frame', 'Height of frame', 'Rėmo aukštis'),
('hingeInwardsLeft', 'Inwards left hinges', 'Vidine kairė varstai'),
('hingeInwardsRight', 'Inwards right hinges', 'Vidine dešinė varstai'),
('hingeOutwardsLeft', 'Outwards left hinges', 'Išorinė kairė varstai'),
('hingeOutwardsRight', 'Outwards right hinges', 'Išorinė dešinė varstai'),
('hinge_accessories', 'Hinge accessories', 'Vyrių priedai'),
('hinge_cap_finishings', 'Hinge cap finishings', 'Vyrių gaubtelių apdaila'),
('hinge_caps', 'Hinge caps', 'Vyrių gaubteliai'),
('hinge_direction', 'Hinge direction', 'Vyrių pusė'),
('hinge_inwards_right', 'Inwards right hinges', 'Vidine dešinė varstai'),
('hinge_side', 'Hinge side', 'Vyrio pusė'),
('hinge_side_architraves', 'Hinge side architraves', 'Vyrių pusės apvadai'),
('hinges', 'Hinges', 'Vyriai'),
('image', 'Image', 'Nuotrauka'),
('individual_prices', 'Individual prices', 'Individualios kainos'),
('individual_user_prices', 'Individual user prices', 'Individualių vartotojų kainos'),
('interior', 'Interior', 'Vidaus'),
('interior_handle', 'Interior handle', 'Vidaus rankena'),
('internal', 'Internal', 'Vidaus'),
('invalid_ral_color', 'Invalid RAL color', 'Klaidingas RAL kodas'),
('last_login', 'Last login', 'Paskutinis prisijungimas'),
('last_updated', 'Last updated', 'Paskutinį kartą atnaujinta'),
('lock_accessory', 'Lock accessory', 'Spynos priedas'),
('locking_directions', 'Locking directions', 'Rakinimo kryptys'),
('locks', 'Locks', 'Spynos'),
('logo', 'Logo', 'Logotipas'),
('logo_name', 'Logo name', 'Logotipo pavadinimas'),
('logo_settings_subtext', 'Change the logo on specification sheet', 'Pakeiskite laikų logotipas'),
('main_lock', 'Main lock', 'Pagrindinė spyna'),
('main_locks_additional_accessories', 'Main locks additional accessories', 'Spynų aksesuarai'),
('manufacturer', 'Manufacturer', 'Gamintojas'),
('margins_off', 'Turn margins on', 'Įjungti antkaini'),
('margins_on', 'Turn margins off', 'Išjungti antkaini'),
('markup', 'Markup', 'Antkainiai'),
('max', 'Max and FE15', 'Max ir FE15'),
('menu', 'Menu', 'Meniu'),
('menu_administration', 'Administration', 'Tvarkymas'),
('menu_create_new', 'Create new', 'Sukurti naują'),
('menu_my_drafts', 'My drafts', 'Mano išsaugoti'),
('menu_my_specifications', 'My specifications', 'Mano specifikacijos'),
('menu_prices', 'Prices', 'Kainos'),
('menu_settings', 'Settings', 'Nustatymai'),
('menu_specifications', 'Specifications', 'Specifikacijos'),
('menu_users', 'Users', 'Vartotojai'),
('metal_construction_color', 'Metal construction color', 'Metalo konstrukcijos spalva'),
('milling', 'Milling', 'Frezavimas'),
('misc', 'Misc', 'Įvairia'),
('model', 'Model', 'Modelis'),
('my_drafts', 'My drafts', 'Mano išsaugoti'),
('my_drafts_are_you_sure', 'Are you sure you want to delete draft?', 'Ar tikrai norite ištrinti?'),
('my_drafts_delete_text', 'The draft will be deleted and cannot be recovered.', 'Dokumentas bus ištrintas ir jo atkurti nebeibus galima.'),
('my_specifications', 'Specifications', 'Specifikacijos'),
('my_specifications_are_you_sure', 'Are you sure you want to delete this specification?', 'Ar tikrai norite ištrinti specifikaciją?'),
('my_specifications_delete_text', 'The specification sheet will be deleted and cannot be recovered.', 'Si specifikacija bus ištrinta ir jos atkurti nebeibus galima.'),
('name', 'Name', 'Vardas'),
('name_alt', 'Name', 'Pavadinimas'),
('new_price', 'New price', 'Nauja kaina'),
('new_specification', 'New specification', 'Nauja specifikacija'),
('next', 'Next', 'Toliau'),
('no_drafts', 'You don''t have any drafts yet', 'Neturite jokių neužbaigtu dokumentų'),
('no_glass', 'No glass', 'Jokio stiklo'),
('no_price_adjustments', 'No price adjustments for this category', 'Nėra kainų nustatymų šiai kategorijai'),
('no_specifications', 'You don''t have any saved specifications yet', 'Neturite jokių išsaugotų specifikacijų'),
('no_thresholds', 'No thresholds', 'Be slenkščių'),
('none', 'None', 'Nėra'),
('note', 'Note', 'Komentaras'),
('note_placeholder', 'Add a note', 'Pridėkite komentarą'),
('nothing_here_yet', 'Nothing here yet', 'Kolkas čia tuščia'),
('number_of_hinges', 'Number of hinges', 'Vyrių skaičius'),
('opposite_side', 'Opposite side', 'Kita pusė'),
('opposite_side_architraves', 'Opposite side architraves', 'Kitos pusės apvadai'),
('other', 'Other', 'Kita'),
('pack_type', 'Pack type', 'Paketo tipas'),
('packaging', 'Packaging', 'Pakavimas'),
('packing', 'Packing', 'Pakavimas'),
('password', 'Password', 'Slaptažodis'),
('percentage', 'Percentage', 'Procentai'),
('plus_add_glass', '+ Add glass', '+ Pridėti stiklą'),
('price', 'Price', 'Kaina'),
('prices', 'Prices', 'Kainos'),
('print', 'Print', 'Spausdinti'),
('print_for_production', 'Print for production', 'Spausdinti gamybai'),
('quantity', 'Quantity', 'Kiekis'),
('reset', 'Reset', 'Atstatyti'),
('save', 'Save', 'Išsaugoti'),
('save_draft', 'Save draft', 'Išsaugoti'),
('security_class', 'Security class', 'Saugumo klasė'),
('select_category', 'Select category', 'Pasirinkite vartotoją'),
('select_prices', 'Select prices', 'Pasirinkti kainas'),
('select_user', 'Select user', 'Pasirinkite vartotoją'),
('select_user_and_category', 'Select user and category', 'Pasirinkite vartotoją ir kategoriją'),
('settings', 'Settings', 'Nustatymai'),
('settings_margin_percentage', 'Margin percentage', 'Antkainis'),
('shape', 'Shape', 'Forma'),
('shape_and_size', 'Shape and size', 'Forma ir dydis'),
('smart_locks', 'Smart locks', 'Spynos "Smart"'),
('smart_locks_accessories', 'Smart locks accessories', 'Spynų "Smart" priedai'),
('specification', 'Specification', 'Specifikacija'),
('specification_created_at', 'Specification created at', 'Specifikacija sukurta'),
('specification_name', 'Specification name', 'Specifikacijos pavadinimas'),
('standard', 'Standard', 'Standartas'),
('thresholds', 'Thresholds', 'Slenkščiai'),
('total_amount', 'Total amount', 'Suma'),
('total_price', 'Total price', 'Suma'),
('type', 'Type', 'Tipas'),
('unsaved_changes', 'Any unsaved changes will be lost', 'Visi neišsaugoti pakeitimai bus prarasti'),
('update_draft', 'Update draft', 'Išsaugoti'),
('update_specification', 'Update specification', 'Atnaujinti specifikaciją'),
('upload_logo', 'Upload logo', 'Įkelti logotipą'),
('user', 'User', 'Vartotojas'),
('users', 'Users', 'Vartotojai'),
('users_are_you_sure', 'Are you sure you want to delete?', 'Ar tikrai norite ištrinti?'),
('users_can_change_price', 'Can change price', 'Gali keisti kainas'),
('users_create_new_user', 'Create new user', 'Sukurti naują vartotoją'),
('users_delete_warning_message', 'The user will be deleted and cannot be recovered.', 'Vartotojas bus ištrintas ir jo atkurti nebeibus galima.'),
('width', 'Width', 'Plotis'),
('width_of_frame', 'Width of frame', 'Rėmo plotis');

INSERT INTO "public"."dimensionsclassic" ("id", "heights") VALUES
('1000', '[{"id": 2450, "price": 98}, {"id": 2300, "price": 72}, {"id": 2200, "price": 46}, {"id": 2100, "price": 0}]'),
('1100', '[{"id": 2450, "price": 157}, {"id": 2300, "price": 98}, {"id": 2200, "price": 72}, {"id": 2100, "price": 46}]'),
('1250', '[{"id": 2450, "price": 206}, {"id": 2300, "price": 179}, {"id": 2200, "price": 125}, {"id": 2100, "price": 79}]');

INSERT INTO "public"."handles" ("id", "custom_price", "en", "group", "image", "inside", "lt", "maker", "name", "order", "price", "set", "default") VALUES
('0MP3KWIkaxnH3QL2742', 't', 'Customer provided handle (inside)', 'xcustom', NULL, 't', 'Kliento rankena (viduje)', NULL, 'Customer provided handle (inside)', NULL, NULL, NULL, NULL),
('2fAXEMqVsvaIWZabZNn', NULL, 'Martina S04 OCS-SLIM mat. Chrome', 'INOVO', '/handles/inovo_martina.png', NULL, 'Martina S04 OCS-SLIM mat. chromas', 'INOVO', 'Martina S04 OCS-SLIM mat. Chrome', 20, 11.00, 't', NULL),
('3EJj2ZMlL4YmvVQtQQ88', NULL, 'R923 chrome and mat chrome', 'GHIDINI', '/handles/GHIDINI_R923_CHROME_AND_MAT.png', NULL, 'R923 chromas and matinis chromas', 'GHIDINI', 'R923 chrome and mat chrome', 24, NULL, 't', NULL),
('3RTC84s7Ke47rYAhbLg', NULL, 'YORK mat chrome', 'GHIDINI', '/handles/GHIDINI_YORK_MAT_CHROME.png', NULL, 'YORK matinis chromas', 'GHIDINI', 'YORK mat chrome', 25, NULL, 't', NULL),
('48WGYjeKnjRM13xppV', NULL, 'DH7291 Mat brass', 'DORMA', '/handles/DORMA_DH7291.png', NULL, 'DH7291 matinis žalvaris', 'DORMA', 'DH7291 Mat brass', 24, NULL, 't', NULL),
('4PhBujOTBzRipvAR88', NULL, 'Robot, chrome', 'COLOMBO', '/handles/robot_chrome.png', NULL, 'Robot, chromas', 'COLOMBO', 'Robot, chrome', 22, NULL, 't', NULL),
('5XVEJbFcO0wJJvEOH22C', NULL, 'Eagle 502 OCS-SLIM mat. Chrome', 'INOVO', '/handles/inovo_eagle.png', NULL, 'Eagle 502 OCS-SLIM mat. chromas', 'INOVO', 'Eagle 502 OCS-SLIM mat. Chrome', 19, 11.00, 't', NULL),
('5k4tY3eWWdGFiunMSFMO', NULL, 'K27 Chrome', '00K27', '/handles/ALSEKA_K27_CHROME.png', NULL, 'K27 chromas', NULL, 'K27 Chrome', 0, NULL, 't', NULL),
('6zBFZyLiCOSnuB4WcuE', NULL, 'Aurus 18S Slim Black', 'INOVO', '/handles/inovo_aurus.png', NULL, 'Aurus 18S Slim juoda', 'INOVO', 'Aurus 18S Slim Black', 1, 19.00, 't', NULL),
('7EjsT7A9zchWnQaQNp', NULL, 'Cosmo OC-SLIM chrome', 'INOVO', '/handles/inovo_cosmo.png', NULL, 'Cosmo OC-SLIM chromas', 'INOVO', 'Cosmo OC-SLIM chrome', 16, 18.00, 't', NULL),
('8kz7oh2AjaUv1aKBIgsm', NULL, 'Aurus 18S Slim ChromeOC', 'INOVO', '/handles/inovo_aurus.png', NULL, 'Aurus 18S Slim chromasOC', 'INOVO', 'Aurus 18S Slim ChromeOC', 2, 19.00, 't', NULL),
('9jnBAANWHWNE37DSmIIW', NULL, 'Torino 178 Slim ZBN-White', 'INOVO', '/handles/inovo_torino.png', NULL, 'Torino 178 Slim ZBN balta', 'INOVO', 'Torino 178 Slim ZBN-White', 6, 19.00, 't', NULL),
('9myAqSZDQkNxuKAT24r', NULL, 'ATNE 177 SLIM GraphiteOGS', 'INOVO', NULL, NULL, 'ATNE 177 SLIM GrafitasOGS', 'INOVO', 'ATNE 177 SLIM GraphiteOGS', 12, 19.00, 't', NULL),
('9pcT56b79s1XoZPDZFl', NULL, 'Torino 178 Slim ZNE-Black', 'INOVO', '/handles/inovo_torino.png', NULL, 'Torino 178 Slim ZNE juoda', 'INOVO', 'Torino 178 Slim ZNE-Black', 5, 19.00, 't', NULL),
('B3lvqzHc3RKrmJaIjCNA', NULL, 'K27 Brass', '00K27', '/handles/ALSEKA_K27_BRASS.png', NULL, 'K27 žalvaris', NULL, 'K27 Brass', 0, NULL, 't', NULL),
('DsuJHSDaKe6Qhwl4JKJz', NULL, 'Robot, mat chrome', 'COLOMBO', '/handles/robot_mat_chrome.png', NULL, 'Robot, matinis chromas', 'COLOMBO', 'Robot, mat chrome', 22, NULL, 't', NULL),
('ELwwJkIBnmbLZehNiAZK', NULL, 'ATNE 177 SLIM Black', 'INOVO', NULL, NULL, 'ATNE 177 SLIM juoda', 'INOVO', 'ATNE 177 SLIM Black', 13, 19.00, 't', NULL),
('EszXCsbzelfqBp2iAEZ6h', NULL, 'Elegant 295 SLIM OGH aged bronze', 'INOVO', '/handles/inovo_elegant.png', NULL, 'Elegant 295 SLIM OGH sendinta bronza', 'INOVO', 'Elegant 295 SLIM OGH aged bronze', 10, 19.00, 't', NULL),
('EvWa4TccdD3WrV3kKPIms', NULL, 'GINEVRA brass', 'GHIDINI', '/handles/GHIDINI_GINEVRA_BRASS.png', NULL, 'GINEVRA žalvaris', 'GHIDINI', 'GINEVRA brass', 33, NULL, 't', NULL),
('GbkhsgjxNsB1d7HnGAX', NULL, 'DH7292 Mat chrome', 'DORMA', '/handles/DORMA_DH7292_MAT_CHROME.png', NULL, 'DH7292 matinis chromas', 'DORMA', 'DH7292 Mat chrome', 22, NULL, 't', NULL),
('HLQ8pzniMgCUVQr7f6Gf', NULL, '17099 handle, black', 'new_york', '/other-accessories/new_york_black.png', NULL, '17099 handle, juodė', 'New York', '17099 handle, black', 7, 46.00, 't', NULL),
('HZYuJVHL1hj8owcpgbf2', NULL, 'DH722 Chrome', 'DORMA', '/handles/DORMA_DH722_CHROME.png', NULL, 'DH722 chromas', 'DORMA', 'DH722 Chrome', 19, NULL, 't', NULL),
('IA0TV6N25Z3qwzK5bdCf', NULL, 'Mat stainless steel handle HR-121 600-400 INOX', 'INOX', '/other-accessories/pulling_handle_2.png', NULL, 'Matinė nerūdijančio plieno rankena HR-121 600-400 INOX', NULL, 'Mat stainless steel handle HR-121 600-400 INOX', 1, 45.00, NULL, NULL),
('JwyxwNxlPswQ0OqYu0iqg', NULL, 'Torino 178 Slim OGS-Graphite', 'INOVO', '/handles/inovo_torino.png', NULL, 'Torino 178 Slim OGS-grafitas', 'INOVO', 'Torino 178 Slim OGS-Graphite', 7, 19.00, 't', NULL),
('LSkqZOYbo18ANLbmB8oW', NULL, 'Robot, black', 'COLOMBO', '/handles/robot_black.png', NULL, 'Robot, juoda', 'COLOMBO', 'Robot, black', 22, NULL, 't', NULL),
('LSuDGaG8Sht2JwdgrJA', NULL, 'None', '0', NULL, NULL, 'Nera', NULL, 'None', 0, NULL, NULL, 't'),
('LfEBxjUKle4vtRKC4VBJuK', NULL, 'Mat stainless steel Pulling handle – 20x40x1800 mm', 'l_pull', '/other-accessories/pulling_handle.png', NULL, 'Matinė nerūdijančio plieno traukiama rankena – 20x40x1800 mm', NULL, 'Mat stainless steel Pulling handle – 20x40x1800 mm', 3, 107.00, NULL, NULL),
('MWWhlllso9A7igCAeZXec', NULL, 'Fixed knob solid brass 54 mm', 'knob', '/other-accessories/fixed_know_brass.png', NULL, 'Fiksuotas bumbulas žalvaris 54 mm', NULL, 'Fixed knob solid brass 54 mm', 1, 42.00, NULL, NULL),
('PBTm7KcX57hxYo1dINw', NULL, 'Roboquattro, chrome', 'COLOMBO', '/handles/roboquattro_chrome.png', NULL, 'Roboquattro, chromas', 'COLOMBO', 'Roboquattro, chrome', 22, NULL, 't', NULL),
('PJIMcvrtbzK3Xi6r4ksak', NULL, 'Mat stainless steel handle HR-156 800-600 INOX (straight)', 'INOX', '/other-accessories/pulling_handle_3.png', NULL, 'Matinė nerūdijančio plieno rankena HR-156 800-600 INOX (straight)', NULL, 'Mat stainless steel handle HR-156 800-600 INOX (straight)', 3, 47.00, NULL, NULL),
('R4jPAhkGJHM4XDCbWXA', NULL, 'PRIX black mat', 'GHIDINI', '/handles/GHIDINI_GRAN_PRIX_BLACK_MAT.png', NULL, 'PRIX juoda mat', 'GHIDINI', 'PRIX black mat', 39, NULL, 't', NULL),
('lhqsTkHFBYkT0nlRuNdh', NULL, 'DH722 Mat chrome', 'DORMA', '/handles/DORMA_DH722_MAT_CHROME.png', NULL, 'DH722 matinis chromas', 'DORMA', 'DH722 Mat chrome', 22, NULL, 't', NULL);

INSERT INTO "public"."glass" ("id", "default", "en", "lt", "name", "prices") VALUES
('GLASS1', 't', NULL, NULL, '42mm "DoorWorld Classic"', '{"type": "G11", "price": 261}'),
('GLASS2', NULL, NULL, NULL, '92 mm "DoorWorld Classic"', '{"type": "G10", "price": 438}'),
('GLASS3', NULL, 'Security glass', 'Apsauginis stiklas', 'Security glass', '{"type": "G11", "price": 55}'),
('GLASS4', NULL, NULL, NULL, 'Mat (frosted glass)', '{"type": "G11", "price": 55}'),
('GLASS5', NULL, NULL, NULL, 'Mirror, Grey, Brown tone glass', '{"type": "G11", "price": 32}'),
('GLASS6', NULL, NULL, NULL, 'Wavy glass (nevaļda lt)', '{"type": "G11", "price": 36}');

INSERT INTO "public"."glassaddon" ("id", "en", "lt", "name", "price") VALUES
('ADDON0', 'None', 'Nera', 'None', '{"G1": "0", "G2": "0", "G3": "0", "G4": "0", "G5": "0", "G6": "0", "BP_SIZE_1": "0", "BP_SIZE_05": "0"}'),
('ADDON1', 'Mat (frosted glass)', 'Matinis (šaltyto stiklo)', 'Mat (frosted glass)', '{"G1": "38", "G2": "41", "G3": "52", "G4": "56", "G5": "56", "G6": "64", "BP_SIZE_1": "38", "BP_SIZE_05": "24"}'),
('ADDON2', 'Mirror, grey, brown tone', 'Veidrodinis pilkas, rudo atspalvio', 'Mirror, grey, brown tone', '{"G1": "12", "G2": "12", "G3": "24", "G4": "24", "G5": "36", "G6": "36"}'),
('ADDON3', 'Wavy glass', 'Banguotas stiklas', 'Wavy glass', '{"G1": "38", "G2": "41", "G3": "52", "G4": "56", "G5": "56", "G6": "64"}');

INSERT INTO "public"."glassbulletproofsizes" ("id", "en", "lt", "name", "size") VALUES
('BP_SIZE_05', 'Up to 0.5 sq m', 'Iki 0.5 sq m', 'Up to 0.5 sq m', '["BR4_05", "BR6_05", "P6B_05", "P8B_05"]'),
('BP_SIZE_1', 'Up to 1 sq m', 'Iki 1 sq m', 'Up to 1 sq m', '["BR4_1", "BR6_1", "P6B_1", "P8B_1"]');

INSERT INTO "public"."glassfilm" ("id", "en", "lt", "name", "price") VALUES
('FILM0', 'None', 'Nera', 'None', '{"G1": "0", "G2": "0", "G3": "0", "G4": "0", "G5": "0", "G6": "0"}'),
('FILM1', NULL, NULL, 'TRIPLEX', '{"G1": "30", "G2": "36", "G3": "45", "G4": "50", "G5": "73", "G6": "77"}'),
('FILM2', 'TRIPLEX (Both sides)', 'TRIPLEX (abi pusės)', 'TRIPLEX (Both sides)', '{"G1": "59", "G2": "72", "G3": "89", "G4": "100", "G5": "146", "G6": "155"}');

INSERT INTO "public"."glassshapebulletproof" ("id", "name", "price") VALUES
('BR4_05', 'BR4', '{"max": "496", "classic": "449"}'),
('BR4_1', 'BR4', '{"max": "767", "classic": "685"}'),
('BR6_05', 'BR6', '{"max": "519"}'),
('BR6_1', 'BR6', '{"max": "820"}'),
('P6B_05', 'P6B', '{"max": "319", "classic": "236"}'),
('P6B_1', 'P6B', '{"max": "496", "classic": "413"}'),
('P8B_05', 'P8B', '{"max": "384"}'),
('P8B_1', 'P8B', '{"max": "649"}');

INSERT INTO "public"."glasstypenew" ("id", "en", "lt", "name", "price") VALUES
('G1', 'Rectangular up to 0.5 m2', 'Stačiakampis iki 0.5 m2', 'Rectangular up to 0.5 m2', '{"max": "200", "classic": "119", "max_thick": "354", "classic_thick": "236"}'),
('G2', 'Shaped up to 0.5 m2', 'Suformuotas iki 0.5 m2', 'Shaped up to 0.5 m2', '{"max": "240", "classic": "142", "max_thick": "478", "classic_thick": "318"}'),
('G3', 'Rectangular 0.5-1.0 m2', 'Stačiakampis 0.5-1.0 m2', 'Rectangular 0.5-1.0 m2', '{"max": "281", "classic": "165", "max_thick": "372", "classic_thick": "248"}'),
('G4', 'Shaped 0.5-1.0 m2', 'Suformuotas 0.5-1.0 m2', 'Shaped 0.5-1.0 m2', '{"max": "321", "classic": "189", "max_thick": "549", "classic_thick": "366"}'),
('G5', 'Oval', 'Ovalas', 'Oval', '{"max": "401", "classic": "236", "max_thick": "743", "classic_thick": "496"}'),
('G6', 'Non-standard', 'Nestandartas', 'Non-standard', '{"max": "501", "classic": "296", "max_thick": "850", "classic_thick": "570"}');

INSERT INTO "public"."glasstype" ("id", "name") VALUES
('G1', 'Rectangular, up to 0.2'),
('G10', 'Non-standard'),
('G11', 'Non-standard'),
('G2', 'Shaped up to 0.2'),
('G3', 'Rectangular 0.2-0.5'),
('G4', 'Shaped 0.2-0.5'),
('G5', 'Rectangular 0.5-0.7'),
('G6', 'Shaped 0.5-0.7'),
('G7', 'Rectangular 0.7-1.0'),
('G8', 'Shaped 0.7-1.0'),
('G9', 'Oval');

INSERT INTO "public"."hingeaccessories" ("id", "en", "lt", "name", "price", "quantifiable") VALUES
('Bm9FdwmZoXZczg9pPhmali', 'Reinforcement for hinges', 'Sutvirtinti vyrial', 'Reinforcement for hinges', 12.00, 't'),
('EZJsOHifjEpTMxeRZGybO', 'Galvanized hinges (for outdoor conditions)', 'Galvanizuoti vyrial (lauko sąlygoms)', 'Galvanized hinges (for outdoor conditions)', 0.00, 't'),
('hm7gl2emCKvCHGIIfqfl', 'Extra additional cut protective roll pins for door hinges', 'Papildomajp išpjauti apsauginiai strypeIiai vyriams', 'Extra additional cut protective roll pins for door hinges', 8.00, 't'),
('i4UPIER2kB9QVRX3auLx', 'Hinges covers, Defender, handles powder coated by Munitus (no warranty)', 'Vyrių gaubteliai, Defender, Hmelinio dazymo rankenos (be garantijos)', 'Hinges covers, Defender, handles powder coated by Munitus (no warranty)', 32.00, 'f'),
('qYkUoTaeFywtrWUdFquNL', 'Electro-galvanized axis (recommended for outside conditions)', 'Elektro-galvanizuota ašis (lauko sąlygoms)', 'Electro-galvanized axis (recommended for outside conditions)', 8.00, 't'),
('tsvagAzWmQmDped5QB4', 'Magnetic hinge cover, mat stainless steel or mat brass', 'Magnetinis vyrių gaubtelis, nerūdijančio plieno arba matinio žalvario', 'Magnetic hinge cover, mat stainless steel or mat brass', 20.00, 't');

INSERT INTO "public"."hingecapfinishings" ("id", "default", "en", "image", "lt", "name", "price") VALUES
('7LJB8SSI3K3mjnMT8REc', 't', 'Stainless steel', '/other-accessories/mat_ss_hinge_caps.png', 'Nerūdijantis plienas', 'Stainless steel', 16.00),
('pNuNZUWfrTeZDGdcl3xu', NULL, 'Mat brass', '/other-accessories/brass_hinge_caps.png', 'Matinis žalvaris', 'Mat brass', 20.00);

INSERT INTO "public"."hingecaps" ("id", "caps", "default", "en", "lt", "name", "order", "price") VALUES
('bXx08llL77pvHxdsDzUQ', 't', NULL, 'With caps', 'Su gaubteliais', 'With caps', 2, 13.00),
('dEtNzSoeSnQvPPH16LrJ', 'f', 't', 'Without', 'Be gaubtelių', 'Without', 1, 0.00);

INSERT INTO "public"."lockseasyaccessories" ("id", "collection", "en", "image", "lt", "name", "price", "quantifiable") VALUES
('1', 'locks_easy_accessories', 'TAG key', '/locks_easy_accessories/tag.png', 'TAG raktas', 'TAG key', 22.00, 't'),
('2', 'locks_easy_accessories', 'Radio receiver', NULL, 'Radijo imtuvas', 'Radio receiver', 133.00, 'f'),
('3', 'locks_easy_accessories', 'Radio control', '/locks_easy_accessories/radio_control.png', 'Radijo valdymo blokas', 'Radio control', 57.00, 'f'),
('4', 'locks_easy_accessories', 'I/O Logic', '/locks_easy_accessories/io_logic.png', 'Įvesties/Išvesties plokštė', 'I/O Logic', 257.00, 'f'),
('6', 'locks_smart_accessories', 'Diode for polarity protection', NULL, 'Diodas polarizavimo apsaugai', 'Diode for polarity protection', 53.00, 'f');

INSERT INTO "public"."lockseasy" ("id", "accessories", "collection", "en", "image", "lt", "maker", "name", "price", "set") VALUES
('1_FIAMX1R0698', '["1", "2", "3", "4", "6"]', 'locks_easy', 'x1R 0698 lock, power supply, with TAG reader and 3pcs TAG keys', '/locks_easy/tag.png', 'x1R 0698 spyna, maitinimo blokas su TAG skaitytuvu ir 3 TAG raktais', 'FIAM', 'x1R 0698 lock, power supply, with TAG reader and 3pcs TAG keys', 841.00, 'Set No. 1'),
('2_FIAMX1R0698', '["1", "2", "3", "4", "6"]', 'locks_easy', 'x1R 0698 lock, power supply, with external keypad', '/locks_easy/keypad.png', 'x1R 0698 spyna, maitinimo blokas su išoriniu durų kodu', 'FIAM', 'x1R 0698 lock, power supply, with external keypad', 984.00, 'Set No. 2'),
('3_FIAMX1R0698', '["1", "6"]', 'locks_easy', 'x1R 0698 lock, with alkaline batteries, with TAG reader and 3pcs TAG keys', '/locks_easy/tag.png', 'x1R 0698 spyna, su baterijomis, su TAG skaitytuvu ir 3 TAG raktais', 'FIAM', 'x1R 0698 lock, with alkaline batteries, with TAG reader and 3pcs TAG keys', 807.00, 'Set No. 3'),
('4_FIAMX1R0698', '["1", "6"]', 'locks_easy', 'x1R 0698 lock, with alkaline batteries, with external keypad', '/locks_easy/keypad.png', 'x1R 0698 spyna, su baterijomis, su išoriniu durų kodu', 'FIAM', 'x1R 0698 lock, with alkaline batteries, with external keypad', 950.00, 'Set No. 3'),
('5_FIAMX1R0698', '["1", "2", "3", "6"]', 'locks_easy', 'x1R 0698 lock, with rechargeable batteries, with TAG reader and 3pcs TAG keys', '/locks_easy/tag.png', 'x1R 0698 spyna, su pakraunamomis baterijomis, su TAG skaitytuvu ir 3 TAG raktais', 'FIAM', 'x1R 0698 lock, with rechargeable batteries, with TAG reader and 3pcs TAG keys', 1067.00, 'Set No. 5'),
('6_FIAMX1R0698', '["1", "2", "3", "6"]', 'locks_easy', 'x1R 0698 lock, with rechargeable batteries, with external keypad', '/locks_easy/keypad.png', 'x1R 0698 spyna, su pakraunamomis baterijomis, su išoriniu durų kodu', 'FIAM', 'x1R 0698 lock, with rechargeable batteries, with external keypad', 1211.00, 'Set No. 6');

INSERT INTO "public"."lockssmartaccessories" ("id", "collection", "en", "image", "lt", "name", "price", "quantifiable") VALUES
('1', 'locks_smart_accessories', 'Master card set', NULL, 'Pagrindinis kortelių rinkinys', 'Master card set', 33.00, 't'),
('2', 'locks_smart_accessories', 'TAG key', NULL, 'TAG raktas', 'TAG key', 25.00, 't'),
('3', 'locks_smart_accessories', 'User card', NULL, 'Vartotojo kortelė', 'User card', 9.00, 't'),
('4', 'locks_smart_accessories', 'Key fob Iseo', NULL, 'Raktas Iseo', 'Key fob Iseo', 12.00, 't'),
('5', 'locks_smart_accessories', 'SINGLE ACTION (panic) version', NULL, 'Vieno veikimo (panikos) versija', 'SINGLE ACTION (panic) version', 124.00, 'f'),
('6', 'locks_smart_accessories', 'Diode for polarity protection', NULL, 'Diodų apsauga nuo poliarizacijos', 'Diode for polarity protection', 53.00, 'f');

INSERT INTO "public"."lockssmart" ("id", "accessories", "collection", "en", "image", "lt", "maker", "name", "price", "set") VALUES
('1_x1RSMART', '["1", "2", "3", "4", "5", "6"]', 'locks_smart', 'x1R SMART lock, power supply, external TAG reader with Bluetooth', NULL, 'x1R SMART spyna, maitinimo blokas, išorinis TAG skaitytuvas su Bluetooth', 'FIAM', 'x1R SMART lock, power supply, external TAG reader with Bluetooth', 990.00, 'Set No. 1'),
('2_x1RSMART', '["1", "2", "3", "4", "5", "6"]', 'locks_smart', 'x1R SMART locak, power supply, external keypad with integrated reader with Bluetooth', NULL, 'x1R SMART spyna, maitinimo blokas, išorinis durų kodas su integruotu skaitytuvu su Bluetooth', 'FIAM', 'x1R SMART locak, power supply, external keypad with integrated reader with Bluetooth', 1133.00, 'Set No. 2'),
('3_x1RSMART', '["1", "2", "3", "4", "5", "6"]', 'locks_smart', 'x1R SMART lock, alkaline batteries, external TAG reader with Bluetooth', NULL, 'x1R SMART spyna, su baterijomis, išorinis TAG skaitytuvu su Bluetooth', 'FIAM', 'x1R SMART lock, alkaline batteries, external TAG reader with Bluetooth', 929.00, 'Set No. 3'),
('4_x1RSMART', '["1", "2", "3", "4", "5", "6"]', 'locks_smart', 'x1R SMART lock, alkaline batteries, external keypad with integrated reader with Bluetooth', NULL, 'x1R SMART spyna, su baterijomis, su išoriniu durų kodu su integruotu skaitytuvu su Bluetooth', 'FIAM', 'x1R SMART lock, alkaline batteries, external keypad with integrated reader with Bluetooth', 1072.00, 'Set No. 4'),
('5_x1RSMART', '["1", "2", "3", "4", "5", "6"]', 'locks_smart', 'x1R SMART lock, power supply + alkaline batteries, external TAG reader with Bluetooth', NULL, 'x1R SMART spyna, maitinimo blokas, su baterijomis, išorinis TAG skaitytuvas su Bluetooth', 'FIAM', 'x1R SMART lock, power supply + alkaline batteries, external TAG reader with Bluetooth', 1077.00, 'Set No. 5'),
('6_x1RSMART', '["1", "2", "3", "4", "5", "6"]', 'locks_smart', 'x1R SMART lock, power supply + alkaline batteries, external keypad with integrated reader with Bluetooth', NULL, 'x1R SMART spyna, maitinimo blokas, su baterijomis, išorinis durų kodu su integruotu skaitytuvu su Bluetooth', 'FIAM', 'x1R SMART lock, power supply + alkaline batteries, external keypad with integrated reader with Bluetooth', 1220.00, 'Set No. 6');

INSERT INTO "public"."mainlocksadditionalaccessories" ("id", "collection", "en", "image", "lt", "name", "price", "quantifiable") VALUES
('1', 'main_locks_additional_accessories', 'Mat chrome', NULL, 'Matinis chromas', 'Mat chrome', 28.00, 'f'),
('2', 'main_locks_additional_accessories', 'Mat brass finishing', NULL, 'Matinis žalvaris', 'Mat brass finishing', 28.00, 'f'),
('3', 'main_locks_additional_accessories', 'Black finish', NULL, 'Juoda', 'Black finish', 20.00, 'f'),
('4', 'main_locks_additional_accessories', 'Square finish', NULL, 'Kvadratinis', 'Square finish', 14.00, 'f');

INSERT INTO "public"."millingimages" ("id", "image") VALUES
('704SVXqze0HKjnfB9e4j', '/millings/AF.png'),
('CHI7Wdhza7XgpPPiYTUc', '/millings/DF.png'),
('Mz7W2CMVY90BAg6k3QAI1', '/millings/10F.png'),
('Oozt7XlPebI2FvrElt0j', '/millings/5F.png'),
('QRAfNJzbzTyjUyGxw2Uj', '/millings/victoria.png'),
('mZ3Yq4aveG53H9cv8QeD', '/millings/VF.png'),
('pDYqSHIM7FAxNiOKXn1x', '/millings/MF.png'),
('xzwAL7dI08IcVim2zt9d', '/millings/AR.png'),
('y0da48UIZy7rm53E4cZu', '/millings/MF_baguettes.png');

INSERT INTO "public"."stainedcolors" ("id", "color_type", "image", "name") VALUES
('GerL1', 'wrb', '/stained_colors/GerL1.png', 'Natural Light Okoume'),
('GerL13', 'wrb', '/stained_colors/GerL13.png', 'XHT PL 12 Okoume'),
('GerL2', 'wrb', '/stained_colors/GerL2.png', 'Natural Dark Okoume'),
('GerL4', 'wrb', '/stained_colors/GerL4.png', 'XHT PL 03 Okoume'),
('GerL5', 'wrb', '/stained_colors/GerL5.png', 'XHT PL 09 Okoume'),
('GerL7', 'wrb', '/stained_colors/GerL7.png', 'XHT PL 08 Okoume'),
('GerL9', 'wrb', '/stained_colors/GerL9.png', 'XHT PL 02 Okoume');

INSERT INTO "public"."thresholdoptions" ("id", "alt_price", "double_leaf_en", "double_leaf_lt", "double_leaf_name", "double_leaf_price", "en", "has_double_leaf", "lt", "name", "price", "image") VALUES
('8405v3QdIeFqSx7Qbxy7', '0', NULL, NULL, NULL, NULL, 'Bolt into the floor, sleeve for bolt supplied by client"', NULL, 'Varžtas į grindis, rankovė kliento', 'Bolt into the floor, sleeve for bolt supplied by client"', 0.00, NULL),
('Hkx2rwzn8mcaEJW7On8j', '193', 'Down sliding door seal for double-leaf door', 'Žemyn slankiojantis kištukas dvivyrėm durims', 'Down sliding door seal for double-leaf door', 146.00, 'Down sliding door seal for single-leaf door', 't', 'Žemyn slankiojantis kištukas vienvyrėm durims', 'Down sliding door seal for single-leaf door', 96.00, '/other_accessories/door-lock.png'),
('RTDEHQUBadgJgHm5vPQ1', '0', NULL, NULL, NULL, NULL, 'No lock pin into the bottom', NULL, 'Jokio kištuko apačioje', 'No lock pin into the bottom', 0.00, NULL);

INSERT INTO "public"."otheraccessories" ("id", "en", "group", "image", "lt", "name", "price", "quantifiable", "umbrella", "quantity") VALUES
('0SaHo1ZPYpnYTcIQp505', 'Adjustable latch', 'latch', NULL, 'Reguliuojama sklęstis', 'Adjustable latch', 48.00, NULL, 'misc', NULL),
('0vpCYoomf4s625AxWVB', 'Door closer GEZE TS 4000 (EN 1-6)', 'door_closer', '/other_accessories/door_closer_geze.png', 'Durų uždarytojas GEZE TS 4000 (EN 1-6)', 'Door closer GEZE TS 4000 (EN 1-6)', 69.00, NULL, 'misc', NULL),
('0z3pzPBZiYTlcDyKbZc', 'Drilling for plate (without plate) into the frame for LP711 for 1st lock', 'drilling', NULL, 'Gręžimas plokštės (be plokštės) į rėmą LP711 pirmajai spynai', 'Drilling for plate (without plate) into the frame for LP711 for 1st lock', 0.00, NULL, 'misc', NULL),
('32B2iqm2d6gKqOfMKiPg', 'USA assembled frame for double door', 'friend', NULL, 'JAV surinktas rėmas, dvivėrėms durims', 'USA assembled frame for double door', 265.00, NULL, 'misc', NULL),
('3XLDqVq6PynumRJZRjz', 'Reinforced wooden box, double door', 'xxxpacking', NULL, 'Sustiprintą medinę dėžę dvivėrėms durims', 'Reinforced wooden box, double door', 175.00, NULL, 'packing', NULL),
('3daPasYpYoMnCLGaNK', 'Packing into reinforced wooden crates', 'xxxpacking', '/other_accessories/packing_reinforced.jpeg', 'Pakavimas į sustiprintas medinės dėžės', 'Packing into reinforced wooden crates', 117.00, NULL, 'packing', NULL),
('3zY1OdFI6lHr6yKDat', 'EI30 fire resistance', 'fire', NULL, 'EI30 atsparumas ugniai', 'EI30 fire resistance', 159.00, NULL, 'misc', NULL),
('4CMiJjf1brMRcBLEyAH', '16 mm Chrome', 'eyespot', NULL, '16 mm chromas', '16 mm Chrome', 5.00, NULL, 'eyespot', NULL),
('4cuNbPNlZxvwlMPLYJG', 'Protective plate for the lock Assa/Dorma', 'protective_plate', '/other_accessories/protective_plate_assa.png', 'Apsauginė plokštelė Assa/Dorma', 'Protective plate for the lock Assa/Dorma', 19.00, NULL, 'misc', NULL),
('4oZmGlo1UVbtSKQya6h', 'The drip from the rain for double door (at the bottom of the door)', 'rain_drip', '/other_accessories/drip.png', 'Lietaus nuotekinis dvivėrėms durims (apačioje durų)', 'The drip from the rain for double door (at the bottom of the door)', 49.00, NULL, 'misc', NULL),
('4uBknezpmGnA1JLb6uF', 'Extra 3 pin locking mechanism (switchlock) Mottura 96087L 1 unit', 'extra_lock', '/other_accessories/extra_lock_mottura.png', 'Papildomas 3 vienetų rakinama mechanizmas (switchlock) Mottura 96087L', 'Extra 3 pin locking mechanism (switchlock) Mottura 96087L 1 unit', 56.00, 't', 'misc', 1),
('6uBnnicX7JudHZKWenJ', 'Drilling for plate (without plate) into the frame for LP711 for 2nd lock', 'drilling', NULL, 'Gręžimas plokštės (be plokštės) į rėmą LP711 antrai spynai', 'Drilling for plate (without plate) into the frame for LP711 for 2nd lock', 0.00, NULL, 'misc', NULL),
('7LbEfvdIuIuShnxzOK', 'Packing into wooden box (double door)', 'xpacking', '/other_accessories/wooden_box_2.jpeg', 'Pakavimas į medinę dėžę dvivėrėms durims', 'Packing into wooden box (double door)', 74.00, NULL, 'packing', NULL),
('9AFoYYnFHgQJcHbmdKv', 'Individual design, doors by picture', 'individual', NULL, 'Individualus dizainas, pagal nuotrauką', 'Individual design, doors by picture', 36.00, NULL, 'misc', NULL),
('9HoLt3S4nI6CDDUR03G', 'Drilling to magnetic sensor EA500, without the sensor', 'drilling', NULL, 'Gręžimas magnetiniam sensoriui (be sensorius) EA500', 'Drilling to magnetic sensor EA500, without the sensor', 8.00, NULL, 'misc', NULL),
('9T4gvmkZYInJMMNqFiU', 'Packing into stretch film (PVC)', 'xxxpacking', NULL, 'Pakavimas į plėvelę (PVC)', 'Packing into stretch film (PVC)', 6.00, NULL, 'packing', NULL),
('9hgrHozGivaNS4jCOF52', 'Fumigated pallet, single door', 'xxxxpacking', NULL, 'Smiltykta paletė, vienįvėrėm durims', 'Fumigated pallet, single door', 117.00, NULL, 'packing', NULL),
('9jJiFHgqYNSfGKbtml', 'Door closer GEZE TS 4000S (EN 1-6)', 'door_closer', '/other_accessories/door_closer_geze.png', 'Durų uždarytojas GEZE TS 4000S (EN 1-6)', 'Door closer GEZE TS 4000S (EN 1-6)', 99.00, NULL, 'misc', NULL),
('9kXnqRRyXQqRVXZGMXP', 'OL seal', 'seals', '/other_accessories/ol.jpeg', 'OL sandaruodas', 'OL seal', 14.00, NULL, 'misc', NULL),
('9rYqgzNeJjaypdHXlRm3', 'Alarm sensor installation (sensor supplied by client)', 'alarm_sensor', NULL, 'Signalizacijos montavimas (patekstas kliento)', 'Alarm sensor installation (sensor supplied by client)', 40.00, NULL, 'misc', NULL),
('AVD4NETnbfZQZYWVKBF', 'The hole for the post box (without box installation)', 'postbox', '/other_accessories/postbox_hole.jpeg', 'Skylė pašto', 'The hole for the post box (without box installation)', 14.00, NULL, 'misc', NULL),
('FaJYE69I00UEpyqldS', 'Wider frame', 'frame', NULL, 'Platenis rėmas', 'Wider frame', 175.00, NULL, 'misc', NULL),
('GuHfA1wC8PRXqPVCKJ', 'Door prepared for the door closer for inside of door-leaf to install customers own door closer', 'door_closer', NULL, 'Durų paruošimas durų uždaryojui panelių viduje pasiieiko tik duris', 'Door prepared for the door closer for inside of door-leaf to install customers own door closer', 23.00, NULL, 'misc', NULL),
('H7TmRj6v7CZznr5d15Rq', 'Lead cover (for electronic locks)', 'lead_cover', '/other_accessories/lead_cover.png', 'Laido dangtelės (elektroninems spynoms)', 'Lead cover (for electronic locks)', 40.00, 't', 'misc', 1),
('IAGELsJJRZRyp4FZvY5V', 'Door closer DORMA TS83 (EN 2-5 / EN 3-6) (only silver)', 'door_closer', '/other_accessories/door_closer_dorma.png', 'Durų uždarytojas DORMA TS83 / EN 2-5 / EN 3-6) (tik sidabrinis)', 'Door closer DORMA TS83 (EN 2-5 / EN 3-6) (only silver)', 56.00, NULL, 'umbrella', NULL),
('IXPW87YPRKhlfn44WSe', 'Door closer DORMA ITS96 (EN3-6) with hold open', 'door_closer', NULL, 'Durų uždarytojas DORMA ITS96 (EN3-6) su atlaikymu durti palaikymi', 'Door closer DORMA ITS96 (EN3-6) with hold open', 408.00, NULL, 'misc', NULL),
('JFYi9PMDKEvJRNpJAHxd', '16 mm Mat Chrome', 'eyespot', NULL, '16 mm matinis chromas', '16 mm Mat Chrome', 5.00, NULL, 'eyespot', NULL),
('KsnyIXV4YKud9XaKYklc', 'Chain (door limiter) MOTTURA 96254 (can be fully locked), chrome', 'door_limiter', '/other_accessories/chain.png', 'Grandinėlė MOTTURA 96254 (gali būti pilnai užrakinama), chromas', 'Chain (door limiter) MOTTURA 96254 (can be fully locked), chrome', 37.00, NULL, 'misc', NULL),
('LQIB2qU006IYphfhKf', 'TB6 frame double door', 'frame', NULL, 'TB6 rėmas dvivėroms durys', 'TB6 frame double door', 422.00, NULL, 'misc', NULL),
('M7PevdlrZYfEauzn2HWg', 'Mat stainless steel accessory up to 0.3 m2 on the finish board', 'accessory_plate', '/other_accessories/mat_stainless_steel_accessory_2.png', 'Matinis nerūdijančio pleno aksesuaras iki 0.3 m2 ant baigimo plokštės', 'Mat stainless steel accessory up to 0.3 m2 on the finish board', 38.00, NULL, 'misc', NULL),
('MRjCeJyuXAYVQ3XpvZ', 'Bolt position sensor installation (sensor supplied by client)', 'alarm_sensor', NULL, 'Varžtų pozicijos sensoriaus montavimas (sensorius pateiktas kliento)', 'Bolt position sensor installation (sensor supplied by client)', 40.00, NULL, 'misc', NULL),
('MrfsTnlWqgJSdlzRuGD', 'Plate into door frame (for the main scandinavian lock)', 'doorframe_plate', '/other_accessories/main_lock_plate.png', 'Plokštė į duris rėmą (pagrindinės skandinaviškoms spynoms)', 'Plate into door frame (for the main scandinavian lock)', 16.00, NULL, 'misc', NULL),
('OqsZ8JEJIq5dA036UIQ', 'TB4 frame double door', 'frame', NULL, 'TB4 rėmas dvivėroms durims', 'TB4 frame double door', 159.00, NULL, 'misc', NULL),
('PPjb4byMkbSWl2vJ64K', 'TB6 frame single door', 'frame', NULL, 'TB6 rėmas vienįvėrėms durims', 'TB6 frame single door', 211.00, NULL, 'misc', NULL),
('PwfSauDbRvnEXPOPgwrT', '16 mm Mat Brass16 mm Mat Brass', 'eyespot', NULL, '16 mm matinis žalvaris', '16 mm Mat Brass', 5.00, NULL, 'eyespot', NULL),
('SgmoCl54UVGmSFMPHm', 'Reinforced frame hinges side', 'frame', NULL, 'Sustiprintas rėmas iš vyliū pusės', 'Reinforced frame hinges side', 21.00, NULL, 'misc', NULL),
('TF2dTAnzn129qTFjN2Z', 'Packing into wooden box (single door)', 'xpacking', '/other_accessories/wooden_box_2.jpeg', 'Pakavimas į medinę dėžę (vienoms durims)', 'Packing into wooden box (single door)', 53.00, NULL, 'packing', NULL),
('TPjsLDZ3HAqZpaKhFn1', 'Fumigated pallet, double door', 'xxxxpacking', NULL, 'Smiltykta paletė dviguboms durims', 'Fumigated pallet, double door', 101.00, NULL, 'packing', NULL),
('TeQaNDTkwpkTfHfcIS3', 'Alarm sensor', 'alarm_sensor', '/other_accessories/alarm_sensor.png', 'Signalizacija', 'Alarm sensor', 17.00, NULL, 'misc', NULL),
('Tj44yxA7nFT9sdWQpSP5', 'Installation screws', 'screws', NULL, 'Montavimo varžtai', 'Installation screws', 6.00, 'f', 'misc', NULL),
('VGXEXpn1rdTB31BSAh5', 'Tubes inside the frame for 1st lock s cables, going up in the frame, without cables', 'tubes', NULL, 'Vamzdeliai laidams pirmajai spynaį ir vaidus, be laida', 'Tubes inside the frame for 1st lock s cables, going up in the frame, without cables', 13.00, 't', 'misc', NULL),
('XVIBbM3w7ubK94ScNGs', 'Door closer DORMA ITS96 (EN2-4) hidden into the door', 'door_closer', '/other_accessories/door_closer_dorma_hidden.png', 'Durų uždarytojas DORMA ITS96 (EN2-4) paslėptas duris viduje', 'Door closer DORMA ITS96 (EN2-4) hidden into the door', 318.00, NULL, 'misc', NULL),
('YCTPB3hf6cPtavAst4QU4W', 'Protective plate for the lock Mottura (suitable for Mottura and Fiam locks)', 'protective_plate', '/other_accessories/protective_plate_mottura.png', 'Apsauginė plokštė spynoms Mottura (tinka Mottura ir Fiam spynoms)', 'Protective plate for the lock Mottura (suitable for Mottura and Fiam locks)', 14.00, NULL, 'misc', NULL),
('YCbxtoVhblS5ot5aWjZR', 'Anti-smoke elements Sm S200', 'fire', NULL, 'Anti dūminiai elementai Sm S200', 'Anti-smoke elements Sm S200', 21.00, NULL, 'misc', NULL),
('acKCQPoBZzhOxqpHnAK', '22 mm Chrome', 'eyespot', '/other_accessories/eyespot.png', '22 mm chromas', '22 mm Chrome', 9.00, NULL, 'eyespot', NULL),
('b1nFmrZfQLzLlF4YFY6', 'Packing for project (8 doors/pallet)', 'xxpacking', '/other_accessories/project.jpeg', 'Pakavimas projektui (8 durys/paletė)', 'Packing for project (8 doors/pallet)', 11.00, NULL, 'packing', NULL),
('bsBleRB6Zz0r9CrE4sju', 'Tubes for 1st lock cable to the door leaf, without cables', 'tubes', NULL, 'Vamzdeliai pirmosiios spynos laidams į durų lakštą, be laido', 'Tubes for 1st lock cable to the door leaf, without cables', 13.00, 't', 'misc', NULL),
('f0DTVpZSA0X5RqKQMGz', 'OL seals for double door', 'seals', '/other_accessories/ol.jpeg', 'OL sandaruodai dvivėrėms durims', 'OL seals for double door', 28.00, NULL, 'misc', NULL),
('fhGSaW1JsZzlJLkNCqxn', 'The hole for the post box (with client box installation)', 'postbox', '/other_accessories/postbox_hole_other.png', 'Skylė pašto (su kliento pašto dėžės montavimu)', 'The hole for the post box (with client box installation)', 30.00, NULL, 'misc', NULL),
('fuKvmVzlt2SiKBBVOjpvY', 'Chain (door limiter) MOTTURA 96254 (can be fully locked), mat chrome or mat brass', 'door_limiter', '/other_accessories/chain.png', 'Grandinėlė (door limiter) MOTTURA 96254 (gali būti pilnai užrakinama), matinis chromas arba matinis žalvaris', 'Chain (door limiter) MOTTURA 96254 (can be fully locked), mat chrome or mat brass', 47.00, NULL, 'misc', NULL),
('hEmklef8h7LtyRofckjj', 'Mat stainless steel accessory up to 0.3 m2 on the bottom of the finish board', 'accessory_plate', '/other_accessories/mat_stainless_steel_accessory.png', 'Matinis nerūdijančio pleno aksesuaras iki 0.3 m2 apačioje', 'Mat stainless steel accessory up to 0.3 m2 on the bottom of the finish board', 38.00, NULL, 'misc', NULL),
('hyqVV4docBtQQXBPPlks', '(EN3-6) hidden into the door leaf', 'door_closer', '/other_accessories/door_closer_dorma_hidden.png', '(EN3-6) Paslėptas durų lakšte', '(EN3-6) hidden into the door leaf', 387.00, NULL, 'misc', NULL),
('iIev56lno9AT06VmGntL', 'Special pallet according to door measurements', 'xxxpacking', NULL, 'Special paletė pagal išmatavimus', 'Special pallet according to door measurements', 42.00, NULL, 'packing', NULL),
('jSkK8CpdNKSWSOQ9BLHh', 'The drip from the rain (at the bottom of the door)', 'rain_drip', '/other_accessories/drip.png', 'Lietaus nuotėkis (apačioje)', 'The drip from the rain (at the bottom of the door)', 24.00, NULL, 'misc', NULL),
('jkU7BURTjoKKSR6M09qT', 'Special round detail for Abloy cylinder. Cylinder cover welded to steel part of the door leaf. Steel thickness of the round metal is 3 mm, Inner diameter ~73 mm. The height 35 mm', 'locks', NULL, 'Specialus aksesuaras Abloy cilindrui. Cilindro gaubtus privirinta prie plieninis plokštės~73 mm. Vidinis diametras ~73 mm. Aukštis 35 mm', 'Special round detail for Abloy cylinder. Cylinder cover welded to steel part of the door leaf. Steel thickness of the round metal is 3 mm, Inner diameter ~73 mm. The height 35 mm', 17.00, 't', 'misc', 1),
('jvjOAxnqJrVb3ak1QPeQ', 'Packing into corrugated cardboard (single door)', 'xpacking', '/other_accessories/corrugated.jpeg', 'Pakavimas į gofruotą kartoną (vienoms durims)', 'Packing into corrugated cardboard (single door)', 15.00, NULL, 'packing', NULL),
('kVnanYeoTmKGyU6NXzH', '22 mm Mat Chrome', 'eyespot', NULL, '22 mm matinis chromas', '22 mm Mat Chrome', 12.00, NULL, 'eyespot', NULL),
('lRzcyvmxqJpEsXaDCK5', 'The clearance between the frame and the door leaf = 1 mm less than normal at the lock side', 'frame', NULL, 'Tarpas tarp durų ir rėmo = 1 mm mažesnės nei įprasto spynos pusėje', 'The clearance between the frame and the door leaf = 1 mm less than normal at the lock side', 0.00, NULL, 'misc', NULL),
('lVtIdbuaPzFYfoUHquBOK', 'Lead cover Abloy EA281 (long), installed so that the cable goes up in the frame', 'lead_cover', NULL, 'Laido dangtelės Abloy EA281 (ilgas), sumontuotas kad kabelis goes up in the frame', 'Lead cover Abloy EA281 (long), installed so that the cable goes up in the frame', 45.00, 't', 'misc', NULL),
('mLHroEAIvyy3N11YVLA', '22 mm Mat Brass', 'eyespot', '/other_accessories/eyespot_brass.jpeg', '22 mm matinis žalvaris', '22 mm Mat Brass', 12.00, NULL, 'eyespot', NULL),
('mt37hooucmUBCl5VLyBC', 'Fire resistance EI30/EI45', 'fire', '/other_accessories/fire-resist.png', 'Atsparumus ugniai EI30/EI45', 'Fire resistance EI30/EI45', 39.00, NULL, 'misc', NULL),
('nZSAqNf9XVkYTnIqhIb', 'FB4 frame single door', 'frame', NULL, 'FB4 rėmas vienįvėrėms durims', 'FB4 frame single door', 80.00, NULL, 'misc', NULL),
('oNENapSepP1nYTmzTn3v', 'Adjustable plate into door frame (for the main safe lock)', 'doorframe_plate', '/other_accessories/adjustable-plate.png', 'Reguliuojama plokštelė į durų rėmą (pagrindinei spynai)', 'Adjustable plate into door frame (for the main safe lock)', 23.00, NULL, 'misc', NULL),
('qQV5PYYFmAcPkbNb6ec3', 'Packing into corrugated cardboard (double door)', 'xpacking', '/other_accessories/corrugated.jpeg', 'Pakavimas į gofruotą kartoną (dvivėrėms durims)', 'Packing into corrugated cardboard (double door)', 30.00, NULL, 'packing', NULL),
('tkIV3EESmteersNVYyabu', '16 mm Fireproof, chrome', 'eyespot', '/other_accessories/eyespot_fireproof.jpeg', '16 mm atsparūs liepsnai, chromas', '16 mm Fireproof, chrome', 9.00, NULL, 'eyespot', NULL);



-- Comments
COMMENT ON TABLE "public"."bulletproofmodel" IS 'Bulletproof door models and security configurations';


-- Indices
CREATE UNIQUE INDEX buletproofmodel_pkey ON public.bulletproofmodel USING btree (id);


-- Comments
COMMENT ON TABLE "public"."mainlocks" IS 'Main door locking mechanisms and security hardware';


-- Indices
CREATE INDEX idx_mainlocks_collection ON public.mainlocks USING btree (collection);
CREATE INDEX idx_mainlocks_order ON public.mainlocks USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."hinges" IS 'Hinge options and quantities';


-- Comments
COMMENT ON TABLE "public"."pvccolors" IS 'Available PVC color options and finishes';


-- Indices
CREATE INDEX idx_pvccolors_order ON public.pvccolors USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."finishings" IS 'Surface finishings and treatments';


-- Indices
CREATE INDEX idx_finishings_order ON public.finishings USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."cylinders" IS 'Lock cylinders and key systems';


-- Indices
CREATE INDEX idx_cylinders_group ON public.cylinders USING btree ("group");


-- Comments
COMMENT ON TABLE "public"."doortypeprices" IS 'Door type pricing configurations';


-- Comments
COMMENT ON TABLE "public"."logos" IS 'Company logos and branding elements';


-- Comments
COMMENT ON TABLE "public"."standardmetalcolors" IS 'Standard RAL metal color options';


-- Indices
CREATE INDEX idx_standardmetalcolors_order ON public.standardmetalcolors USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."glassnew" IS 'New glass types and glazing systems';


-- Comments
COMMENT ON TABLE "public"."millings" IS 'Milling and routing options for door surfaces';


-- Comments
COMMENT ON TABLE "public"."dimensionsmax" IS 'Max door dimensions and pricing matrix';


-- Comments
COMMENT ON TABLE "public"."doorfinishingsandmillings" IS 'Door finishing and milling combinations';


-- Comments
COMMENT ON TABLE "public"."dooropenings" IS 'Door opening configurations and hardware';


-- Indices
CREATE INDEX idx_dooropenings_key ON public.dooropenings USING btree (key);


-- Comments
COMMENT ON TABLE "public"."electricstrikes" IS 'Electric strike plates and hardware';


-- Indices
CREATE INDEX idx_electricstrikes_maker ON public.electricstrikes USING btree (maker);


-- Comments
COMMENT ON TABLE "public"."exploitationconditions" IS 'Operating and exploitation conditions';


-- Comments
COMMENT ON TABLE "public"."extracylinders" IS 'Additional cylinder options';


-- Indices
CREATE INDEX idx_extracylinders_group ON public.extracylinders USING btree ("group");


-- Comments
COMMENT ON TABLE "public"."extralocks" IS 'Additional locking mechanisms';


-- Indices
CREATE INDEX idx_extralocks_maker ON public.extralocks USING btree (maker);


-- Comments
COMMENT ON TABLE "public"."glassaddontypes" IS 'Glass addon and enhancement types';


-- Comments
COMMENT ON TABLE "public"."thresholds" IS 'Door threshold and sill options';


-- Indices
CREATE INDEX idx_thresholds_group ON public.thresholds USING btree ("group");
CREATE INDEX idx_thresholds_order ON public.thresholds USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."carvings" IS 'Decorative carvings and design elements';


-- Comments
COMMENT ON TABLE "public"."doortypesactual" IS 'Actual door type configurations';


-- Indices
CREATE INDEX idx_doortypesactual_name ON public.doortypesactual USING btree (name);


-- Comments
COMMENT ON TABLE "public"."categories" IS 'Product categories and classifications';


-- Indices
CREATE INDEX idx_categories_order ON public.categories USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."doormodels" IS 'Available door types and models';


-- Indices
CREATE INDEX idx_doortypes_order ON public.doormodels USING btree ("order");
CREATE UNIQUE INDEX doortypes_pkey ON public.doormodels USING btree (id);


-- Comments
COMMENT ON TABLE "public"."architraves" IS 'Door frame components and architrave products';


-- Indices
CREATE INDEX idx_architraves_group ON public.architraves USING btree ("group");
CREATE INDEX idx_architraves_side ON public.architraves USING btree (side);
CREATE INDEX idx_architraves_order ON public.architraves USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."users" IS 'System users with permissions and preferences';


-- Indices
CREATE INDEX idx_users_email ON public.users USING btree (email);
CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


-- Comments
COMMENT ON TABLE "public"."translations" IS 'System translations for multilingual support';


-- Comments
COMMENT ON TABLE "public"."dimensionsclassic" IS 'Classic door dimensions and pricing matrix';


-- Comments
COMMENT ON TABLE "public"."handles" IS 'Door handles and hardware components';


-- Indices
CREATE INDEX idx_handles_group ON public.handles USING btree ("group");
CREATE INDEX idx_handles_order ON public.handles USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."glass" IS 'Glass types and glazing options';


-- Comments
COMMENT ON TABLE "public"."glassaddon" IS 'Glass addons and enhancements';


-- Comments
COMMENT ON TABLE "public"."glassbulletproofsizes" IS 'Bulletproof glass sizes and configurations';


-- Comments
COMMENT ON TABLE "public"."glassfilm" IS 'Glass films and protective coatings';


-- Comments
COMMENT ON TABLE "public"."glassshapebulletproof" IS 'Bulletproof glass shapes and forms';


-- Comments
COMMENT ON TABLE "public"."glasstypenew" IS 'New glass type classifications';


-- Comments
COMMENT ON TABLE "public"."glasstype" IS 'Glass type classifications';


-- Comments
COMMENT ON TABLE "public"."hingeaccessories" IS 'Hinge accessories and components';


-- Comments
COMMENT ON TABLE "public"."hingecapfinishings" IS 'Hinge cap finishings and treatments';


-- Comments
COMMENT ON TABLE "public"."hingecaps" IS 'Hinge caps and covers';


-- Indices
CREATE INDEX idx_hingecaps_order ON public.hingecaps USING btree ("order");


-- Comments
COMMENT ON TABLE "public"."lockseasyaccessories" IS 'Easy lock accessories and components';


-- Comments
COMMENT ON TABLE "public"."lockseasy" IS 'Easy-install lock systems';


-- Indices
CREATE INDEX idx_lockseasy_collection ON public.lockseasy USING btree (collection);


-- Comments
COMMENT ON TABLE "public"."lockssmartaccessories" IS 'Smart lock accessories and components';


-- Comments
COMMENT ON TABLE "public"."lockssmart" IS 'Smart lock systems and electronic hardware';


-- Indices
CREATE INDEX idx_lockssmart_collection ON public.lockssmart USING btree (collection);


-- Comments
COMMENT ON TABLE "public"."mainlocksadditionalaccessories" IS 'Additional accessories for main locks';


-- Comments
COMMENT ON TABLE "public"."millingimages" IS 'Milling pattern images and visuals';


-- Comments
COMMENT ON TABLE "public"."stainedcolors" IS 'Stained color options and finishes';


-- Comments
COMMENT ON TABLE "public"."thresholdoptions" IS 'Threshold configuration options';


-- Comments
COMMENT ON TABLE "public"."otheraccessories" IS 'Miscellaneous accessories and components';


-- Indices
CREATE INDEX idx_otheraccessories_group ON public.otheraccessories USING btree ("group");
