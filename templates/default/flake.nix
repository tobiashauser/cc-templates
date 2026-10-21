{
  description = "My new cobweb-curriculum package.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";

    # tag: 1.1.2
    cc-lib = {
      url = "git+ssh://git@github.com/tobiashauser/cc-lib.git?ref=main&shallow=1";
      inputs = {
        parts.follows = "parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    inputs@{ parts, ... }:
    parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        imports = [
          inputs.cc-lib.flakeModules.default
          # inputs.parts.flakeModules.easyOverlay # generate overlays from packages

          # Additional imports.
          # ./lib
          # ./options
          # ./overlays
          # ./templates
        ];

        config = {
          identifier = null; # TODO configure with a unique identifier.
          latexmk = {
            # Configure latexmk.
          };

          # Add the supported systems.
          systems = [
            "aarch64-darwin"
          ];

          perSystem =
            { config, ... }:
            {
              imports = [
                # Modules that provide outputs parametrized over system.
                # ./apps
                # ./devShells
                # ./options/perSystem.nix
                # ./packages
              ];

              # Globally import `easy-overlay' to generate overlays for
              # the following packages.
              # overlayAttrs = {
              #   inherit (config.packages) my-package;
              # };

              # Additional package outputs.
            };
        };
      }
    );
}
