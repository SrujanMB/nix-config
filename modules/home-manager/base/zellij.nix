{
  programs.zellij = {
    enable = true;

    enableZshIntegration = true;

    settings = {
      theme = "onedark";
      show_startup_tips = false;
      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
