{ pkgs, ... }: {
  programs.gpg = {
    enable = true;
    publicKeys = [{
      source = ../../../keys/openpgp/kyoku.asc;
      trust = 5;
    }];
    settings.default-key = "77587FEAB23500FA2F5189409E93146AC5E91880";
    scdaemonSettings = {
      disable-ccid = true;
      pcsc-shared = true;
    };
  };

  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry_mac;
  };
}
