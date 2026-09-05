{
  description = "flake for system programs";

  inputs = {

    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs?ref=nixos-26.05";

  };

  outputs = {self, nixpkgs-unstable, nixpkgs-stable, ...}  @inputs:{

    nixosConfigurations.dision = nixpkgs-stable.lib.nixosSystem {

      specialArgs = {inherit inputs;};

      modules = [

        ./configuration.nix
        ./myModules/sys-settings.nix
        ./myModules/nvidia-drivers.nix
        ./myModules/programs.nix

      ];

    };

  };


}
