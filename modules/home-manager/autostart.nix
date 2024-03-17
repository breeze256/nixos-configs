# Set autostart applications and commands
{ config, pkgs, ... }:

{
  # Conky
  home.file.".config/autostart/conky.desktop".source = ../../resources/autostart/conky.desktop;
  # nemo-desktop
  home.file.".config/autostart/nemo-desktop.desktop".source = ../../resources/autostart/nemo-desktop.desktop;
  # desktop-refresh
  home.file.".config/autostart/desktop-refresh.desktop".source = ../../resources/autostart/desktop-refresh.desktop;
  # Qv2ray
  home.file.".config/autostart/qv2ray.desktop".source = ../../resources/autostart/qv2ray.desktop;
  # Birdtray
  home.file.".config/autostart/com.ulduzsoft.Birdtray.desktop".source = ../../resources/autostart/com.ulduzsoft.Birdtray.desktop;

}
