# Stage 1: Build the application using Maven
FROM maven:3.9.9-eclipse-temurin-23 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy project files
COPY . .

# Build the project and skip tests
RUN mvn clean package -DskipTests

# Stage 2: Use a lightweight JDK image for running the app
FROM eclipse-temurin:23-jdk

# Set the working directory
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/websocket_demo-0.0.1-SNAPSHOT.jar websocket_demo.jar

# Expose port 8080
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "websocket_demo.jar"]
