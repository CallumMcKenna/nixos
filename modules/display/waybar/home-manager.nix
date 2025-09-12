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
      settings.mainBar = {
        # Positional values
        layer = "top";
        position = "top";

        # Module Layout
        modules-left = [ "sway/workspaces" ];
        modules-center = [ "clock" ];
        modules-right = [ "network" "pulseaudio" "group/hardware" ];

        # Modules
        "sway/workspaces" = {
          disable-scroll = true;
        };

        "clock" = {
          interval = 60;
          tooltip = true;
          format = "{:%H:%M}";
          tooltip-format = "{:%m-%d-%Y}";
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

        # Hardware group
        "temperature" = {
          format = "Temperature: {temperatureC}°C";
          format-alt = "Temperature: {temperatureF}°F";
          tooltip = false;
          critical-threshold = 80;
        };

        # The disk group
        "disk" = {
          format = "Disk {percentage_used}%";
        };

        "cpu" = {
          format = "CPU {usage}%";
        };

        "memory" = {
          format = "Mem {percentage}%";
        };

        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "Battery {capacity}%";
        };

        "group/hardware" = {
          orientation = "inherit";
          drawer = {
            transition-duration = 500;
            transition-left-to-right = false;
          };
          modules = [
            "battery"
            "temperature"
            "cpu"
            "disk"
            "memory" 
          ];
        };
      };
      style = if config.styles.gruvbox.em.enable then ./styles/gruvbox/em.css else if config.styles.tokyonight.mamoth.enable then ./styles/tokyonight/mamoth.css else ./styles/gruvbox/penguin.css;
    };
  };
}
