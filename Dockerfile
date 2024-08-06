# Use the official image as a parent image
FROM openjdk:11-jdk-slim

# Set the working directory
WORKDIR /app

# Install dos2unix to fix line endings
RUN apt-get update && apt-get install -y dos2unix
COPY . .
# Copy the build.gradle and settings.gradle files first for Gradle build cache
COPY build.gradle settings.gradle ./

# Copy the Gradle wrapper files
COPY gradlew gradlew.bat ./
COPY gradle/ gradle/

# Ensure the Gradle wrapper is executable and fix line endings
RUN dos2unix gradlew && chmod +x gradlew

# Download the dependencies without running the tests
RUN ./gradlew dependencies --no-daemon

# Copy the rest of the application
COPY src/ src/

# Build the application
RUN ./gradlew bootJar --no-daemon

# Expose the port the application runs on
EXPOSE 8080

# Set the entry point to run the application
ENTRYPOINT ["java","-jar","/app/build/libs/demo-0.0.1-SNAPSHOT.jar"]
