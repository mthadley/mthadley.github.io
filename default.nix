with import ./nix/packages.nix;

stdenv.mkDerivation {
  name = "elm-bp";
  buildInputs = [
    gnumake
    nodejs
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test
  ];
  src = ./.;
  preBuild = ''
    export HOME=$TMP # Make elm happy
    make clean
  '';
  makeFlags = [ "ENVIRONMENT=production" ];
  installPhase = "cp -r dist $out";
}
