# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A launcher for Minecraft focused on legacy versions of the game"
HOMEPAGE="https://github.com/betacraftuk/betacraft-launcher"
SRC_URI="https://github.com/betacraftuk/betacraft-launcher/archive/refs/tags/1.09_16.tar.gz"

S="${WORKDIR}/betacraft-launcher-1.09_16"

DEPEND="=openjdk-bin-8.362_p09 dev-java/gradle-bin"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  # patch build.gradle syntax to allow modern gradle-bin to parse
  sed -i 's/targetCompatibility = 5/targetCompatibility = 7/g' build.gradle
  sed -i 's/sourceCompatibility = 5/sourceCompatibility = 7/g' build.gradle
  sed -i 's/compile fileTree/implementation fileTree/g' build.gradle

  cp -vf "${FILESDIR}/betacraft-launcher.sh" "${WORKDIR}/betacraft-launcher"
  cp -vf "${FILESDIR}/uk.betacraft.betacraftlauncher.desktop" "${WORKDIR}/uk.betacraft.betacraftlauncher.desktop"
  chmod -v +x "${WORKDIR}/betacraft-launcher"

  eapply_user
}

src_compile() {
  gradle jar -g gradle-user-home
}

src_install() {
  #TODO replace these with install -dm755 shenanigans
  mkdir -pv "${D}/usr/bin"
  mkdir -pv "${D}/usr/share/applications"
  mkdir -pv "${D}/usr/share/betacraft"
  cp -vf "build/libs/BetaCraft-Launcher-Java.jar" "${D}/usr/share/betacraft/"
  cp -vf "${WORKDIR}/betacraft-launcher" "${D}/usr/bin/"
  cp -vf "${WORKDIR}/uk.betacraft.betacraftlauncher.desktop" "${D}/usr/share/applications/"
}
