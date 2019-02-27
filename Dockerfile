FROM openjdk:8-alpine

ARG VERSION

COPY ./target/spring-petclinic-$VERSION.jar /

RUN ln -s /spring-petclinic-$VERSION.jar /spring-petclinic.jar

ENTRYPOINT ["java", "-jar", "/spring-petclinic.jar"]

