FROM alpine:3.20 as builder
WORKDIR /build
RUN apk update && apk upgrade
RUN apk add alpine-sdk linux-headers git zlib-dev openssl-dev gperf cmake
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git && \
cd telegram-bot-api && rm -rf build && mkdir build && cd build && \
cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. && \
cmake --build . --target install


FROM alpine:3.20
RUN apk update && apk upgrade
RUN apk add --update openssl libstdc++
COPY --from=builder /build/telegram-bot-api/bin/telegram-bot-api /usr/bin/telegram-bot-api

CMD ["/usr/bin/telegram-bot-api"]
