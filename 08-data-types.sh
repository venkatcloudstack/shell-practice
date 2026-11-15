#!/bin/bash

NUM1=10
NUM2=gopi

SUM=$(($NUM1+$NUM2))

echo "the sum of num1 and num2 is : $SUM"

#array

MOVIES=("rrr","pspk","pushpa") #index always starts with 0
echo "movies are :${MOVIES[0]}"