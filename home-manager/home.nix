{ config, pkgs, lib, ... }:

{
  # Import home-manager's modules
  imports = [ 
    ../modules/home-manager
  ];

  # Set the user and the user's directory managed by home-manager.
  # 设置由 home-manager 管理的用户及用户目录
  home.username = "strnight";
  home.homeDirectory = "/home/strnight";
    
  # 三种修改用户 home 目录配置的方法：
  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # 设置鼠标指针大小以及字体 DPI
  xresources.properties = {
    # "Xcursor.size" = 16;
    "Xft.dpi" = 93;
    "xterm*faceSize" = 11;
    "XTerm*faceName" = "Sarasa Mono SC";
    "XTerm*charClass" = [ "37:48" "45-47:48" "58:48" "64:48" "126:48" ];
  };
  xresources.extraConfig = ''
    #include "/home/strnight/.config/xterm/nord.Xresources"
  ''; 

  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO 在这里添加你的自定义 bashrc 内容
    # bashrcExtra = ''
      # export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    # '';

    # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
    shellAliases = {
      la = "ls -all"; # List all
      nixos-upgrade = "sudo nix flake update /etc/nixos && sudo nixos-rebuild switch --upgrade"; # Update lock file and upgrade packages
      meminfo = "free -h -l -t";
      cpuinfo = "lscpu";
    };
  };

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

