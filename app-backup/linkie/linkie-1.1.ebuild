# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="symlink everything from \$LINKIE_REPO into \$LINKIE_PATH."
HOMEPAGE="https://github.com/draumaz/linkie"
SRC_URI="https://github.com/draumaz/linkie/archive/refs/tags/1.1.tar.gz"

KEYWORDS="~amd64 ~arm64 x86"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  default
  mv -v "./linkie.sh" "./linkie"
  chmod -v +x "./linkie"
}

src_install() {
  dobin "${PN}"
  doman "${PN}.1"
}
