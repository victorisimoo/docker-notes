
FROM node:14-alpine

ENV NODE_ENV=development
ENV NODE_PORT=8000
ENV HOME=/home/node/app
ENV PATH=${PATH}:${HOME}/node_modules/.bin


RUN mkdir -p $HOME && chown -R node:node $HOME

WORKDIR $HOME


USER node

COPY --chown=node:node package*.json $HOME/


RUN npm install


COPY --chown=node:node . .
RUN npm run build


VOLUME ${HOME}/static

EXPOSE $NODE_PORT


CMD [ "node", "./index.js" ]