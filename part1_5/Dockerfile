FROM ubuntu:16.04

WORKDIR /webapp

RUN apt update && apt install -f -y curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash
RUN apt install -y nodejs
RUN node -v && npm -v

COPY package.json .
RUN npm install
COPY config.js webpack.config.js ./
COPY src ./src
COPY util ./util
EXPOSE 5000

CMD ["npm", "start"]
