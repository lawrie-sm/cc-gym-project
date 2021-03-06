DROP TABLE IF EXISTS members_events;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS events;
DROP TABLE IF EXISTS locations;

CREATE TABLE locations (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  capacity INT4 NOT NULL
);

CREATE TABLE members (
  id SERIAL4 PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  membership VARCHAR(255) NOT NULL
);

CREATE TABLE events (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  start_time TIMESTAMP NOT NULL,
  end_time TIMESTAMP NOT NULL,
  location_id INT4 REFERENCES locations (id) ON DELETE CASCADE
);

CREATE TABLE members_events (
  id SERIAL4 PRIMARY KEY,
  member_id INT4 REFERENCES members (id) ON DELETE CASCADE,
  event_id INT4 REFERENCES events (id) ON DELETE CASCADE
);
