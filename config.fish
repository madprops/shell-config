set fish_greeting

alias get="sudo apt install -y"
alias update="sudo apt update"
alias upgrade="sudo apt -y dist-upgrade"
alias up="update && upgrade"
alias remove="sudo apt remove"
alias autorm="sudo apt autoremove"
alias h="history | grep"
alias p="ps aux | grep"
alias sauce="source ~/.config/fish/config.fish"
alias rm="rm -I"
alias lq="/bin/lq -u"
alias clone="git clone --depth 1"

function search
  echo "----------------------------"
  ag --ignore "*bundle*" --width 200 "$argv"
  echo "----------------------------"
end

source /home/yo/code/ezkl/ezkl.fish.sh

set PATH $PATH:/home/yo/scripts:/home/yo/.local/bin:/home/yo/bin:/home/yo/.nimble/bin:/home/yo/go/bin