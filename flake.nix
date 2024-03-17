{
  description = "Starry Night's NixOS Flake";

  # The nixConfig here only affects the flake itself, not the system configuration!
  # 这里的 nixConfig 只影响 flake 自己，不影响系统配置
  nixConfig = {
    extra-substituters = [
      # nix community's cache server. nix 社区的缓存服务器
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      # nix community's cache server public key. nix 社区的缓存服务器公钥
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    # NixOS official software mirror (tsinghua mirror). NixOS 官方软件源 (清华源)
    nixpkgs.url = "git+https://mirrors.tuna.tsinghua.edu.cn/git/nixpkgs?ref=nixos-unstable";
    # home-manager, to manage user's configs (ghproxy mirror). home-manager，用来管理用户配置 (ghproxy 源)
    home-manager = {
      url = "git+https://mirror.ghproxy.com/https://github.com/nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      MINIPC-PN64 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixos
          (import ./overlays)

          # 将 home-manager 配置为 nixos 的一个 module
          # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            # Set the user managed by home-manager. 设置 home-manager 管理的用户
            home-manager.users.strnight = import ./home-manager/home.nix;

            # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home-manager/home.nix 的参数
            # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
            home-manager.extraSpecialArgs = inputs;
          }
        ];
      };
    };
  };
}
