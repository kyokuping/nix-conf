let
  kyoku = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOTXoMM0+H+bPD3HQCFiMzrT4zNl0KkBzqap2A2FOGTw";
in
{
  "openrouter-api-token.age".publicKeys = [ kyoku ];
  "r2-credentials.age".publicKeys = [ kyoku ];
}
