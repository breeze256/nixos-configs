{ config, pkgs, lib, ... }:

{
  # Import home-manager's modules
  imports = [ 
    ../modules/home-manager
  ];

  # Set the user and the user's directory managed by home-manager.
  home.username = "strnight";
  home.homeDirectory = "/home/strnight";
    

  # ~/.Xresources
  xresources.properties = {
    # "Xcursor.size" = 16;
    # xterm's configs
    "Xft.dpi" = 93;
    "xterm*faceSize" = 11;
    "XTerm*faceName" = "Sarasa Mono SC";
    "XTerm*charClass" = [ "37:48" "45-47:48" "58:48" "64:48" "126:48" ];
  };
  # import xterm's theme
  xresources.extraConfig = ''
    #include "/home/strnight/.config/xterm/nord.Xresources"
  ''; 


  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

