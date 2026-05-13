{
  boot.kernelParams = [
    # Disable the old driver for Southern Islands (SI) and Sea Islands (CIK)
    "radeon.si_support=0"
    "amdgpu.si_support=1"
    "radeon.cik_support=0"
    "amdgpu.cik_support=1"
    "amdgpu.sg_display=0"
    "amdgpu.gpu_recovery=1"
  ];
  
  services.udev.extraRules = ''
    KERNEL=="card1", SUBSYSTEM=="drm", DRIVERS=="amdgpu", ATTR{device/power_dpm_force_performance_level}="high"
  '';

  # Ensure the system actually uses the amdgpu kernel module
  services.xserver.videoDrivers = [ "amdgpu" ];
}
