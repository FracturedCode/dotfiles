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
- Windows 10
- Linux, tested specifically on
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
> The bootstrap script is destructive! It removes clutter from $HOME that we attempt to configure in a more XDG-compliant way.


## Yadm configuration

See [the "Class and Overrides" section of the alternates page in the yadm docs.](https://yadm.io/docs/alternates#).

Classes available:
- work