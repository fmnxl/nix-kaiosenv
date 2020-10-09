Nix-based KaiOS Dev Environment
=====================

## Motivation

The official KaiOS [documentation](https://developer.kaiostech.com/getting-started/env-setup/os-env-setup)
for setting up the development environment takes a few steps:
- Installing a legacy version of Firefox (for its WebIDE)
- Installing `adb-platform-tools` through `brew`
- Downloading and installing the `adbhelper` extension
- (Linux) setting up `udev` rules

I also encountered a few issues when setting up WebIDE on Linux:
- installing WebIDE extension can be disallowed due to version mismatch and/or security restrictions
- when a newer version of Firefox exist, Firefox/WebIDE [might not work properly](https://developer.mozilla.org/en-US/docs/Archive/WebIDE/Troubleshooting#Unable_to_load_project_list)

This repo demonstrates the use of Nix to bootstrap all of the above,
reproducibly.

## How it works

### `adbhelper`

To install this extension, we can use Firefox's deprecated [Extension Sideloading](https://extensionworkshop.com/documentation/publish/distribute-sideloading/).
This will automatically add the extension to our Firefox installation. However, the user would still have to manually enable the extension.

## Requirements
- Nix > 2.0
- Nixpkgs v19.09

### macOS
- (optional but recommended) [`home-manager`](https://github.com/rycee/home-manager/)


## Usage

There are 2 ways of using this repo:

### (Recommended) With `home-manager`

Add the package to your home manager configuration (by running `home-manager edit` then `home-manager switch`)

```nix
# home.nix
let
  kaiosNixEnv = pkgs.callPackage ~/nix-kaiosenv {};
in
{
  home.packages = [
    # ...
    kaiosNixEnv.package
  ];
  home.file = {
    # ...
  } // kaiosNixEnv.home-file;
}
```

### With `nix-shell`

To have a more seamless experience, consider using `direnv` to automatically load the dev environment when `cd`-ing into the project.

```
$ nix-shell

# create a symlink to the WebIDE .xpi to the current directory
$ setup

# Start firefox with custom profile
$ firefox --profile ./profile 

# Start WebIDE (Shift+F8)
```

## TODO

- [x] Firefox derivation with WebIDE extension pre-installed
- [x] Ship adbhelper extension out of the box
- [x] Installs `adb` through android platform tools
- [ ] Upgrade to Firefox v59
    - [ ] Use deterministic profiles to inject prefs.js

### macOS specific

- [x] Leagacy Firefox derivation
- [ ] Usage with `home-manager`
- [ ] Usage with `nix-shell`

### NixOS specific

- [ ] `adb` and `udev` setup

## Relevant links

- https://paul.kinlan.me/debugging-web-pages-on-the-nokia-8110-with-kaios/
- https://cmacr.ae/post/2020-05-09-managing-firefox-on-macos-with-nix/
- https://github.com/nix-community/home-manager/blob/master/modules/programs/firefox.nix
- https://github.com/nix-community/nur-combined/blob/master/repos/rycee/pkgs/firefox-addons/default.nix
 
