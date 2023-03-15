FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      ca-certificates \
      build-essential \
      zlib1g-dev \
      libbz2-dev \
      libboost-all-dev \
      file \
      numactl \
      gawk \
      locales && \
    apt-get autoremove && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    sed -i '/C.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen

#ADD --checksum=sha256:15078e24c79fe5aabe42748d64f95d15f3fbd7708e84d88fc07c4b7f2e4b0902 https://github.com/alekseyzimin/masurca/releases/download/v4.1.0/MaSuRCA-4.1.0.tar.gz /tmp/masurca.tar.gz
ADD https://github.com/alekseyzimin/masurca/releases/download/v4.1.0/MaSuRCA-4.1.0.tar.gz /opt/MaSuRCA-4.1.0.tar.gz
COPY manifest-sha256.txt /opt

WORKDIR /opt
# NOTE: We remove the part that copies Flye since this fails for some reason.
RUN sha256sum -c ./manifest-sha256.txt && \
    tar xvzf ./MaSuRCA-4.1.0.tar.gz && \
    cd MaSuRCA-4.1.0 && \
    sed -i 's/ && cp -a ..\/Flye $DEST//' install.sh && \
    ./install.sh && \
    ln -sf /usr/bin/gawk /usr/bin/awk && \
    rm -rf /opt/MaSuRCA-4.1.0.tar.gz /opt/manifest-sha256.txt

ENV LC_ALL=C.UTF-8 \
    LANGUAGE=C.UTF-8 \
    LANG=C.UTF-8 \
    PATH="${PATH}:/opt/MaSuRCA-4.1.0/bin"

CMD ["masurca"]
#ENTRYPOINT ["masurca"]
