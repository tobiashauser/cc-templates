# Global attribute sets such as `config` or `lib` are passed to this
# module. Remember to pass along the arguments with the import of this
# function in 'default.nix'.
{
  lib,
  ...
}:

lib.readDir
