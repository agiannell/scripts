#!/bin/bash

if [ -z "$1" ] ; then
  mkvDir=$HOME/Movies/ripped/mkv
else
  mkvDir="$1"
fi

mp4Dir=$HOME/Movies/ripped/mp4
toBeDeletedDir=$HOME/Movies/ripped/to-be-deleted
sortedMkvFilesByDateModifiedAsc=$(ls -rt $mkvDir)

for mkvFilename in $sortedMkvFilesByDateModifiedAsc 
do
  mp4Filename="${mkvFilename%.mkv}.mp4"
  mkvFilepath="$mkvDir/$mkvFilename"
  mp4Filepath="$mp4Dir/$mp4Filename"
  toBeDeletedFilepath="$toBeDeletedDir/$mkvFilename"
  
  # using handbrake cli to transcode using the 4K preset
  HandBrakeCLI -i "$mkvFilepath" -o "$mp4Filepath" --preset="General/HQ 2160p60 4K HEVC Surround"

  # move mkv file to to-be-deleted folder for manual deletion
  mv "$mkvFilepath" "$toBeDeletedFilepath"
done
