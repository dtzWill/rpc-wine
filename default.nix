{ pkgs ? import <nixpkgs> {} }:

pkgs.callPackage ./build.nix {
  wine = pkgs.wineWowPackages.staging;
}
