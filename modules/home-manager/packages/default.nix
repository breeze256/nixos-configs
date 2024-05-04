{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [

    # CLI Applications
    tree # Tree view 树状图视图
    htop # Task manager
    hunspell # Spell checker

    # Internet
    firefox # Web browser 网络浏览器
    thunderbird # Email client
    birdtray # thunderbird tray
    localsend # File transfer 文件传输
    qq # Social app 社交软件 
    wechat-uos # wechat
    clash-verge-rev # clash
    teamspeak_client # Speak client
    telegram-desktop # Social app
    varia # download manager
    # bilibili # bilibili

    # Education
    stellarium # Star map
    octaveFull # Calculating
    kdePackages.kalzium # periodic table
    dialect # translator
    # geogebra6 # geogebra

    # Game
    hmcl # Minecraft Launcher MC 启动器
    lunar-client # PVP client
    
    # Development
    codeblocks # C IDE
    emacs-gtk # GNU Emacs

    # Multi-Media
    netease-cloud-music-gtk # Netease GTK 
    # bilibili # bilibili
    obs-studio # Screen recorder

    # System Tools
    conky # System information monitor 系统信息监视器

    # Graphics
    gimp # Photo editor
    xournalpp # pdf editor

    # Office
    libreoffice-qt # Office

  ];
}
