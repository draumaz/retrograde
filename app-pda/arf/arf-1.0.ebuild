# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="an Android ROM flasher"
HOMEPAGE="https://github.com/draumaz/arf"
SRC_URI="https://github.com/draumaz/arf/archive/refs/tags/${PVR}.tar.gz"

S="${WORKDIR}/arf-${PVR}"

DEPEND="dev-util/android-tools app-arch/unzip"
# payload-dumper-go also but i need to make a new build for that

KEYWORDS="~alpha amd64 arm arm64 hppa ~ia64 ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~amd64-linux ~x86-linux ~arm64-macos ~x64-macos"
LICENSE="GPL-3"
SLOT="0"

src_prepare() {
  default
  distrib/make_distrib
}

src_install() {
  mv -v arf.sh arf
  chmod +x arf
  insinto "/usr/bin"
  dobin arf
}
