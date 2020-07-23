{ stdenv, wine, rapidjson }:

stdenv.mkDerivation {
  pname = "rpc-wine";
  version = "0";

  src = builtins.fetchGit ./.;

  buildInputs = [ wine rapidjson ];

  buildPhase = ''
    runHook preBuild

    chmod +x build.sh
    patchShebangs build.sh
    ./build.sh -s32

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    install -D bin64/discord-rpc.dll.so $out/lib/discord-rpc.dll.so

    mkdir -p $out/etc/profile.d
    substitute discord-rpc-wine.sh $out/etc/profile.d/discord-rpc-wine.sh \
      --replace '@dllpath@' $out/lib

    runHook postInstall
  '';
}

