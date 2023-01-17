FROM kremlinkev/7dtd:latest

LABEL maintainer="kremlinkev <kevin@mancu.so>"

ARG DEBIAN_FRONTEND=noninteractive

USER root

RUN apt-get update \
    && apt-get install -y git rsync

RUN git clone https://gitlab.com/KhaineGB/darkness-falls-a20.git /tmp/df

RUN rsync -av --exclude='.git/' /tmp/df/ /steam/7dtd \
    && rm -rf /tmp/df/ \
    && find /steam/7dtd/Mods/0-DarknessFallsCore/Worlds -type d -exec ln -s {} /steam/7dtd/Data/Worlds \;

RUN apt-get purge -y git rsync \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

# doing find since chown -R seems to cause dockerhub run out of Disk.
RUN find /steam -exec chown steam: {} \;

USER steam
ENV USER=steam
ENV HOME=/steam

CMD /start.sh
