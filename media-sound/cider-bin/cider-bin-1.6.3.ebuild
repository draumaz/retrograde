# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A new cross-platform Apple Music experience based on Electron and Vue.js written from scratch with performance in mind"
HOMEPAGE="https://cider.sh"
SRC_URI="https://github.com/ciderapp/Cider/releases/download/v1.6.3/cider_${PVR}_amd64.deb"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}"

src_install() {
  tar -xpvf "${S}/data.tar.xz" -C "${D}"

  mkdir -p "${D}/usr/bin"
  ln -sv "/opt/Cider/cider" "${D}/usr/bin/cider"
}
