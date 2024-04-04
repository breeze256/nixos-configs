{ config, lib, pkgs, ... }

{
  # virt-manager
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # proxychain
  programs.proxychains.enable = true;
  programs.proxychains.proxies.prx1.enable = true;
  programs.proxychains.proxies.prx1.type = "socks5";
  programs.proxychains.proxies.prx1.host = "127.0.0.1";
  programs.proxychains.proxies.prx1.port = 1089;

}