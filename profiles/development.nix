{ config, lib, pkgs, ... }:

let
	callPackage = pkgs.lib.callPackageWith (pkgs // fractalide-pkgs);
	fractalide-pkgs = rec {
		boot = callPackage ../pkgs/boot {};
	};
in
{
# install development packages
	environment.systemPackages = with pkgs; [
		binutils
		sublime3
		fractalide-pkgs.boot
	];
	security.setuidPrograms = [ "mount_afp" ];
}
