# Define the library this package exposes.
{
  imports = [
    # Add library modules.
    ./square.nix
  ];

  # Define functions inline or import them.
  flake.lib = {
    decr = x: x - 1;
    incr = import ./incr.nix { };
  };
}
