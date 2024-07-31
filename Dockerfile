# Stage 1: Build the application
FROM gradle:7.4.1-jdk11 AS builder

WORKDIR /app

# Copy the Gradle wrapper and build files
COPY gradle/ gradle/
COPY gradlew gradlew
COPY gradlew.bat gradlew.bat
COPY build.gradle settings.gradle ./

# Copy the source code
COPY src/ src/

# Ensure the gradlew script is executable
RUN chmod +x gradlew

# Build the application
RUN ./gradlew build --no-daemon

# Stage 2: Create a minimal runtime image
FROM openjdk:11-jdk-slim

WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=builder /app/build/libs/*.jar /app/app.jar

EXPOSE 8080

# Define healthcheck
HEALTHCHECK CMD curl --fail http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
