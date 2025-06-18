{
  pkgs,
  config,
  ...
}: {
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
}
