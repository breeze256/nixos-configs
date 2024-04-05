# MINIPC-PN64's configuration file.

{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/nixos/default.nix 
  ];
  
  nixpkgs.config = {
    allowUnfree = true; 
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };

  nix = {

    settings = {
      # Enable flakes and new 'nix' command
      experimental-features = "nix-command flakes"; # Enable flake

      # Deduplicate and optimize nix store
      auto-optimise-store = true;
      trusted-users = [ "strnight" ];
      substituters = lib.mkForce [
        "https://mirror.sjtu.edu.cn/nix-channels/store"
        # "https://cache.nixos.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      ];
    };

    # Garbage collection
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

  };

  networking = {
    hostName = "MINIPC-PN64"; # hostname
    networkmanager.enable = true;
    nameservers = [ "223.5.5.5" "223.6.6.6" ]; # Set DNS.
    # firewall.enable = false;
  };

  # GRUB configurations.
  boot = { 
    kernelParams = [ "intel_idle.max_cstate=1" ];
    kernelPackages = pkgs.linuxPackages_latest;
    kernel.sysctl = { "vm.swappiness" = 25; };

    loader.grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;

      # Add the Windows boot entry.
      extraEntries = '' 
        menuentry "Windows Boot Manager" {
            search --file --no-floppy --set=root /EFI/Microsoft/Boot/bootmgfw.efi
            chainloader (''${root})/EFI/Microsoft/Boot/bootmgfw.efi
        }
      '';
    };

    loader.efi.canTouchEfiVariables = true;
    loader.efi.efiSysMountPoint = "/boot"; # EFI mount point
  };


  # Filesystem and swap settings.
  fileSystems = {
    "/".options = [ "compress=zstd" ];
    "/home".options = [ "compress=zstd" ];
    "/nix".options = [ "compress=zstd" "noatime" ];
  };
  swapDevices = [ { device = "/dev/nvme0n1p4"; } ]; # Define swap device 指定交换空间设备

  # user configs
  users.users = {
    strnight = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # SSH Key
      ];
      extraGroups = [ "wheel" "libvirtd" ];
    };
  };

  # time zone
  time.timeZone = "Asia/Shanghai";
  
  # select internationalisation properties
  i18n.defaultLocale = "zh_CN.UTF-8"; 
  i18n.inputMethod = {
    enabled = "fcitx5"; # fcitx5
    fcitx5.addons = with pkgs; [
      fcitx5-rime # rime
      fcitx5-chinese-addons # Chinese support
    ];
  };

  # audio
  hardware.pulseaudio.enable = false;
  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };



  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.05"; # Did you read the comment? 你阅读注释了吗
}

