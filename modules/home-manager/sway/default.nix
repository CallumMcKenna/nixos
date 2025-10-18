{ ... }:

let
  mod = "Mod4";
  terminal = "alacritty";
  menu = "wmenu-run";
  networkmanager = "nmtui";

  browserMostlySecure = "tor-browser";
  browserLessSecure = "brave";
  browserEvenLessSecure = "firefox"; # It's hardened firefox made to not break websites

  lock = "swaylock";
in
{
  imports = [
    ./waybar/default.nix
    ./swaylock.nix
  ];

  # Wallpaper app
  services.swww.enable = true;

  wayland.windowManager.sway = {
    enable = true;
    config = {
      # Launch waybar on startup
      startup = [
        { command = "waybar"; }
        { command = "swww img ~/config/wallpapers/gatsby.jpg"; }
        { command = "swaylock"; }
      ];

      window.titlebar = false;

      # Disable swaybar
      bars = [];

      keybindings = {
        ### Apps
        "${mod}+t" = "exec ${terminal}";
        "${mod}+m" = "exec ${menu}";
        "${mod}+c" = "exec ${lock}";
        "${mod}+n" = "exec ${networkmanager}";

        ### Browsers
        "${mod}+b+x" = "exec ${browserMostlySecure}";
        "${mod}+b+y" = "exec ${browserLessSecure}";
        "${mod}+b+z" = "exec ${browserEvenLessSecure}";

        ### Utility
        "${mod}+e" = "kill";
        "${mod}+Shift+e" = "exit";
        "${mod}+f" = "fullscreen";

        ### Moving around
        # Instead of direction keys, use home row keys like nvim
        "${mod}+h" = "focus left";
        "${mod}+j" = "focus down";
        "${mod}+k" = "focus up";
        "${mod}+l" = "focus right";

        "${mod}+Shift+h" = "move left";
        "${mod}+Shift+j" = "move down";
        "${mod}+Shift+k" = "move up";
        "${mod}+Shift+l" = "move right";

        ### Workspaces
        "${mod}+1" = "workspace number 1";
        "${mod}+2" = "workspace number 2";
        "${mod}+3" = "workspace number 3";
        "${mod}+4" = "workspace number 4";
        "${mod}+5" = "workspace number 5";
        "${mod}+6" = "workspace number 6";
        "${mod}+7" = "workspace number 7";
        "${mod}+8" = "workspace number 8";
        "${mod}+9" = "workspace number 9";
        "${mod}+0" = "workspace number 10";

        "${mod}+Shift+1" = "move container to workspace number 1";
        "${mod}+Shift+2" = "move container to workspace number 2";
        "${mod}+Shift+3" = "move container to workspace number 3";
        "${mod}+Shift+4" = "move container to workspace number 4";
        "${mod}+Shift+5" = "move container to workspace number 5";
        "${mod}+Shift+6" = "move container to workspace number 6";
        "${mod}+Shift+7" = "move container to workspace number 7";
        "${mod}+Shift+8" = "move container to workspace number 8";
        "${mod}+Shift+9" = "move container to workspace number 9";
        "${mod}+Shift+0" = "move container to workspace number 10";
      };
    };
  };
}
