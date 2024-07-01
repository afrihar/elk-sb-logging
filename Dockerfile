# First stage: Build the application
FROM maven:3.9.8-amazoncorretto-21 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and source code
COPY pom.xml .
COPY src ./src

# Package the application
RUN mvn clean package -DskipTests

# Second stage: Prepare the runtime environment
FROM tomcat:latest

COPY --from=builder /app/target/*.war /usr/local/tomcat/webapps/ROOT.war
