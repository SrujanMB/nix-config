{ pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # KWallet auto-login
    kdePackages.kwallet-pam

    # hyprland utils
    waybar
    hyprpaper
    hyprlock

    # GUI Applications
    discord
    onlyoffice-desktopeditors
    parsec-bin
    vivaldi

    # GUI Creative Applications
    gimp
    krita
    inkscape
    davinci-resolve
    kdePackages.kdenlive

    # GUI Utils
    mpv
    alacritty
    xournalpp
    kdePackages.okular
    winetricks
    wineWowPackages.stable

    # GUI code editors
    zed-editor
    vscode-fhs

    # Sound
    pipewire
    pulseaudio
    pamixer
    easyeffects

    # Other
    pavucontrol
    brightnessctl
    networkmanagerapplet
    mesa-demos
    vulkan-tools
    radeontop

    # Games :P
    osu-lazer-bin
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    font-awesome
    twemoji-color-font
  ];
}
