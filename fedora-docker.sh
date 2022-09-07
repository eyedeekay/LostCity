#! /usr/bin/env sh

. ./config.sh

cat <<EOF > /etc/yum.repos.d/adoptium.repo
[Adoptium]
name=Adoptium
baseurl=https://packages.adoptium.net/artifactory/rpm/${DISTRIBUTION_NAME:-$(. /etc/os-release; echo $ID)}/\$releasever/\$basearch
enabled=1
gpgcheck=1
gpgkey=https://packages.adoptium.net/artifactory/api/gpg/key/public
EOF
yum -y update
yum -y install temurin-18-jdk

jpackage --verbose \
    --type rpm \
    --linux-menu-group "Network;WebBrowser;P2P" \
    --linux-app-category "Network" \
    --linux-package-deps "firefox|chromium|brave|firefox-esr|librewolf|icecat" \
    --linux-shortcut \
    --license-file LICENSE.md \
    --name lostcity \
    --app-version "$GITHUB_TAG" \
    --input src/build \
    --main-jar Unciv.jar \
    --java-options "-Dhttp.proxyHost=127.0.0.1 -Dhttp.proxyPort=4444 -Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=4444" \
    --main-class com.unciv.app.desktop.DesktopLauncher
ls *.rpm