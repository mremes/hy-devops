FROM ubuntu:18.10

ENV PATH=$PATH:/root/.local/bin

RUN apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -f -y git rtmpdump \
    wget ffmpeg python3-dev python3-setuptools \
    python3-pycryptodome python3-requests python3-lxml \
    php-cli php-curl php-xml php-bcmath && \
    git clone https://github.com/aajanki/yle-dl.git && \
    cd yle-dl && python3 setup.py install --user && \
    cd - && rm -r yle-dl && apt-get purge -y --auto-remove \
    git && yle-dl --help

CMD ["/bin/bash"]
