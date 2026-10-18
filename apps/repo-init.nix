{
  config,
  name,
  pkgs,
  ...
}:

let
  git-lfs-webdav = "${config.packages.git-lfs-webdav}/bin/git-lfs-webdav";

in
{
  apps.repo-init = {
    type = "app";
    program = pkgs.writeShellScriptBin "repo-init" ''
      # Initialize git flow.
      if ! git config --get --local gitflow.branch.master > /dev/null 2>&1; then
          echo "Initialize git flow…"
          git flow init --defaults --local \
              --feature="feat/" \
              --bugfix="fix/" \
              --tag="v"
      fi

      # Connect to git lfs storage.
      ${git-lfs-webdav} init "https://webdav.blueberry.tobiashauser.org/${name}"

      if command -v op > /dev/null 2>&1; then
          env GIT_LFS_USERNAME=$(op item get df2r4oku75lxqui2bqvr7443ae --fields username) \
              GIT_LFS_PASSWORD=$(op item get df2r4oku75lxqui2bqvr7443ae --fields password --reveal) \
              ${git-lfs-webdav} login
      else
          ${git-lfs-webdav} login
      fi
    '';
  };
}
