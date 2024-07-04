# docker build -t ascp:3.7.2 -f Dockerfile  .
# singularity build aspera-ascp-3.7.2.sif docker-daemon://ascp:3.7.2
# mv aspera-ascp-3.7.2.sif ascp
# chmod +x ascp

FROM ubuntu:24.04

RUN apt-get update -y && apt-get install -y --no-install-recommends wget zip && \
    wget http://download.asperasoft.com/download/sw/cli/3.7.2/aspera-cli-3.7.2.354.010c3b8-linux-64-release.sh && \
    bash aspera-cli-3.7.2.354.010c3b8-linux-64-release.sh && \
    rm -r aspera-cli-3.7.2.354.010c3b8-linux-64-release.sh && \
    apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN chmod a+rx /root/.aspera/cli/bin/* && \
    mv /root/.aspera /opt/aspera

# Add the common Aspera Connect private key
RUN mkdir -p /opt/aspera/connect/etc/ && \
    wget --no-check-certificate -O /opt/aspera/connect/etc/asperaweb_id_dsa.openssh https://gist.githubusercontent.com/pansapiens/67822d6d642252e73190e74bbc666924/raw/4340f0e46a9381d38f045cbfd0a1fad820c62794/asperaweb_id_dsa.openssh && \
    ln -s /opt/aspera/connect/etc/asperaweb_id_dsa.openssh /asperaweb_id_dsa.openssh

ENV PATH=/opt/aspera/cli/bin:$PATH

ENTRYPOINT ["ascp"]
    
