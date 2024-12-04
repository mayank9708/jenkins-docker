 Use an official OpenJDK runtime as the base image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the application JAR file into the container
COPY HelloWorld.class /app/HelloWorld.class

# Expose the application port (adjust based on your app's port)
EXPOSE 8080

# Command to run the JAR file
CMD ["java", "HelloWorld"]
