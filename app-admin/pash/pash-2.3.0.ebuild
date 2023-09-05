# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="🔒 A simple password manager using GPG written in POSIX sh."
HOMEPAGE="https://github.com/dylanaraps/pash"
SRC_URI="https://github.com/dylanaraps/pash/archive/refs/tags/${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

src_install() {
  dobin "${PN}"
}
