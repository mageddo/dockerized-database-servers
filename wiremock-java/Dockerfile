FROM gradle:6.6.1-jdk11
WORKDIR /app
COPY ./ /app
ENTRYPOINT ["gradle", "run", "--info", "--no-daemon"]
