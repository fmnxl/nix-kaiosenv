{ stdenv, callPackage }:
let
  inherit (stdenv.hostPlatform) isDarwin;
  firefoxDerivation = if isDarwin
    then ./firefox-macos.nix
    else ./firefox-linux.nix;
in
callPackage firefoxDerivation {}

