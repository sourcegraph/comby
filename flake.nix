{
  description = "Flake to build comby";

  inputs = {
    nixpkgs = { url = "github:NixOS/nixpkgs/nixpkgs-unstable"; };
    flake-utils = { url = "github:numtide/flake-utils"; };
  };

  outputs = { self, nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        inherit system;
        pkgs = import nixpkgs { inherit system; };
      in
      {
        defaultPackage = pkgs.comby;
      });
}
