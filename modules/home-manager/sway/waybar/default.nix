{ ... }:

{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      modules-left = [ "clock" "network" "pulseaudio" ];
      modules-center = [ "sway/workspaces" ];
      modules-right = [ "temperature" "cpu" "memory" "disk" "battery" ];

      # Disk group
      "disk" = {
        format = "Disk: {percentage_used}%";
      };

      "disk#config" = { # This just displays the size of the whole disk
        path = ./../../..;
        format = "Config: {used}";
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
          # Add the code size too
        ];
      };
    };
  };
}
