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
alias checkcode="goldie \"console.log\" && goldie '\"'"

function h
  history | grep "$argv"
end

function p
  ps aux | grep "$argv"
end

function s
  goldie "$argv"
end

function f
  find . -type f -iname "*$argv*"
end

function i
  symview images "$argv"
end

function v
  symview videos "$argv"
end

function a
  symview audio "$argv"
end

function m
  symview media "$argv"
end

function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

function z
  set p $(ezkl jump "$argv")

  if test -n "$p"
    cd "$p"

    if test $status != 0
      ezkl forget "$p"
    end
  end
end

function zz
  ezkl remember
end

function zzz
  ezkl forget
end

function o
  set p (python ~/code/openfile/openfile.py)

  if test -n "$p"
    code "$p"
  end
end

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin
set xhistory ~/.local/share/fish/xhistory.log
set max_xhistory 500

function intercept --on-event fish_postexec
  echo 111
  if [ "$status" != 0 ]
    return
  end

  if string match -q "cd" $argv
    return
  end

  if string match -q "cd *" $argv
    return
  end

  if string match -q "ls" $argv
    return
  end

  if string match -q "lq" $argv
    return
  end

  if string match -q "z" $argv
    return
  end

  if string match -q "z *" $argv
    return
  end

  if string match -q "br" $argv
    return
  end

  if string match -q "o" $argv
    return
  end

  echo "$argv" >> $xhistory
  set log_size (count (cat $xhistory))

  awk '!seen[$0]++' $xhistory > temp.txt && mv temp.txt $xhistory

  while test $log_size -gt $max_xhistory
    sed -i 1d $xhistory
    set log_size (count (cat $xhistory))
  end
end