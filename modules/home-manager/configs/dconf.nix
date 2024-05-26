{
  config,
  lib,
  pkgs,
  ...
}: {
  # dconf settings
  dconf.settings = {
    # nemo-desktop
    "org/nemo/desktop" = {
      show-desktop-icons = true;
      use-desktop-grid = true;
      home-icon-visible = true;
      trash-icon-visible = true;
      volumes-visible = true;
      ignored-desktop-handlers = "budgie.budgie-desktop-view";
    };

    # virt-manager
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };
}
