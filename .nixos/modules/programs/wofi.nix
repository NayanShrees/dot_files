{ ... }:

{
  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      allow_images = true;
      hide_scroll = true;
      insensitive = true;
      prompt = "run";
    };
    style = ../../themes/wofi/style.css;
  };
}
