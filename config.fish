set fish_greeting

alias get="sudo pacman -S"
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syu"
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

function search
  echo "----------------------------"
  ag --ignore "*bundle*" --width 200 "$argv"
  echo "----------------------------"
end

source /home/yo/code/ezkl/ezkl.fish.sh