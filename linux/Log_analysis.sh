#!/bin/bash

sed s/INCORRECT_PASSWORD/ACCESS_DENIED/ /learning_sed/Admin_logA.txt > access_denied.txt
awk '{print $4, $6}' /learning/Update1_Combined_Access_logs.txt > filtered_logs.txt
