# Step 1: Use lightweight Java 17 image
FROM eclipse-temurin:17-jdk-alpine

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy Gradle wrapper and project files
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .
COPY src src

# Step 4: Give execute permission
RUN chmod +x gradlew

# Step 5: Build the application
RUN ./gradlew build -x test

# Step 6: Run the Spring Boot app
CMD ["java", "-jar", "build/libs/demo-app-0.0.1-SNAPSHOT.jar"]
