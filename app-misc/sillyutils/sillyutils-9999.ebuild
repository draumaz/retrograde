# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3

DESCRIPTION="A collection of silly shell utilities from the retrograde project"
HOMEPAGE="https://github.com/draumaz/retrograde"

# 9999 ebuilds are inherently unstable and pull directly from Git.
# KEYWORDS are typically omitted or set to ~* for such ebuilds.
# We'll omit them here as it's common practice for live ebuilds.

# Remove mirror and fetch restrictions as we're pulling directly from Git.
RESTRICT=""

# Define the Git repository and branch
EGIT_REPO_URI="https://github.com/draumaz/sillyutils.git"
EGIT_BRANCH="main"

SLOT="0"

# The S variable defines the source directory after git-r3.eclass clones the repo.
# By default, git-r3 will clone into ${WORKDIR}/${PN}, but since the repo name
# is 'retrograde', we'll explicitly set S to match the cloned directory.

# Runtime dependencies
RDEPEND="
	app-shells/bash
"

src_prepare() {
  default
  distrib/make_distrib
}

src_install() {
  cd build
  insinto "/usr/bin"
  dobin bin/sillyutils
  find man/ -name "*.1" | xargs doman
  find bin/ -type l | xargs doins
}
