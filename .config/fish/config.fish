set -x PATH $PATH \
    $HOME/.local/bin \
    $HOME/.npm-global/bin \
    $HOME/go/bin

set -x EDITOR vim
set -x FZF_FIND_FILE_COMMAND "find \$dir -type f"
set -x LIBVIRT_DEFAULT_URI "qemu:///system"

alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
