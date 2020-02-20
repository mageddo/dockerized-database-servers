FROM openjdk:8-jdk

WORKDIR /app
COPY ./ /app
RUN javac Main.java

ENV MY_ENV="${MY_ENV} plus something"

ENTRYPOINT ["java", "Main"]