# Define a top-level module that collects all package definitions from
# this directory.
{
  pkgs,
  ...
}:

{
  # This is automatically scoped perSystem in the output.
  packages = {
    greet = pkgs.callPackage ./greet.nix {
      greeting = "Grüezi";
    };
  };
}
