#! /usr/bin/env sh
git pull --all
. ../i2p.firefox/config.sh
. ./config.sh
. "${HOME}/github-release-config.sh"
ant distclean jar
./windows.sh
./windows-exe.sh
./windows-portable.sh
msisum=$(sha256sum "lostcity-${GITHUB_TAG}.msi")
github-release upload --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --label "I2P Browser launcher as a Jpackage inside of an MSI package. ${msisum}" \
    --name "lostcity.msi" \
    --file "lostcity-${GITHUB_TAG}.msi" \
    --replace
echo "Uploaded MSI package"
exesum=$(sha256sum "lostcity-${GITHUB_TAG}.exe")
github-release upload --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --label "I2P Browser launcher as a Jpackage inside of an EXE package. ${exesum}" \
    --name "lostcity.exe" \
    --file "lostcity-${GITHUB_TAG}.exe" \
    --replace
echo "Uploaded EXE package"
zipsum=$(sha256sum "lostcity-portable-${GITHUB_TAG}.zip")
github-release upload --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --label "I2P Browser launcher as a Jpackage inside of an zip to be run from a directory on Windows. ${zipsum}" \
    --name "lostcity-portable.zip" \
    --file "lostcity-portable-${GITHUB_TAG}.zip" \
    --replace
echo "Uploaded Windows ZIP package"
