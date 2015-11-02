{ config, lib, pkgs, ... }:

{
	environment.systemPackages = with pkgs; [
		chromium
		firefox
	];
	nixpkgs.config = {
		allowUnfree = true;
		allowBroken = true;
		firefox = {
			enableGoogleTalkPlugin = true;
			enableAdobeFlash = true;
		};
		chromium = {
			enablePepperFlash = true;
			enablePepperPDF = true;
		};
	};
}
