{
  config,
  inputs,
  outputs,
  pkgs,
  ...
}:
let
  key = "${config.users.users.bahrom04.home}/.config/sops/age/keys.txt";
in
{
  imports = [
    inputs.sops-nix.darwinModules.sops
  ];

  nix.settings.experimental-features = "nix-command flakes";
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    neovim
    fastfetch
    redis
  ];

  environment.variables.EDITOR = "vim";

  sops = {
    # Path to key file for unlocking secrets
    age.keyFile = "/Users/bahrom04/.config/sops/age/keys.txt";
    # Default file that contains list of secrets
    defaultSopsFile = ../secrets/secrets.yaml;
    # The format of the secret file
    defaultSopsFormat = "yaml";
  };

  services.redis.enable = true;

  programs.fish.enable = true;

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
    shell = pkgs.fish;
    uid = 501;
  };

  nixpkgs.config.allowUnfree = true;
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager = {
    users.bahrom04 = import ../home.nix;
    extraSpecialArgs = {
      inherit inputs outputs;
    };
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

  system.stateVersion = 5;
}
