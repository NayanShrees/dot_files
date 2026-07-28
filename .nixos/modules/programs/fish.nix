{ ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "ls -l --color=auto";
    };
    interactiveShellInit = ''
      set fish_greeting
    '';
  };
}
