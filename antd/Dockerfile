FROM node:20-alpine

RUN apk add --no-cache bash

# Persist bash history between sessions
RUN mkdir /commandhistory
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
  && echo $SNIPPET >> "/root/.bashrc"


EXPOSE 3000
WORKDIR /app