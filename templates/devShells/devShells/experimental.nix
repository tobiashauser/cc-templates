# Just another module definition that exposes a devShell.
{
  pkgs,
  ...
}:

{
  # Define the shell environment by placing it in `devShells'.
  devShells.experimental = pkgs.mkShell {
    name = "experimental";
    packages = with pkgs; [
      cowsay
    ];
  };
}
