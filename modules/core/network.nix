{ ... }:
{
  networking.hostName = "pavilion";
  networking.networkmanager.enable = true;

  services.tailscale.enable = true;
  services.openssh.enable = true;
}
