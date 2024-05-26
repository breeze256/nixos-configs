{
  description = "Breeze256's NixOS Flake";

  nixConfig = {
    extra-substituters = [
      # nix community's cache server.
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      # nix community's cache server public key.
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # NixOS official software mirror (tsinghua mirror).
    nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs?ref=nixos-unstable";

    # home-manager (ghproxy mirror).
    home-manager = {
      url = "git+https://mirror.ghproxy.com/https://github.com/nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      MINIPC-PN64 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          ./nixos
          (import ./overlays) # import overlays

          # import home-manager as a module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Set the user managed by home-manager.
            home-manager.users.breeze256 = import ./home-manager/home.nix;

            # use inputs in home.nix
            home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}