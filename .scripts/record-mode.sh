#!/bin/bash

jack_control start

pactl set-default-sink jack_out
pactl set-default-source jack_in

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

cd ~/data/projects/config && obs-scene-switcher
