# Define the library this package exposes. The framework expects
# 'flake.lib' to be defined only once, imported submodules are not
# possible. Access nixpkgs's library by requiring `lib' in the inputs.
args@{
  ...
}:

{
  # Define functions inline or import them.
  flake.lib = {
    decr = x: x - 1;
    incr = import ./incr.nix;
    ls = import ./ls.nix args;
  };
}
