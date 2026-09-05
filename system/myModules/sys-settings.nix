{pkgs, config, ...}:

{

    networking.firewall.enable = true;

    nix.settings.experimental-features = ["nix-command" "flakes"];

}
