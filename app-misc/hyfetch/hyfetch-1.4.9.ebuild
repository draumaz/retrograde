# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit distutils-r1

DESCRIPTION="Neofetch with LGBTQ+ pride flags!"
HOMEPAGE="https://github.com/hykilpikonna/hyfetch"
SRC_URI="https://github.com/hykilpikonna/hyfetch/archive/refs/tags/1.4.9.tar.gz"

KEYWORDS="~amd64 ~arm64 x86"
LICENSE="GPL-3"
SLOT="0"

PYTHON_COMPAT=(python3_{10..12})
