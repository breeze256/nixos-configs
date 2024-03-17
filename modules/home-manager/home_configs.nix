{ config, pkgs, ... }:

{
  # VS Code configured via home-manager, with extensions
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
  
  # git 相关配置
  programs.git = {
    enable = true;
    userName = "libshell64";
    userEmail = "18980896953@163.com";
  };
  
  # Conky configs
  home.file.".config/conky" = {
    source = ../../resources/conky;
    recursive = true;   # 递归整个文件夹
  };
  
  # Minecraft natives
  home.file.".minecraft/natives" = {
    source = ../../resources/mc-natives;
    recursive = true;
  };
  
  # Pixmaps
  home.file.".local/share/pixmaps" = {
    source = ../../resources/pixmaps;
    recursive = true;   # 递归整个文件夹
  };
  
  # User's scripts
  home.file.".local/share/scripts" = {
    source = ../../resources/scripts;
    recursive = true;   # 递归整个文件夹
    executable = true;  # 将其中所有文件添加「执行」权限
  };

  
  # Hidden apps
  home.file.".local/share/applications/org.fcitx.Fcitx5.desktop".source = ../../resources/hidden_apps/org.fcitx.Fcitx5.desktop; # Fcitx5
  home.file.".local/share/applications/org.fcitx.fcitx5-migrator.desktop".source = ../../resources/hidden_apps/org.fcitx.fcitx5-migrator.desktop; # Fcitx5 migrator
  home.file.".local/share/applications/cups.desktop".source = ../../resources/hidden_apps/cups.desktop; # CUPS
  
}
