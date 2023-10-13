CREATE DATABASE things_catalog;
CREATE TABLE genres(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  name VARCHAR(250) NOT NULL
);
CREATE TABLE sources(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  name VARCHAR(250) NOT NULL
);
CREATE TABLE authors(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  first_name VARCHAR(250) NOT NULL,
  last_name VARCHAR(250) NOT NULL,
);
CREATE TABLE labels(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  title VARCHAR(250) NOT NULL,
  color VARCHAR(250) NOT NULL,
);
CREATE TABLE books(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  source_id INT REFERENCES sources(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  publisher VARCHAR(250) NOT NULL,
  cover_state VARCHAR(250) NOT NULL,
);
CREATE TABLE movies(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  source_id INT REFERENCES sources(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  silent BOOLEAN NOT NULL,
);
CREATE TABLE music(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  source_id INT REFERENCES sources(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  on_spotify BOOLEAN NOT NULL,
);
CREATE TABLE games(
  id INT GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
  author_id INT REFERENCES authors(id),
  genre_id INT REFERENCES genres(id),
  source_id INT REFERENCES sources(id),
  label_id INT REFERENCES labels(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  multiplayer BOOLEAN NOT NULL,
  last_played_at DATE NOT NULL,
);