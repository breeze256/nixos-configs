{ config, lib, pkgs, ... }:

{  
  environment = {
    systemPackages = with pkgs; [
      lightdm-gtk-greeter # Lightdm gtk greeter
      vim # TUI Text editor TUI 文本编辑器
      wget # Web tool 网络工具
      libayatana-appindicator # Appindicator 托盘指示
      git # Git tool Git 工具
      neofetch # Displays Linux information 显示 Linux 信息
      appimage-run # AppImage support AppImage 支持
      # gnome.gnome-software # Flatpak support Flatpak 支持
      plata-theme # GTK theme GTK 主题
      paper-icon-theme # Icon theme 图标主题
      gnome.gnome-terminal # Gnome terminal Gnome 终端
      gnome.gnome-backgrounds # Gnome wallpapers
      adapta-backgrounds # Adapta wallpapers
      gnome.dconf-editor # Dconf view
      gnome.gnome-system-monitor # Gnome system monitor Gnome 系统监视器
      gnome.file-roller # Gnome archive manager Gnome 归档管理器
      gnome.gnome-calendar # Gnome calendar
      gnome.gnome-clocks # Gnome clocks
      gthumb # Image viewer
      cinnamon.nemo-fileroller # Nemo archive extensions Nemo 归档扩展
      gedit # GUI text editor GUI 文本编辑器
      gcc11 # GNU Compiler Collection
      gdb # GNU Debug Bridge
      gnumake # Make
      clang-tools_11 # Clang
      android-tools # adb and fastboot tools adb 及 fastboot 工具
      zulu8 # ZuluJDK-8
      zulu17 # ZuluJDK-17
      system-config-printer # CUPS configure tool
      cups-filters # CUPS filters
      usbutils # Usb port tool
      appimagekit # Appimage tools
      ntfs3g # NTFS support
      woeusb-ng # Windows image flasher
      proxychains # Terminal proxy
    ];
    budgie.excludePackages = with pkgs; [
      mate.mate-terminal # Use gnome.gnome-terminal 改用 gnome.gnome-terminal
      mate.pluma # Use gedit 改用 gedit
      mate.engrampa # Use gnome.file-roller 改用 gnome.file-roller
      mate.eom # Use gthumb
    ];
  };
}
