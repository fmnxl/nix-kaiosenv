{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs.stdenv.hostPlatform) isDarwin;
  kaiosNixEnv = pkgs.callPackage ./default.nix {};
  firefox = pkgs.callPackage ./firefox.nix {};
  firefoxMac = pkgs.writeShellScriptBin "firefox" ''
    open ${firefox}/Applications/Firefox-KaiOS.app
  '';
in
pkgs.mkShell {
  buildInputs = [
    kaiosNixEnv.package
  ] ++ (if isDarwin then [firefoxMac] else []);
}

