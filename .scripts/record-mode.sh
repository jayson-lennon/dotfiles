#!/bin/bash

jack_control start

CARLA=$(ps -AF|awk '/carla\/carla/ {print $2}')
if [ -z $OBS ]
  then
    carla ~/data/projects/config/carla.carxp &
    sleep 2
fi

OBS=$(ps -AF|awk '/\/usr\/bin\/obs/ {print $2}')
if [ -z $OBS ]
  then
    obs &
    sleep 2
fi

# Map tablet to appropriate screen
setup-tablet

jack_disconnect 'system:capture_1' 'PulseAudio JACK Source:front-left'
jack_disconnect 'system:capture_2' 'PulseAudio JACK Source:front-right'

pactl set-default-source jack_in
pactl set-default-sink jack_out

cd ~/data/projects/config && obs-scene-switcher
