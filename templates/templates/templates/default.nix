# Collect all templates defined in this subtree into a single module.
{
  flake.templates = {
    default = {
      description = "my new template";
      path = ./default;
    };
  };
}
