# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a symlink, doas -> sudo"
HOMEPAGE="https://github.com/Duncaen/OpenDoas"

S="${WORKDIR}"

DEPENDS="app-admin/doas !app-admin/sudo"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
  ln -s doas sudo
}

src_install() {
  insinto "/usr/bin"
  doins sudo
}

