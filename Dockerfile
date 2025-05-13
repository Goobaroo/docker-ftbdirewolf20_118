# syntax=docker/dockerfile:1

FROM openjdk:18.0.2-jdk-buster

LABEL version="1.11.0"
LABEL homepage.group=Minecraft
LABEL homepage.name="FTB Presents Direwolf20 1.18"
LABEL homepage.icon="https://cdn.feed-the-beast.com/blob/ad/ad980c51db980730fb00e1f5b145c8ffbb39b2f8f1b326044c5d5310d1e3e82a.png"
LABEL homepage.widget.type=minecraft
LABEL homepage.widget.url=udp://FTBDirewolf20_118:25565


RUN apt-get update && apt-get install -y curl && \
 adduser --uid 99 --gid 100 --home /data --disabled-password minecraft

COPY launch.sh /launch.sh
RUN chmod +x /launch.sh

USER minecraft

VOLUME /data
WORKDIR /data

EXPOSE 25565/tcp

ENV MOTD="FTB Presents Direwolf20 1.18 v1.11.0 Server Powered by Docker"
ENV LEVEL=world
ENV JVM_OPTS="-Xms4096m -Xmx6144m"

CMD ["/launch.sh"]