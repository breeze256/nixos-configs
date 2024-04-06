{ config, pkgs, lib, ... }:

{
    nixpkgs.overlays = [

    # Bug on https://github.com/NixOS/nixpkgs/issues/298150 of fprintd
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