# specify base image
FROM adoptopenjdk/openjdk11:slim

# install Maven and curl (curl is needed for the wait-for-webserver.sh script)
RUN apt-get update && apt-get install -y --no-install-recommends maven curl

# define working directory
WORKDIR /app

# copy over app files
COPY pom.xml .
COPY src src
COPY wait-for-webserver.sh .

# make the script executable
RUN chmod +x wait-for-webserver.sh

# expose default Spring Boot port 8080
EXPOSE 8080

# Entry point script to run commands
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh
ENTRYPOINT ["./entrypoint.sh"]
