{ buildFHSEnv, fetchurl, lib }:
let
  version = "18.13.1";
  binary = fetchurl {
    url = "https://github.com/can1357/oh-my-pi/releases/download/v${version}/omp-linux-x64";
    sha256 = "ee2961c7da02e514a2475ee958c2fd85dbabf4d0907949ba5022edb2951f84b5";
    executable = true;
  };
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
  runScript = binary;
  meta = {
    description = "Oh My Pi coding agent, official stable Linux binary";
    homepage = "https://omp.sh";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "omp";
  };
}
