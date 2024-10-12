{
  config,
  pkgs,
  inputs,
  ...
}: {
  users.users.renee = {
    initialHashedPassword = "$y$j9T$M1umYAwk9vPwv4g5c6Gh21$WEgBeKJKYl2xszgcm.XJ6rPlG8x1Kl.1ABlDsLuh9y7";
    isNormalUser = true;
    description = "renee";
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "flatpak"
      "audio"
      "video"
      "plugdev"
      "input"
      "kvm"
      "qemu-libvirtd"
    ];
    openssh.authorizedKeys.keys = [ "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOxOEoEIxdDMyIJut1381J0hjIvuFGE0pL4DJJfx5thX renee@nixos"
      
    ];
    packages = [inputs.home-manager.packages.${pkgs.system}.default];
  };
  home-manager.users.renee =
    import renee/${config.networking.hostName}.nix;
}
