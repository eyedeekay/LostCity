#! /usr/bin/env sh

. ./config.sh
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "Unciv.jar"
echo "Downloaded jar"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity.zip" 
echo "Downloaded freestanding zip"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity.zip" 
echo "Downloaded jpackage zip"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity_${GITHUB_TAG}_.deb"
echo "Downloaded debian package"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity-${GITHUB_TAG}_.rpm"
echo "Downloaded fedora package"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity.msi"
echo "Downloaded MSI package"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity.exe"
echo "Downloaded EXE package"
github-release download --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --name "lostcity-portable.zip"
echo "Downloaded Windows ZIP package"

echo "Sums for release ${GITHUB_TAG}" | tee RELEASES.md
echo "==============================" | tee -a RELEASES.md
echo "" | tee -a RELEASES.md
echo "- [$(sha256sum Unciv.jar)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/Unciv.jar)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity.zip)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity.zip)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity.zip)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity.zip)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity_${GITHUB_TAG}_.deb)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity_${GITHUB_TAG}_.deb)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity-${GITHUB_TAG}_.rpm)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity-${GITHUB_TAG}_.rpm)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity.msi)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity.msi)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity.exe)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity.exe)" | tee -a RELEASES.md
echo "- [$(sha256sum lostcity-portable.zip)](https://github.com/eyedeekay/lostcity/releases/download/${GITHUB_TAG}/lostcity-portable.zip)" | tee -a RELEASES.md
echo "" | tee -a RELEASES.md

git add RELEASES.md
edgar
git commit -am "Update releases page"
git push --all