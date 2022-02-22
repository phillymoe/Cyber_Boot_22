#!/bin/bash

sed s/INCORRECT_PASSWORD/ACCESS_DENIED/ LogA.txt > access_denied2.txt

awk '{print $4, $6}' access_denied2.txt > filtered_logs2.txt
