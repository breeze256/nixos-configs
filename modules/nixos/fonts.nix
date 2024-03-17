{ config, lib, pkgs, ... }:

{
  # Set fonts. 配置字体
  fonts = {
    fontDir.enable = true;
    packages = with pkgs; [
      noto-fonts noto-fonts-cjk-sans noto-fonts-cjk-serif
      source-han-sans sarasa-gothic source-code-pro
      hack-font jetbrains-mono
    ];
    fontconfig.defaultFonts = {
      emoji = [ "Noto Color Emoji" ]; # emoji
      # monospace fonts 等宽体
      monospace = [
        "Sarasa Mono SC"
        "Noto Sans Mono CJK SC"
        "DejaVu Sans Mono"
      ];
      # sansserif fonts 界面字体
      sansSerif = [
        "Sarasa UI SC"
        "Noto Sans CJK SC"
        "DejaVu Sans"
      ];
      # serif fonts 衬线字体
      serif = [
        "Noto Serif CJK SC" 
        "Source Han Serif SC"
        "DejaVu Serif"
      ];
    };
  };
}
