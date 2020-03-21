#!/bin/bash

IFS=

echo "Enter your CS 240 Homework Number: ";
read homework_number

echo "Enter how many iterations: "
read runs

hw_score=0
iterations=0;

RED='\033[0;91m'
GREEN='\033[0;92m'

BG_RED='\033[101m'
BG_GREEN='\033[102m'

DEFAULT='\033[0m'
BOLD='\033[1m'

cd ./"hw${homework_number}"

make clean > /dev/null
make > /dev/null
mkdir err_logs

while [[ $iterations -lt $runs ]]
do
  # Your projected total score for this assignment: 100

  test_output=$(./"hw${homework_number}_test")
  hw_score=$(printf '%s\n' "${test_output}" | grep "assignment: " | cut -d ":" -f2 | cut -c2- )
  ((iterations++))

  if [[ $hw_score != 100 ]]
  then
    clear
    echo -e $test_output > "./err_logs/run_${iterations}_error_log"
    cat ./err_logs/run_${iterations}_error_log
    echo -e "${RED}Iteration #${DEFAULT}${BG_RED}${BOLD}${iterations}${DEFAULT}${RED}/${runs} ERRORED${DEFAULT}"
    echo -e "${RED}Error log piped into ./hw${homework_number}/err_logs/run_${iterations}_error_log.${DEFAULT}"
    echo -e "${RED}If the error log/screen is empty despite the script stopping, then there was a compilation/make error.${DEFAULT}"
    echo -e "${RED}To delete all error logs, type rm ./hw${homework_number}/err_logs/run_*${DEFAULT}"
    exit 0
  else
    echo -e "${GREEN}Iteration #${BOLD}${iterations}/${runs} successful${DEFAULT}"
  fi

done

echo -e "${BG_GREEN}${BOLD}Testing Complete.${DEFAULT}"
echo -e "${RED}Removing test files...${DEFUALT}"
make clean > /dev/null
echo -e "${GREEN}Test files removed.${DEFAULT}"
echo -e "${RED}Removing error logs...${DEFAULT}"
rm -r ./err_logs > /dev/null
echo -e "${GREEN}Error logs removed.${DEFAULT}"
