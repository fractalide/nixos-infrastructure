#Usage: 'nix-build' in this directory to test pkgs builds only!
# This file does not plug into the rest of the project

{ pkgs ? import <nixpkgs> {}}:

let

	callPackage = pkgs.lib.callPackageWith (pkgs // fractalide-pkgs);
	fractalide-pkgs = rec {
		boot = callPackage ./boot {};
		capnpc-rust = callPackage ./capnpc-rust.nix {};
	};
in fractalide-pkgs
