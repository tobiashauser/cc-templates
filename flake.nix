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
    parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./lib
      ];

      options.${name} = { };

      config = {
        systems = [
          "aarch64-darwin"
        ];

        perSystem = {
          _module.args = {
            inherit name;
          };

          imports = [
            ./apps
            ./devShells
            ./packages
          ];
        };
      };
    };
}
