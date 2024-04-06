{ config, lib, pkgs, ... }:

{
  # apanel-png
  systemd.timers."switchto-light" = {

    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "*-*-* 7:15:00";
      Persistent = true; 
      Unit = "switchto-light.service";
    };

  };

  systemd.services."switchto-light" = {
    serviceConfig = {
      ExecStart = "/home/breeze256/.local/share/scripts/switchto-light.sh";
      Type = "oneshot";
      User = "breeze256";
    };

  };
}
