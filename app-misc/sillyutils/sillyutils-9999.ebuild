# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A collection of silly shell utilities from the retrograde project"
HOMEPAGE="https://github.com/draumaz/retrograde"

# Define the Git repository and branch
EGIT_REPO_URI="https://github.com/draumaz/sillyutils.git"
EGIT_BRANCH="main"

SLOT="0"

# Runtime dependencies
RDEPEND="app-shells/bash"

src_prepare() {
  default
  distrib/make_distrib
}

src_install() {
  insinto "/usr/bin"
  find build/bin/ -type f | xargs dobin
}
