Nix KaiOS Environment
=====================

Setting up dev environment for KaiOS development is a bit cumbersome:
- requires an old version of Firefox for its WebIDE
- setting up `udev` rules
- installing WebIDE extension can be disallowed due to version mismatch and/or security restrictions
- when a newer version of Firefox exist, Firefox/WebIDE [might not work properly](https://developer.mozilla.org/en-US/docs/Archive/WebIDE/Troubleshooting#Unable_to_load_project_list)

## Requirements
- Nix >2.0
- Nixpkgs v19.09
- `adb`

## Usage

```
$ nix-shell

# create a symlink to the WebIDE .xpi to the current directory
$ setup

# Start firefox with custom profile
$ firefox --profile ./profile 

# Start WebIDE (Shift+F8)
```

## TODO

- [ ] `adb` and `udev` setup
  - Avoid requiring `programs.adb` in configuration.nix
- [ ] Firefox derivation with WebIDE extension pre-installed
- [ ] Automatically use separate profile

### Relevant links

- https://paul.kinlan.me/debugging-web-pages-on-the-nokia-8110-with-kaios/
