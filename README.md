# nix-conf
<hr>


```zsh
# Requires Nix with Flakes enabled.

git clone https://github.com/kyokuping/nix-conf.git
cd ~/nix-conf

# darwin(first migration)
sudo nixos-rebuild build --flake .#nixos
sudo nixos-rebuild boot --flake .#nixos

# darwin (subsequent changes)
sudo darwin-rebuild switch --flake .#kyoku-MacBookAir

# NixOS (first migration)
sudo nixos-rebuild build --flake .#nixos
sudo nixos-rebuild boot --flake .#nixos

# NixOS (subsequent changes)
sudo nixos-rebuild switch --flake .#nixos

# garbage collection (오래된 generation 및 미사용 store 정리)
sudo nix-collect-garbage -d
```
