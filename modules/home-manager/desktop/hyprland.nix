{
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mainMod" = "Alt";
      "$terminal" = "alacritty";
      "$browser" = "brave";

      monitor = ",preferred,auto,auto";

      exec-once = [
        "$browser"
        "discord"
        "waybar"
        "nm-applet"
        "/run/current-system/sw/etc/xdg/autostart/pam_kwallet_init.desktop" # For KWallet auto-unlock
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/Pictures/screenshots"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us";
        kb_variant = "";
        follow_mouse = 0;

        accel_profile = "flat";
        force_no_accel = true;

        touchpad = {
          natural_scroll = true;
        };

        sensitivity = -0.25; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 4;
        gaps_out = 7;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      cursor = {
        no_warps= true;
      };

      decoration = {
        rounding = 10;
        drop_shadow = true;
        shadow_range = 4;
        shadow_render_power = 3;
        "col.shadow" = "rgba(1a1a1aee)";
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,   1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = true;
        workspace_swipe_distance = 275;
        workspace_swipe_forever = false;
      };

      misc = {
        animate_manual_resizes = false;
        animate_mouse_windowdragging = false;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = false;
      };

      bind = [
        "$mainMod, Return, exec, $terminal"

        "$mainMod, C, killactive,"
        "$mainMod, Q, exit,"
        "$mainMod, E, exec, dolphin"
        "$mainMod, F, togglefloating,"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, N, togglesplit, # dwindle"

        # Move focus between windows (vim bindings)
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Move windows (vim bindings)
        "$mainMod SHIFT, H, swapwindow, l"
        "$mainMod SHIFT, L, swapwindow, r"
        "$mainMod SHIFT, K, swapwindow, u"
        "$mainMod SHIFT, J, swapwindow, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute,        exec, pamixer -t "
        ", XF86AudioMicMute,     exec, pamixer --default-source -t "

        # Brightness Control
        ", XF86MonBrightnessUp,   exec, brightnessctl set +5% "
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
