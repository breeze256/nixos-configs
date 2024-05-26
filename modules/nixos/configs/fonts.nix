{
  config,
  lib,
  pkgs,
  ...
}: {
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
      # sarasa-gothic

      # maple font
      maple-mono
      maple-mono-NF
      maple-mono-SC-NF
      maple-mono-autohint

      # other fonts
      hack-font
      jetbrains-mono
      cascadia-code
    ];

    fontconfig.localConf = ''
      <!-- fix steam Chinese display -->
      <match target="pattern">
        <test qual="any" name="family"><string>Helvetica</string></test>
        <edit name="family" mode="assign"><string>Noto Sans CJK SC</string></edit>
      </match>
    '';

    fontconfig.defaultFonts = {
      emoji = ["Noto Color Emoji"]; # emoji

      # monospace
      monospace = [
        "DejaVu Sans Mono"
        "monospace"
        "Maple Mono SC NF"
      ];

      # sansserif
      sansSerif = [
        # "Sarasa UI SC"
        "Source Han Sans"
        "DejaVu Sans"
      ];

      # serif fonts
      serif = [
        "Noto Serif CJK SC"
        "DejaVu Serif"
      ];
    };
  };
}
