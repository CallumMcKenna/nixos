{ config, lib, pkgs, ... }:

{
  options = {
    zsh.enable = lib.mkEnableOption "enables zsh" // { default = true; };
    autoLogin.callum.enable = lib.mkEnableOption "enables autologin of user callum" // { default = true; };
  };

  config = {
    users.users.callum = {
      isNormalUser = true;
      description = "Main User";
      extraGroups = [ "networkmanager" "wheel" ];
      shell = lib.mkIf config.zsh.enable pkgs.zsh;
      packages = with pkgs; [];
    };

    programs.zsh.enable = lib.mkIf config.zsh.enable true;

    # Enable autologin
    services.getty.autologinUser = lib.mkIf config.autoLogin.callum.enable "callum";
  };
}
