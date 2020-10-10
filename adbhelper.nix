{ pkgs }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  xpi = pkgs.fetchurl {
    url = if isDarwin
      then "https://ftp.mozilla.org/pub/mozilla.org/labs/fxos-simulator/adb-helper/mac64/adbhelper-mac64-latest.xpi"
      else "https://ftp.mozilla.org/pub/labs/fxos-simulator/adb-helper/linux64/adbhelper-0.9.2-linux64.xpi";
    hash = "sha256:1g0zcgn2b12wbibbw3d96fm441l20cdbz67rp5zx760ybmrdz6v5";
  };
in
pkgs.stdenv.mkDerivation {
  name = "adbhelper";
  src = xpi;
  buildCommand = ''
    dst="$out"
    mkdir -p "$dst"
    install -v -m644 "$src" "$dst/adbhelper@mozilla.org.xpi"
  '';
}

