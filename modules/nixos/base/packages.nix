{ pkgs, inputs, ... }:
{
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
    chezmoi
    wget
    jq
    lf
    eza
    fzf
    zsh
    tree
    btop
    fastfetch
    openvpn

    # Dev stuff
    gh
    gcc
    nil
    nixd
    nixfmt
    cloudflared
    nodejs
    python3
    ruby
    libyaml
    bundler
    sqlite
    zlib
    readline
    libxml2
    libxslt
    openssl
    rubyfmt
    rails-new
    rubyPackages.rails
    gnumake
    libyaml
    dotnet-sdk_10
    dotnet-runtime_10
    dotnet-aspnetcore_10
    roslyn-ls
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
