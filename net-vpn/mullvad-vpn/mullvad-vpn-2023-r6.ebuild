# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Free the internet from mass surveillance"
HOMEPAGE="https://mullvad.net"
SRC_URI="https://mullvad.net/media/app/MullvadVPN-2023.6_amd64.deb"

S="${WORKDIR}"

KEYWORDS="~amd64"
LICENSE=""
SLOT="0"

IUSE="bash-completion elogind fish-completion systemd zsh-completion"

src_install() {
  tar -xpvf "${S}/data.tar.xz" -C "${D}"

  if not use systemd; then
    rm -rf "${D}/usr/lib"
  fi

  if not use bash-completion; then
    rm -rf "${D}/usr/share/bash-completion"
  fi

  if not use zsh-completion; then
    rm -rf "${D}/usr/local/share/zsh"
  fi
  
  if not use fish-completion; then
    rm -rf "${D}/usr/share/fish"

  fi
}
