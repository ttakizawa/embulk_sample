FROM openjdk:8

# system update
RUN apt-get -y update && apt-get -y upgrade

# locale
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# timezone (Asia/Tokyo)
ENV TZ JST-9

# etc
ENV TERM xterm

# tools
RUN apt-get install -y vim git zip unzip less wget jq

RUN mkdir -p /root/.local/bin
ENV PATH $PATH:/root/.local/bin

# Python
RUN apt-get install -y python3 python3-pip
RUN pip3 install --user --upgrade awscli

# embulk
RUN curl -o /usr/local/bin/embulk --create-dirs -L "http://dl.embulk.org/embulk-latest.jar" && \
    chmod +x /usr/local/bin/embulk

# install plugin
RUN embulk gem install representable -v 3.0.4
RUN embulk gem install faraday -v 0.17.4
RUN embulk gem install embulk-output-bigquery && \
    embulk gem install embulk-input-mysql

WORKDIR /root

#ENTRYPOINT ["/bin/sh", "-c", "/root/entrypoint.sh"]
ENTRYPOINT ["/bin/sh", "-c", "while true; do echo hello world; sleep 1; done"]