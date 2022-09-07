#! /usr/bin/env sh
. ./config.sh
mkdir -p tmp
cp -v LICENSE.md tmp/LICENSE.md
rm -rf lostcity-portable
jpackage \
    --verbose \
    --type app-image \
    --name lostcity-portable \
    --app-version "$GITHUB_TAG" \
    --input src/build \
    --main-jar Unciv.jar \
    --resource-dir tmp \
    --java-options "-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444" \
    --main-class com.unciv.app.desktop.DesktopLauncher
rm -rf tmp
cp -v LICENSE.md lostcity-portable/LICENSE.md
rm lostcity-portable.zip -f
zip -r lostcity-portable-${GITHUB_TAG}.zip lostcity-portable