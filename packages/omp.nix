{ buildFHSEnv, fetchurl, lib, runCommand }:
let
  version = "18.13.1";
  download = fetchurl {
    url = "https://github.com/can1357/oh-my-pi/releases/download/v${version}/omp-linux-x64";
    sha256 = "ee2961c7da02e514a2475ee958c2fd85dbabf4d0907949ba5022edb2951f84b5";
  };
  # executable=true in fetchurl switches verification to a recursive NAR
  # hash. Verify the upstream file digest first, then set its executable bit.
  binary = runCommand "omp-${version}-binary" { } ''
    install -Dm755 ${download} "$out/bin/omp"
  '';
in
buildFHSEnv {
  pname = "omp";
  inherit version;
  # The Bun executable embeds native addons. Give both the executable and
  # extracted addons standard library paths without rewriting the Bun ELF.
  targetPkgs = pkgs: with pkgs; [
    stdenv.cc.cc.lib
    zlib
    openssl
    alsa-lib
    libpulseaudio
    ripgrep
    git
    cacert
  ] ++ lib.optional (pkgs.stdenv.cc.cc ? libgcc) pkgs.stdenv.cc.cc.libgcc;
  runScript = "${binary}/bin/omp";
  meta = {
    description = "Oh My Pi coding agent, official stable Linux binary";
    homepage = "https://omp.sh";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "omp";
  };
}
