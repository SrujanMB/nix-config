{
  programs.nixvim = {
    plugins.cmp = {
      enable = true;

      settings = {
        snippet = {
          expand = ''
            	    function(args)
            	      require('luasnip').lsp_expand(args.body)
            	    end
            	  '';
        };

        completion = {
          completeopt = "menu,menuone,noinsert";
        };

        mapping = {
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-n>" = "cmp.mapping.select_next_item()";

          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";

          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";

          "<C-l>" = "cmp.mapping.confirm { select = true; }";
          "<C-y>" = "cmp.mapping.confirm { select = true; }";

          "<C-Space>" = "cmp.mapping.complete {}";

          # Think of <c-l> as moving to the right of your snippet expansion.
          #  So if you have a snippet that's like:
          #  function $name($args)
          #    $body
          #  end
          #
          # <c-l> will move you to the right of the expansion locations.
          # <c-h> is similar, except moving you backwards.

          "<C-gt>" = ''
            cmp.mapping(function()
              if luasnip.expand_or_locally_jumpable() then
                luasnip.expand_or_jump()
              end
            end, { 'i', 's' })
          '';
          "<C-lt>" = ''
            cmp.mapping(function()
              if luasnip.locally_jumpable(-1) then
                luasnip.jump(-1)
              end
            end, { 'i', 's' })
          '';

        };

        autoEnableSources = true;

        # Dependencies
        #
        # WARNING: If plugins.cmp.autoEnableSources Nixivm will automatically enable the
        # corresponding source plugins. This will work only when this option is set to a list.
        # If you use a raw lua string, you will need to explicitly enable the relevant source
        # plugins in your nixvim configuration.
        sources = [
          # Snippet Engine & its associated nvim-cmp source
          # https://nix-community.github.io/nixvim/plugins/luasnip/index.html
          {
            name = "luasnip";
          }
          # Adds other completion capabilites.
          #  nvim-cmp does not ship with all sources by default. They are split
          #  into multiple repos for maintenance purposes.
          # https://nix-community.github.io/nixvim/plugins/cmp-nvim-lsp.html
          {
            name = "nvim_lsp";
          }
          # https://nix-community.github.io/nixvim/plugins/cmp-path.html
          {
            name = "path";
          }
        ];

      };
    };
  };
}
