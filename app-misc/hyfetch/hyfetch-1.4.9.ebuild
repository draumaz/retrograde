# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=(python3_{10..12})

DESCRIPTION="Neofetch with LGBTQ+ pride flags!"
HOMEPAGE="https://github.com/hykilpikonna/hyfetch"
SRC_URI="https://github.com/hykilpikonna/hyfetch/archive/refs/tags/${PV}.tar.gz"

KEYWORDS="~amd64 ~arm64 x86"
LICENSE="MIT"
SLOT="0"

inherit distutils-r1
