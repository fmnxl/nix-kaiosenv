{ buildEnv, callPackage, androidenv }:
{
  package = buildEnv {
    name = "kaios-nix-env";
    paths = [
      (callPackage ./firefox.nix {})
      androidenv.androidPkgs_9_0.platform-tools
    ];
  };
  home-file = import ./home-extensions.nix {};
}
