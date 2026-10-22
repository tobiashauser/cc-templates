# Define options that should be available in perSystem here. See
# 'https://flake.parts/define-custom-flake-attribute.html#persystem-first'.
{
  lib,
  ...
}:

let
  inherit (lib) mkOption types;

in
{
  options = {
    hostName = mkOption {
      description = "A custom name for the host system.";
      type = types.str;
      default = "visionary-seriema";
    };
  };
}
