# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a symlink manager for files inside of ~/.config."
HOMEPAGE="https://github.com/draumaz/linkie"
SRC_URI="https://github.com/draumaz/linkie/archive/refs/tags/1.0.tar.gz"

S="${WORKDIR}/linkie-main"

KEYWORDS="~amd64 ~arm64 x86"
LICENSE="MIT"
SLOT="0"

src_install() {
  dobin "${PN}"
}
