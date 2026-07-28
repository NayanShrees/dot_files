{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultbranch = "main";
      user.name = "Nayan Shrees";
      user.email = "nayan@nayanshrees.com";
      core.editor = "hx";
      pull.rebase = true;
      fetch.prune = true;
    };
  };
}
