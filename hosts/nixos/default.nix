{ pkgs, username, hostname, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/hyprland.nix
    ../../modules/nixos/korean-input.nix
  ];

  networking.hostName = hostname;
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Seoul";
  i18n.defaultLocale = "ko_KR.UTF-8";

  boot.loader.systemd-boot = {
    enable = true;
    configurationLimit = 5;
  };
  boot.loader.efi.canTouchEfiVariables = true;

  users.users.${username} = {
    isNormalUser = true;
    description = "kyoku-nixOS";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.zsh;
    packages = [ pkgs.kdePackages.kate ];
  };
  programs.zsh.enable = true;
  programs.firefox.enable = true;
  services.printing.enable = true;
  services.pcscd.enable = true;

  virtualisation.docker.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
  environment.systemPackages = with pkgs; [ vim wget git docker-compose ];
  fonts.packages = with pkgs; [ noto-fonts-cjk-sans nerd-fonts.jetbrains-mono ];

  home-manager.users.${username} = import ./home.nix;

  system.stateVersion = "26.05";
}
