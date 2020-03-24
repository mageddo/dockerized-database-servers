FROM adoptopenjdk:11-jdk-hotspot

WORKDIR /app
COPY ./ /app
RUN javac Main.java

ENV MY_ENV="${MY_ENV} plus something"

ENTRYPOINT ["java", "Main"]