{ config, pkgs, ... }:

{
  # bash
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH=~/.npm-packages/bin:$PATH
      export NODE_PATH=~/.npm-packages/lib/node_modules
      export PNPM_HOME=~/.npm-packages/bin
    '';

    # aliases
    shellAliases = {
      la = "ls -all"; # List all
      nixos-upgrade = "sudo nix flake update /etc/nixos && sudo nixos-rebuild switch --upgrade"; # Update lock file and upgrade packages
      meminfo = "free -h -l -t";
      cpuinfo = "lscpu";
      editconfig = "sudo code /etc/nixos --no-sandbox --user-data-dir=/root/.config/Code";
      ls = "colorls";
      ff = "fastfetch";
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

  # vscode
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages
      (ps: with ps; [ 
        # Add depends here
      ]);
  };
  
  # git configs
  programs.git = {
    enable = true;
    userName = "libshell64";
    userEmail = "18980896953@163.com";
  };
  
  # Conky configs
  home.file.".config/conky" = {
    source = ../../../resources/conky;
    recursive = true;
  };
  
  # Minecraft natives
  home.file.".minecraft/natives" = {
    source = ../../../resources/mc-natives;
    recursive = true;
  };
  
  # Pixmaps
  home.file.".local/share/pixmaps" = {
    source = ../../../resources/pixmaps;
    recursive = true;
  };
  
  # User's scripts
  home.file.".local/share/scripts" = {
    source = ../../../resources/scripts;
    recursive = true;
    executable = true;
  };


  # Modified desktop files
  home.file.".local/share/applications" = {
    source = ../../../resources/applications;
    recursive = true;
    executable = true;
  };
}
