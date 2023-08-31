# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="sillyutils."
HOMEPAGE="https://github.com/draumaz/sillyutils"
SRC_URI="https://github.com/draumaz/sillyutils/archive/refs/tags/${PVR}.zip"

S="${WORKDIR}/sillyutils-${PVR}"

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~x64-macos"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  default
  cp -v sillyutils.sh sillyutils
  chmod -v +x sillyutils
  sh tools/distrib.sh
}

src_install() {
  dobin "${PN}"
  doman "${PN}.1"
  insinto "/usr/bin"
  doins bin/* 
}
