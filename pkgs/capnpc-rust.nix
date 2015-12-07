{ stdenv, fetchFromGitHub, rustUnstableCargoPlatform, makeWrapper }:

with rustUnstableCargoPlatform;

buildRustPackage rec {
  name = "capnpc-rust-2015-12-07";
  src = fetchFromGitHub {
    owner = "fractalide";
    repo = "capnpc-rust";
    rev = "727ab28fb9f335a16a383e54f3acbbef0cea5b15";
    sha256 = "055n2sfj1812bzkc63h0y85px35y1xh4bs3c169k23ldjhxrk1bb";
  };

  depsSha256 = "0qs6ilpvcrvcmxg7a94rbg9rql1hxfljy6gxrvpn59dy8hb1qccb";

  meta = with stdenv.lib; {
    description = "Cap'n Proto code generation for Rust.";
    homepage = https://github.com/fractalide/capnpc-rust;
    license = with licenses; [ mit ];
    maintainers = [ maintainers.sjmackenzie ];
  };
}
