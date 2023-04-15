# built maven image using docker
FROM maven:3-adoptopenjdk-8 as maven_built
WORKDIR /app
COPY . .
RUN mvn clean package

# deploy war file to tomcat from mvn_built
FROM tomcat:8.0
COPY --from=mvn_built /app/target/*.war /user/local/tomcat/webapp

