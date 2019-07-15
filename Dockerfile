FROM node:lts-alpine

ENV PORT 3001

EXPOSE 3001

RUN npm i -g yarn
RUN npm i -g pm2

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

RUN yarn start

CMD ["pm2", "start", "bin/server.js", "--watch"]
