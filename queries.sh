#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
echo "$($PSQL "SELECT SUM(winner_goals) FROM games")"

echo -e "\nTotal number of goals in all games from both teams combined:"
echo "$($PSQL "select sum(goals) from (select sum(winner_goals) as goals from games a union select sum(opponent_goals) from games b) c")"

echo -e "\nAverage number of goals in all games from the winning teams:"
echo "$($PSQL "select avg(winner_goals) from games")"

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "select round(avg(winner_goals),2) from games")"

echo -e "\nAverage number of goals in all games from both teams:"
echo "$($PSQL "select avg(winner_goals + opponent_goals) as av from games")"

echo -e "\nMost goals scored in a single game by one team:"
echo "$($PSQL "select max(goals) from (select winner_id as team, winner_goals as goals from games a union all select opponent_id as team, opponent_goals as goals from games b) c")"

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "select count(winner_id) from games where winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
echo "$($PSQL "select t.name from games g inner join teams t on g.winner_id = t.team_id  where round = 'Final' and year = '2018'")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "select t.name from teams t inner join (select winner_id as t from games a where round ='Eighth-Final' and year = '2014' union select opponent_id as t from games b where round='Eighth-Final' and year='2014') c on t.team_id = c.t order by t.name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "select t.name from games g inner join teams t on g.winner_id = t.team_id group by t.name order by t.name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "select g.year, t.name from games g inner join teams t on g.winner_id = t.team_id  where round = 'Final' order by g.year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "select name from teams where name like 'Co%'")"
