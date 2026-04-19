-- Created by Redgate Data Modeler (https://datamodeler.redgate-platform.com)
-- Last modification date: 2026-04-19 10:35:01.798

-- tables
-- Table: buses
CREATE TABLE buses (
    id integer NOT NULL CONSTRAINT buses_pk PRIMARY KEY AUTOINCREMENT,
    number text NOT NULL,
    name text NOT NULL,
    total_mileage real NOT NULL DEFAULT 0,
    photo blob,
    CONSTRAINT unique_number UNIQUE (number)
);

-- Table: crew
CREATE TABLE crew (
    id integer NOT NULL CONSTRAINT crew_pk PRIMARY KEY AUTOINCREMENT,
    last_name text NOT NULL,
    text_id text NOT NULL,
    experience integer NOT NULL DEFAULT 0,
    category text,
    address text,
    birth_year integer,
    bus_id integer NOT NULL,
    CONSTRAINT unique_text_id UNIQUE (text_id),
    CONSTRAINT crew_buses FOREIGN KEY (bus_id)
    REFERENCES buses (id)
);

-- Table: routes
CREATE TABLE routes (
    id integer NOT NULL CONSTRAINT routes_pk PRIMARY KEY AUTOINCREMENT,
    name text NOT NULL,
    start_point text NOT NULL,
    end_point text NOT NULL,
    length real NOT NULL
);

-- Table: trips
CREATE TABLE trips (
    id integer NOT NULL CONSTRAINT trips_pk PRIMARY KEY AUTOINCREMENT,
    bus_id integer NOT NULL,
    route_id integer NOT NULL,
    departure_date text NOT NULL,
    arrival_date text NOT NULL,
    passengers_count integer NOT NULL DEFAULT 0,
    ticket_price real NOT NULL DEFAULT 0,
    CONSTRAINT trips_buses FOREIGN KEY (bus_id)
    REFERENCES buses (id),
    CONSTRAINT trips_routes FOREIGN KEY (route_id)
    REFERENCES routes (id)
);

-- Table: users
CREATE TABLE users (
    id integer NOT NULL CONSTRAINT users_pk PRIMARY KEY AUTOINCREMENT,
    login text NOT NULL,
    password text NOT NULL,
    role text NOT NULL,
    full_name text,
    CONSTRAINT unique_login UNIQUE (login)
);

-- End of file.

