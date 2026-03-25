# nix-conf
<hr>


```zsh
# Requires Nix with Flakes enabled.

git clone https://github.com/kyokuping/nix-conf.git
cd ~/nix-conf

# darwin
sudo -E darwin-rebuild switch --flake .#kyoku-MacBookAir --impure
```
