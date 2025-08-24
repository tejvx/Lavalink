FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Update package list and install required tools
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Create plugins directory
RUN mkdir -p /app/plugins

# Download Lavalink JAR with retry logic
RUN for i in 1 2 3; do \
    curl -L -o Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/download/4.0.8/Lavalink.jar && \
    java -jar Lavalink.jar --version && break || sleep 5; \
    done

# Download essential plugins with proper error handling and verification
RUN curl -L -o /app/plugins/youtube-plugin.jar \
    https://github.com/lavalink-devs/youtube-source/releases/download/1.7.2/youtube-plugin-1.7.2.jar && \
    [ -s /app/plugins/youtube-plugin.jar ] || (echo "YouTube plugin download failed" && exit 1)

RUN curl -L -o /app/plugins/lavasrc-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/download/4.2.0/lavasrc-plugin-4.2.0.jar && \
    [ -s /app/plugins/lavasrc-plugin.jar ] || (echo "LavaSrc plugin download failed" && exit 1)

# Optional plugins with fallback handling
RUN curl -L -o /app/plugins/sponsorblock-plugin.jar \
    https://github.com/lavalink-devs/sponsorblock-plugin/releases/download/3.0.1/sponsorblock-plugin-3.0.1.jar || \
    echo "SponsorBlock plugin download failed, continuing..."

# Verify all JAR files are valid
RUN for jar in /app/plugins/*.jar; do \
    if [ -f "$jar" ]; then \
        unzip -t "$jar" > /dev/null 2>&1 || (echo "Invalid JAR: $jar" && rm -f "$jar"); \
    fi; \
    done

# Copy configuration file
COPY application.yml /app/application.yml

# Set proper permissions
RUN chmod +r /app/plugins/*.jar 2>/dev/null || true
RUN chmod +r /app/application.yml
RUN chmod +x /app/Lavalink.jar

# Create logs directory
RUN mkdir -p /app/logs

# Expose Lavalink port
EXPOSE 2333

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -f http://localhost:2333/v4/info || exit 1

# Start Lavalink with plugins
CMD ["java", "-Djava.awt.headless=true", "-Dfile.encoding=UTF-8", "-Xmx512m", "-jar", "Lavalink.jar"]
