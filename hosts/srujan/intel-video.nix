{config, pkgs, inputs, ...}: {
  # This stuff is here to hopefully enable parsec hardware renderers
  hardware.graphics = {
    enable = true;
    # For newer Intel GPUs (Broadwell and newer)
    extraPackages = with pkgs; [
      intel-media-driver
      libva-vdpau-driver
      libvdpau-va-gl
    ];

    # For NVIDIA (If using the NVIDIA VA-API driver)
    # extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };
  }
