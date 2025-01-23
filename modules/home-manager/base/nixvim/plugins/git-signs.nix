{
  programs.nixvim = {
    # Adds git related signs to the gutter, as well as utilities for managing changes
    # See `:help gitsigns` to understand what the configuration keys do
    # https://nix-community.github.io/nixvim/plugins/gitsigns/index.html
    plugins.gitsigns = {
      enable = true;
      settings = {
        signs = {
          add = {text = "+";};
          change = {text = "~";};
          delete = {text = "_";};
          topdelete = {text = "‾";};
          changedelete = {text = "~";};
        };
      };
    };
    # Check out: https://github.com/JMartJonesy/kickstart.nixvim/blob/main/plugins/gitsigns.nix 
    # for reccommended git sign keymappings.
  };
}
