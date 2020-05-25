FROM adoptopenjdk:11-jre-hotspot
ADD target/OAuthServer.jar OAuthServer.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","OAuthServer.jar"]
