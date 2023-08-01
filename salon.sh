#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "
echo -e "\n ~~~~ TULAS SALON ~~~~\n"



MAIN_MENU(){
  if [[ $1 ]]
  then
  echo -e "\n$1"
  fi
  SERVICES=$($PSQL "SELECT service_id, name FROM services;")
  echo "$SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
     MAIN_MENU "I could not find that service. What would you like today?"
    else
      AVIALABLE_SERVICE=$($PSQL "SELECT service_id, name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -z $AVIALABLE_SERVICE ]]
      then 
      MAIN_MENU "I could not find that service. What would you like today?"
      else
      PHONE
    fi
  fi
  
  
}


EXIT(){
  echo 'Thanks for coming by'
}
PHONE(){
  echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NUMBER=$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")
        if [[ -z $CUSTOMER_NUMBER ]]
          then
            CREATE_CUSTOMER
          else
            CREATE_APPOINTMENT
        fi
}
CREATE_CUSTOMER(){
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    CREATE_APPOINTMENT
}

CREATE_APPOINTMENT(){
  # get names and id
  C_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'") 
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'") 
  # formated
  SERVICE_NAME_FORMATTED=$(echo $SERVICE_NAME | sed -E 's/\s//g')
  C_NAME_FORMATTED=$(echo $C_NAME | sed -E 's/\s//g')

  echo -e "\nWhat time would you like your cut, $C_NAME_FORMATTED?"
  read SERVICE_TIME
  INSERT_SERVICE=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID_SELECTED', '$SERVICE_TIME')")
  if [[ $INSERT_SERVICE == 'INSERT 0 1' ]]
    then
     echo -e "\nI have put you down for a $SERVICE_NAME_FORMATTED at $SERVICE_TIME, $C_NAME_FORMATTED."
  fi
}


MAIN_MENU
