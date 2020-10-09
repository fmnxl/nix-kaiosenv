# https://cmacr.ae/post/2020-05-09-managing-firefox-on-macos-with-nix/
{ stdenv, fetchurl, undmg }:
let
  adbhelper = import ./adbhelper.nix { };
in
stdenv.mkDerivation rec {
  pname = "Firefox";
  version = "59.0a1";

  buildInputs = [ undmg ];
    sourceRoot = ".";
    phases = [ "unpackPhase" "installPhase" ];
    installPhase = ''
      mkdir -p "$out/Applications"
      cp -r FirefoxNightly.app "$out/Applications/Firefox-KaiOS.app"
    '';

  src = fetchurl {
    name = "Firefox-${version}.dmg";
    # url = "https://download-installer.cdn.mozilla.net/pub/firefox/releases/${version}/mac/en-GB/Firefox%20${version}.dmg";
    url = "http://download-installer.cdn.mozilla.net/pub/firefox/nightly/2017/11/2017-11-19-22-01-26-mozilla-central/firefox-59.0a1.en-US.mac.dmg";
    sha256 = "06gjwzv8dn5x8sw8prh2c7q218s82sxvmjr923y0b1wlhzcr5zlc";
  };

  meta = with stdenv.lib; {
    description = "The Firefox web browser";
    homepage = "https://www.mozilla.org/en-GB/firefox";
    maintainers = [ maintainers.cmacrae ];
    platforms = platforms.darwin;
  };
}
