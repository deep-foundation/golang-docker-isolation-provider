FROM node:18.16 AS node

RUN apt-get update
RUN apt-get install ffmpeg zip golang -y

COPY package.json .
COPY index.js .
COPY index.js.map .
COPY index.ts .
COPY node_modules ./node_modules
COPY imports ./imports

ENTRYPOINT ["node", "index.js"]
