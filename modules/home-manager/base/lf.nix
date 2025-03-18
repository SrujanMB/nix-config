{ pkgs, config, ... }:
{
  # You can get the icon file using:
  # nix run nixpkgs#wget -- "https://raw.githubusercontent.com/gokcehan/lf/master/etc/icons.example" -O lf-icons
  xdg.configFile."lf/icons".source = ./lf-icons;

  home.sessionVariables = {
    PISTOL_CHROMA_FORMATTER = "terminal256";
    PISTOL_CHROMA_STYLE = "onedark";
  };

  # Adapted from: https://github.com/vimjoyer/lf-nix-video
  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      hidden = false;
      icons = true;
      drawbox = true;
      ignorecase = true;
    };

    commands = {
      editor-open = ''$$EDITOR $f'';

      mkdir = ''
        ''${{
        printf "Directory Name:"
        read DIR
        mkdir $DIR
        }}
      '';

      on-select = ''
        &{{
            lf -remote "send $id set statfmt \"$(eza -ld --color=always "$f" | sed 's/\\/\\\\/g;s/"/\\"/g')\""
        }}'';

      # Git stuff from lf wiki: https://github.com/gokcehan/lf/wiki/Integrations#git
      git_branch = ''
        ''${{
        git branch | fzf | xargs git checkout
        pwd_shell="$(pwd | sed 's/\\/\\\\/g;s/"/\\"/g')"
        lf -remote "send $id updir; cd \"$pwd_shell\""
        }}
      '';
    };

    keybindings = {
      o = "";
      c = "mkdir";
      "." = "set hidden!";
      "<enter>" = "open";

      ee = "editor-open";
      V = ''''$${pkgs.bat}/bin/bat --paging=always --theme=base16 "$f"'';

      # Git stuff
      gb = ":git_branch";
      "gp" = ''$clear; git pull --rebase || true; echo "Press ENTER"; read ENTER'';
      "gs" = ''$clear; git status; echo "Press ENTER"; read ENTER'';
      "gl" =
        ''$clear; git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit'';
    };

    extraConfig =
      let
        previewer = pkgs.writeShellScriptBin "pv.sh" ''
          file=$1
          w=$2
          h=$3
          x=$4
          y=$5
          mime=$(${pkgs.file}/bin/file -Lb --mime-type "$file")
          batFlags=" --paging=always --color=always --theme=base16 --terminal-width $(($w - 3))"

          # Uses the kitty image protocol which works with wezterm too
          #echo $mime
          if [[ $mime =~ ^image ]]; then
              ${pkgs.kitty}/bin/kitty +kitten icat --silent --stdin no --transfer-mode file --place "''${w}x''${h}@''${x}x''${y}" "$file" < /dev/null > /dev/tty
              exit 1
          elif [[ $mime =~ ^text|json ]]; then
              # Extra json type as bat does not highlight unknown filetypes.
              if [[ $mime =~ json ]]; then
                 batFlags+=" --language json"

              fi
              ${pkgs.bat}/bin/bat $batFlags "$file"
          else
              ${pkgs.pistol}/bin/pistol "$file"
          fi

        '';
        cleaner = pkgs.writeShellScriptBin "clean.sh" ''
          ${pkgs.kitty}/bin/kitty +kitten icat --clear --stdin no --silent --transfer-mode file < /dev/null > /dev/tty
        '';
      in
      ''
        set cleaner ${cleaner}/bin/clean.sh
        set previewer ${previewer}/bin/pv.sh
      '';
  };
}
