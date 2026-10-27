{ appimageTools, fetchurl, lib, makeDesktopItem }:
let
  pname = "zen-browser";
  version = "1.23.4b";
  src = fetchurl {
    url = "https://github.com/zen-browser/desktop/releases/download/${version}/zen-x86_64.AppImage";
    sha256 = "0acae554219848792e7f463af7b31aa118e40c44a1e33698b6119e71ba4fecb6";
  };
  desktop = makeDesktopItem {
    name = pname;
    desktopName = "Zen Browser";
    genericName = "Web Browser";
    exec = "${pname} %U";
    icon = "web-browser";
    categories = [ "Network" "WebBrowser" ];
    mimeTypes = [ "text/html" "x-scheme-handler/http" "x-scheme-handler/https" ];
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  profile = ''
    export MOZ_ENABLE_WAYLAND=1
    # Use the compositor's text-input protocol inside the FHS environment.
    unset GTK_IM_MODULE QT_IM_MODULE
  '';
  extraInstallCommands = ''
    install -Dm444 ${desktop}/share/applications/${pname}.desktop \
      "$out/share/applications/${pname}.desktop"
  '';
  meta = {
    description = "Zen browser, official stable-channel Linux AppImage";
    homepage = "https://zen-browser.app";
    license = lib.licenses.mpl20;
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
