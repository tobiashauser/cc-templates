{
  pkgs,
  ...
}:

let
  git-lfs-webdav = pkgs.callPackage ../packages/git-lfs-webdav.nix { };

in
pkgs.mkShell {
  packages = [
    git-lfs-webdav
  ];
}
