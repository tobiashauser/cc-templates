# Define the overlays as a toplevel attribute set that lives at
# flake.overlays. Since this is a module in itself, it may require
# top-level arguments.
{
  withSystem,
  ...
}:

{
  flake.overlays = {
    systemStringFile = final: prev: prev.writeText "system-string" prev.stdenv.hostPlatform.system;

    # More often that not overlays just reexport packages from the
    # outputs. This can be done using this pattern:
    fromPackages = {
      greet =
        final: prev:
        withSystem prev.stdenv.hostPlatform.system (
          { config, ... }:
          {
            greet = config.packages.greet;
          }
        );
    };
  };
}
