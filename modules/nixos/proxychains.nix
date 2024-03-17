{ config, lib, pkgs, ... }:

{
  programs.proxychains.enable = true;
  programs.proxychains.proxies.prx1.enable = true;
  programs.proxychains.proxies.prx1.type = "socks5";
  programs.proxychains.proxies.prx1.host = "127.0.0.1";
  programs.proxychains.proxies.prx1.port = 1089;
}
