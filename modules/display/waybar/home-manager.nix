{ lib, config, ... }:

{
  options.styles = {
    # Penguin is the default
    gruvbox.em.enable = lib.mkEnableOption "Enables the eminem theme for all home manager modules" // { default = false; };
    tokyonight.mamoth.enable = lib.mkEnableOption "Enables the Utah Mamoth theme for all home manager modules" // { default  = false; };
  };

  config = lib.mkIf config.defaultPkgs.enable {
    programs.waybar = lib.mkIf config.defaultPkgs.sway.enable {
      enable = true;
      settings = {
        topBar = {
          # Positional values
          layer = "top";
          position = "top";

          # Module Layout
          modules-left = [ "disk" "cpu" "memory" "temperature" ];
          modules-right = [ "clock" ];

          "clock" = {
            interval = 60;
            tooltip = true;
            format = "{:%H:%M}";
            tooltip-format = "{:%m-%d-%Y}";
          };

          # Modules
          "temperature" = {
            format = "Temperature: {temperatureC}°C";
            format-alt = "Temperature: {temperatureF}°F";
            tooltip = false;
            critical-threshold = 80;
          };

          "disk" = {
            format = "Disk {percentage_used}%";
          };

          "cpu" = {
            format = "CPU {usage}%";
          };

          "memory" = {
            format = "Mem {percentage}%";
          };
        };
        bottomBar = {
          # Positional values
          layer = "top";
          position = "bottom";

          # Module Layout
          modules-left = [ "network" "pulseaudio" ];
          modules-center = [ "sway/workspaces" ];
          modules-right = [ "battery" ];

          # Modules
          "sway/workspaces" = {
            disable-scroll = true;
          };

          "network" = {
            interface = "wlp3s0";
            format = "{ifname}";
            format-wifi = "{essid} ({signalStrength}%)";
            format-disconnected = "Disconnected";
            tooltip-format = "{ifname}";
            tooltip-format-disconnected = "Disconnected";
            max-length = 50;
          };

          "pulseaudio" = {
            format = "Volume {volume}%";
            format-muted = "Muted";
                  tooltip = false;
                            };

          "battery" = {
            states = {
              warning = 30;
              critical = 15;
            };
            format = "Battery {capacity}%";
          };
        };
      };
      style = ./styles/nord/tlou.css;
      #style = if config.styles.gruvbox.em.enable then ./styles/gruvbox/em.css else if config.styles.tokyonight.mamoth.enable then ./styles/tokyonight/mamoth.css else ./styles/gruvbox/penguin.css;
    };
  };
}
