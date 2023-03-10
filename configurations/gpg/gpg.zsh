export GPG_TTY=$(tty)
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg
gpg-relay() {
    # What
    # This is to pipe a windows gpg-agent into wsl.
    #
    # Setup
    # Compile https://github.com/Lexicality/wsl-relay and place in your windows path
    # Install socat
    # On windows, your gpg-agent must be running. If it doesn't already start automatically, you can add
    # a startup script to task scheduler or a systemd script in wsl to execute `gpg-connect-agent.exe /bye`
    #
    # Usage
    # Usually, you'll want to fork this function: `gpg-relay &`
    # You could create a gpg-relay daemon on wsl. I'm doing it this way
    # because my weird use cases require both my gpg installs on wsl and win.
    gpgconf --kill gpg-agent
    exec socat UNIX-LISTEN:$GNUPGHOME/S.gpg-agent,fork, EXEC:'wsl-relay.exe --input-closes --pipe-closes --gpg',nofork
}
