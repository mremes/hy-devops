FROM ubuntu:16.04

WORKDIR /webapp

RUN apt update && apt install -f -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN node -v && npm -v

COPY package.json config.js index.js ./
RUN npm install
COPY server ./server
COPY logs.txt ./logs.txt
EXPOSE 8000

CMD ["npm", "start"]

