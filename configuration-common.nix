{ config, lib, pkgs, ... }:

with lib;
rec {
	imports = [
		# Import default packages.
		./profiles/default.nix
	];

	boot = {
		# Disable console blanking after being idle.
		kernelParams = [ "consoleblank=0" ];
	};
}
