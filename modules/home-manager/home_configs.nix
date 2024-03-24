{ config, pkgs, ... }:

{
  # bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    # bashrcExtra = ''
      # export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    # '';

    # aliases
    shellAliases = {
      la = "ls -all"; # List all
      nixos-upgrade = "sudo nix flake update /etc/nixos && sudo nixos-rebuild switch --upgrade"; # Update lock file and upgrade packages
      meminfo = "free -h -l -t";
      cpuinfo = "lscpu";
    };
  };

  # VSCode
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-vscode.cpptools
      llvm-vs-code-extensions.vscode-clangd
    ];
  };
  
  # git configs
  programs.git = {
    enable = true;
    userName = "libshell64";
    userEmail = "18980896953@163.com";
  };
  
  # Conky configs
  home.file.".config/conky" = {
    source = ../../resources/conky;
    recursive = true;
  };
  
  # Minecraft natives
  home.file.".minecraft/natives" = {
    source = ../../resources/mc-natives;
    recursive = true;
  };
  
  # Pixmaps
  home.file.".local/share/pixmaps" = {
    source = ../../resources/pixmaps;
    recursive = true;
  };
  
  # User's scripts
  home.file.".local/share/scripts" = {
    source = ../../resources/scripts;
    recursive = true;
    executable = true;
  };

  # Hidden apps
  home.file.".local/share/applications/org.fcitx.Fcitx5.desktop".source = ../../resources/hidden_apps/org.fcitx.Fcitx5.desktop; # Fcitx5
  home.file.".local/share/applications/org.fcitx.fcitx5-migrator.desktop".source = ../../resources/hidden_apps/org.fcitx.fcitx5-migrator.desktop; # Fcitx5 migrator
  home.file.".local/share/applications/cups.desktop".source = ../../resources/hidden_apps/cups.desktop; # CUPS
}
