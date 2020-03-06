#!/bin/bash

IFS=

echo "Enter your CS 240 Homework Number: ";
read homework_number

echo "Enter what function you are testing without ()."
read func

echo "Enter what score you are looking to replicate, or -1 to test 100% correctness."
read score

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
mkdir sniffer_logs > /dev/null

while [[ true ]]
do
  # func_name(): xx/yy

  test_output=$(./"hw${homework_number}_test")
  hw_score=$(printf '%s\n' "${test_output}" | grep "${func}(): " | cut -d ":" -f2 | cut -c2-3)
  max_score=$(printf '%s\n' "${test_output}" | grep "${func}(): " | cut -d ":" -f2 | cut -c5-6)
  ((iterations++))

  if [[ $score -eq -1 ]]
  then
    score=$max_score
  fi

  if [[ $score -eq $max_score ]]
  then
    if [[ $hw_score -ne $score ]]
    then
      clear
      echo -e $test_output > "./sniffer_logs/run_${iterations}_error_log"
      cat ./sniffer_logs/run_${iterations}_error_log
      echo -e "${RED}Iteration ${DEFAULT}${BG_RED}${BOLD}#${iterations}${DEFAULT}${RED} did not recieve full score.${DEFAULT}"
      echo -e "${RED}Error log piped into ./hw${homework_number}/sniffer_logs/run_${iterations}_error_log.${DEFAULT}"
      echo -e "${RED}If the error log/screen is empty despite the script stopping, then there was a compilation/make error.${DEFAULT}"
      echo -e "${RED}To remove all error logs, type rm ./hw${homework_number}/sniffer_logs/run_*${DEFAULT}"
      exit 0
    else
      echo -e "${GREEN}Iteration #${BOLD}${iterations} successful${DEFAULT}"
    fi
  else
    if [[ $hw_score -eq $score ]]
    then
      clear
      echo -e $test_output > "./sniffer_logs/run_${iterations}_error_log"
      cat ./sniffer_logs/run_${iterations}_error_log
      echo -e "${RED}Iteration ${DEFAULT}${BG_RED}${BOLD}#${iterations}${DEFAULT}${RED} tripped the program.${DEFAULT}"
      echo -e "${RED}Error log piped into ./hw${homework_number}/sniffer_logs/run_${iterations}_error_log.${DEFAULT}"
      echo -e "${RED}If the error log/screen is empty despite the script stopping, then there was a compilation/make error.${DEFAULT}"
      echo -e "${RED}To remove all error logs, type rm ./hw${homework_number}/sniffer_logs/run_*${DEFAULT}"
      exit 0
    else
      echo -e "${GREEN}Iteration #${BOLD}${iterations} successful${DEFAULT}"
    fi
  fi
done
