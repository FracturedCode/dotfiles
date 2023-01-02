FROM alpine:latest

RUN apk add git zsh nano curl sudo
RUN adduser -h /home/test -s /bin/sh -D test
RUN echo 'test ALL=(ALL:ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
USER test
WORKDIR /home/test
RUN ZSH="$HOME/.config/oh-my-zsh" sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
WORKDIR /home/test/
COPY . ./.config/dotfiles
RUN rm .zshrc && rm -rf ./.config/oh-my-zsh/custom
