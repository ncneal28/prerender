FROM node:12-alpine

ENV CHROME_BIN=/usr/bin/chromium-browser
ENV CHROME_PATH=/usr/lib/chromium/
ENV MEMORY_CACHE=0

WORKDIR /app

RUN apk add --update-cache chromium \
    && rm -rf /var/cache/apk/* /tmp/*

COPY package.json .
COPY lib ./lib
COPY server.js .

RUN npm install

USER node

EXPOSE 3000

CMD ["node", "server.js"]