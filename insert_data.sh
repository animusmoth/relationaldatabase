#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
#clear the way
echo $($PSQL "TRUNCATE games,teams")

# Define some functions first
INSERT_TEAM() {
    if [[ $1 != 'winner' && $1 != 'opponent' ]]
    then
    TEAM_ID=$($PSQL "select team_id from teams where name = '$1'")
    #if doesn't exist
    if [[ -z $TEAM_ID ]]
    then
    # insert team
      INSERT_TEAM_RESULT=$($PSQL "insert into teams(name) values('$1')")
      if [[ $INSERT_TEAM_RESULT == "INSERT 0 1" ]]
      then
        echo "Inserted into teams, $1"
        #grab the id of the new team
        TEAM_ID=$($PSQL "select team_id from teams where name = '$1'")
      fi
    fi  
    fi  
}

# Define global variable
TEAM_ID=0

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNERGOALS OPPONENTGOALS
do

  #Insert winner team
  INSERT_TEAM "$WINNER"
  #get winner id
  WINNER_ID=$TEAM_ID
  #Insert opponent team
  INSERT_TEAM "$OPPONENT"
  #get opponent id
  OPPONENT_ID=$TEAM_ID

  #Insert games
  INSERT_GAME_RESULT=$($PSQL "insert into games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) values('$YEAR', '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNERGOALS, $OPPONENTGOALS)")
  if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
  then
      echo "Inserted into games, $YEAR, $ROUND, $WINNER($WINNER_ID), $OPPONENT($OPPONENT_ID), $WINNERGOALS, $OPPONENTGOALS"
  fi


done