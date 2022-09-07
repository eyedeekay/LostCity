#! /usr/bin/env sh
. ./config.sh
jpackage \
    --verbose \
    --type exe \
    --win-dir-chooser \
    --win-help-url "https://geti2p.net" \
    --win-menu \
    --win-menu-group "Unciv-Over-I2P(LostCity) Configurer" \
    --win-shortcut \
    --win-shortcut-prompt \
    --win-per-user-install \
    --license-file LICENSE.md \
    --name lostcity \
    --app-version "$GITHUB_TAG" \
    --input src/build \
    --java-options "-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444" \
    --main-jar Unciv.jar \
    --main-class com.unciv.app.desktop.DesktopLauncher
