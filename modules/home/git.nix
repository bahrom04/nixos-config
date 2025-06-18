{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    lfs.enable = true;

    userName = "bahrom04";
    userEmail = "magdiyevbahrom@gmail.com";

    signing = {
      signByDefault = true;
      key = "3A1329E21721DA4B99E4E9403FCB31D3A00AE191";
    };

    extraConfig = {
      http.sslVerify = false;
      pull.rebase = false;
    };

    # Git ignores
    ignores = [
      ".idea"
      ".DS_Store"
      "nohup.out"
    ];
  };
}
