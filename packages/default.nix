{ pkgs, ... }:
{
  packages = {
    git-lfs-webdav = pkgs.callPackage ./git-lfs-webdav.nix { };
  };
}
