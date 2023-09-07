# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="symlink everything from \$LINKIE_REPO into \$LINKIE_PATH."
HOMEPAGE="https://github.com/draumaz/linkie"
SRC_URI="https://github.com/draumaz/linkie/archive/refs/tags/${PVR}.tar.gz"

KEYWORDS="~amd64 ~arm64 x86"
LICENSE="GPL-3"
SLOT="0"

IUSE="gnome"

src_compile() {
  default
  if use gnome; then
    mv -v "./g${PN}.sh" "./g${PN}"
	mv -v "./${PN}.1" "./g${PN}.1"
	chmod -v +x "./g${PN}"
  else
    mv -v "./${PN}.sh" "./${PN}"
	chmod -v +x "./${PN}"
  fi
}

src_install() {
  if use gnome; then
    dobin "g${PN}"
    doman "g${PN}.1"
  else
    dobin "${PN}"
	doman "${PN}.1"
  fi
}
