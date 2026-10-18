{
  pkgs,
  ...
}:

pkgs.buildGoModule {
  pname = "git-lfs-webdav";
  version = "v1.0.0";
  vendorHash = "sha256-wcu0jHtkm5saRneBVR9xz7jvMhHryJrYGrajdLJAglE=";
  
  src = pkgs.fetchFromGitHub {
    owner = "quiet-koala";
    repo = "git-lfs-webdav";
    rev = "master";
    hash = "sha256-m5pwkEG1gcIEs+wiMgzrBVzAvqXNaT+eOygeZAIdI+4=";
  };
}
