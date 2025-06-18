{
  config,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    generateCompletions = true;
    loginShellInit = ''
      eval "$(starship init fish)"
    '';
  };
}
