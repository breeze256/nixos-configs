{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [

    # Bug https://github.com/NixOS/nixpkgs/issues/298150
    (final: prev: {
      fprintd = prev.fprintd.overrideAttrs { 
        mesonCheckFlags = [ 
          "--no-suite"
          "fprintd:TestPamFprintd"
        ]; 
      };
    })

  ];
}
