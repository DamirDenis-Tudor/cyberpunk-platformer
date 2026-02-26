FROM eclipse-temurin:21-jdk-jammy

RUN apt-get update && apt-get install -y \
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
COPY gradle ./gradle
COPY gradlew .

RUN ./gradlew build --no-daemon

CMD ["java", "-jar", "build/libs/cyberpunk-platformer-1.0.0.jar"]
