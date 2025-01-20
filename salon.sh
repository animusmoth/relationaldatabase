#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#echo $($PSQL "truncate customers, appointments")

echo -e "\n~~~~~ Salon ~~~~~\n"

DO_STUFF() {

  SERVICE_ID_SELECTED=$1

  echo -e "\nPlease input your phone"
  read CUSTOMER_PHONE
  ## check if phone exists
  CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    ## phone does not exist
    echo -e "\nPlease input your name"
    read CUSTOMER_NAME
    RESULT_INSERT=$($PSQL "insert into customers (name, phone) values('$CUSTOMER_NAME','$CUSTOMER_PHONE')")
    # get the customer
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone = '$CUSTOMER_PHONE'")
  else
    CUSTOMER_NAME=$($PSQL "select name from customers where customer_id = $CUSTOMER_ID")
  fi
  echo -e "\nPlease input the time you wish to book"
  read SERVICE_TIME
  
  
  RESULT_INSERT_APP=$($PSQL "insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  echo -e "I have put you down for a $(echo $SERVICE_NAME | sed -E 's/^ *| *$//g') at $SERVICE_TIME, $(echo $CUSTOMER_NAME | sed -E 's/^ *| *$//g')."
  
}

SHOW_MENU() {

READ_SERVICES=$($PSQL "select service_id, name from services order by service_id")

  if [[ -z $READ_SERVICES ]]
  then
    echo -e "\nSorry you don't have services available."
  else 
    echo "$READ_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME 
    do
      echo -e "$SERVICE_ID) $SERVICE_NAME"
    done
  fi
  echo -e "\nPlease choose a service"
  read SERVICE_ID_SELECTED

  SERVICE_NAME=$($PSQL "select name from services where service_id = $SERVICE_ID_SELECTED")
  ## service exists?
  if [[ -z $SERVICE_NAME ]]
  then
    SHOW_MENU "\nPlease provide a valid service."
  else
    DO_STUFF $SERVICE_ID_SELECTED
  fi

}

MAIN () {

    if [[ $1 ]] 
    then
        echo -e "\n$1\n"
    fi

  echo How may I help you?
  SHOW_MENU

}
  
MAIN