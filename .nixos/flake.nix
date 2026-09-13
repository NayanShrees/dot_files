{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        shrees = nixpkgs.lib.nixosSystem {
          inherit system;
          modules = [
            ./hosts/shrees/configuration.nix
            # home-manager.nixosModules.default
            # {
            #   home-manager = {
            #     users.nayan = ./users/nayan/home.nix;
            #   };
            # }
          ];
        };
      };
      homeConfigurations = {
        nayan = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./users/nayan/home.nix ];
        };
      };
    };
}
