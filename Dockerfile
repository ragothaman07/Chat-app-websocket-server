FROM maven:# Use an official Maven image with Java 23
           FROM maven:3.9.9-eclipse-temurin-23

           # Set the working directory inside the container
           WORKDIR /app

           # Copy the Maven project files (pom.xml and source code)
           COPY . .

           # Build the application using Maven
           RUN mvn clean package

           # Expose port 8080 for the application
           EXPOSE 8080

           # Run the application
           CMD ["java", "-jar", "target/your-app.jar"]
