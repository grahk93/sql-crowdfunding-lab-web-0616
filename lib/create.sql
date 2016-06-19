CREATE TABLE projects (
  id INTEGER PRIMARY KEY, 
  title TEXT,
  category TEXT, 
  funding_goal REAL,
  start_date INTEGER,
  end_date INTEGER,
  pledge_id INTEGER
);

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  pledge_id INTEGER
);

CREATE TABLE pledges (
  id INTEGER PRIMARY KEY,
  amount REAL,
  user_id INTEGER,
  project_id INTEGER
);
