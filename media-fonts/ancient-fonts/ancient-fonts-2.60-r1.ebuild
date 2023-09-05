# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Unicode Fonts for Ancient Scripts"
HOMEPAGE="https://dn-works.com/ufas"
SRC_URI="https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/ttf-ancient-fonts/2.60-1.1/ttf-ancient-fonts_2.60.orig.tar.xz"

FONT_SUFFIX="otf ttf"

S="${WORKDIR}/ttf-ancient-fonts-${PV}.orig"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
