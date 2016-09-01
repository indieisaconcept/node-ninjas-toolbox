FROM       mhart/alpine-node:6.5
MAINTAINER Jonathan Barnett (me@indieisaconcept)

ENV NODE_DIR    /usr/src/app/

RUN apk add --update alpine-sdk

# DEFAULTS #

RUN npm install -g \
                nsp \
                npm-check \
                node-versions \
                create-react-app

WORKDIR ${NODE_DIR}

# setup local cli tool / app

COPY package.json ${NODE_DIR}
RUN  npm install

COPY . ${NODE_DIR}
RUN  npm link

EXPOSE 3000

WORKDIR /home

CMD ['/bin/bash']
