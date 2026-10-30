# Stage 1: build with Gradle on JDK 17
FROM gradle:8.10-jdk17 AS build
WORKDIR /home/gradle/project
COPY --chown=gradle:gradle build.gradle ./
COPY --chown=gradle:gradle src ./src
RUN gradle bootJar --no-daemon -x test

# Stage 2: lightweight Java runtime
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /home/gradle/project/build/libs/app.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
