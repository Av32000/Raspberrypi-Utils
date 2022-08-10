#!/bin/bash
showTemp(){
 hashcount=$(printf "%.0f\n" "$1")
 echo -ne "\r["
 for ((i=0; i<$hashcount; i++))
 do
  echo -ne "#"
 done
 for ((i=0; i<$((80 - $hashcount)); i++))
 do
  echo -ne "."
 done
 echo -ne "] "$1"°C"
}
clear
while true
do
 temp=$(vcgencmd measure_temp | cut -c6- | cut -d "'" -f1)
 showTemp $temp
 sleep 1
done