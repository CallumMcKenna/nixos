{ ... }:

{
  programs.waybar = {
    enable = true;
    mainBar.settings = {
      modules-left = [ "clock" "network" "pulseaudio" ];
      modules-center = [ "sway/workspaces" ];
      modules-right = [ "temperature" "cpu" "memory" "group/disk" "battery" ];

      # Disk group
      "disk" = {
        format = "Disk: {percentage_used}%";
      };

      "disk#config" = {
        path = "~/config";
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
