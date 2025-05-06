{
  programs.zellij = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      theme = "onedark";
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
