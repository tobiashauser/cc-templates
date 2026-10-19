{
  greeting ? "Hello",
  pkgs,
  ...
}:

pkgs.stdenvNoCC.mkDerivation {
  pname = "greet";
  version = "20261019";

  src = pkgs.writeShellScript "greet" ''
    echo "${greeting}" $@
  '';

  dontUnpack = true;

  installPhase = ''
    mkdir -p $out/bin
    cp $src $out/bin/greet
  '';
}
