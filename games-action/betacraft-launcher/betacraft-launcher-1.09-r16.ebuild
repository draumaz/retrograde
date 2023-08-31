# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A launcher for Minecraft focused on legacy versions of the game"
HOMEPAGE="https://github.com/betacraftuk/betacraft-launcher"
SRC_URI="https://github.com/betacraftuk/betacraft-launcher/archive/refs/tags/1.09_16.tar.gz"

S="${WORKDIR}/betacraft-launcher-1.09_16"

DEPEND="=dev-java/openjdk-bin-8.362_p09 dev-java/gradle-bin"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  default
  for SUBST in \
    's/targetCompatibility = 5/targetCompatibility = 7/g' \
    's/sourceCompatibility = 5/sourceCompatibility = 7/g' \
    's/compile fileTree/implementation fileTree/g'; do
      sed -i "${SUBST}" build.gradle
  done
  cp -vf "${FILESDIR}/betacraft-launcher.sh" "${WORKDIR}/betacraft-launcher"
  cp -vf "${FILESDIR}/uk.betacraft.betacraftlauncher.desktop" "${WORKDIR}/uk.betacraft.betacraftlauncher.desktop"
  chmod -v +x "${WORKDIR}/betacraft-launcher"
  ls ${WORKDIR}
}

src_compile() {
  gradle jar -g gradle-user-home
}

src_install() {
  for DIR in "${D}/usr/bin" "${D}/usr/share/applications" \
    "${D}/usr/share/icons/hicolor/256x256/apps" "${D}/usr/share/betacraft"; do
      mkdir -pv "${DIR}"
  done
  cp -vf "build/libs/BetaCraft-Launcher-Java.jar" "${D}/usr/share/betacraft/"
  cp -vf "${WORKDIR}/betacraft-launcher" "${D}/usr/bin/"
  cp -vf "${WORKDIR}/uk.betacraft.betacraftlauncher.desktop" "${D}/usr/share/applications/"
  cp -vf "${S}/src/main/resources/icons/icon.png" "${D}/usr/share/icons/hicolor/256x256/apps/uk.betacraft.betacraftlauncher.png"
}
