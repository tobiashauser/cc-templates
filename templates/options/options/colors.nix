# Extract entire subtrees of options into their own files.
{
  lib,
  ...
}:

let
  inherit (lib) mkOption types;

in
{
  black = mkOption {
    description = "HEX code to use as black.";
    type = types.str;
    default = "#000000";
  };

  white = mkOption {
    description = "HEX code to use as white.";
    type = types.str;
    defualt = "#FFFFFF";
  };
}
