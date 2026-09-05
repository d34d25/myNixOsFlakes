{pkgs, config, inputs, ...}:
let

    stable = import inputs.nixpkgs-stable {

        system = pkgs.system;

        config.allowUnfree = true;

    };

    unstable = import inputs.nixpkgs-unstable {

        system = pkgs.system;

        config.allowUnfree = true;

    };

in
{

    environment.systemPackages = [

        stable.git
        stable.htop
        stable.fastfetch

        stable.aseprite
        stable.blender

    ];

}
