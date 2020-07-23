{ stdenv, cmake, wine, rapidjson }:

stdenv.mkDerivation {
  pname = "rpc-wine";
  version = "0";

  src = builtins.fetchGit ./.;

  nativeBuildInputs = [ cmake ];

  buildInputs = [ wine rapidjson ];
}

