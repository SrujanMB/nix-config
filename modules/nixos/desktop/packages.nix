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
    alacritty
    discord
    kdePackages.okular
    krita

    # GUI code editors
    zed-editor
    onlyoffice-bin

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
