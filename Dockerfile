FROM ubuntu:24.10

RUN apt get update && apt get upgrade
RUN apt get install make git zlib1g-dev libssl-dev gperf cmake g++
RUN git clone --recursive https://github.com/tdlib/telegram-bot-api.git && cd telegram-bot-api && \
    rm -rf build && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX:PATH=.. .. && \
    cmake --build . --target install && \
    cd ../.. && \
    ls -l telegram-bot-api/bin/telegram-bot-api*
