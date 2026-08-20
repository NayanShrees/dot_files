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
      language = [
        {
          name = "c";
          formatter = {
            command = "clang-format";
          };
          auto-format = true;
        }

        {
          name = "cpp";
          formatter = {
            command = "clang-format";
          };
          auto-format = true;
        }

        {
          name = "json";
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
          formatter = {
            command = "rustfmt";
          };
          auto-format = true;
        }

        {
          name = "typst";
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
