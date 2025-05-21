CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  description TEXT,
  distance_from_earth INT NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  galaxy_type VARCHAR(30)
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  galaxy_id INT NOT NULL REFERENCES galaxy(galaxy_id),
  temperature INT NOT NULL,
  has_life BOOLEAN NOT NULL,
  star_type VARCHAR(30)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  star_id INT NOT NULL REFERENCES star(star_id),
  has_life BOOLEAN NOT NULL,
  is_spherical BOOLEAN NOT NULL,
  distance_from_star INT,
  mass NUMERIC(10, 2)
);

CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(50) UNIQUE NOT NULL,
  planet_id INT NOT NULL REFERENCES planet(planet_id),
  is_spherical BOOLEAN NOT NULL,
  age_in_millions_of_years INT NOT NULL,
  moon_type VARCHAR(30)
);

CREATE TABLE planet_type (
  planet_type_id SERIAL PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL,
  description TEXT,
  is_gas_giant BOOLEAN NOT NULL,
  average_density NUMERIC(5, 2)
);

INSERT INTO galaxy (name, description, distance_from_earth, is_spherical, galaxy_type) VALUES
  ('Milky Way', 'Our home galaxy', 0, true, 'Spiral'),
  ('Andromeda', 'Nearest spiral galaxy', 2500000, true, 'Spiral'),
  ('Triangulum', 'Small spiral galaxy', 3000000, true, 'Spiral'),
  ('Whirlpool', 'Galaxy with prominent arms', 23000000, true, 'Spiral'),
  ('Sombrero', 'Bright central bulge', 29000000, false, 'Spiral'),
  ('Messier 87', 'Elliptical galaxy', 53000000, false, 'Elliptical');

INSERT INTO star (name, galaxy_id, temperature, has_life, star_type) VALUES
  ('Sun', 1, 5778, true, 'G-type'),
  ('Sirius', 1, 9940, false, 'A-type'),
  ('Betelgeuse', 1, 3500, false, 'M-type'),
  ('Rigel', 2, 12100, false, 'B-type'),
  ('Vega', 2, 9602, false, 'A-type'),
  ('Proxima Centauri', 1, 3042, false, 'M-type');

INSERT INTO planet (name, star_id, has_life, is_spherical, distance_from_star, mass) VALUES
  ('Earth', 1, true, true, 150, 5.97),
  ('Mars', 1, false, true, 228, 0.64),
  ('Venus', 1, false, true, 108, 4.87),
  ('Jupiter', 1, false, true, 778, 1898),
  ('Saturn', 1, false, true, 1430, 568),
  ('Uranus', 1, false, true, 2870, 86.8),
  ('Neptune', 1, false, true, 4500, 102),
  ('Kepler-22b', 4, false, true, 600, 36),
  ('Gliese 581g', 6, false, true, 20, 3.1),
  ('HD 209458 b', 5, false, true, 1500, 220),
  ('TRAPPIST-1e', 6, false, true, 39, 0.62),
  ('TRAPPIST-1f', 6, false, true, 39, 0.68);

INSERT INTO moon (name, planet_id, is_spherical, age_in_millions_of_years, moon_type) VALUES
  ('Moon', 1, true, 4500, 'Terrestrial'),
  ('Phobos', 2, false, 4500, 'Captured Asteroid'),
  ('Deimos', 2, false, 4500, 'Captured Asteroid'),
  ('Io', 4, true, 4500, 'Volcanic'),
  ('Europa', 4, true, 4500, 'Icy'),
  ('Ganymede', 4, true, 4500, 'Icy'),
  ('Callisto', 4, true, 4500, 'Icy'),
  ('Titan', 5, true, 4500, 'Icy'),
  ('Rhea', 5, true, 4500, 'Icy'),
  ('Iapetus', 5, true, 4500, 'Icy'),
  ('Dione', 5, true, 4500, 'Icy'),
  ('Tethys', 5, true, 4500, 'Icy'),
  ('Enceladus', 5, true, 4500, 'Icy'),
  ('Miranda', 6, true, 4500, 'Icy'),
  ('Ariel', 6, true, 4500, 'Icy'),
  ('Umbriel', 6, true, 4500, 'Icy'),
  ('Titania', 6, true, 4500, 'Icy'),
  ('Oberon', 6, true, 4500, 'Icy'),
  ('Triton', 7, true, 4500, 'Icy'),
  ('Nereid', 7, true, 4500, 'Icy');

INSERT INTO planet_type (name, description, is_gas_giant, average_density) VALUES
  ('Terrestrial', 'Rocky planet with solid surface', false, 5.5),
  ('Gas Giant', 'Large planet composed mostly of gases', true, 1.3),
  ('Ice Giant', 'Planet with icy composition', true, 1.6);
