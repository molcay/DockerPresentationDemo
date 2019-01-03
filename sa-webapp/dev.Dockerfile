# Step 1: Build
FROM maven:3-jdk-8-alpine as builder

# Copy source file to container
COPY ./ /app/build/

# Change working directory in container
WORKDIR /app/build/

# Package application
RUN mvn install

# Step 2: Publish
FROM openjdk:8-jre-alpine

# Environment Variable that defines the endpoint of sentiment-analysis python api.
ENV SA_LOGIC_API_URL http://localhost:5000

# Copy packaged application from builder step to /app/ folder
COPY --from=builder /app/build/target/sentiment-analysis-web-0.0.1-SNAPSHOT.jar /app/

# Change working directory in container
WORKDIR /app/

# Expose 8080 port (actually do nothing, this is for documentation purposes only)
EXPOSE 8080

CMD ["java", "-jar", "sentiment-analysis-web-0.0.1-SNAPSHOT.jar", "--sa.logic.api.url=${SA_LOGIC_API_URL}"]
