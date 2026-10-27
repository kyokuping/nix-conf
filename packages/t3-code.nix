{ appimageTools, fetchurl, lib, makeDesktopItem }:
let
  pname = "t3-code";
  version = "0.1.3";
  src = fetchurl {
    url = "https://github.com/pingdotgg/t3code/releases/download/v${version}/T3-Code-${version}-x86_64.AppImage";
    sha256 = "801cce482d2085da1bfba1d0e301c0a2d75a7c8d0efd24865c2261948342df21";
  };
  desktop = makeDesktopItem {
    name = pname;
    desktopName = "T3 Code";
    exec = "${pname} --ozone-platform=wayland --enable-wayland-ime";
    icon = "applications-development";
    categories = [ "Development" ];
  };
in
appimageTools.wrapType2 {
  inherit pname version src;
  extraInstallCommands = ''
    install -Dm444 ${desktop}/share/applications/${pname}.desktop \
      "$out/share/applications/${pname}.desktop"
  '';
  meta = {
    description = "T3 Code desktop, official Linux AppImage";
    homepage = "https://t3.codes";
    license = lib.licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
