{ pkgs ? import <nixpkgs> {} }:
let
  xpi = pkgs.fetchurl {
    url = "https://ftp.mozilla.org/pub/labs/fxos-simulator/adb-helper/linux64/adbhelper-0.9.2-linux64.xpi";
    hash = "sha256:07i6va2gbcn1zlqf8srmpnf83hf4lx5j5f7a6kx1hgk70pm9ilcw";
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

