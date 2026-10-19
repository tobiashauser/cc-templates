{
  description = "Template for a cobweb-curriculum package.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";

    support = {
      url = "git+ssh://git@github.com/tobiashauser/cc-support.git?shallow=1&rev=398d58c4701b232d0da3e6f22416ae7407849475"; # 1.0.0
      inputs = {
        parts.follows = "parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs =
    inputs@{ parts, ... }:
    let
      name = "cc-template";
    in
    parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./lib
        inputs.support.flakeModules.default
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
            ./devShells
          ];
        };
      };
    };
}
