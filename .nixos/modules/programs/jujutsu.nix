{ ... }:

{
  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        email = "nayan@nayanshrees.com";
        name = "Nayan Shrees";
      };
      ui.default-command = "log";
    };
  };
}
