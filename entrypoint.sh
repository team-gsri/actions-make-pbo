#!/bin/sh

if [ "$#" -ne "2" ]; then
  echo "Usage: $0 mission_directory briefing_name"
  exit 1
fi

MISSION_DIR=$GITHUB_WORKSPACE/$1
MISSION_SQM=$MISSION_DIR/mission.sqm
MISSION_BIN=$MISSION_DIR/mission.bin
MISSION_PBO=$MISSION_DIR.pbo
BRIEFING_NAME=${2//\"/}

if [ ! -d "$MISSION_DIR" ]; then
  echo "Mission directory not found"
  exit 2
fi

if [ ! -f "$MISSION_SQM" ]; then
  echo "Mission SQM file not found"
  exit 3
fi

if [ -n "$BRIEFING_NAME" ]; then
  echo "Setting briefing name"
  IN='briefingName="[^"]*";'
  OUT="briefingName=\"$BREFING_NAME\";"
  sed -i "s/$IN/$OUT/g" "$MISSION_SQM"
fi

echo "Rapifying mission.sqm"
/usr/bin/armake2 rapify "$MISSION_SQM" "$MISSION_BIN"
mv -f "$MISSION_BIN" "$MISSION_SQM"

echo "Packing mission.pbo"
/usr/bin/armake2 pack "$MISSION_DIR" "$MISSION_PBO"
