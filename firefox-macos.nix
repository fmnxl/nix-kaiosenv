# https://cmacr.ae/post/2020-05-09-managing-firefox-on-macos-with-nix/
{ stdenv, fetchurl, undmg }:
let
  adbhelper = import ./adbhelper.nix { };
in
stdenv.mkDerivation rec {
  pname = "Firefox";
  version = "48.0.2";

  buildInputs = [ undmg ];
    sourceRoot = ".";
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications"
      cp -r Firefox.app "$out/Applications/Firefox-KaiOS.app"
    '';

  src = fetchurl {
    name = "Firefox-${version}.dmg";
    url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
    sha256 = "1312rifkc1z0h1zlkdpbnq0frfgrl9acjxjdqslsqpl0ixai200d";
  };

  meta = with stdenv.lib; {
    description = "The Firefox web browser";
    homepage = "https://www.mozilla.org/en-GB/firefox";
    maintainers = [ maintainers.cmacrae ];
    platforms = platforms.darwin;
  };
}
