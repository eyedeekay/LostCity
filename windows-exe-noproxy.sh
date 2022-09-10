#! /usr/bin/env sh
. ./config.sh
jpackage \
    --verbose \
    --type exe \
    --win-dir-chooser \
    --win-help-url "https://github.com/eyedeekay/LostCity" \
    --win-menu \
    --win-menu-group "Unciv-Over-I2P(LostCity) Configurer" \
    --win-shortcut \
    --win-shortcut-prompt \
    --win-per-user-install \
    --license-file LICENSE.md \
    --name lostcity \
    --app-version "$GITHUB_TAG" \
    --input src/build \
    --main-jar Unciv.jar \
    --main-class com.unciv.app.desktop.DesktopLauncher
