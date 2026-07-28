{ ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.blur = true;
      font.size = 12;
      font.normal = {
        family = "Comic Code Ligatures";
        style = "Regular";
      };

      font.bold = {
        family = "Comic Code Ligatures";
        style = "Bold";
      };

      font.italic = {
        family = "Comic Code Ligatures";
        style = "Italic";
      };

      font.bold_italic = {
        family = "Comic Code Ligatures";
        style = "Bold Italic";
      };

      cursor = {
        style = {
          blinking = "Always";
        };
        blink_timeout = 0;
      };

      terminal.shell = "tmux";
    };
  };
}
