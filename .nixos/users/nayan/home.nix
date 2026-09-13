{
  pkgs,
  config,
  ...
}:

{
  home.username = "nayan";
  home.homeDirectory = "/home/nayan";

  home.sessionVariables = {
    XDG_DATA_HOME = "${config.home.homeDirectory}/.local/share";
  };

  home.packages = [
    pkgs.btop
    pkgs.clang-tools
    pkgs.cmake
    pkgs.cmake-language-server
    pkgs.dconf2nix
    pkgs.devenv
    pkgs.evince
    pkgs.fastfetch
    pkgs.firefox
    pkgs.gnome-tweaks
    pkgs.gnumake
    pkgs.keepassxc
    pkgs.lld
    pkgs.lldb
    pkgs.nautilus
    # pkgs.neocmakelsp
    pkgs.ninja
    pkgs.nixd
    pkgs.nixfmt
    pkgs.numix-icon-theme-circle
    pkgs.openjdk
    pkgs.prettier
    pkgs.ripgrep
    pkgs.tinymist
    pkgs.trezor-suite
    pkgs.typst
    pkgs.typstyle
    pkgs.unzip
    pkgs.valgrind
    pkgs.yubioath-flutter
  ];

  imports = [
    ../../modules/programs/alacritty.nix
    ../../modules/programs/fish.nix
    ../../modules/programs/git.nix
    ../../modules/programs/gnome.nix
    ../../modules/programs/helix.nix
    ../../modules/programs/jujutsu.nix
    ../../modules/programs/tmux.nix
    ../../modules/programs/xdg.nix
  ];

  nixpkgs.config.allowUnfree = true;

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "26.05";

  programs.home-manager.enable = true;
}
