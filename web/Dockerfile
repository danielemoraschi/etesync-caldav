FROM node

ENV BASE_DIR "/app"

ENV PORT 3600
ENV REACT_APP_DEFAULT_API_PATH etebase
ENV NODE_ENV developmnet

WORKDIR $BASE_DIR
COPY source $BASE_DIR

RUN yarn
RUN yarn build

CMD ["sh", "-c", "PORT=$PORT yarn start"]