{ pkgs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # Utils:
    vim
    neovim
    git
    wget
    jq
    lf
    eza
    fzf
    zsh
    tree
    btop
    fastfetch

    # Dev stuff
    gcc
    nodejs
    python3
    dotnet-sdk_8
    dotnet-runtime_8
    dotnet-aspnetcore_8
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ]; })
  ];
}
