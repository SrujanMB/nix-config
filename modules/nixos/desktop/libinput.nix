{
  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput = {
    enable = true;
    mouse.accelProfile = "flat";
    touchpad.accelProfile = "flat";
  };
}
