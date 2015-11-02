{ pkgs, lib, config, ...}:

{

	services = {
		xserver = {
			enable = true;
			layout = "dvorak";
			xkbOptions = "grp:alt_space_toggle, ctrl:swapcaps";
			displayManager.lightdm.enable = true;
			windowManager.xmonad.enable = true;
			windowManager.xmonad.enableContribAndExtras = true;
			windowManager.default = "xmonad";
			desktopManager.xterm.enable = false;
			desktopManager.xfce.enable = true;
			desktopManager.default = "xfce";
			config = ''
				Section "InputClass"
					Identifier  "Marble Mouse"
					MatchProduct "Logitech USB Trackball"
					Option "EmulateWheel" "true"
					Option "EmulateWheelButton" "8"
					Option "Emulate3Buttons" "true"
				EndSection'';
			synaptics = {
				enable = true;
				twoFingerScroll = true;
				additionalOptions = ''
					Option "TapButton2" "3"
					Option "Tapbutton3" "2"
					Option "ClickFinger2" "3"
					Option "ClickFinger3" "2"
					Option "AreaTopEdge" "2500"
					Option "SoftButtonAreas" "3608 0 1 2500 2928 3607 1 2500"
					Option "PalmDetect" "1"
				'';
			};
		};
	};

	environment.systemPackages = with pkgs; [
		dmenu
		redshift
	];
}
