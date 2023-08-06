# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A launcher for Minecraft focused on legacy versions of the game"
HOMEPAGE="https://github.com/betacraftuk/betacraft-launcher"
SRC_URI="https://github.com/betacraftuk/betacraft-launcher/archive/refs/tags/1.09_16.tar.gz"

S="${WORKDIR}/betacraft-launcher-1.09_16"

KEYWORDS="~amd64"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  sed -i 's/targetCompatibility = 5/targetCompatibility = 7/g' build.gradle
  sed -i 's/sourceCompatibility = 5/sourceCompatibility = 7/g' build.gradle
  sed -i 's/compile fileTree/implementation fileTree/g' build.gradle
  eapply_user
}

src_compile() {
  gradle jar -g gradle-user-home
}

src_install() {
  dobin "build/libs/BetaCraft-Launcher-Java.jar"
}
