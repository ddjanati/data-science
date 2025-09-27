#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
        echo "Usage: $0 <input csv> <results csv>" >&2
        exit 1
    fi

input=$1
output=$2

ponies=("Twilight Sparkle" "Rarity" "Pinkie Pie" "Rainbow Dash" "Applejack" "Fluttershy")

total_lines=$(( $(csvtool -t ',' height $input) - 1 ))

echo "pony_name, total_line_count, percent_all_lines\n" > $output

for pony in "${ponies[@]}"
do
	echo -e "\nSearching lines for $pony"
	value=$(csvtool -t ',' col 4 $input | grep -i "$pony" | wc -l)
	echo "$value lines detected"

	echo "Calculating total percentage for $pony"
	pct=$(echo "scale=2; 100 * $value / $total_lines" | bc)
	echo "% lines spoken = $pct"

	echo "outputing results to csv"
	echo "$pony, $value, $pct%" >> $output
done
