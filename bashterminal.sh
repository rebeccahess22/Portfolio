psql --username=freecodecamp --dbname=postgres

CREATE DATABASE worldcup;
DROP TABLE games;
DROP TABLE teams;

/c worldcup

CREATE TABLE games(
  year INT NOT NULL,
  round VARCHAR(30) NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL, 
  game_id SERIAL PRIMARY KEY
);

CREATE TABLE teams(
  team_id SERIAL PRIMARY KEY NOT NULL,
  name VARCHAR(30) UNIQUE NOT NULL
);


\d 
#creating the foreign keys; 
  # serial autogenerates new values for indexing purposes which is ok for primary key but not okay for foreign key
ALTER TABLE games ADD COLUMN winner_id INT NOT NULL;
ALTER TABLE games ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id);

ALTER TABLE games ADD COLUMN opponent_id INT NOT NULL;
ALTER TABLE games ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id);

pg_dump -cC --inserts -U freecodecamp worldcup > worldcup.sql