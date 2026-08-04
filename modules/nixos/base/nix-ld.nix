{pkgs, ...}:
{
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    # X11 dependencies
    xorg.libX11
    xorg.libXcursor
    xorg.libXext
    xorg.libXi
    xorg.libXinerama
    xorg.libXrandr
    xorg.libXfixes

    # Wayland dependencies
    wayland
    libxkbcommon

    # Graphics and Rendering (Godot 4 defaults to Vulkan)
    vulkan-loader
    libGL

    # Audio
    alsa-lib
    libpulseaudio

    # System and Text
    dbus
    fontconfig

    # .NET / C# / Mono dependencies
    icu
  ];
}
