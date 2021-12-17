FROM ubuntu:latest
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
    libmicrohttpd-dev \
    libssl-dev \
    cmake \
    build-essential \
    libhwloc-dev \
    git && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/pablo-lp/xmr-stak.git \
    && mkdir xmr-stak/build && cd xmr-stak/build \
    && cmake -DCUDA_ENABLE=OFF -DOpenCL_ENABLE=OFF .. \
    && make install

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh
ENTRYPOINT ["/usr/local/bin/run.sh"]