{ config, lib, pkgs, ... }:

{
  # Budgie and lightdm configs
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "modesetting" ];
  services.xserver.desktopManager.budgie.enable = true;
  services.xserver.desktopManager.budgie.extraPlugins = with pkgs; [
    budgiePlugins.budgie-media-player-applet 
    budgiePlugins.budgie-analogue-clock-applet
    budgiePlugins.budgie-user-indicator-redux
  ];
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.displayManager.lightdm.greeters.slick.enable = false;
  services.xserver.displayManager.lightdm.greeters.gtk.enable = true;
  services.xserver.displayManager.lightdm.greeters.gtk.theme.name = "Plata-Lumine";
  services.xserver.displayManager.lightdm.greeters.gtk.iconTheme.name = "Paper";
  services.xserver.displayManager.lightdm.greeters.gtk.clock-format = "%H:%M:%S";
  services.xserver.displayManager.lightdm.greeters.gtk.indicators = [ 
    "~host" "~spacer" "~clock" "~spacer" "~session" "~language" "~a11y" "~power" 
  ];

  # Printing configs
  services.printing.enable = true;
  services.printing.drivers = [ pkgs.hplip ];
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  services.openssh = {
    enable = true;
    settings = {
      UseDns = false;
    };
    extraConfig = ''
      GSSAPIAuthentication no
    ''; 
  };
  services.teamviewer.enable = true;
  services.flatpak.enable = true;

}
