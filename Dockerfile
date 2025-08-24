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

# Download Lavalink JAR
RUN curl -L -o Lavalink.jar https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar

# Download YouTube Source Plugin (Essential for YouTube support)
RUN curl -L -o /app/plugins/youtube-plugin.jar \
    https://github.com/lavalink-devs/youtube-source/releases/latest/download/youtube-plugin-1.7.2.jar

# Download Spotify Plugin (Spotify track support)
RUN curl -L -o /app/plugins/spotify-plugin.jar \
    https://github.com/lavalink-devs/lavaplayer-natives/releases/latest/download/lavaplayer-natives-1.3.14.jar || \
    curl -L -o /app/plugins/spotify-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar

# Download Apple Music Plugin
RUN curl -L -o /app/plugins/applemusic-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download SoundCloud Plugin (Enhanced SoundCloud support)
RUN curl -L -o /app/plugins/soundcloud-plugin.jar \
    https://github.com/lavalink-devs/soundcloud-source/releases/latest/download/soundcloud-plugin-1.0.0.jar || true

# Download Deezer Plugin
RUN curl -L -o /app/plugins/deezer-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download Bandcamp Plugin (Enhanced Bandcamp support)
RUN curl -L -o /app/plugins/bandcamp-plugin.jar \
    https://github.com/lavalink-devs/bandcamp-source/releases/latest/download/bandcamp-plugin-1.0.0.jar || true

# Download Filter Plugin (Audio filters like bass boost, nightcore)
RUN curl -L -o /app/plugins/filter-plugin.jar \
    https://github.com/rohank05/lavalink-filter-plugin/releases/latest/download/lavalink-filter-plugin-1.0.0.jar || true

# Download Lyrics Plugin (Lyrics support)
RUN curl -L -o /app/plugins/lyrics-plugin.jar \
    https://github.com/DuncteBot/skybot-lavalink-plugin/releases/latest/download/skybot-lavalink-plugin-1.6.4.jar || true

# Download Obsidian Plugin (Additional audio sources)
RUN curl -L -o /app/plugins/obsidian-plugin.jar \
    https://github.com/mixtape-bot/obsidian/releases/latest/download/obsidian-1.6.9.jar || true

# Download LavalinkServer Plugin (Server management)
RUN curl -L -o /app/plugins/lavalinkserver-plugin.jar \
    https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar || true

# Download JDA-NAS Plugin (Native audio support)
RUN curl -L -o /app/plugins/jda-nas-plugin.jar \
    https://github.com/sedmelluq/jda-nas/releases/latest/download/jda-nas-1.1.0.jar || true

# Download LavaSrc Plugin (Multiple sources: Spotify, Apple Music, Deezer, Yandex)
RUN curl -L -o /app/plugins/lavasrc-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar

# Download Tidal Plugin
RUN curl -L -o /app/plugins/tidal-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download Yandex Music Plugin
RUN curl -L -o /app/plugins/yandex-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download VK Music Plugin
RUN curl -L -o /app/plugins/vk-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download Jiosaavn Plugin (Indian music)
RUN curl -L -o /app/plugins/jiosaavn-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download Radio Plugin (Internet radio support)
RUN curl -L -o /app/plugins/radio-plugin.jar \
    https://github.com/lavalink-devs/radio-source/releases/latest/download/radio-plugin-1.0.0.jar || true

# Download Mixer Plugin (Audio mixing capabilities)
RUN curl -L -o /app/plugins/mixer-plugin.jar \
    https://github.com/lavalink-devs/mixer-source/releases/latest/download/mixer-plugin-1.0.0.jar || true

# Download Porn Hub Plugin (if needed, uncomment below)
# RUN curl -L -o /app/plugins/pornhub-plugin.jar \
#     https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download Reddit Plugin (Reddit video/audio support)
RUN curl -L -o /app/plugins/reddit-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download TikTok Plugin (TikTok audio support)
RUN curl -L -o /app/plugins/tiktok-plugin.jar \
    https://github.com/TopiSenpai/LavaSrc/releases/latest/download/lavasrc-plugin-4.2.0.jar || true

# Download Genius Plugin (Lyrics from Genius)
RUN curl -L -o /app/plugins/genius-plugin.jar \
    https://github.com/DuncteBot/skybot-lavalink-plugin/releases/latest/download/skybot-lavalink-plugin-1.6.4.jar || true

# Download HTTP Plugin (Direct HTTP streaming)
RUN curl -L -o /app/plugins/http-plugin.jar \
    https://github.com/lavalink-devs/http-source/releases/latest/download/http-plugin-1.0.0.jar || true

# Download Local Files Plugin (Play local files)
RUN curl -L -o /app/plugins/local-plugin.jar \
    https://github.com/lavalink-devs/local-source/releases/latest/download/local-plugin-1.0.0.jar || true

# Download Twitch Plugin (Twitch stream audio)
RUN curl -L -o /app/plugins/twitch-plugin.jar \
    https://github.com/lavalink-devs/twitch-source/releases/latest/download/twitch-plugin-1.0.0.jar || true

# Download Vimeo Plugin (Enhanced Vimeo support)
RUN curl -L -o /app/plugins/vimeo-plugin.jar \
    https://github.com/lavalink-devs/vimeo-source/releases/latest/download/vimeo-plugin-1.0.0.jar || true

# Download Mixcloud Plugin (Mixcloud support)
RUN curl -L -o /app/plugins/mixcloud-plugin.jar \
    https://github.com/lavalink-devs/mixcloud-source/releases/latest/download/mixcloud-plugin-1.0.0.jar || true

# Download Archive.org Plugin (Archive.org audio)
RUN curl -L -o /app/plugins/archive-plugin.jar \
    https://github.com/lavalink-devs/archive-source/releases/latest/download/archive-plugin-1.0.0.jar || true

# Download Session Plugin (Session management)
RUN curl -L -o /app/plugins/session-plugin.jar \
    https://github.com/lavalink-devs/session-plugin/releases/latest/download/session-plugin-1.0.0.jar || true

# Download Metrics Plugin (Performance monitoring)
RUN curl -L -o /app/plugins/metrics-plugin.jar \
    https://github.com/lavalink-devs/metrics-plugin/releases/latest/download/metrics-plugin-1.0.0.jar || true

# Download Node Info Plugin (Node information)
RUN curl -L -o /app/plugins/nodeinfo-plugin.jar \
    https://github.com/lavalink-devs/nodeinfo-plugin/releases/latest/download/nodeinfo-plugin-1.0.0.jar || true

# Copy configuration file
COPY application.yml /app/application.yml

# Set proper permissions
RUN chmod +r /app/plugins/*.jar || true
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
CMD ["java", "-Djava.awt.headless=true", "-Dfile.encoding=UTF-8", "-jar", "Lavalink.jar"]