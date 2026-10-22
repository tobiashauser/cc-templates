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
      { self, ... }:
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
          # Add the supported systems.
          systems = [
            "aarch64-darwin"
          ];

          perSystem =
            { system, ... }:
            let
              pkgs = import inputs.nixpkgs {
                inherit system;
                # Importing from `self` evaluates the options in the
                # context of this flake, using `inputs` preserves
                # the providing flake's options.
                #
                # overlays = inputs.cc-lib.lib.overlaysFrom [
                #   self.overlays
                # ];
                #
                # or simpler
                overlays = builtins.attrValues self.overlays;
              };
            in
            {
              identifier = null; # TODO configure with a unique identifier.

              # Inject the overlay into the module arguments, this is
              # only necessary if modules are used.
              # _module.args.pkgs = pkgs;

              imports = [
                # Modules that provide outputs parametrized over system.
                # ./apps
                # ./devShells
                # ./options/perSystem
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
