#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Toggle Light
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 💡

ELGATO_LIGHT_HOST="192.168.1.64"
QUERY=${1:-toggle}

if [[ $QUERY = toggle ]]; then
  ON=`curl $ELGATO_LIGHT_HOST:9123/elgato/lights | jq ".lights[0].on"`
  if [[ $ON = 0 ]]; then
    ON=1
  else
    ON=0
  fi
elif [[ $QUERY = on ]]; then
  ON=1
else
  ON=0
fi

curl -X PUT \
  $ELGATO_LIGHT_HOST:9123/elgato/lights \
  -H Content-Type:application/json \
  --data '{"Lights":[{"Temperature":344,"Brightness":20,"On":'$ON'}],"NumberOfLights":1}' > /dev/null

if [[ $ON = 0 ]]; then
  STATE=off python3 toggle-hallway-light.py
  echo "Toggled light off"
else
  STATE=on python3 toggle-hallway-light.py
  echo "Toggled light on"
fi
