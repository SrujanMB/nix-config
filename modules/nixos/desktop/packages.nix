{ pkgs, ...}: {
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
    onlyoffice-bin

    # GUI Creative Applications
    gimp
    krita
    blender
    inkscape
    davinci-resolve
    kdePackages.kdenlive

    # GUI Utils
    mpv
    alacritty
    kdePackages.okular
    lutris
    winetricks
    wineWowPackages.stable

    # GUI code editors
    zed-editor

    # Sound
    pipewire
    pulseaudio
    pamixer

    # Other
    pavucontrol
    brightnessctl
    networkmanagerapplet

    # Games :P
    osu-lazer-bin
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-emoji
    font-awesome
    twemoji-color-font
  ];
}
