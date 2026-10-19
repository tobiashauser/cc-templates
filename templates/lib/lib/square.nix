# Global attribute sets such as `config` or `lib` are passed to this
# module.
{ ... }:
{
  # Define the function at its location, explicitely going through
  # flake.lib.
  flake.lib.square = x: x * x;
}
