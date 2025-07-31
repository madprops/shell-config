set fish_greeting

alias get="sudo pacman -S"
alias update="sudo pacman -Syy"
alias upgrade="sudo pacman -Syu"
alias upgrade_aur="yay -Syu --aur"
alias upgrade_flatpak="flatpak update"
alias sauce="source ~/.config/fish/config.fish"
alias rm="rm -I"
alias gitclone="git clone --depth=1"
alias flatget="flatpak --installation=extra install"
alias flatupdate="flatpak --installation=extra update"
alias flatremove="flatpak --installation=extra uninstall"
alias flatclean="flatpak --installation=extra uninstall --unused"
alias flatrun="flatpak --installation=extra run"
alias aurinstalled="pacman -Qqm"
alias d="dolphin ."
alias dirsize="du -sh"
alias q="touch /tmp/q && tail -f -n0 /tmp/q"
alias ipaddress="curl -s https://w.merkoba.com/ip/"
alias getpage="wget --mirror --page-requisites --no-parent"
alias shake="python ~/code/shakepeer/main.py"
alias th="date +%H"
alias tm="date +%M"
alias jerry="wget -q menta.alwaysdata.net/s3/sein.php -O -| mpv -"
alias yt="yt-dlp"
alias blue2="bluetoothctl connect $BLUETOOTH_DEVICE"
alias blue0="bluetoothctl disconnect $BLUETOOTH_DEVICE"

function pacclean
  sudo pacman -Rns $(pacman -Qdtq)
end

function fish_prompt
  # set -l timestamp (date "+%H:%M:%S")
  echo -n (set_color cyan)"[$timestamp]"(set_color normal) (prompt_pwd) "> "
end

function getaudio
  cd ~/music/units &&
  yt-dlp --extract-audio --audio-format mp3 -f bestaudio "$argv"
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

function g
  goldie -e="/ace/" -e="msg.js" "$argv"
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

function remove_metadata
  convert "$argv" -strip "$argv"
end

function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

function tagdiff
  git diff $(git describe --tags --abbrev=0) HEAD
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
  set p (python ~/code/openfile/openfile.py 4)

  # Check if path exists
  if test -n "$p"
    # Resolve symlinks
    set resolved (readlink -f "$p")

    # Check if directory or file
    if test -d "$resolved"
      cd "$resolved"
    else
      code "$resolved"
    end
  end
end

function c
  python ~/code/runcmd/runcmd.py
end

function aurget
  yay -a --answerclean None --answerdiff None "$argv"
end

function venv_make
  python -m venv venv
end

function venv_install
  venv/bin/pip install "$argv" &&
  set name (echo "$argv" | tr "-" "_") &&
  venv/bin/pip list | grep -i "$name"
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

function installed
  pacman -Qqe
end

function manera
  set cmd $argv[1]
  set term $argv[2]

  # Get the raw man page results with grep
  set raw_output (man "$cmd" | col -b | grep -i --color=always -C 2 "$term")

  # Process the grep output to preserve original formatting
  set first_block true
  set current_block ""
  set in_separator false

  for line in $raw_output
    # Check if this is grep's separator (which is just "--")
    if test "$line" = "--"
      set in_separator true
      continue
    end

    # If we just saw a separator and have content, print the current block and start a new one
    if test "$in_separator" = true -a -n "$current_block"
      if test "$first_block" = true
        set first_block false
      else
        # Just add an extra newline between blocks without any dashes
        printf "\n"
      end

      # Print non-empty lines from current block
      for item in $current_block
        if test -n "$item"
          printf "%s\n" $item
        end
      end

      # Reset for new block
      set current_block ""
      set in_separator false
    end

    # Append non-empty line to current block
    if test -n "$line"
      set -a current_block $line
      set in_separator false
    end
  end

  # Print the last block if it exists
  if test -n "$current_block"
    if test "$first_block" = false
      # Just add an extra newline before the final block
      printf "\n"
    end

    for item in $current_block
      if test -n "$item"
        printf "%s\n" $item
      end
    end
  end
end

set -gx QT_QPA_PLATFORMTHEME qt6ct
source ~/.config/shell/vars.fish
set NPM_PACKAGES "$HOME/.npm-packages"
set PATH $PATH $NPM_PACKAGES/bin