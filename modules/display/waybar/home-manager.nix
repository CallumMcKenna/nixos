{ ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      modules-left = [ "clock" "network" "pulseaudio" ];
      modules-center = [ "sway/workspaces" ];
      modules-right = [ "temperature" "cpu" "memory" "disk#config" "battery" ];

      # Disk group
      "disk" = {
        format = "Disk: {percentage_used}%";
      };

      "disk#config" = {
        path = home/callum/config;
        format = "Config: {used}";
      };

      "disk#code" = {
        path = "~/code";
        format = "Code: {used}";
      };

      "group/disk" = {
        orientation = "inherit";
        drawer = {
          transition-duration = 500;
          transition-left-to-right = false;
          click-to-reveal = true;
        };
        modules = [
          "disk"
          "disk#config"
          "disk#code"
        ];
      };
    };
  };
}
