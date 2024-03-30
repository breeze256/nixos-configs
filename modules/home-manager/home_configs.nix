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

  # Starship
  programs.starship = {
    enable = true;
    # Configuration written to ~/.config/starship.toml
    settings = {
      format = "$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$character";
      directory = {
        style = "blue bold";
      };
      hostname = {
        ssh_only = false;
        style = "bold red";
        disabled = false;
      };
      username = {
        style_user = "green bold";
        style_root = "red bold";
        format = "[$user]($style) on ";
        disabled = false;
        show_always = true;
      };
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](green)";
      };
      git_branch = {
        format = "[$branch]($style)";
        style = "bright-black";
      };
      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };
      git_state = {
        format = "\([$state( $progress_current/$progress_total)]($style)\) ";
        style = "bright-black";
      };
      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };
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
