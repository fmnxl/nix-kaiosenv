# https://extensionworkshop.com/documentation/publish/distribute-sideloading/
{ pkgs }:
let
  mozillaConfigPath = "Library/Application Support/Mozilla";
  extensionPath = "Extensions/{ec8030f7-c20a-464f-9b0e-13a3a9e97384}";
  adbhelper = import ./adbhelper.nix { inherit pkgs; };
in
{
  "${mozillaConfigPath}/${extensionPath}" = {
    source = adbhelper;
    recursive = true;
  };
}

