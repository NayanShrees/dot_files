{ ... }:

{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        line-number = "relative";
        mouse = false;
        bufferline = "multiple";
        rulers = [
          80
          120
        ];
        true-color = true;

        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };

        file-picker = {
          hidden = false;
        };

        lsp = {
          display-inlay-hints = true;
          display-messages = true;
        };

        soft-wrap.enable = true;

        statusline = {
          left = [
            "mode"
            "file-name"
            "read-only-indicator"
            "file-modification-indicator"
            "spinner"
          ];
          center = [
            "diagnostics"
            "workspace-diagnostics"
          ];
          right = [
            "version-control"
            "selections"
            "position"
            "position-percentage"
          ];
        };
      };
    };

    languages = {
      language-server = {
        harper-ls = {
          command = "harper-ls";
          args = [ "--stdio" ];
          config = {
            harper-ls = {
              dialect = "British";
            };
          };
        };
      };
      language = [
        {
          name = "c";
          language-servers = [
            "clangd"
            "harper-ls"
          ];
          formatter = {
            command = "clang-format";
          };
          auto-format = true;
        }

        {
          name = "cpp";
          language-servers = [
            "clangd"
            "harper-ls"
          ];
          formatter = {
            command = "clang-format";
          };
          auto-format = true;
        }

        {
          name = "json";
          language-servers = [ "harper-ls" ];
          formatter = {
            command = "prettier";
            args = [
              "--parser"
              "json"
            ];
          };
          auto-format = true;
        }

        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "harper-ls"
          ];
          formatter = {
            command = "rustfmt";
          };
          auto-format = true;
        }

        {
          name = "typst";
          language-servers = [
            "tinymist"
            "harper-ls"
          ];
          formatter = {
            command = "typstyle";
          };
          auto-format = true;
        }

        {
          name = "nix";
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }
      ];
    };
  };
}
