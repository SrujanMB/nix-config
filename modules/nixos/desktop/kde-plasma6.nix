{
  services.desktopManager.plasma6.enable = true;
  environment.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct"; # Required for qt6ct to work
    QT_QPA_PLATFORM = "wayland";    # For native Wayland support
  };
}
