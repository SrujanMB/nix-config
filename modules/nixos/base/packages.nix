{ pkgs, inputs, ...}: {
  nixpkgs.config = {
    allowUnfree = true;
  };
  
  # Used by nixd to fetch packages based on the flake version:
  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];

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
    nil
    nixd
    nixfmt-rfc-style
    nodejs
    python3
    dotnet-sdk_8
    dotnet-runtime_8
    dotnet-aspnetcore_8
    temurin-bin
    maven
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    powerline-fonts
    powerline-symbols

    # New way:
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    # Old way:
    #(nerdfonts.override { fonts = [ "FiraCode" "NerdFontsSymbolsOnly" ]; })
  ];
}
