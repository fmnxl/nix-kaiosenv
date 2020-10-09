{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  kaiosNixEnv = pkgs.callPackage (import ./default.nix) {};
  firefox = pkgs.callPackage (import ./firefox.nix) {};
  firefoxMac = pkgs.writeShellScriptBin "firefox" ''
    open ${firefox}/Applications/Firefox-KaiOS.app
  '';
in
pkgs.mkShell {
  buildInputs = [
    kaiosNixEnv
  ] ++ (if isDarwin then [firefoxMac] else []);
}

