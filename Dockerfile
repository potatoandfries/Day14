#Starting With this linux server
FROM  maven:3-eclipse-temurin-21


## ✌𝓑𝓾𝓲𝓵𝓭𝓲𝓷𝓰 𝓽𝓱𝓮 𝓪𝓹𝓹𝓵𝓬𝓪𝓽𝓲𝓸𝓷✌
#Create a directory for our application
#go into the directory cd /app
WORKDIR /app

#everything after this is in /app 
COPY mvnw .
COPY mvnw.cmd .
COPY pom.xml .

#copy directories ( directory in our system  / what u want the name to be)
COPY .mvn .mvn
COPY src src

# Build the application
RUN mvn package -Dmaven.test.skip=true

##🆁🆄🅽🅽🅸🅽🅶 🆃🅷🅴 🅰🅿🅿🅻🅲🅰🆃🅸🅾🅽
# Define environment variable
#this is the external port
ENV PORT=8080

# Expose the port
EXPOSE ${PORT}

#Run the progamme
ENTRYPOINT SERVER_PORT=${PORT} java -jar target/day14-0.0.1-SNAPSHOT.jar