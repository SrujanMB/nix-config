{ pkgs, ... } :

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "Arc-Dark";

    terminal = "${pkgs.alacritty}/bin/alacritty";
  };
}
