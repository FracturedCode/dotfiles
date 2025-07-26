FROM alpine:edge

ARG USER=jess
ENV HOME /home/$USER

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add --update sudo git yadm powershell carapace hyfetch fastfetch vivid curl

# add new user
RUN adduser -D $USER \
        && echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
        && chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

RUN mkdir -p ~/.local/bin && curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

RUN yadm clone https://github.com/FracturedCode/dotfiles.git \
	&& yadm bootstrap

RUN pwsh

ENTRYPOINT [ "/usr/bin/pwsh" ]