# WSL
export DOCKER_HOST=localhost:2375

# Go
set -gx GOROOT "/usr/lib/go/"
set -gx GOPATH "$HOME/gowork"
test -d "$GOROOT/bin"; and set PATH "$GOROOT/bin" $PATH
test -d "$GOPATH/bin"; and set PATH "$GOPATH/bin" $PATH

# Python
set -gx PYENV_ROOT "$HOME/.pyenv"
test -d "$PYENV_ROOT/bin"; and set PATH "$PYENV_ROOT/bin" $PATH
status --is-interactive; and . (pyenv init -|psub)
status --is-interactive; and source (pyenv virtualenv-init -|psub)
