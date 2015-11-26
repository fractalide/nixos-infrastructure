#Usage: 'nix-build' in this directory to test pkgs builds only!
# This file does not plug into the rest of the project

{ pkgs ? import <nixpkgs> {}}:

let

	callPackage = pkgs.lib.callPackageWith (pkgs // fractalide-pkgs);
	fractalide-pkgs = rec {
		boot = callPackage ./boot {};
		rustcNightly = self.rustc {
			date = "2015-11-26";
			hash = "15h84x58fzwx38iqv85g9zq1kzlx8xhrc79c14i27lgm61q7ywdf";
		};
		cargoNightly = self.cargo {
			date = "2015-11-26";
			hash = "16lb1ximivzp0v1afmv2538w6wvkln0wg0429lpg97n0j5rapi1i";
		};
	};
in fractalide-pkgs
