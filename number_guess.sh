#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# generate a random number between 1 and 1,000 inclusive
TARGET=$(( RANDOM % 1000 + 1 ))

echo "Enter your username:"

read USERNAME

USERCHECK=$($PSQL "SELECT username FROM user_record WHERE username='$USERNAME'")

if [[ -z $USERCHECK ]]
then
  # first time user so welcome them
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # and register them
  INSERT=$($PSQL "INSERT INTO user_record (username, total_games, best_score) VALUES ('$USERNAME', 0, 0)")
else
  # already in DB so get their data
  PLAYED=$($PSQL "SELECT total_games FROM user_record WHERE username='$USERNAME'")
  BEST=$($PSQL "SELECT best_score FROM user_record WHERE username='$USERNAME'")
  # display their data
  echo "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST guesses."
fi

echo "Guess the secret number between 1 and 1000:"
TRY_COUNT=0

GUESS_FUNC() {
read GUESS
# check if input is integer
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
    echo "That is not an integer, guess again:"
    GUESS_FUNC
    exit
fi
# higher, lower, equals
if [[ $GUESS -gt $TARGET ]]
then
  # too high
  echo "It's lower than that, guess again:"
  ((TRY_COUNT+=1))
  GUESS_FUNC
elif [[ $GUESS -lt $TARGET ]]
  then
    # too low
    echo "It's higher than that, guess again:"
    ((TRY_COUNT+=1))
    GUESS_FUNC
else
  # they guessed correctly
  ((TRY_COUNT+=1))
  echo "You guessed it in $TRY_COUNT tries. The secret number was $TARGET. Nice job!"
fi
}

GUESS_FUNC

# game finished, update database
OLD_GAMES=$($PSQL "SELECT total_games FROM user_record WHERE username='$USERNAME'")
NEW_GAMES=$((OLD_GAMES + 1))
UPDATE_GAMES=$($PSQL "UPDATE user_record SET total_games=$NEW_GAMES WHERE username='$USERNAME'")
OLD_BEST=$($PSQL "SELECT best_score FROM user_record WHERE username='$USERNAME'")
if [[ $OLD_BEST = 0 ]]
then
  # first ever game
  UPDATE_SCORE=$($PSQL "UPDATE user_record SET best_score=$TRY_COUNT WHERE username='$USERNAME'")
elif [[ $TRY_COUNT -lt $OLD_BEST ]]
then
  # it's a new best
  UPDATE_SCORE=$($PSQL "UPDATE user_record SET best_score=$TRY_COUNT WHERE username='$USERNAME'")
fi

exit
