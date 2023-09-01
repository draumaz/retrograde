# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="A violent, sexy, multiplayer first person shooter based on the ioquake3 engine"
HOMEPAGE="http://openarena.ws"
SRC_URI="http://download.tuxfamily.org/openarena/rel/088/openarena-0.8.8.zip https://github.com/OpenArena/legacy/archive/refs/heads/master.zip"

S="${WORKDIR}"

OA_BINDIR="${S}/openarena-0.8.8"
OA_SRCDIR="${S}/legacy-master"

DEPEND="media-libs/libvorbis media-libs/libsdl net-misc/curl"

IUSE="doc"

KEYWORDS="~amd64"
LICENSE="GPL"
SLOT="0"

src_prepare() {
  default
  cd "${OA_BINDIR}"
  rm -rfv *.dll *.exe *.app __MACOSX
}

src_compile() {
  cd "${OA_SRCDIR}/engine/openarena-engine-source-0.8.8"
  emake
}

src_install() {
  cd "${OA_SRCDIR}/engine/openarena-engine-source-0.8.8"
  COPYDIR="${D}/opt/openarena" emake copyfiles

  mkdir -pv "${D}/opt" "${D}/usr/share/pixmaps" "${D}/usr/share/applications" "${D}/usr/bin"

  if use doc; then
    for DOCS in CHANGES COPYING CREDITS LINUXNOTES README WENEED; do
	  dodoc "${OA_BINDIR}/${DOCS}" ${OA_BINDIR}/readme_*
	done
  fi
  
  cp -rv ${OA_BINDIR}/{baseoa,missionpack} "${D}/opt/openarena/"

  for FILE in oa_ded openarena; do
    mv -v ${D}/opt/openarena/${FILE}.{amd64,x86_64}
  done

  doman ${FILESDIR}/doc/*.6

  # Adapted from Mark Vainomaa's PKGBUILD
  # https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=openarena

  install -Dm 644 "${FILESDIR}/img/openarena.png" "${D}/usr/share/pixmaps/"
  install -Dm 644 "${FILESDIR}/img/openarena-server.png" "${D}/usr/share/pixmaps/"
  install -Dm 644 "${FILESDIR}/desktop/openarena.desktop" "${D}/usr/share/applications/"
  install -Dm 644 "${FILESDIR}/desktop/openarena-server.desktop" "${D}/usr/share/applications/"

  install -Dm 755 "${FILESDIR}/openarena-runner.sh" "${D}/opt/openarena/openarena-runner.sh"

  for LINK in openarena{,-server}; do
    ln -sv "/opt/openarena/openarena-runner.sh" ${D}/usr/bin/${LINK}
  done
}
