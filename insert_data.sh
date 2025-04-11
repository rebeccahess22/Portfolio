#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#clear out the tables on each run 
echo $($PSQL "TRUNCATE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do 
  if [[ $YEAR != 'year' ]]
  then 
     #check if winner is in the teams table
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNER_ID ]]
    then 
      echo Winner: $WINNER not found in the teams table 
      #insert winner to the teams table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]] 
      then 
        echo Inserted $WINNER into teams
        #NOW WE PULL THE team_id FROM THE TEAMS TABLE 
        WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
      fi  
    fi 

    #check if opponent is in the teams table
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_ID ]]
    then
      echo Opponent: $OPPONENT not found in the teams table 
      #insert opponent into the teams table
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]] 
      then 
        echo Inserted $OPPONENT into teams
        #NOW INSERT THE TEAM ID INTO THE GAMES TABLE FOR THE WINNER ID 
        OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
        fi 
    fi 

    #insert each round observation
    INSERT_GAME_RESULT=$($PSQL "INSERT INTO games(year, round, winner, opponent, winner_goals, opponent_goals, winner_id, opponent_id) \
      VALUES($YEAR, '$ROUND', '$WINNER', '$OPPONENT', '$WINNER_GOALS', '$OPPONENT_GOALS', $WINNER_ID, $OPPONENT_ID)")
    #check if inserted 
    if [[ $INSERT_GAME_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted $YEAR $ROUND $WINNER $OPPONENT 
    else 
      echo ERROR
    fi 

  fi
done 