# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A scrcpy wrapper imbued with QoL features"
HOMEPAGE="https://github.com/draumaz/aal"

# Define the Git repository and branch
EGIT_REPO_URI="https://github.com/draumaz/aal.git"
EGIT_BRANCH="main"

SLOT="0"

# Runtime dependencies
RDEPEND="app-shells/bash dev-util/android-tools app-mobilephone/scrcpy"

src_prepare() {
  default
  mv -v aal.sh aal
  chmod -v +x aal
}

src_install() {
  insinto "/usr/bin"
  dobin aal
}
