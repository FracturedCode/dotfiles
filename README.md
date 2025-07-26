# FracturedCode/dotfiles

Blurb

## Try it out

Prereqs to try it out:
- docker
- curl

```sh
curl https://raw.githubusercontent.com/FracturedCode/dotfiles/refs/heads/master/DOCKERFILE | \
	docker build --build-arg "USER=$USER" -t FracturedCode/dotfiles -f - . \
	docker run --rm -it FracturedCode/dotfiles
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
yadm bootstrap
```

Yadm classes available:
- work