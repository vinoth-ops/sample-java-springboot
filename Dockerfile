# Use the Maven + OpenJDK 17 image
FROM openjdk:17-alpine AS build


# Set the working directory to /workspace
WORKDIR /workspace

# Step 2: Copy your Spring sample application code into the container
COPY . /workspace


# Step 3: Build the application with Maven and package it
RUN ./mvnw clean package

################ Stage 2 ##################################

# Step 4: Use a minimal image to run the native executable
FROM openjdk:17-alpine

# Step 5: Copy the native executable from the build stage
COPY --from=build /workspace/target/*.jar /app/spring-app.jar

# Step 6: Expose port 8080 for the application
EXPOSE 8080

# Step 7: Run the native executable
CMD ["java", "-jar", "/app/spring-app.jar"]
