# CS 240 Homework Scripts
Scripts that you can use to help you when working on CS240 homework.

# Notice
These scripts all run in the directory where you clone your homework.
Example:
  If you had a directory in your home folder called ~/cs240, and within ~/cs240 there is hw0, hw1, hw2, etc, you must put these scripts in ~/cs240/
  Based on the example above, the full path of a script (such as tester.sh) would be ~/cs240/tester.sh
  These scripts will not work otherwise.
__If you wish to remove the err_log and sniffer_log folders, please do so with caution. Make sure you have verified your remove command.__

Before using any script, you must first run this command:
```
chmod +x script_name.sh
```
This will turn your script into a working executable.

__To exit any script at any time, press CTRL + C.__
__Please be careful when using these scripts on Purdue servers. Running them for too long may have unintended side effects.__

# Script Descriptions

## sniffer.sh
This script will ask you for a homework number, a specific function name (without the parenthesis), and the score you looking to replicate.

The script will automatically stop, print out the test module output, and save the output into ./hw(num)/sniffer_log/
If the score you are looking to replicate is -1, then the script will grab the max score of the specified function and will stop if it encounters any errors.

## tester.sh
This script will ask you for a homework number and a number of iterations.

This script will terminate when the score does not equal 100, or the number of iterations has been reached. Any errors encountered will be printed and saved into ./hw(num)/err_log/
