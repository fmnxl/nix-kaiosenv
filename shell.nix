{ pkgs ? import <nixpkgs> {} }:
let
  adbhelper = pkgs.fetchurl {
    url = "https://ftp.mozilla.org/pub/labs/fxos-simulator/adb-helper/linux64/adbhelper-0.9.2-linux64.xpi";
    hash = "sha256:07i6va2gbcn1zlqf8srmpnf83hf4lx5j5f7a6kx1hgk70pm9ilcw";
  };
  setup = pkgs.writeScriptBin "setup" ''
    #!${pkgs.stdenv.shell}
    echo "Symlinking adbhelper.xpi to current directory" 1>&2
    echo "Install this extension to your firefox" 1>&2
    ln -s ${adbhelper} adbhelper.xpi
  '';
in
pkgs.mkShell {
  buildInputs = [
    (import ./firefox.nix {})
    setup
  ];
}
