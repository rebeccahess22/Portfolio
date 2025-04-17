# World Cup Project
In this project, we are given a list of games in a .csv titled games.csv. It contains the columns year, round, winner, opponent, winner_goals, and opponent goals. 

I created a database titled **worldcup** and two empty tables: **games** and **teams**. 

The **games** table contains the following columns: 
  * year
  * round
  * winner_goals
  * opponent_goals
  * game_id
  * winner_id
  * opponent_id

The **teams** table contains:
  * team_id
  * name 

The two tables are related through foreign keys winner_id and opponent_id in the games table and primary key team_id in the teams table. 
The commands to create these tables can be found in bashterminal.sh. 

The data from the csv is loaded to the csv using a bash script titled insert_data.sh. 
After the data is inserted, we use another bash script to query the data titles queries.sh. 
