FROM node:12.13.0-slim

RUN apt-get update -y && \
      apt-get install -y \
        jq \
        nano \
        htop && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app 
