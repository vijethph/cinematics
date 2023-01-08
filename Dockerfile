#
# Build stage
#
FROM maven:3.6.3-openjdk-14 AS build
COPY src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests

#
# Package stage
#
FROM eclipse-temurin:16 as package
COPY --from=build /usr/src/app/target/dbms-0.0.1-SNAPSHOT.jar /usr/app/dbms.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/app/dbms.jar"]
