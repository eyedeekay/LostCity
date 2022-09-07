FROM fedora
RUN yum -y update
RUN yum -y install rpm-build wget
ADD . /src/lostcity
WORKDIR /src/lostcity
CMD ./fedora-docker.sh
