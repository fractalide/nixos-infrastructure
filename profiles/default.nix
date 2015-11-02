{ config, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		git
		wget
		cacert
	];
}
