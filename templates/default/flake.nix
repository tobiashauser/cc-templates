{
  description = "My new cobweb-curriculum package.";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    parts.url = "github:hercules-ci/flake-parts";

    # tag: 1.1.0
    support = {
      url = "git+ssh://git@github.com/tobiashauser/cc-support.git?shallow=1&rev=9f60551bce0a1fc3c719e8a1cc262e9276629a85";
      inputs = {
        parts.follows = "parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
  };

  outputs = inputs@{ parts, ... }: parts.lib.mkFlake { inherit inputs; } {
    imports = [
      inputs.support.flakeModules.default

      # Additional imports.
      # ./lib
      # ./templates
    ];

    # Define extra options.
    # options.<packageName> = { };

    config = {
      identifier = null; # TODO configure with a unique identifier.

      # Add the supported systems.
      systems = [
        "aarch64-darwin"
      ];

      perSystem = {
        imports = [
          # Modules that provide outputs parametrized over system.
          # ./apps
          # ./devShells
          # ./packages
        ];
        
        # Additional package outputs.
      };
    };
  };
}
