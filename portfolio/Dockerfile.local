FROM ruby:latest

RUN bundle config --lobal frozen 1

# Persist bash history between sessions
RUN mkdir /commandhistory
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
  && echo $SNIPPET >> "/root/.bashrc"

EXPOSE 3001
WORKDIR /app
ENV BUNDLE_PATH /gems
ENV GEM_HOME /gems
ENV PATH $BUNDLE_PATH/bin:$GEM_HOME/gems/bin:./node_modules/.bin:$PATH

RUN gem install bundler
