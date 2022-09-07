#! /usr/bin/env sh
. ./config.sh
jpackage \
    --verbose \
    --type dmg \
    --license-file LICENSE.md \
    --name lostcity \
    --app-version "$GITHUB_TAG" \
    --input src/build \
    --java-options "-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444" \
    --main-jar Unciv.jar \
    --main-class com.unciv.app.desktop.DesktopLauncher
