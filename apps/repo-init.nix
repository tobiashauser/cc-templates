{
  name,
  pkgs,
  ...
}:

let
  git-lfs-webdav = pkgs.callPackage ../packages/git-lfs-webdav.nix { };

in
pkgs.writeShellScript "init" ''
  # Initialize git flow.
  if ! git config --get --local gitflow.branch.master > /dev/null 2>&1; then
      echo "Initialize git flow…"  
      git flow init --defaults --local \
          --feature="feat/" \
          --bugfix="fix/" \
          --tag="v"
  fi
  
  # Connect to git lfs storage.
  ${git-lfs-webdav}/bin/git-lfs-webdav init "https://webdav.blueberry.tobiashauser.org/${name}"

  if command -v op > /dev/null 2>&1; then
      env GIT_LFS_USERNAME=$(op item get df2r4oku75lxqui2bqvr7443ae --fields username) \
          GIT_LFS_PASSWORD=$(op item get df2r4oku75lxqui2bqvr7443ae --fields password --reveal) \
          ${git-lfs-webdav}/bin/git-lfs-webdav login
  else
      ${git-lfs-webdav}/bin/git-lfs-webdav login
  fi
''
