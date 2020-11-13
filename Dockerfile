FROM shashwot/alpine-java

LABEL maintainer "shashwot@gmail.com"

COPY ["entrypoint.sh","."]

RUN apk update && \
    apk upgrade && \
    apk add bash && \ 
    addgroup -S kafka && adduser -S kafka -G kafka && \
    mkdir kafka && \
    wget https://downloads.apache.org/kafka/2.6.0/kafka_2.12-2.6.0.tgz && \
    tar -xvzf kafka_2.12-2.6.0.tgz -C ./kafka --strip 1 && \
    bash -c 'echo delete.topic.enable = true' >> /opt/kafka/config/server.properties && \
    chown -R kafka. /opt/kafka && \
    chown -R kafka. entrypoint.sh && \
    rm -rf kafka_2.12-2.6.0.tgz

ENTRYPOINT ["/opt/entrypoint.sh"]

EXPOSE 2181 9092
