#!/bin/bash

INCREMENT=$(cat increment.txt)
echo $INCREMENT
echo -n $((INCREMENT + 1)) > increment.txt
