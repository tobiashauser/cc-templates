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
        imports = [ ];
        
        options.${name} = { };

        config = {
          flake.lib = {
            each = import ./lib/each.nix { inherit lib; };
          };

          systems = [
            "aarch64-darwin"
          ];

          perSystem = {
            _module.args.name = name;

            imports = [
              ./apps
              ./devShells
              ./packages
            ];
          };
        };
      }
    );
}
