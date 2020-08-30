# Use an old nixpkgs to retreive old firefox
{ system ? builtins.currentSystem }:
(import (builtins.fetchTarball {
  name = "nixpkgs-16.03";
  url = "https://github.com/nixos/nixpkgs/archive/16.03.tar.gz";
  sha256 = "0m2b5ignccc5i5cyydhgcgbyl8bqip4dz32gw0c6761pd4kgw56v";
}) { inherit system; }).firefox
