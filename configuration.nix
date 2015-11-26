let hostName = "${builtins.readFile ./host.name}";
in
rec {
	imports = [ # Include the results of the hardware scan.
		./hardware-configuration.nix
		# Configuration common to conventional and Nixops-provisioned computers
		./configuration-common.nix
		# Import machine-specific configuration files.
		(./machines + "/${hostName}.nix")
	];

	networking.hostName = "${hostName}"; # Define your hostname.
}
