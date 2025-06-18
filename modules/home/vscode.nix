# reference: https://maksar.github.io/posts/code/2021-09-19-vscode/
{
  config,
  pkgs,
  ...
}: {
  programs.vscode = {
    enable = true;
    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        yzhang.markdown-all-in-one
        ecmel.vscode-html-css
        fill-labs.dependi
        ms-python.vscode-pylance
        ms-python.python
        ms-vscode-remote.vscode-remote-extensionpack
        ms-vscode-remote.remote-ssh
        ms-python.black-formatter
        #rust-lang.rust-analyzer
        zguolee.tabler-icons
        vscode-icons-team.vscode-icons
        tal7aouy.icons
        tamasfe.even-better-toml
        #kubukoz.nickel-syntax
        bbenoist.nix
      ];

      userSettings = {
        "files.autoSave" = "afterDelay";
        "[nix]"."editor.tabSize" = 2;
        "[python]"."editor.tabSize" = 4;
        "editor.fontSize" = 16;
        "terminal.integrated.fontSize" = 14;
        "editor.defaultFormatter" = "ms-python.black-formatter";
        "editor.formatOnSave" = true;
        "terminal.integrated.profiles.osx" = {
          "fish (nix)" = {
            path = "/run/current-system/sw/bin/fish";
          };
        };
        "terminal.integrated.defaultProfile.osx" = "zsh";
        "workbench.iconTheme" = "vscode-icons";
        "diffEditor.ignoreTrimWhitespace" = false;
        "vsicons.dontShowNewVersionMessage" = true;
        "liveServer.settings.donotShowInfoMsg" = true;
        "explorer.fileNesting.patterns" = {
          "*.ts" = "\${capture}.js";
          "*.js" = "\${capture}.js.map, \${capture}.min.js, \${capture}.d.ts";
          "*.jsx" = "\${capture}.js";
          "*.tsx" = "\${capture}.ts";
          "tsconfig.json" = "tsconfig.*.json";
          "package.json" = "package-lock.json, yarn.lock, pnpm-lock.yaml, bun.lockb";
          "*.sqlite" = "\${capture}.\${extname}-*";
          "*.db" = "\${capture}.\${extname}-*";
          "*.sqlite3" = "\${capture}.\${extname}-*";
          "*.db3" = "\${capture}.\${extname}-*";
          "*.sdb" = "\${capture}.\${extname}-*";
          "*.s3db" = "\${capture}.\${extname}-*";
        };
        "terminal.integrated.inheritEnv" = false;
        "editor.accessibilitySupport" = "off";

        # Language-specific settings
        "[javascript]" = {
          "editor.defaultFormatter" = "vscode.typescript-language-features";
        };
        "[javascriptreact]" = {
          "editor.defaultFormatter" = "vscode.typescript-language-features";
        };
        "[html]" = {
          "editor.defaultFormatter" = "NikolaosGeorgiou.html-fmt-vscode";
        };
        "[css]" = {
          "editor.defaultFormatter" = "vscode.css-language-features";
        };
        "[python]" = {
          "diffEditor.ignoreTrimWhitespace" = false;
          "editor.defaultColorDecorators" = "never";
          "gitlens.codeLens.symbolScopes" = ["!Module"];
          "editor.formatOnType" = true;
          "editor.wordBasedSuggestions" = "off";
        };
        "github.copilot.enable" = {
          "*" = false;
          "plaintext" = false;
          "markdown" = false;
          "scminput" = false;
        };
      };
    };
  };
}
