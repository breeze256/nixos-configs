{ config, lib, pkgs, ... }:

{
  # Set fonts.
  fonts = {

    fontDir.enable = true;
    packages = with pkgs; [

      # noto-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif

      # source-sans
      source-han-sans
      source-code-pro

      # sarasa
      sarasa-gothic

      # other fonts
      hack-font
      jetbrains-mono
      
    ];

    fontconfig.localConf = ''
      <!-- fix steam Chinese display -->
      <match target="pattern">
        <test qual="any" name="family"><string>Helvetica</string></test>
        <edit name="family" mode="assign"><string>Sarasa UI SC</string></edit>
      </match>
    '';

    fontconfig.defaultFonts = {

      emoji = [ "Noto Color Emoji" ]; # emoji

      # monospace
      monospace = [
        "DejaVu Sans Mono"
        "monospace"
        "Noto Sans Mono CJK SC"
      ];

      # sansserif
      sansSerif = [
        "Sarasa UI SC"
        "Noto Sans CJK SC"
        "DejaVu Sans"
      ];

      # serif fonts
      serif = [
        "Noto Serif CJK SC" 
        "Source Han Serif SC"
        "DejaVu Serif"
      ];

    };

  };
}
