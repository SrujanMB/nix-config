{
  programs.waybar =
    let
      # Size Variables
      xxs = "2px";
      xs  = "4px";
      sm  = "8px";
      md  = "12px";
      lg  = "14px";
      xl  = "16px";

      background-color = "#383c4a";
      active-color = "#4e5263";

      text-color = "white";
      text-color-hint = "#7c818c";

      # Useful Snippets:
      px = "padding-left: ${lg}; padding-right: ${lg};";
      mr = "margin-right: ${sm};";
      ml = "margin-left: ${sm};";
      mx = mr + ml;

      border-radius = "border-radius: 9999px;";

      bg-default = "background: ${background-color};";
      bg-active = "background: ${active-color};";

      text-default = "color: ${text-color};";
      text-hint = "color: ${text-color-hint};";

      colors-default = text-default + bg-default;
    in {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "4 4 0 4";

        modules-left   = [ "hyprland/workspaces" "hyprland/submap" ];
        modules-center = [ "clock" ];
        modules-right  = [ "backlight" "pulseaudio" "custom/mem" "cpu" "tray" "battery" "keyboard-state" ];

        "hyprland/workspaces" = {
          persistent-workspaces = {
            "*" = 4;
          };
          disable-scroll = true;
        };

        "keyboard-state" = {
          # numlock = true;
          capslock = true;
          format = "{icon} ";
          format-icons = {
            locked = " ";
            unlocked = "";
          };
        };

        "clock" = {
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a; %d %b, %I:%M %p}";
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [ "󰃞" "󰃟" "󰃠" ];
          min-length = 4;
        };

        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{icon}  {volume}%  {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = " {volume}%";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          on-click = "pavucontrol";
          min-length = 4;
        };

        "custom/mem" = {
          format = " {}";
          interval = 3;
          exec = "free -h | awk '/Mem:/{printf $3}'";
          tooltip = false;
        };

        "cpu" = {
          interval = 2;
          format = "  {usage}%";
          min-length = 5;
        };

        # Probably does not work yet
        "temperature" = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "{icon} {temperatureC}°C";
          format-icons = ["" "" "" "" ""];
          tooltip = false;
        };

        battery = {
          states = {
              warning = 30;
              critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = " {capacity}%";
          format-plugged = " {capacity}%";
          format-alt = "{icon} {time}";
          format-icons = ["" "" "" "" "" "" "" "" "" ""];
    	  # on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };

        tray = {
          icon-size = 10;
          spacing = 4;
        };
      };
    };

    style =
        ''
        * {
            border: none;
            border-radius: ${xs};
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: JetBrains Mono;
            font-size: ${lg};
            font-weight: bold;
        }

        window#waybar {
            background: transparent;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        #workspaces {
            transition: none;
            padding: ${xxs};
            border-width: ${xs};
            border-style: solid;
            border-color: ${text-color-hint};
            ${border-radius}
            ${bg-default}
        }

        #workspaces button {
            transition: none;
            font-size: ${sm};
            padding: 0 ${xs} 0 ${xs};
            ${text-hint}
            background: transparent;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        #workspaces button:hover {
            transition: none;
            box-shadow: inherit;
            text-shadow: inherit;
            border-radius: inherit;
            ${text-default}
            ${bg-active}
        }

        #workspaces button.active {
            ${bg-active}
            ${text-default}
            border-radius: inherit;
        }

        #keyboard-state {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #submap {
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #clock {
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #backlight {
          ${mr}
          ${px}
          ${border-radius}
          transition: none;
          ${colors-default}
        }

        #pulseaudio {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #pulseaudio.muted {
            background-color: #90b1b1;
            color: #2a5c45;
        }

        #custom-mem {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #cpu {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #temperature {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #temperature.critical {
            background-color: #eb4d4b;
        }

        #battery {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        #battery.charging {
            ${text-default}
            background-color: #26A65B;
        }

        #battery.warning:not(.charging) {
            background-color: #ffbe61;
            color: black;
        }

        #battery.critical:not(.charging) {
            background-color: #f53c3c;
            color: #ffffff;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: linear;
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        #tray {
            ${mr}
            ${px}
            ${border-radius}
            transition: none;
            ${colors-default}
        }

        @keyframes blink {
            to {
                background-color: ${text-color};
                color: #000000;
            }
        }
        '';
    };
}
