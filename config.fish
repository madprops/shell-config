set fish_greeting

alias get="sudo pacman -S"
alias update="sudo pacman -Syy"
alias upgrade="yay && flatpak update"
alias sauce="source ~/.config/fish/config.fish"
alias rm="rm -I"
alias gitclone="git clone --depth 1"
alias flatget="flatpak --installation=extra install"
alias flatremove="flatpak --installation=extra uninstall"
alias flatclean="flatpak --installation=extra uninstall --unused"
alias flatrun="flatpak --installation=extra run"
alias aurinstalled="pacman -Qqm"
alias d="dolphin ."
alias getaudio="yt-dlp --extract-audio --audio-format mp3"
alias dirsize="du -sh"

function h
  history | grep "$argv"
end

function p
  ps aux | grep "$argv"
end

function s
  echo "----------------------------"
  ag --ignore "*bundle*" --width 200 "$argv"
  echo "----------------------------"
end

function f
  find . -type f -iname "*$argv*"
end

function i
  python /home/yo/code/symview/symview.py images "$argv"
end

function v
  python /home/yo/code/symview/symview.py videos "$argv"
end

function a
  python /home/yo/code/symview/symview.py audio "$argv"
end

function m
  python /home/yo/code/symview/symview.py media "$argv"
end

function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

set -g EZKL_PATH "/home/yo/code/ezkl"
source /home/yo/code/ezkl/ezkl.fish

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set MANPATH $NPM_PACKAGES/share/man $MANPATH 