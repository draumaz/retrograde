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

src_prepare() {
  default
  mv -v "./linkie.sh" "./linkie"
  chmod -v +x "./linkie"
}

src_install() {
  dobin "${PN}"
  doman "${PN}.1"

  if use gnome; then
    insinto "/usr/bin"

    ln -sv "${PN}" "g${PN}"
    ln -sv "${PN}.1" "g${PN}.1"
    doins "g${PN}"
    doman "g${PN}.1"
  fi
}
