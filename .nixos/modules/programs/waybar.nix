{ ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;

        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [ "clock" ];
        modules-right = [
          "hyprland/window"
          "wireplumber"
          "cpu"
          "memory"
          "network"
          "battery"
        ];

        "hyprland/workspaces" = {
          format = "{icon}";
        };

        "clock" = {
          interval = 1;
          format = "{:%H:%M:%S %A %d-%B-%Y}";
          tooltip-format = "<tt>{calendar}</tt>";
          locale = "en_GB.UTF-8";
          calendar = {
            mode = "year";
            mode-mon-col = 3;
            # weeks-pos = "left";
            on-scroll = 1;
            format = {
              months = "<span color='#ffead3'><b>{}</b></span>";
              days = "<span color='#ecc6d9'><b>{}</b></span>";
              weeks = "<span color='#99ffdd'><b>W{}</b></span>";
              weekdays = "<span color='#ffcc66'><b>{}</b></span>";
              today = "<span background='#0000ff' color='#ff6699'><b><u>{}</u></b></span>";
            };
          };
          actions = {
            on-click-middle = "mode";
            on-scroll-up = "shift_up";
            on-scroll-down = "shift_down";
          };
        };

        "hyprland/window" = {
          format = "{}";
          rewrite = {
            "(.*)firefox" = " Firefox";
            "(.*)alacritty" = " Terminal";
          };
        };

        "wireplumber" = {
          format = "{icon} {volume}%";
          format-muted = " Muted";
          format-icons = [
            ""
            ""
            ""
          ];
          on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          scroll-step = 5;
        };

        "cpu" = {
          format = " {usage}%";
        };

        "memory" = {
          format = " {}%";
        };

        "network" = {
          format-ethernet = "essid";
          format-wifi = "{icon} {essid}";
          format-disconnected = "󰖪";
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
        };

        "battery" = {
          format = "{icon} {capacity}%";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
      };
    };
    style = ../../themes/waybar/style.css;
  };
}
