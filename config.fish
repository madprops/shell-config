set fish_greeting

alias get="sudo pacman -S"
alias update="sudo pacman -Syy"
alias upgrade="yay && flatpak update"
alias sauce="source ~/.config/fish/config.fish"
alias rm="rm -I"
alias gitclone="git clone --depth=1"
alias flatget="flatpak --installation=extra install"
alias flatremove="flatpak --installation=extra uninstall"
alias flatclean="flatpak --installation=extra uninstall --unused"
alias flatrun="flatpak --installation=extra run"
alias aurinstalled="pacman -Qqm"
alias d="dolphin ."
alias dirsize="du -sh"

function fish_prompt
  set -l timestamp (date "+%H:%M:%S")
  echo -n (set_color cyan)"[$timestamp]"(set_color normal) "$PWD" "> "
end

function getaudio
  cd ~/music/library/units/ &&
  yt-dlp --extract-audio --audio-format mp3 "$argv"
end

function checknetwork
  strace -f -e trace=network -s 10000 $argv
end

function numlines
  find . -type f -exec cat {} \; | wc -l
end

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

function album
  cd /home/yo/music/library/albums && rip search "$argv"
end

function remove_metadata
  convert "$argv" -strip "$argv"
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
  # Run openfile.py and get a path
  set p (python ~/code/openfile/openfile.py)

  # Check if path exists
  if test -n "$p"
    # Resolve symlinks
    set resolved (readlink -f "$p")

    # Open with code editor
    code "$resolved"
  end
end

function aurget
  yay -a --answerclean None --answerdiff None "$argv"
end

function venv_make
  python -m venv venv
end

function venv_install
  venv/bin/pip install "$argv"
end

function venv_freeze
  venv/bin/pip freeze > requirements.txt
end

function venv_reqs
  venv/bin/pip install -r requirements.txt
end

function heaviest
  expac -s "%m %n" | sort -n
end

function gif_wins
  borat/venv/bin/python borat/src/main.py \
  --input "/home/yo/Downloads/pics/gifs3/1667107980975667.gif" \
  --words "$argv wins a ; [repeat] ; [RANDOM] ; [repeat]" --bgcolor 0,0,0 \
  --bottom 0 --fontsize 1.5 --width 600 --filter anyhue2 --framelist 11,11,33,33 --font triplex --boldness 2
end

function gif_isa
  borat/venv/bin/python borat/src/main.py \
  --input "/home/yo/Downloads/pics/pics27/1708233011778349.jpg" \
  --words "$argv is [Random] [x5]" --bgcolor dark2 --fontcolor light2 \
  --top 0 --fontsize 2.3 --filter random2 --width 600 --font triplex
end

function gif_number
  borat/venv/bin/python borat/src/main.py \
  --input "/home/yo/Downloads/pics/pics27/Dek1759390274543456256.png" \
  --top 0 --words "[number 1-3] [x3]" --fontcolor 0,0,0 --font triplex
end

set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin