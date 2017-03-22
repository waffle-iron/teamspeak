FROM debian:jessie
MAINTAINER Reesey275 <reesey275@gmail.com>

ENV TS3_USER=teamspeak \
    TS3_GROUP=teamspeak \
    TS3_HOME=/teamspeak \
    TS3_VERSION=3.0.13.6 \
    TS3_FILENAME=teamspeak3-server_linux_amd64 
	
    # Build-time metadata as defined at http://label-schema.org
ARG BUILD_DATE
ARG VCS_REF
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.dockerfile="/Dockerfile" \
      org.label-schema.license="MIT" \
      org.label-schema.name="Docker Teamspeak 3" \
      org.label-schema.url="https://github.com/asosgaming/docker-teamspeak/" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/asosgaming/docker-teamspeak.git" \
      org.label-schema.vcs-type="Git"
	
ADD entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh && \
    apt-get -q update && \
    apt-get -q install -y \
    locales \
    wget \
    sudo \
    mysql-common \
    libxcursor1 \
    libglib2.0-0 \
    libreadline5 \
    bzip2 \
    tar \
    sqlite3 \
    ca-certificates && \
    groupadd -g 4000 -r ${TS3_GROUP} && \
    useradd -u 4000 -r -m -g ${TS3_GROUP} -d ${TS3_HOME} ${TS3_USER} && \
    update-ca-certificates && \
    locale-gen --purge en_US.UTF-8 && \
    echo LC_ALL=en_US.UTF-8 >> /etc/default/locale && \
    echo LANG=en_US.UTF-8 >> /etc/default/locale && \
    apt-get -qq clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR ${TS3_HOME}

RUN   wget "http://dl.4players.de/ts/releases/${TS3_VERSION}/${TS3_FILENAME}-${TS3_VERSION}.tar.bz2" -O ${TS3_FILENAME}-${TS3_VERSION}.tar.bz2 \
       && tar -xjf "${TS3_FILENAME}-${TS3_VERSION}.tar.bz2" \
       && rm ${TS3_FILENAME}-${TS3_VERSION}.tar.bz2 \
       && cp -r ${TS3_FILENAME}/* ${TS3_HOME} \
       && rm -r ${TS3_HOME}/tsdns \
       && rm -r ${TS3_FILENAME}

ADD entrypoint.sh ${TS3_HOME}/entrypoint.sh

RUN  cp $(pwd)/redist/libmariadb.so.2 $(pwd)

RUN chown -R ${TS3_USER}:${TS3_GROUP} ${TS3_HOME} && chmod u+x /entrypoint.sh

USER ${TS3_USER}

VOLUME ${TS3_HOME}

EXPOSE 9987/udp
EXPOSE 10011
EXPOSE 30033

ENTRYPOINT ${TS_HOME}/entrypoint.sh
