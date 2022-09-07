#! /usr/bin/env sh

. ./config.sh
./clean.sh
edgar && git push --all
./all-linux.sh
github-release release --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --name "${GITHUB_NAME}" \
    --description "${GITHUB_DESCRIPTION}" \
    --tag "${GITHUB_TAG}"; true
sleep 2s
github-release edit --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --name "${GITHUB_NAME}" \
    --description "${GITHUB_DESCRIPTION}" \
    --tag "${GITHUB_TAG}"; true
echo "Relase ${GITHUB_TAG} setup"
jvmsum=$(sha256sum "lostcity.tar.gz")
github-release upload --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --label "Unciv-Over-I2P(LostCity) launcher as a Jpackage, does not require a JVM. ${jvmsum}" \
    --name "lostcity.tar.gz" \
    --file "lostcity.tar.gz" \
    --replace
echo "Uploaded jpackage zip"
debsum=$(sha256sum "lostcity_${GITHUB_TAG}_amd64.deb")
github-release upload --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --label "Unciv-Over-I2P(LostCity) launcher as a Jpackage inside of a Debian package. ${debsum}" \
    --name "lostcity_${GITHUB_TAG}_amd64.deb" \
    --file "lostcity_${GITHUB_TAG}_amd64.deb" \
    --replace
echo "Uploaded debian package"
rpmsum=$(sha256sum lostcity-${GITHUB_TAG}-1.x86_64.rpm)
github-release upload --user "${GITHUB_USER}" \
    --repo "${GITHUB_REPO}" \
    --tag "${GITHUB_TAG}" \
    --label "Unciv-Over-I2P(LostCity) launcher as a Jpackage inside of a Fedora package. ${rpmsum}" \
    --name "lostcity-${GITHUB_TAG}-1.x86_64.rpm" \
    --file "lostcity-${GITHUB_TAG}-1.x86_64.rpm" \
    --replace
echo "Uploaded fedora package"
git pull github --tags
git push --all
