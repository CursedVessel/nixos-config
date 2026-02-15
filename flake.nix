{
  description = "Hunter's Multi-System NixOS Configuration (Unstable)";

  inputs = {
    # NixOS Unstable
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager (Unstable)
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    {
      nixosConfigurations = {
        # Laptop - Gon
        Gon = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/Gon/default.nix

            # Home Manager Module
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.cosmic = import ./home.nix;

              # Fixes "clobber" error by backing up existing files
              home-manager.backupFileExtension = "backup";
            }
          ];
        };
      };
    };
}
