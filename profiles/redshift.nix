{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    latitude = "22.20109";
    longitude = "114.15316";
    temperature.night = 3500;
    brightness.night = "0.4";
  };
}
