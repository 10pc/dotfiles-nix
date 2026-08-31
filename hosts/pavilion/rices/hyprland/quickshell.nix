{ pkgs, quickshell, ... }:
pkgs.stdenv.mkDerivation {
  name = "quickshell-wrapper";
  meta = with pkgs.lib; {
    description = "Quickshell with Qt deps";
    license = licenses.gpl3Only;
  };

  dontUnpack = true;
  dontConfigure = true;
  dontBuild = true;

  nativeBuildInputs = [
    pkgs.makeWrapper
    pkgs.qt6.wrapQtAppsHook
  ];

  buildInputs = with pkgs; [
    quickshell
    kdePackages.qtwayland
    kdePackages.qtpositioning
    kdePackages.qtlocation
    kdePackages.syntax-highlighting
    gsettings-desktop-schemas
    qt6.qtbase
    qt6.qtdeclarative
    qt6.qt5compat
    qt6.qtimageformats
    qt6.qtmultimedia
    qt6.qtpositioning
    qt6.qtquicktimeline
    qt6.qtsensors
    qt6.qtsvg
    qt6.qttools
    qt6.qttranslations
    qt6.qtvirtualkeyboard
    qt6.qtwayland
    kdePackages.kirigami
    kdePackages.kdialog
    vulkan-headers
    libdrm
    cpptrace
    jemalloc
    mesa
  ];

  installPhase = ''
    mkdir -p $out/bin
    makeWrapper ${quickshell}/bin/qs $out/bin/qs \
      --prefix XDG_DATA_DIRS : ${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}
    chmod +x $out/bin/qs
  '';
}
