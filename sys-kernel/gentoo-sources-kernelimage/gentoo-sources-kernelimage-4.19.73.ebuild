# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="A 'genkernel all' kernel image compiled on gentoo-sources"
HOMEPAGE="https://www.gentoo.org"
SRC_URI="https://dev.gentoo.org/~ago/distfiles/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="-* ~amd64"
RDEPEND="sys-kernel/linux-firmware"
RESTRICT="strip"

pkg_setup() {
	if [[ ${MERGE_TYPE} != buildonly ]]
	then
		ewarn
		ewarn
		ewarn "If you have a separate BOOT partition, is highly recommended to configure a portage HOOK."
		ewarn "This is needed because the boot partition needs to be mounted and umounted."
		ewarn "You may also, want to configure your bootloader."
		ewarn "A valid example is available into /usr/share/doc/${PF}/bashrc.bz2"
		ewarn
		ewarn
	fi
}

src_install() {
	dodir /boot /lib/modules
	cp *genkernel* "${D}"/boot/ || die
	cp -r "${PV}"-gentoo "${D}"/lib/modules/ || die
	insinto /usr/share/doc/${PF}
	doins "${FILESDIR}"/bashrc
}
