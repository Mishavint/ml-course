#!/bin/bash

declare -A letters=(
["A"]=14781
["B"]=8977
["C"]=23555
["D"]=10599
["E"]=11493
["F"]=1164
["G"]=5795
["H"]=7265
["I"]=1118
["J"]=8615
["K"]=5621
["L"]=11641
["M"]=12454
["N"]=19093
["O"]=58154
["P"]=19378
["Q"]=5890
["R"]=11669
["S"]=48463
["T"]=22668
["U"]=29117
["V"]=340
["W"]=10884
["X"]=6298
["Y"]=10909
["Z"]=6097
)

tac handwritten_data.csv > temp.csv

for i in "${!letters[@]}"
do
  value=${letters[$i]}
#  echo "$i -> $value"
  head -"$value" temp.csv > "$i"
  sed -i -e "1,$value d" temp.csv
done

#for i in "${!letters[@]}"
#do
#  echo "$i"
#  cut -c-2 $i | uniq -c
#done

rm temp.csv handwritten_data.csv

for i in "${!letters[@]}"
do
  head -500 $i >> handwritten_data.csv
done

for i in "${!letters[@]}"
do
  rm $i
done

tac handwritten_data.csv > temp.csv
rm handwritten_data.csv
cat temp.csv > handwritten_data.csv
rm temp.csv