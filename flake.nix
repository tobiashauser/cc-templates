{
  description = "Template for a cobweb-curriculum package.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{ parts, ... }:
    let
      # CHANGE TO THE NAME OF YOUR PACKAGE.
      name = "cobweb-curriculum-template";
    in
    parts.lib.mkFlake { inherit inputs; } (
      { lib, ... }:
      {
        options.${name} = { };

        config = {
          flake.lib = {
            each = import ./lib/each.nix { inherit lib; };
          };
          
          systems = [
            "aarch64-darwin"
          ];

          perSystem =
            { pkgs, ... }:
            {
              imports = [
                ./devShells
                ./packages
              ];
              
              config = {
                apps.repo-init = {
                  type = "app";
                  program = "${pkgs.callPackage ./apps/repo-init.nix { inherit name; }}";
                };
                # devShells.default = pkgs.callPackage ./devShells/default.nix { };
                # packages.git-lfs-webdav = pkgs.callPackage ./packages/git-lfs-webdav.nix { };
              };
            };
        };
      }
    );
}
