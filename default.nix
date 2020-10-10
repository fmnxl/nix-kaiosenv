{ pkgs }:
{
  package = pkgs.buildEnv {
    name = "kaios-nix-env";
    paths = [
      (pkgs.callPackage ./firefox.nix {})
      pkgs.androidenv.androidPkgs_9_0.platform-tools
    ];
  };
  home-file = import ./home-extensions.nix { inherit pkgs; };
}
