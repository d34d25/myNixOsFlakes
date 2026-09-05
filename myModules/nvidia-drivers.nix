{pkgs, config, ...}:

{
    services.xserver.videoDrivers = ["nvidia"];

    hardware.nvidia = {

        open = true;

        package = config.boot.kernelPackages.nvidiaPackages.production;

    };

}
