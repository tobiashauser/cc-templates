{
  config,
  pkgs,
  ...
}:

{
  devShells = {
    default = pkgs.mkShell {
      packages = [
        config.packages.git-lfs-webdav
      ];
    };
  };
}
