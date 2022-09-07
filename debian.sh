#! /usr/bin/env sh

. ./config.sh
jpackage --verbose \
    --type deb \
    --linux-deb-maintainer hankhill19580@gmail.com \
    --linux-menu-group "Network;WebBrowser;P2P" \
    --linux-app-category "Games" \
    --linux-package-deps "" \
    --linux-shortcut \
    --license-file LICENSE.md \
    --name lostcity \
    --app-version "$GITHUB_TAG" \
    --input src/build \
    --java-options "-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444" \
    --main-jar Unciv.jar \
    --main-class com.unciv.app.desktop.DesktopLauncher
