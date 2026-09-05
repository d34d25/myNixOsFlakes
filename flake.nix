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

        ({pkgs, config, ...}:
        let

          stable = inputs.nixpkgs-stable.legacyPackages.${pkgs.system};

          unstable = inputs.nixpkgs-unstable.legacyPackages.${pkgs.system};

        in
        {

          networking.firewall.enable = true;

          services.xserver.videoDrivers = ["nvidia"];

          hardware.nvidia = {

              open = true;

              package = config.boot.kernelPackages.nvidiaPackages.production;

          };

          nix.settings.experimental-features = ["nix-command" "flakes"];

          environment.systemPackages = [

            stable.git
            stable.htop
            stable.fastfetch

          ];

        })
      ];

    };

  };


}
