#!/bin/bash

echo "all the variables passed to the script:$@"

echo "number of variables passed to the script:$#"

echo "script name:$0"

echo "present working directory:$PWD"

echo "home directory of the user who is running the script:$HOME"

echo "which user is running the script:$USER"

echo "process ID of the current script:$$"

echo "process ID of last command running in background:$!"