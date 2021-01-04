FROM kremlinkev/7dtd:latest

LABEL maintainer="kremlinkev <kevin@mancu.so>"

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y git rsync

RUN git clone https://gitlab.com/KhaineGB/darknessfallsa19server.git /tmp/df

RUN rsync -av --exclude='.git/' /tmp/df/ /steam/7dtd \
    && rm -rf /tmp/df/

RUN apt-get purge -y git rsync \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

RUN chown steam: /steam

USER steam
ENV USER=steam
ENV HOME=/steam

CMD /start.sh