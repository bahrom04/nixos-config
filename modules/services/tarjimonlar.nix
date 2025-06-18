{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  # Shorter name to access final settings a
  # user of tarjimonlar.nix module HAS ACTUALLY SET.
  # cfg is a typical convention.
  cfg = config.services.tarjimonlar;
in {
  # Declare what settings a user of this "tarjimonlar" module CAN SET.
  options.services.tarjimonlar = {
    enable = mkOption {
      type = types.bool;
      default = false;
      example = true;
      description = "Whether to enable this tarjimonlar module";
    };
  };

  config = mkIf cfg.enable {
    # Espanso (Home Manager level)
    services.espanso = {
      enable = true;
      matches = {
        base = {
          matches = [
            {
              trigger = ":now";
              replace = "It's {{currentdate}} {{currenttime}}";
            }
            {
              trigger = "o'";
              replace = "oʻ";
            }
            {
              trigger = "O'";
              replace = "Oʻ";
            }
            {
              trigger = "g'";
              replace = "gʻ";
            }
            {
              trigger = "G'";
              replace = "Gʻ";
            }
            {
              trigger = ";'";
              replace = "ʼ";
            }
            {
              trigger = '':"''; # qoʻshtirnoq ochilishi
              replace = "“";
            }
            {
              trigger = ''":''; # qoʻshitirnoq yopilishi
              replace = "”";
            }
            {
              trigger = "..."; # va hokazodagi 3 ta nuqta 1 bayt shakliga oʻgirish
              replace = "…";
            }
          ];
        };
        global_vars = {
          global_vars = [
            {
              name = "currentdate";
              type = "date";
              params = {format = "%d/%m/%Y";};
            }
            {
              name = "currenttime";
              type = "date";
              params = {format = "%R";};
            }
          ];
        };
      };
    };

    # write other pkgs or services to enable alongside tarjimonlar
  };
}
