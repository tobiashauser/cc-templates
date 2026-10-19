# This function is scoped to `perSystem` which makes an instance of
# `pkgs` for the current system available among other attribute sets.
{
  pkgs,
  ...
}:

{
  # Define the app at its location in apps.
  apps.hello = {
    type = "app";
    program = pkgs.hello;
  };
}
