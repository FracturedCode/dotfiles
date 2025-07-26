# FracturedCode/dotfiles

Blurb

## Try it out

Prereqs to try it out:
- docker
- curl

```sh
curl https://raw.githubusercontent.com/FracturedCode/dotfiles/refs/heads/master/Dockerfile \
	| docker build --build-arg "USER=$USER" -t FracturedCode/dotfiles -f - . \
	&& docker run --rm -it FracturedCode/dotfiles
```

## Compatibility

OS:
- Windows 10 (WIP)
- Linux, tested specifically on
	- Alpine
	- Arch
- MacOS 15

Architecture:
- x64
- arm64

## Installation

Prereqs:
- [yadm](https://yadm.io/docs/install)

```sh
cd "$HOME"
yadm clone git@github.com:FracturedCode/dotfiles.git
```

It is recommended to run the bootstrap script when prompted, or manually with `yadm bootstrap`.

> [!WARNING]
> The bootstrap script is destructive! It removes clutter from $HOME in order to configure in a more XDG-compliant way.

## Recommmended software

For the prompt:
- zsh or pwsh (pwsh preferred)
- [Oh My Posh](https://ohmyposh.dev/)
- [vivid](https://github.com/sharkdp/vivid)

## Yadm configuration

See [the "Class and Overrides" section of the alternates page in the yadm docs.](https://yadm.io/docs/alternates#).

Classes available:
- work