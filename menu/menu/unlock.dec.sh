#!/bin/bash
# pewarna hidup
red='\e[1;31m'
green='\e[1;32m'
blue="\033[1;96m"
NC='\e[0m'
clear
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo -e "\E[1;41;97m              UNLOCK ACCOUNT SSH              \E[0m"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat    
echo "USERNAME          EXP DATE          STATUS"
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" | lolcat
echo ""
read -p "Input Username Account : " username
egrep "^$username" /etc/passwd >/dev/null
passwd -u $username
clear
  echo " "
  echo " "
  echo " "
  echo -e "\033[0;33m───────────────────\033[0m"
  echo -e "Username ${blue}$username${NC} Sukses Di ${green}UNLOCKED${NC}."
  echo -e "Akses Dengan Username ${blue}$username${NC} Telah Berhasil Di Unlock"
  echo -e "\033[0;33m───────────────────\033[0m"
  echo ""
read -n 1 -s -r -p "Enter Back To Menu"
menu unlock.temp1.sh 