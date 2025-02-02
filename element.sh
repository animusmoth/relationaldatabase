#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

MAIN () {

# check if argument exists
if [[ $1 ]]
then 
  CHECK $1
else
  echo Please provide an element as an argument.
fi

}

CHECK() {
# creates a local check_element variable
CHECK_ELEMENT=$1
if [[ $CHECK_ELEMENT =~ ^[0-9]+$ ]]
then
  CONDITION=" where atomic_number=$CHECK_ELEMENT"
else
  if [[ $CHECK_ELEMENT =~ ^[A-Z]$ || $CHECK_ELEMENT =~ ^[A-Z][a-z]$ ]]
  then
    CONDITION=" where symbol='$CHECK_ELEMENT'"
  else
    CONDITION=" where name='$CHECK_ELEMENT'"
  fi
fi

ELEMENT=$($PSQL "select atomic_number, symbol, name, atomic_mass, boiling_point_celsius as boiling, melting_point_celsius as melting, t.type from elements inner join properties using(atomic_number) inner join types t using(type_id) $CONDITION")

if [[ -z $ELEMENT ]]
then
  echo -e "I could not find that element in the database."
else
  
  IFS='|' read ATOMIC_NUMBER SYMBOL  NAME MASS BOILING MELTING TYPE <<< "$ELEMENT"
  echo -e "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
fi
}

MAIN $1