{ config, pkgs, lib, ... }:

{
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装

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
    qv2ray # Proxy client
    teamspeak_client # Speak client
    telegram-desktop # Social app

    # Education
    stellarium # Star map

    # Game
    hmcl # Minecraft Launcher MC 启动器
    lunar-client # PVP client
    
    # Development
    vscode # Code editor 代码编辑器
    codeblocks # C IDE

    # Multi-Media
    yesplaymusic # Music app 音乐软件
    netease-cloud-music-gtk # Netease GTK 
    # bilibili # bilibili
    obs-studio # Screen recorder

    # System Tools
    conky # System information monitor 系统信息监视器

    # Graphics
    gimp # Photo editor

    # Office
    libreoffice-qt # Office

  ];
}
