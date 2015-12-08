{ config, pkgs, ... }:

{
	boot = {
		loader.grub.enable = true;
		loader.grub.version = 2;
		# Define on which hard drive you want to install Grub.
		loader.grub.device = "/dev/sdb";
#		initrd.kernelModules = [ "vboxdrv" "vboxnetadp" "vboxnetflt" ];
		blacklistedKernelModules = [ "snd_pcsp" ];
	};

	boot.initrd.luks.devices = [
	{
		name = "root"; device = "/dev/sda1"; preLVM = true;
	}
	];

	imports = [
	../profiles/development.nix
	../profiles/dvorak-xmonad-graphics.nix
	../profiles/networking.nix
	#		../profiles/redshift.nix
	../profiles/database.nix
	../profiles/browser.nix
	];

	environment.systemPackages = with pkgs; [
	jre
	go
	];

environment.variables = {
		PATH = "PATH=@initialPath@:/home/stewart/bin";
	};

	i18n = {
		consoleFont = "lat9w-16";
		consoleKeyMap = "dvorak";
		defaultLocale = "en_US.UTF-8";
	};

	time.timeZone = "Asia/Hong_Kong";

	hardware.pulseaudio.enable = true;

	programs.bash.promptInit = ''
	# Provide a nice prompt.
	PROMPT_COLOR="1;31m"
	let $UID && PROMPT_COLOR="1;32m"
	PS1="\n\[\033[$PROMPT_COLOR\][\u@\h:\w]\\$\[\033[0m\] "
	if test "$TERM" = "xterm"; then
	PS1="\[\033]2;\h:\u:\w\007\]$PS1"
	fi
	'';

	users = {
		mutableUsers = true;
		extraUsers = {
			stewart = {
				name = "stewart";
				group = "users";
				uid = 1000;
				createHome = true;
				home = "/home/stewart";
				shell = "/run/current-system/sw/bin/bash";
				extraGroups = [ "wheel" "audio" "vboxusers" "video" "plugdev"];
			};
		};
	};

	networking = {
#		networkmanager.enable = true;
		firewall = {
			allowedTCPPorts = [ ];
		};
		wireless.enable = true;  # Enables wireless.
	};
	#	users.extraGroups = {stewart.gid = 1000; vboxusers.members = [ "stewart"];};
}
