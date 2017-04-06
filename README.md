[![Stories in Ready](https://badge.waffle.io/asosgaming/teamspeak.png?label=ready&title=Ready)](https://waffle.io/asosgaming/teamspeak)
## ASoS Gaming TeamSpeak 3 Docker Image

## Version: [1.0.0.5](https://github.com/asosgaming/teamspeak/blob/master/Dockerfile)

* Version 1.0.0.5

[![](https://images.microbadger.com/badges/version/asos/teamspeak.svg)](https://microbadger.com/images/asos/teamspeak "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/asos/teamspeak.svg)](https://microbadger.com/images/asos/teamspeak "Get your own image badge on microbadger.com")
[![Docker Automated build](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg?style=plastic)](https://img.shields.io/docker/automated/jrottenberg/ffmpeg.svg)
[![Github Releases (by Release)](https://img.shields.io/github/downloads/atom/atom/v0.190.0/total.svg)](https://github.com/asosgaming/teamspeak/releases/tag/1.0.0.5)
[![Stories in Ready](https://badge.waffle.io/asosgaming/sinusbot.png?label=ready&title=Ready)](http://waffle.io/asosgaming/sinusbot)

Docker container for the TeamSpeak 3 Server.

TeamSpeak 3 Homepage: https://www.teamspeak.com/teamspeak3.html


* Installation Instructions

*      More Information will be added later.
      As of right now this image is built to use custom variables.
      These variables must be set in your docker.compose file.   
      If you do not use a docker-compose file this will not work for you
      This build was made to be used with MariaDB or MySQL only
      You may create a folder on your docker host at /storate/teamspeak and assign permissions to 4000:4000 (teamspeak:teamspeak)
      Upload your backups and license keys to this directory on the docker host.

------------------------UPDATES---------------------------

Instituting Changes to allow for Docker Image Tags in build environment.
Completed Update of Teamspeak Server to latest version allowed for use with Sinusbot.
Versioning added to match Sinusbot Versions. For best results make sure both versions are the same.

----------------------------------------------------------

## Available Environment Variables

*Please refer the docker run command options for the `--env-file` flag where you can specify all required environment variables in a single file. This will save you from writing a potentially long docker run command. Alternatively you can use docker-compose.*

Below is the complete list of available options that can be used to customize your TeamSpeak container.

| Environment Variable | Description |
|-----------|-------------|
| `TS_USER` | User which owns the teamspeak_server pid. Defaults to `teamspeak`|
| `TS_HOME` |  Directory of the containing teamspeak file. Defaults to `/teamspeak` |
| `LOG_QUERY_COMMANDS` |Directory of the containing teamspeak file. Defaults to `0`  |
| `MACHINE_ID` | Optional name of this server process to identify a group of servers with the same ID. This can be useful when running multiple TeamSpeak 3 Server instances on the same database. Please note that we strongly recommend that you do NOT run multiple server instances on the same SQLite database. Default is `not used`. |
| `TS3_LICENSE_PATH` |  The physical path where your license file is located. Default is `Empty`.  |
| `DEFAULT_VOICE_PORT` |  UDP port open for clients to connect to. This port is used by the first  virtual server, subsequently  started virtual servers will open on increasing  port numbers Defautls to `9987`  |
| `VOICE_IP` |   IP on which the server instance will listen for incoming voice connections. Defaults to `0.0.0.0`  |
| `FILE_TRANSFER_PORT` |  TCP Port opened for file transfers. If you specify this parameter, you also  need to specify the `FILE_TRANSFER_IP` envoirment variable! Defautls to `30033` |
| `FILE_TRANSFER_IP` |  IP on which the file transfers are bound to. If you specify this parameter,  you also need to specify the `FILE_TRANSFER_PORT` envoirment variable! Defaults to `0.0.0.0`  |
| `QUERY_PORT` |TCP Port opened for file transfers. If you specify this parameter, you also  need to specify the `QUERY_IP` envoirment variable! Defautls to `10011` |
| `QUERY_IP` | IP bound for incoming ServerQuery connections. If you specify this parameter,  you also need to specify the `QUERY_PORT` envoirment variable! Defaults to `0.0.0.0`  |
| `QUERY_IP_WHITELIST` |  The file containing whitelisted IP addresses for the ServerQuery interface. All hosts listed in this file will be ignored by the ServerQuery flood protection. Defaults to `query_ip_whitelist.txt`  |
| `QUERY_IP_BLACKLIST` |  The file containing backlisted IP addresses for the ServerQuery interface. All hosts listed in this file will be ignored by the ServerQuery flood protection. Defaults to `query_ip_blacklist.txt` |
| `LOG_PATH` |   The physical path where the server will create logfiles. Defaults to `logs/`  |
| `LOG_QUERY_COMMAND` |  If set to "1", the server will log every ServerQuery command executed by clients. This can  be useful while trying to diagnose several different issues. Defaults to `0`  |
| `DB_CLIENT_KEEP_DAYS` |  Defines how many days to keep unused client identities. Auto-pruning is triggered on every  start and on every new month while the server is running. Defaults to `30`.  |
| `LOG_APPEND` |  If set to "1", the server will not create a new logfile on every start. Instead, the log output will be appended to the previous logfile. The logfile name will only contain the ID of the virtual server. Defaults to `0`.  |
| `QUERY_SKIP_BRUTEFORCE_CHECK` | Defaults to `0`.  |
| `TS3_MARIADB_DB` | Name of the Database. Default to  `Not Set`.  |
| `TS3_MARIADB_USER` | Database User. Default to  `Not Set`.  |
| `TS3_MARIADB_PASS` | Database User Password. Default to  `Not Set`. |
| `TS3_MARIADB_HOST` | Hostname of the DatabaseServer like localhost Default to  `Not Set`. |
| `TS3_MARIADB_PORT` | DatabaseServer Port. Default to  `Not Set`.  |


# LICENSE
The MIT License (MIT)

Copyright (c) 2017 ASoS Gaming www.asosgaming.com
