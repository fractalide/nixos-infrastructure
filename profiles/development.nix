{ config, lib, pkgs, ... }:

let
callPackage = pkgs.lib.callPackageWith (pkgs // self);
self = rec {
	boot = callPackage ../pkgs/boot {};
	rustc = callPackage ../pkgs/rust-nightly.nix {};
	capnpc-rust = callPackage ../pkgs/capnpc-rust {};
};

rustcNightly = self.rustc.rustc {
	date = "2015-11-26";
	hash = "1rj3rii20nsf43m9w30sq4n5ral3z20yq2m261rwh1y3f7x52s4b";
};

cargoNightly = self.rustc.cargo {
	date = "2015-11-26";
	hash = "0gblirjrfd22qcpm8gb5427z84w9nx0ip2d3j69wk4dl81dqw5jw";
};
in
{
	# install development packages
	environment.systemPackages = with pkgs; [
	binutils
	sublime3
	nox
	self.boot
	#rustcNightly
	#cargoNightly
	#self.capnpc-rust
	# rustcMaster
	rustUnstable.cargo
	rustUnstable.rustc
	openssl
	capnproto
	mesa
	freetype
	SDL2
	gitg
	];
}
