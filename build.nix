{ stdenv, cmake, wine, rapidjson }:

stdenv.mkDerivation {
  pname = "rpc-wine";
  version = "0";

  src = builtins.fetchGit ./.;

  nativeBuildInputs = [ cmake ];

  buildInputs = [ wine rapidjson ];

  cmakeFlags = [ "-D32BIT=OFF" ];

  installPhase = ''
    runHook preInstall

    install -D bin64/discord-rpc.dll.so $out/lib/discord-rpc.dll.so

    runHook postInstall
  '';
}

