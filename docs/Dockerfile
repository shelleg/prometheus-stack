FROM nginx:latest

RUN apt-get update && \
      apt-get install -y --no-install-recommends curl xz-utils

# Install NodeJS
ENV NODE_VERSION 9.1.0
RUN curl -kSLO "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" \
      && tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local --strip-components=1 --no-same-owner \
      && rm "node-v$NODE_VERSION-linux-x64.tar.xz" \
      && ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Clean excess
RUN apt-get autoremove -y && \
      apt-get autoclean -y && \
      rm -rf /var/lib/{apt,dpkg,cache,log} /tmp/* ~/.cache && \
      rm -rf /usr/src/python /usr/share/doc /usr/share/man && \
      rm -rf /var/lib/apt/lists/* && \
      rm -f /var/cache/apt/archives/*.deb

# Install GitBook
WORKDIR /srv/docs
COPY book.json /srv/docs/
RUN npm install -g gitbook-cli
RUN gitbook install

# Build
COPY . /srv/docs/
RUN gitbook build
RUN rm /usr/share/nginx/html/*
RUN mv ./_book/* /usr/share/nginx/html/
