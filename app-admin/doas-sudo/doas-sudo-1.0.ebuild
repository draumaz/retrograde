# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION=""
HOMEPAGE=""

S="${WORKDIR}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

src_compile() {
  ln -s sudo doas
}

src_install() {
  insinto "/usr/bin"
  doins doas
}

