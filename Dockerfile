FROM       mhart/alpine-node:6.5
MAINTAINER Jonathan Barnett (me@indieisaconcept)

RUN apk add --update alpine-sdk

# DEFAULTS #

RUN npm install -g \
                nsp \
                npm-check \
                node-versions \
                create-react-app

EXPOSE 3000

WORKDIR /home

CMD ['/bin/bash']
