#!/bin/bash

echo "M A C C H A N G E" | figlet
echo "							By @DraculaO0"
echo
echo
echo "Enter your wireless interface"
read -p "=> " interface
echo ""
sudo ifconfig $interface down
macchanger -l > mac-vendors.txt
vmac=$(shuf -n 1 mac-vendors.txt | awk '{ printf $3 }')
rmac=$(printf "%02x:%02x:%02x" $[RANDOM%256] $[RANDOM%256] $[RANDOM%256])
nmac="$vmac:$rmac"
rm -rf mac-vendors.txt
echo -e "\033[0;32mChangin MAC to => $nmac\033[0m"
echo ""
sudo macchanger -m $nmac $interface
sudo ifconfig $interface up
