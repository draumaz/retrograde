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
  mkdir -v bin
  mv -v sillyutils.sh bin/sillyutils
  chmod -v +x bin/sillyutils
  cd bin
  for LINK in `cat sillyutils | \
    tr ' ' '\n' | \
    grep '()' | \
    tr '()' '\n' | \
    grep '[Aa-zZ]'`; do ln -sv sillyutils ${LINK}
  done
}

src_install() {
  dobin bin/*
  doman "${PN}.1"
}
