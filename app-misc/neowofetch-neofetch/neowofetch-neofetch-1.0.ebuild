# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="a symlink, neofetch -> neowofetch"
HOMEPAGE="https://github.com/hykilpikonna/hyfetch"

DEPEND="app-misc/hyfetch !!app-misc/neofetch"

S="${WORKDIR}"

LICENSE="ISC"
KEYWORDS="~amd64"
SLOT="0"

src_compile() {
  ln -s neowofetch neofetch
}

src_install() {
  insinto "/usr/bin"
  doins neofetch
}

