{ ... }:

{
  age.identityPaths = [ "/Users/kyoku/.ssh/id_ed25519" ];
  age.secrets.terraform-r2 = {
    file = ../../secrets/terraform-r2.age;
    owner = "kyoku";
  };
}
