{ config, pkgs, ... }:

{
	imports = [
		../profiles/development.nix
	];

	boot = {
		loader = {
			grub = {
				enable = true;
				version = 2;
				device = "/dev/sda";
			};
		};
	};

	networking.networkmanager.enable = true;

	i18n = {
		consoleFont = "lat9w-16";
		consoleKeyMap = "us";
		defaultLocale = "en_US.UTF-8";
	};

	environment.systemPackages = with pkgs; [
	# Env
		awesome
		networkmanagerapplet
		pavucontrol
		gnome3.dconf
		gnome3.gnome_themes_standard
		lm_sensors

		# Misc
		wget

		# Network
		firefoxWrapper
		chromium
		kde4.plasma-nm
		transmission

		# Dev
		git
		vim_configurable
		emacs
		ranger
		htop
		screen
		ruby
		tmux
		python
		rxvt_unicode

		# Others
		gimp
		clementine
		rtorrent
		ncmpcpp
		gmpc
		libreoffice
		crawl
		xchat
		inkscape


		# audio / video
		ffmpeg
		mpv
		vlc
		audacity
	];

	environment.variables = {
		PATH = "PATH=@initialPath@:/home/denis/envs/bin";
		EDITOR = pkgs.lib.mkOverride 0 "vim";
	};

	time.timeZone = "Europe/Brussels";

	programs.zsh.enable = true;

	services = {
		dbus.enable = true;
		postgresql = {
			enable = true;
			package = pkgs.postgresql93;
		};
		printing.enable = true;
		# Fan
		thermald.enable = true;
		xserver = {
			displayManager.slim.defaultUser = "denis";
			enable = true;
			layout = "be";
			xkbOptions = "eurosign:e";
			windowManager = {
				awesome.enable = true;
				default = "awesome";
			};
			synaptics = {
				enable = true;
				twoFingerScroll = true;
			};
		};
		mpd = {
			enable = true;
			#mpd.musicDirectory = "/home/denis/music";
			#mpd.serviceConfig = { PermissionsStartOnly = "true"; };
		};
	};

	users.extraUsers = {
		denis = {
			name = "denis";
			group = "users";
			uid = 1000;
			createHome = true;
			home = "/home/denis";
			shell = "/run/current-system/sw/bin/zsh";
			extraGroups = [ "wheel" "audio" "plugdev" "networkmanager" "mpd" ];
		};
	};

	nixpkgs.config = {
		allowUnfree = true;
		# firefox = {
		#  enableAdobeFlash = true;
		# };
		chromium = {
		  enablePepperFlash = true;
		  enablePepperPDF = true;
		};
		vim_configurable.customize = {
			name = "myvim";
			vimrcConfig.customRC = ''
			set mouse=a
			set syntax=on
			set expandtab
			set shiftwidth=2
			set softtabstop=2
			set autoindent
			set smartindent
			'';
		};
	};

}
