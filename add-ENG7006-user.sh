#!/bin/bash
username=eng7006
realname="ENG 7006"
password="eng7006!"

maxid=$(dscl . -list /Users UniqueID | awk '{print $2}' | sort -ug | tail -1)
newid=$((maxid+1))

dscl . -create /Users/$username
dscl . -create /Users/$username UserShell /bin/bash
dscl . -create /Users/$username RealName "$realname"
dscl . -create /Users/$username UniqueID "$newid"
dscl . -create /Users/$username PrimaryGroupID 20
dscl . -create /Users/$username NFSHomeDirectory /Users/$username

dscl . -passwd /Users/$username $password

dseditgroup -o edit -t user -a $username staff

cp -R /System/Library/User\ Template/English.lproj /Users/$username
chown -R $username:staff /Users/$username
