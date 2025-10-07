{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = "Arc-Dark";

    terminal = "${pkgs.alacritty}/bin/alacritty";
  };
}
