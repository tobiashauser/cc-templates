# Get a list of paths in DIR that match PATTERN. Note, that PATTERN
# must match the entire path; nix doesn't support substrings.
{
  lib,
  ...
}:

let
  inherit (builtins) match readDir;
  inherit (lib) filterAttrs mapAttrsToList;

  matching =
    pattern: name: _type:
    !(isNull (match pattern name));
  
  withPrefix =
    dir: name: _type:
    dir + "/${name}";
  
in
dir: pattern: mapAttrsToList (withPrefix dir) (filterAttrs (matching pattern) (readDir dir))
