# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DEPEND="x11-libs/libXScrnSaver"

DESCRIPTION="GB Studio"
HOMEPAGE="https://github.com/chrismaltby/gb-studio"
SRC_URI="https://github.com/chrismaltby/gb-studio/releases/download/v3.1.0/gb-studio-linux-debian.deb"

S="${WORKDIR}"

KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

src_install() {
  tar -xpvf "${S}/data.tar.xz" -C "${D}"
}
