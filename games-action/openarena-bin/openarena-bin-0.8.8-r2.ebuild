# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Adapted from Mark Vainomaa's PKGBUILD
# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=openarena

EAPI=8

DESCRIPTION="A violent, sexy, multiplayer first person shooter based on the ioquake3 engine"
HOMEPAGE="http://openarena.ws"
SRC_URI="http://download.tuxfamily.org/openarena/rel/088/openarena-0.8.8.zip"

S="${WORKDIR}/openarena-0.8.8"

DEPEND="media-libs/libvorbis media-libs/libsdl net-misc/curl"

IUSE="doc"

KEYWORDS="~amd64 x86"
LICENSE="GPL"
SLOT="0"

src_prepare() {
  default
  rm -rfv *.dll *.exe *.app __MACOSX
}

src_install() {
  mkdir -pv "${D}/opt" "${D}/usr/share/pixmaps" "${D}/usr/share/applications" "${D}/usr/bin"

  mv -v "${S}" "${D}/opt/openarena"

  if use doc; then
    dodoc CHANGES COPYING CREDITS LINUXNOTES README WENEED
  fi

  find "${D}/opt/openarena" -type f -exec chmod 644 {} \;
  find "${D}/opt/openarena" -type d -exec chmod 755 {} \;
  chmod 755 ${D}/opt/openarena/*.i386 ${D}/opt/openarena/*.x86_64

  install -Dm 644 "${FILESDIR}/openarena.png" "${D}/usr/share/pixmaps/"
  install -Dm 644 "${FILESDIR}/openarena-server.png" "${D}/usr/share/pixmaps/"
  install -Dm 644 "${FILESDIR}/openarena.desktop" "${D}/usr/share/applications/"
  install -Dm 644 "${FILESDIR}/openarena-server.desktop" "${D}/usr/share/applications/"

  doman "${FILESDIR}/openarena.6"

  install -Dm 755 "${FILESDIR}/openarena-runner.sh" "${D}/opt/openarena/openarena-runner.sh"

  ln -sv "/opt/openarena/openarena-runner.sh" "${D}/usr/bin/openarena"
  ln -sv "/opt/openarena/openarena-runner.sh" "${D}/usr/bin/openarena-server"
}
