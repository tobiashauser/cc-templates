{
  flake.templates = {
    apps = {
      description = "expose executable scripts";
      path = ./apps;
    };

    default = {
      description = "initialize a new cobweb-curriculum package";
      path = ./default;
    };

    devShells = {
      description = "add devShells to the package";
      path = ./devShells;
    };

    lib = {
      description = "expose a library with the package";
      path = ./lib;
    };

    options = {
      description = "add options for the module";
      path = ./options;
    };

    overlays = {
      description = "add explicit overlay definitions";
      path = ./overlays;
    };

    packages = {
      description = "output packages";
      path = ./packages;
    };

    templates = {
      description = "define templates in this package";
      path = ./templates;
    };
  };
}
