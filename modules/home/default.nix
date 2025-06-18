# Add your reusable home-manager modules to this directory, on their own file (https://wiki.nixos.org/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
#
# Refer to the link below for more options:
# https://nix-community.github.io/home-manager/options.xhtml
{
  git = import ./git.nix;
  zsh = import ./zsh.nix;
  fish = import ./fish.nix;
  vscode = import ./vscode.nix;
  starship = import ./starship.nix;
  fastfetch = import ./fastfetch.nix;
}
