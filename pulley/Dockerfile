FROM ruby:latest

ARG USER_ID
ARG GROUP_ID

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

# Create non-root user - user and group args must be passed in on build
# ex. --build-arg USER_ID=$(id -u) --build-arg GROUP_ID=$(id -g)
RUN addgroup --gid $GROUP_ID user
RUN useradd --create-home --uid $USER_ID --gid $GROUP_ID user
USER user
