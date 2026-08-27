{ ... }:

{
  age.identityPaths = [ "/Users/kyoku/.ssh/id_ed25519" ];
  age.secrets.openrouter-api-token = {
    file = ../../secrets/openrouter-api-token.age;
    owner = "kyoku";
  };
}
