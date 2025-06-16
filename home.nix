{
  inputs,
  config,
  pkgs,
  ...
}: let
  modulesHome = import ./modules/home;
  modulesServices = import ./modules/services;

in {
  imports = [
    inputs.sops-nix.homeManagerModules.sops

    modulesHome.fastfetch
    modulesHome.fish
    modulesHome.git
    modulesHome.starship
    modulesHome.zsh
    modulesHome.vscode
    modulesServices.espanso
  ];

  home.username = "bahrom04";
  home.homeDirectory = "/Users/bahrom04";

  programs.home-manager.enable = true;
  # home-manager.backupFileExtension = "backup";

  # services.tarjimonlar.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  # Foydalanuvchi profiliga oʻrnatilishi kerak boʻlgan paketlar
  home.packages = with pkgs; [
    git
    gnupg # gpg key uchun
    neofetch

    # arxivlar
    zip
    xz
    unzip  
    jq # json ustida ishlovchi yengil va qulay instrument
    mtr # tarmoq diagnostika utilitasi
    dnsutils # `dig` + `nslookup`
    ldns # `dig` o'rnini bosuvchi, `drill` buyrug'ini taqdim etadi
    nmap # tarmoq qidiruvchi va xavfsizlik auditi uchun utilita

    # aria2c -x 16 -s 16  "https://CONTENT_PATH"
    aria2 # multi-protokol va multi-manba'lik buyruq satridagi yuklovchi utilita

    # hokazo
    cowsay
    file
    which
    tree
    # nix-output-monitor
    espanso
  ];

  nixpkgs = {
      # Configure your nixpkgs instance
      config = {
        # Wallahi, forgive me RMS...
        allowUnfree = true;
        # Workaround for https://github.com/nix-community/home-manager/issues/2942
        allowUnfreePredicate = _: true;
        # Let the system use fucked up programs
        allowBroken = true;
      };
    };

  sops = {
    # Path to key file for unlocking secrets
    age.keyFile = "${config.home.homeDirectory}/.config/sops/age/keys.txt";
    # Default file that contains list of secrets
    defaultSopsFile = ./secrets/secrets.yaml;
    # The format of the secret file
    defaultSopsFormat = "yaml";
  };

  home.stateVersion = "25.05";
}
