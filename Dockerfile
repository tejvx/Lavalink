FROM openjdk:17-jdk-slim
WORKDIR /app
RUN apt-get update && apt-get install -y curl \
    && curl -L -o Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar
COPY application.yml /app/application.yml
EXPOSE 2333
CMD ["java", "-jar", "Lavalink.jar"]