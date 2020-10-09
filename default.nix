{ buildEnv, callPackage, androidenv }:
buildEnv {
  name = "kaios-nix-env";
  paths = [
    (callPackage (import ./firefox.nix) {})
    androidenv.androidPkgs_9_0.platform-tools
  ];
}
