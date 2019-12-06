FROM openjdk:12 as build

WORKDIR /build

# First just add the dependencies
COPY ./.mvn ./.mvn
COPY ./pom.xml ./mvnw ./
RUN ./mvnw dependency:resolve

# Create the jar files
COPY ./src ./src
RUN ./mvnw package



FROM openjdk:12

# Add in the compiled jar
COPY --from=build /build/target/*.jar /

# Setup the entrypoint script
COPY ./docker/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

