#!/bin/bash
#
# This script requires HandBrakeCLI. On macOS, at least, you need to download
# and install it separately from Handbrake.
#
# See: https://handbrake.fr/downloads2.php

MKVDIR="$HOME/Movies/ripped/mkv"

    # Change the preset if you like (see options: "HandBrakeCLI --preset-list")
    # If you want to transcode ALL movie files, remove the -name option.
    find "$MKVDIR"/* -type f -name "*.mkv" -exec bash -c '
	MP4DIR="$HOME/Movies/ripped/mp4"
	MKVFILENAME="${1##*/}";
	MP4FILENAME="${MKVFILENAME%.mkv}.mp4";
	HandBrakeCLI -i "$1" -o "$MP4DIR/$MP4FILENAME" --preset="General/HQ 2160p60 4K HEVC Surround";
	rm "$1";
    ' __ {} \;
