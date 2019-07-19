DROP TABLE IF EXISTS members_events;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS events;

CREATE TABLE members (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  membership VARCHAR(255) NOT NULL
);

CREATE TABLE events (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  time TIMESTAMP NOT NULL
);

CREATE TABLE members_events (
  ID SERIAL4 PRIMARY KEY,
  member_id INT4 REFERENCES members (id),
  event_id INT4 REFERENCES events (id)
)
