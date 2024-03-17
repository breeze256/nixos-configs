{ config, pkgs, lib, ... }:

{
  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装

  home.packages = with pkgs; [
    tree # Tree view 树状图视图
    htop # Task manager
    firefox # Web browser 网络浏览器
    vscode # Code editor 代码编辑器
    hmcl # Minecraft Launcher MC 启动器
    gimp # Photo editor
    qq # Social app 社交软件 
    localsend # File transfer 文件传输
    yesplaymusic # Music app 音乐软件 
    conky # System information monitor 系统信息监视器
    qv2ray # Proxy client
    libreoffice-qt # Office
    hunspell # Spell checker
    stellarium # Star map
    lunar-client # PVP client
    teamspeak_client # Speak client
    telegram-desktop # Social app
    thunderbird # Email client
    obs-studio # Screen recorder
    birdtray # thunderbird tray
    codeblocks # C IDE
  ];
}
