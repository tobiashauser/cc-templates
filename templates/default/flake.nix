{
  description = "Template for a new cobweb-curriculum package.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";
    tree.url = "github:denful/import-tree";

    cc-lib = {
      url = "git+ssh://git@github.com/tobiashauser/cc-lib.git?ref=main&shallow=1";
      inputs = {
        parts.follows = "parts";
        nixpkgs.follows = "nixpkgs";
        tree.follows = "tree";
      };
    };
  };

  outputs =
    inputs@{ parts, tree, ... }:
    let
      # Define the module in here so that it can be exported from the
      # flake as well.
      module =
        { config, self, ... }:
        {
          imports = [
            (tree [
              ./lib
              ./overlays
              ./options
            ])
          ];

          config.perSystem =
            { system, ... }:
            let
              pkgs = import inputs.nixpkgs {
                inherit system;
                overlays = builtins.attrValues self.overlays;
              };
            in
            {
              _module.args = {
                inherit pkgs;
                top = { inherit config; };
              };

              imports = [
                (tree [
                  ./apps
                  ./devShells
                  ./options/perSystem
                  ./packages
                ])
              ];
            };
        };

    in
    parts.lib.mkFlake { inherit inputs; } (
      { ... }:
      {
        imports = [
          inputs.cc-lib.flakeModules.default
          module
        ];
        systems = [ "aarch64-darwin" ];
        flake.flakeModules.default = module;
      }
    );
}
