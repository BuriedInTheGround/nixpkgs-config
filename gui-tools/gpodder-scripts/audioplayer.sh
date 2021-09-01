#!/usr/bin/env bash

# =============================================================================
# audioplayer
#
# This script was created in order to add new items on the top of current mpd
# playlist.
# It can be used in order to play gPodder or podboat podcasts without losing
# your current playlist.
# =============================================================================

current_playlist=$(mpc playlist)
log_file=~/.config/gpodder-scripts/audioplayer.log
tmp_playlist_location=~/.local/share/mpd/playlists

mpc stop

podcast_file=$(echo "$@" | sed s/\\/home\\/simone\\///g | sed s/Downloads\\///g)
echo $podcast_file

if [ "$current_playlist" != "" ]
then
    mpc save tmp_playlist
    mpc clear
    mpc add "$podcast_file"
    mpc load tmp_playlist
    rm $tmp_playlist_location/tmp_playlist.m3u
else
    mpc add "$podcast_file"
fi

mpc play &
exit
