#! /usr/bin/env sh

. ./config.sh
docker build -t eyedeekay/lostcity .
docker rm -f lostcity-fedora
docker run --name lostcity-fedora eyedeekay/lostcity
docker cp lostcity-fedora:/src/lostcity/lostcity-${GITHUB_TAG}-1.x86_64.rpm .
