#!/bin/bash

#Script for get information about element

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then 
  echo "Please provide an element as an argument."
else
ELEMENTS=$($PSQL "SELECT * FROM elements left join properties using(atomic_number) left join types using(type_id)")
echo "$ELEMENTS" | while read TYPE_ID BAR ATOMIC_NUMBER BAR SYMBOL BAR NAME BAR ATOMIC_MASS BAR MELTING_POINT_CELSIUS BAR BOILING_POINT_CELSIUS BAR TYPE
do 
  if [[ $1 -eq $ATOMIC_NUMBER ]] 
  then
    echo "The element with atomic number $ATOMIC_NUMBER is "$NAME" ("$SYMBOL"). It's a "$TYPE", with a mass of $ATOMIC_MASS amu. "$NAME" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  elif [[ $1 == "$SYMBOL" ]] 
  then 
    echo "The element with atomic number $ATOMIC_NUMBER is "$NAME" ("$SYMBOL"). It's a "$TYPE", with a mass of $ATOMIC_MASS amu. "$NAME" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  elif [[ $1 == "$NAME" ]] 
  then 
    echo "The element with atomic number $ATOMIC_NUMBER is "$NAME" ("$SYMBOL"). It's a "$TYPE", with a mass of $ATOMIC_MASS amu. "$NAME" has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
  fi
done 
fi > wynik.txt

PLIK=wynik.txt
read WYNIK < $PLIK

if [[ -n $WYNIK ]] 
then
  echo "$WYNIK"
else 
  echo "I could not find that element in the database."
fi





