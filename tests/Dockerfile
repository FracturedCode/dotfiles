FROM alpine:latest as alpine

RUN apk add git zsh nano curl sudo gpg
RUN adduser -h /home/test -s /bin/sh -D test
RUN echo 'test ALL=(ALL:ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
WORKDIR /home/test
USER test
COPY . ./.config/dotfiles
USER root
RUN chown -R test .config/dotfiles
RUN chown test .config/
USER test


FROM debian:latest as debian

RUN apt update && apt install -y git zsh nano curl sudo gpg
RUN adduser --home /home/test --shell /bin/sh test
RUN echo 'test ALL=(ALL:ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
WORKDIR /home/test
USER test
COPY . ./.config/dotfiles
USER root
RUN chown -R test .config/dotfiles
RUN chown test .config/
USER test