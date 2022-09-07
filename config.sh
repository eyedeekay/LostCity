#! /usr/bin/env sh
export GITHUB_USER=eyedeekay
export GITHUB_REPO=LostCity
export GITHUB_NAME="Package UnCiv with I2P-Enabling Defaults"
export GITHUB_DESCRIPTION=$(cat CHANGES.md)
export GITHUB_TAG=4.2.7

mkdir -p src/build
wget -O src/build/Unciv.jar -c https://github.com/yairm210/Unciv/releases/download/${GITHUB_TAG}/Unciv.jar