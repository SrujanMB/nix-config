{
  # Use SDDM if you are planning to use KDE Plasma or hyprland
  services.displayManager.sddm.enable = true;

  # Trying to enable kwallet auto-unlock on user login
  # Make sure to run /run/current-system/sw/etc/xdg/autostart/pam_kwallet_init.desktop on startup
  # This is done in the hyprland config.
  # For more info: https://github.com/NixOS/nixpkgs/issues/69632
  security.pam.services.sddm.kwallet.enable = true;
}
