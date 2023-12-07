ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /app

RUN apt-get -y update && \
    apt-get -y install --no-install-recommends git-core nodejs npm gcc g++ make && \
    rm -rf /var/lib/apt/lists/*

RUN git clone --depth=1 --branch 2.6.0 https://github.com/Jalle19/eda-modbus-bridge.git eda-modbus-bridge
RUN npm i --prefix eda-modbus-bridge --omit=dev

COPY config.sh /app/config.sh
RUN chmod +x /app/config.sh

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
