#Usage: 'nix-build' in this directory to test pkgs builds only!
# This file does not plug into the rest of the project

{ pkgs ? import <nixpkgs> {}}:

let

	callPackage = pkgs.lib.callPackageWith (pkgs // self);
	self = rec {
	#	boot = callPackage ./boot {};
	#rustRegistry = callPackage ./rust-packages.nix {};
	#capnpc-rust = callPackage ./capnpc-rust { inherit rustRegistry;};
	};
in self
