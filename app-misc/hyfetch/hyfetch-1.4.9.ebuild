# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Neofetch with LGBTQ+ pride flags!"
HOMEPAGE="https://github.com/hykilpikonna/hyfetch"
SRC_URI="https://github.com/hykilpikonna/hyfetch/archive/refs/tags/1.4.9.tar.gz"

KEYWORDS="~amd64 ~arm64 x86"
LICENSE="GPL-3"
SLOT="0"

BDEPEND="dev-lang/python"

src_compile() {
  python3 ./setup.py build
}

src_install() {
  python3 ./setup.py install --root="${D}" --optimize=1 --skip-build
  install -Dm 644 ${PN}/scripts/autocomplete.bash "${D}"/usr/share/bash-completion/completions/${PN}
  install -Dm 644 ${PN}/scripts/autocomplete.zsh "${D}"/usr/share/zsh/site-functions/${PN}
}
