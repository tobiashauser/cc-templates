# This module create the options for the flake.
{
  lib,
  ...
}@args:

let
  inherit (lib) mkOption types;

in
{
  options = {
    answer = mkOption {
      description = "The answer to the ultimate question.";
      type = types.number;
      default = 42;
    };

    colors = import ./colors.nix args;
  };
}
