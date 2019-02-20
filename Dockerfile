FROM openjdk:8-alpine

ARG VERSION

COPY ./target/spring-petclinic-$VERSION.jar /

ENTRYPOINT ["java", "-jar", "/spring-petclinic-$VERSION.jar"]

