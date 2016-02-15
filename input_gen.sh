#!/bin/sh

INPUT_FILE=input
DEV_COUNT=100
echo "" > $INPUT_FILE # Clear file
value=

# Initial values init
for ((i = 0; i < 100; i++))
do
	value[$i]=$((RANDOM%256))
done
# Generate input
for i in {1..1000000}
do
	n=$((RANDOM%100))
	o=${value[$n]}
	neigh_sum=$((${value[$n-1]} + ${value[$n+1]} + ${value[$n+10]} + ${value[$n-10]}))
	value[$n]=$(($o + 3 * ($neigh_sum - 4 * $o) / 20))
	echo $n ${value[$n]} >> $INPUT_FILE
done
