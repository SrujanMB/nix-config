{ pkgs, ... }:
{
  networking.networkmanager = {
    enable = true;
    # Add networkmanager-openvpn to the plugins list
    plugins = with pkgs; [
      networkmanager-openvpn
      # Keep any other plugins you might have, like
      # networkmanager-l2tp
    ];
  };
}
