#FROM ubuntu:22.10
FROM debian:bullseye

# RUN echo 'APT { Get { AllowUnauthenticated "1"; }; };' > /etc/apt/apt.conf.d/99allow_unauth
#RUN rm -r  /etc/apt/trusted.gpg.d
#RUN apt-get update && apt-get install -y gnupg
#RUN apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com
RUN apt-get update && apt-get install -y gpsbabel && rm -rf /tmp/* && apt-get clean 