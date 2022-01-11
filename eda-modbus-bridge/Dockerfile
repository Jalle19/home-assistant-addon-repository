ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

WORKDIR /app

RUN apk add --no-cache git nodejs npm python3 musl-dev make g++ linux-headers

RUN git clone --depth=1 https://github.com/Jalle19/eda-modbus-bridge.git eda-modbus-bridge
RUN npm i --prefix eda-modbus-bridge

COPY config.sh /app/config.sh
RUN chmod +x /app/config.sh

COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

CMD ["/app/entrypoint.sh"]
