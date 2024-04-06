# Add your reusable nixos's configs modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  imports = [

    ./fonts.nix
    ./nix_exp.nix
    
  ];
}