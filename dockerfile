FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    openjdk-17-jdk \
    gradle \
    libxext6 \
    libxrender1 \
    libxtst6 \
    libxi6 \
    libxrandr2 \
    x11-apps \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY build.gradle settings.gradle ./
COPY src ./src
COPY libs ./libs

RUN gradle build --no-daemon

CMD ["java", "-jar", "build/libs/cyberpunk-platformer-1.0.0.jar"]
