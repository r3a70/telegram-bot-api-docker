FROM ubuntu:24.10

WORKDIR /app

COPY . /app

RUN apt update && apt upgrade -y
RUN apt install make git zlib1g-dev libssl-dev gperf cmake g++ -y
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git && cd telegram-bot-api && \
    rm -rf build && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. && \
    cmake --build . --target install && \
    cd ../.. && \
    ls -l telegram-bot-api/bin/telegram-bot-api*
