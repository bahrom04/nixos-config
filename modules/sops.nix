{ 
  config,
  lib,
  inputs,
  ...
}: 

{ 
  imports = [
    inputs.sops-nix.darwinModules.sops
  ];

  sops = {
    defaultSopsFile = ../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";
    age.keyFile = config.environment.variables.SOPS_AGE_KEY_FILE;
    secrets = {
      api_id = {
        owner = "bahrom04";
        mode = "0440";
      };
      api_hash = {
        owner = "bahrom04";
        mode = "0440";
      };
      phone_number = {
        owner = "bahrom04";
        mode = "0440";
      };
      first_name = {
        owner = "bahrom04";
        mode = "0440";
      };
      lat = {
        owner = "bahrom04";
        mode = "0440";
      };
      lon = {
        owner = "bahrom04";
        mode = "0440";
      };
      timezone = {
        owner = "bahrom04";
        mode = "0440";
      };
      city = {
        owner = "bahrom04";
        mode = "0440";
      };
      weather_api_key = {
        owner = "bahrom04";
        mode = "0440";
      };
    };
  };
}