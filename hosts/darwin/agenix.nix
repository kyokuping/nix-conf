{ ... }:

{
  age.identityPaths = [ "/Users/kyoku/.ssh/id_ed25519" ];
  age.secrets.openrouter-api-token = {
    file = ../../secrets/openrouter-api-token.age;
    owner = "kyoku";
  };
  age.secrets.r2-credentials = {
    file = ../../secrets/r2-credentials.age;
    owner = "kyoku";
  };
}
