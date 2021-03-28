#!/bin/bash
if ! command -v nvidia-settings &> /dev/null
then
    echo "'nvidia-settings' isn't installed."
    exit
fi
if ! command -v xcalib &> /dev/null
then
    echo "'xcalib' isn't installed."
    exit
fi
if [[ $1 == "dark" ]]
then
    nvidia-settings -a "DigitalVibrance=-1024"
    xcalib -i -a
elif [[ $1 == "normal" ]]
then
    nvidia-settings -a "DigitalVibrance=0"
    xcalib -c
elif [[ $1 == "bw" ]]
then
    nvidia-settings -a "DigitalVibrance=-1024"
    xcalib -c
else
    echo "Usage: shades bw|dark|normal"
fi
