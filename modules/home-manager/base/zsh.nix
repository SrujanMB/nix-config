{ config, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases =
      let
        flakeDir = "~/nix-config";
        ezaExtraFlags = "--icons --hyperlink";
      in {
        rebuild = "sudo nixos-rebuild switch --flake ${flakeDir}";
        update = "sudo nix flake update ${flakeDir}";
        upgrade = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";

        ls = "eza ${ezaExtraFlags}";
        la = "eza -a ${ezaExtraFlags}";
        ll = "eza -lah ${ezaExtraFlags}";

        ff = "fastfetch";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo"];
      theme = "agnoster";
    };
  };
}
