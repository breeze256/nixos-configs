{ config, pkgs, lib, ... }:

{
  nixpkgs.overlays = [
    (final: prev: {
      fprintd = prev.fprintd.overrideAttrs { 
        mesonCheckFlags = [ 
          "--no-suite" "fprintd:TestPamFprintd"
        ]; 
      };
    })
  ];
}
