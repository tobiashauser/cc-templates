# Add the applications and scripts this package defines.
# This module must be imported inside config.perSystem.
{
pkgs,
...
}:

{
  imports = [
    # Add modules.
    ./hello
  ];

  apps = {
    bye = {
      type = "app";
      program = pkgs.writeShellScriptBin "bye" "echo 'Goodbye👋'";
    };
  };
}
