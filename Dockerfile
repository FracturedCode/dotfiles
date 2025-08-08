FROM alpine:edge AS base

ARG USER=jess
ENV HOME /home/$USER

RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
	&& apk add --update sudo git yadm powershell carapace hyfetch fastfetch vivid curl \
	&& apk add --no-cache coreutils

# add new user
RUN addgroup $USER \
	&& adduser -h $HOME -G $USER -D $USER \
	&& echo "$USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER \
	&& chmod 0440 /etc/sudoers.d/$USER

USER $USER
WORKDIR $HOME

RUN mkdir -p ~/.local/bin && curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin

ENTRYPOINT [ "/usr/bin/pwsh" ]

FROM base AS try-local

ARG USER=jess

COPY --chown=$USER:$USER . ./dotfiles
RUN cd ./dotfiles \
	&& git config user.email 'test@test.com' \
	&& git config user.name 'testy mctestface' \
	&& git add . \
	&& git commit -m "WIP"
RUN yadm clone "$(realpath ./dotfiles)" \
	&& yadm bootstrap

# Cache all the first time run stuff
RUN pwsh

FROM base AS try-remote

RUN yadm clone https://github.com/FracturedCode/dotfiles.git \
	&& yadm bootstrap

# Cache all the first time run stuff
RUN pwsh