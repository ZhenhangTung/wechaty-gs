FROM node:16
FROM wechaty/wechaty:next
LABEL maintainer="Huan <zixia@zixia.net>"

RUN cd /tmp \
  && wget https://github.com/yudai/gotty/releases/download/v2.0.0-alpha.3/gotty_2.0.0-alpha.3_linux_amd64.tar.gz \
  && tar zxvf ./gotty*.tar.gz \
  && rm -f gotty*.tar.gz \
  && mv gotty* /usr/local/bin

WORKDIR /usr/src/app

COPY package*.json ./


RUN npm --registry=https://registry.npm.taobao.org install

COPY . .

EXPOSE 8080
