final: prev:
let
  source = builtins.fetchTarball {
    url = "https://github.com/Riey/kime/archive/2539caf368cf7a5a4a13ccaced3acf61f6a9ba42.tar.gz";
    sha256 = "sha256-YQQ27pSyuznqOI5o5oqLQIdUPqnrw8UTmD65KL9su3c=";
  };
in
{
  kime = (import (source + "/default.nix") {
    pkgs = prev // { xorg = { libxcb = prev.libxcb; }; };
    qt5 = false;
    qt6 = true;
  }).overrideAttrs (old: {
    pname = "kime";
    name = "kime-3.2.0";
    version = "3.2.0";
    __intentionallyOverridingVersion = true;
    cargoDeps = prev.rustPlatform.fetchCargoVendor {
      inherit (old) src;
      hash = "sha256-FP7uHsLVozB6kpwCuNFrYY2j6RQUL6n41hfvlFN5/qI=";
    };
    nativeBuildInputs = old.nativeBuildInputs ++ [ prev.autoPatchelfHook ];
    runtimeDependencies = (old.runtimeDependencies or []) ++ [ (prev.lib.getLib prev.wayland) ];
    postPatch = (old.postPatch or "") + ''
      substituteInPlace res/kime.desktop \
        --replace-fail /usr/bin/kime-xdg-autostart "$out/bin/kime"
      substituteInPlace res/kime-xdg-autostart \
        --replace-fail /usr/bin/kime "$out/bin/kime" \
        --replace-fail '"#@"' '"$@"'
    '';
    installPhase = ''
      runHook preInstall
      ${old.installPhase}
      runHook postInstall
    '';
    postInstall = (old.postInstall or "") + ''
      mv "$out/lib/gtk-3.0/3.0.0/immodules/libim-kime.so" \
        "$out/lib/gtk-3.0/3.0.0/immodules/im-kime.so"
    '';
    doInstallCheck = true;
    installCheckPhase = ''
      runHook preInstallCheck
      "$out/bin/kime" --version | head -n1 | grep -Fx 'kime 3.2.0'
      test -f "$out/lib/qt-6/plugins/platforminputcontexts/libkimeplatforminputcontextplugin.so"
      test -f "$out/lib/gtk-3.0/3.0.0/immodules/im-kime.so"
      case "$(${prev.patchelf}/bin/patchelf --print-rpath "$out/bin/kime-wayland")" in
        *"${prev.lib.getLib prev.wayland}/lib"*) ;;
        *) echo "kime-wayland is missing its Wayland runtime library" >&2; exit 1 ;;
      esac
      runHook postInstallCheck
    '';
  });
}
