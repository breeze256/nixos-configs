{ config, lib, pkgs, ... }:

{
  # apanel-png
  systemd.timers."apanel-png" = {

    wantedBy = [ "timers.target" ];

    timerConfig = {
      OnCalendar = "hourly";
      Persistent = true; 
      Unit = "apanel-png.service";
    };

  };

  systemd.services."apanel-png" = {

    script = ''
      ${pkgs.curl}/bin/curl -o /home/strnight/.cache/apanel.png "https://7timer.info/V3/exe/apanel.php?lon=87.1777&lat=43.4709&en&2km"
    '';
    
    serviceConfig = {
      Type = "oneshot";
      User = "strnight";
    };

  };
}
