# Define the shell environment this package exposes.
{
  pkgs,
  ...
}:

{
  imports = [
    # Add devShell modules.
    ./experimental.nix
  ];

  # Define devShells.
  devShells = {
    default = pkgs.mkShell {
      packages = with pkgs; [
        hello
      ];
    };
  };
}
