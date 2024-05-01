{ config, lib, pkgs, ... }:

{  
  environment = {

    systemPackages = with pkgs; [
    
      ## CLI Applications
      # Tools
      wget # Web tool 网络工具
      colorls # ls with color and font-awesome icons
      vim # TUI Text editor TUI 文本编辑器
      xray # xray core
      asusctl # ASUS tweaks
      git # Git tool Git 工具
      neofetch # Displays Linux information 显示 Linux 信息
      appimage-run # AppImage support AppImage 支持
      libayatana-appindicator # Appindicator 托盘指示
      cups-filters # CUPS filters
      usbutils # Usb port tool
      appimagekit # Appimage tools
      proxychains # Terminal proxy
      android-tools # adb and fastboot tools adb 及 fastboot 工具
      
      # Development
      # C/CPP
      gcc11 # GNU Compiler Collection
      gdb # GNU Debug Bridge
      gnumake # Make
      clang-tools # Clang

      # Python
      python3 # py
      python311Packages.pip # pip
      
      # Java
      zulu8 # ZuluJDK-8
      zulu17 # ZuluJDK-17

      # Node.js
      nodejs
      
      ## GUI Applications
      # System
      lightdm-gtk-greeter # Lightdm gtk greeter
      # gnome.gnome-software # Flatpak support Flatpak 支持
      plata-theme # GTK theme GTK 主题
      materia-theme
      paper-icon-theme # Icon theme 图标主题
      adapta-backgrounds # Adapta wallpapers
      gnome.gnome-backgrounds # Gnome wallpapers
      gnome.gnome-terminal # Gnome terminal Gnome 终端
      gnome.dconf-editor # Dconf view
      gnome.gnome-system-monitor # Gnome system monitor Gnome 系统监视器
      gnome.file-roller # Gnome archive manager Gnome 归档管理器
      gnome.gnome-calendar # Gnome calendar
      gnome.pomodoro # Time management
      gnome.gnome-clocks # Gnome clocks
      gnome.ghex # Hex editor
      gthumb # Image viewer
      gparted # Disk tool
      qalculate-gtk # Calculator
      cinnamon.nemo-fileroller # Nemo archive extensions Nemo 归档扩展
      gedit # GUI text editor GUI 文本编辑器
      
      # Tools
      system-config-printer # CUPS configure tool
      ntfs3g # NTFS support
      woeusb-ng # Windows image flasher
      
    ];

    budgie.excludePackages = with pkgs; [
    
      mate.mate-terminal # => gnome.gnome-terminal
      mate.pluma # => gedit
      mate.engrampa # => gnome.file-roller
      mate.eom # => gthumb
      mate.mate-calc # => qalculate-gtk
      
    ];
    
  };
}
