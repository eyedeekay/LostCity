#! /usr/bin/env sh

. ./config.sh
docker build -t eyedeekay/i2p.plugins.firefox .
docker rm -f lostcity-fedora
docker run --name lostcity-fedora eyedeekay/i2p.plugins.firefox
docker cp lostcity-fedora:/src/i2p.plugins.firefox/lostcity-${GITHUB_TAG}-1.x86_64.rpm .
