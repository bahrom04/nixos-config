{
  lib,
  config,
  inputs,
  outputs,
  pkgs,
  ...
}: 
let
  keys = "/Users/bahrom04/.config/sops/age/keys.txt";
in
{
  imports = [
    inputs.sops-nix.darwinModules.sops

    inputs.home-manager.darwinModules.home-manager
    inputs.auto_profile_tg.darwinModules.default
  ];

  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = keys;
  }; 

  nix = {
    enable = true;
    nixPath = lib.mapAttrsToList (key: value: "${key}=${value.to.path}") config.nix.registry;
    settings.experimental-features = "nix-command flakes";
  };

  environment = {
    variables = {
      EDITOR = "vim";
      SOPS_AGE_KEY_FILE="${config.users.users.bahrom04.home}/.config/sops/age/keys.txt";
      };
    systemPackages = with pkgs; [
      nixfmt-rfc-style
      neovim
      fastfetch
      redis
      age # very important
      sops
    ];
  };

  nixpkgs = {
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Disable if you don't want linux thingies on mac
      allowUnsupportedSystem = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
      # Let the system use fucked up programs
      allowBroken = true;
    };
  };

  services.redis.enable = true;

  # MacOs Dock setttings
  system.defaults.dock = {
    autohide = false;
    largesize = 16;
    mineffect = "scale";
    minimize-to-application = true;
    mru-spaces = true;
    orientation = "bottom";
    show-recents = false;
    show-process-indicators = true;
    tilesize = 50;
  };

  system.primaryUser = "bahrom04";

  users.users.bahrom04 = {
    name = "bahrom04";
    home = "/Users/bahrom04";
  };

  home-manager = {
    users.bahrom04 = import ../home.nix;
    extraSpecialArgs = {
      inherit inputs outputs;
    };
  };

  # programs.zsh = {
  #   enable = true;
  #   enableCompletion = true;
  #   enableBashCompletion = true;
  #   enableSyntaxHighlighting = true;
  # };

  # Automatic flake devShell loading
  programs.direnv = {
    enable = true;
    silent = true;
    loadInNixShell = false;
    nix-direnv.enable = true;
  };

  # Replace commant not found with nix-index
  programs.nix-index = {
    enable = true;
  };

  # Networking DNS & Interfaces
  networking = {
    computerName = "air"; # Define your computer name.
    localHostName = "air"; # Define your local host name.
  };

  # services.auto_profile_tg = {
  #   enable = true;
  #   api_id = config.sops.secrets."auto_profile_tg/api_id".path;
  #   api_hash = config.sops.secrets."auto_profile_tg/api_hash".path;
  #   phone_number = config.sops.secrets."auto_profile_tg/phone_number".path;
  #   first_name = config.sops.secrets."auto_profile_tg/first_name".path;
  #   lat = config.sops.secrets."auto_profile_tg/lat".path;
  #   lon = config.sops.secrets."auto_profile_tg/lon".path;
  #   timezone = config.sops.secrets."auto_profile_tg/timezone".path;
  #   city = config.sops.secrets."auto_profile_tg/city".path;
  #   weather_api_key = config.sops.secrets."auto_profile_tg/weather_api_key".path;
  # };

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true; # default shell on catalina

  # Select host type for the system
  nixpkgs.hostPlatform = lib.mkDefault "aarch64-darwin";

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 5;
}
