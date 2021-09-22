#!/bin/bash
#
# This script produces a dynamic welcome message
# it should look like
#   Welcome to planet hostname, title name!

# Task 1: Use the variable $USER instead of the myname variable to get your name
# Task 2: Dynamically generate the value for your hostname variable using the hostname command - e.g. $(hostname)
# Task 3: Add the time and day of the week to the welcome message using the format shown below
#   Use a format like this:
#   It is weekday at HH:MM AM.
# Task 4: Set the title using the day of the week
#   e.g. On Monday it might be Optimist, Tuesday might be Realist, Wednesday might be Pessimist, etc.
#   You will need multiple tests to set a title
#   Invent your own titles, do not use the ones from this example

###############
# Variables   #
###############
date=$(date "+%A")
	if [ $date = Monday ]; then day="Boring Day"
	fi;
	if [ $date = Tuesday ]; then day="Sleep Day"
	fi;
	if [ $date = Wednesday ]; then day="Hump Day"
	fi;
	if [ $date = Thursday ]; then day="Work Day"
	fi;
	if [ $date = Friday ]; then day="Play Day"
	fi;
	if [ $date = Saturday ]; then day="Play Day 2"
	fi;
	if [ $date = Sunday ]; then day="The Last Day of the weekend"
	fi;
USER="Nickolas"
hostname=$(hostname)
###############
# Main        #
###############

echo Welcome to planet $hostname "i am $USER" today is $day, better known as $(date "+%A %T")
