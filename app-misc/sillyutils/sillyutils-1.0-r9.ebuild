# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="like coreutils but extremely silly"
HOMEPAGE="https://github.com/draumaz/sillyutils"
SRC_URI="https://github.com/draumaz/sillyutils/archive/refs/tags/${PVR}.tar.gz"

S="${WORKDIR}/sillyutils-${PVR}"

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~x64-macos"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  default
  distrib/make_distrib
}

src_install() {
  cd build
  insinto "/usr/bin"
  dobin bin/sillyutils
  find man/ -name "*.1" | xargs doman
  find bin/ -type l | xargs doins
}
