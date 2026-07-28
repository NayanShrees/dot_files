{
  pkgs,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    # ../../modules/services/ly.nix
    # ../../modules/services/tlp.nix
  ];

  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_latest;
  };

  networking.hostName = "shrees";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  i18n.extraLocales = [
    "en_US.UTF-8/UTF-8"
  ];

  console = {
    keyMap = "uk";
  };

  # systemd.sleep.settings.Sleep = {
  # AllowSuspend = "yes";
  # };

  security.sudo.enable = false;
  security.doas.enable = true;

  security.doas.extraRules = [
    {
      users = [ "nayan" ];
      keepEnv = true;
      persist = true;
    }
  ];

  services.pipewire = {
    enable = true;
    # pulse.enable = true;
  };

  services.libinput.enable = true;
  services.openssh.enable = true;
  services.pcscd.enable = true;

  # services.resolved.enable = true;
  # services.mullvad-vpn.enable = true;
  # services.mullvad-vpn.package = pkgs.mullvad-vpn;

  # programs.hyprland = {
  # enable = true;
  # xwayland.enable = false;
  # };

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  services.gnome.core-apps.enable = false;
  services.gnome.core-developer-tools.enable = false;
  services.gnome.games.enable = false;
  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-user-docs
  ];

  services.xserver.xkb = {
    layout = "gb";
    variant = "";
    options = "";
  };

  programs.firefox.enable = false;
  programs.fish.enable = true;
  programs.bash.enable = false;
  programs.nano.enable = false;

  documentation.nixos.enable = false;

  users.users.nayan = {
    isNormalUser = true;
    shell = pkgs.fish;
    description = "Nayan Shrees";
    extraGroups = [ "networkmanager" ]; # Enable ‘sudo’ for the user.
  };

  environment.systemPackages = [
    pkgs.clang
    pkgs.gcc
    pkgs.git
    pkgs.home-manager
    pkgs.helix
    pkgs.rustup
    pkgs.tmux
  ];

  fonts = {
    fontconfig = {
      enable = true;
      defaultFonts = {
        serif = [ "Comic Code Ligatures" ];
        sansSerif = [ "Comic Code Ligatures" ];
        monospace = [ "Comic Code Ligatures" ];
      };
    };
    packages = [
      pkgs.nerd-fonts.fira-code
    ];
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?

}
