FROM ubuntu:14.04

RUN apt-get update \ 
    && apt-get install nodejs npm -y
RUN ln -s /usr/bin/nodejs /usr/bin/node \
    && mkdir -p /var/log/nodeapp

ADD nodeapp /opt/nodeapp

WORKDIR /opt/nodeapp

RUN npm install

VOLUME [ "/var/log/nodeapp" ]

EXPOSE 3000

ENTRYPOINT [ "nodejs", "server.js" ]
