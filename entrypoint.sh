#!/bin/sh
# Start the web server in the background
mvn spring-boot:run &
# Wait for the web server to become available
./wait-for-webserver.sh
# Keep container running (remove this line if you run tests instead)
tail -f /dev/null
