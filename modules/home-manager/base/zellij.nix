{
  programs.zellij = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      theme = "tokyo-night";
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
