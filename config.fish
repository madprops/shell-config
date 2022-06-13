set fish_greeting

alias get="sudo pacman -S"
alias update="sudo pacman -Syy"
alias upgrade="yay && flatpak update"
alias h="history | grep"
alias p="ps aux | grep"
alias sauce="source ~/.config/fish/config.fish"
alias rm="rm -I"
alias lq="/bin/lq -u"
alias gitclone="git clone --depth 1"
alias flatget="flatpak --installation=extra install"
alias flatremove="flatpak --installation=extra uninstall"
alias flatclean="flatpak --installation=extra uninstall --unused"
alias flatrun="flatpak --installation=extra run"
alias aurinstalled="pacman -Qqm"
alias d="dolphin ."
alias getaudio="yt-dlp --extract-audio --audio-format mp3 --audio-quality 3"
alias dirsize="du -sh"

function search
  echo "----------------------------"
  ag --ignore "*bundle*" --width 200 "$argv"
  echo "----------------------------"
end

function f
  find . -type f -iname "*$argv*"
end

set -g EZKL_PATH "/home/yo/code/ezkl"
source /home/yo/code/ezkl/ezkl.fish

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH 