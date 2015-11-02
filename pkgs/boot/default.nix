{ stdenv, fetchurl, makeWrapper, jre }:

	stdenv.mkDerivation rec {
		version = "2.4.2";
		name = "boot-${version}";
		builder = ./boot_builder.sh;
		src = fetchurl {
			url = "https://github.com/boot-clj/boot-bin/releases/download/${version}/boot.sh";
			sha256 = "18d7dks6vvpwpw30jffzy7qqpypw6vhlp2sj838i5rj2q0imh14c";
		};

		inherit jre;
		buildInputs = [ makeWrapper ];
		propagatedBuildInputs = [ jre ];
		meta = {
			description = "Build tooling for Clojure";
			homepage = http://boot-clj.com/;
			license = stdenv.lib.licenses.epl10;
			platforms = stdenv.lib.platforms.linux ++ stdenv.lib.platforms.darwin;
			maintainers = [ stdenv.lib.maintainers.sjmackenzie ];
		};
	}
