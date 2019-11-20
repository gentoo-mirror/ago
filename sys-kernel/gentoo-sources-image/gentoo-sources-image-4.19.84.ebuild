# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit mount-boot

DESCRIPTION="A 'genkernel all' kernel image compiled on gentoo-sources"
HOMEPAGE="https://www.gentoo.org"
SRC_URI="https://dev.gentoo.org/~ago/distfiles/${PN}/${P}.tar.xz"

LICENSE="GPL-2"
SLOT="${PVR}"
KEYWORDS="-* ~amd64"
RDEPEND="sys-kernel/linux-firmware"
RESTRICT="binchecks strip"

pkg_setup() {
	if [[ ${MERGE_TYPE} != buildonly ]]
	then
		ewarn
		ewarn
		ewarn "You may want to configure your bootloader by setting a portage HOOK (/etc/portage/bashrc)."
		ewarn "A valid example is available into /usr/share/doc/${PF}/bashrc.bz2"
		ewarn
		ewarn
	fi
}

src_install() {
	insinto /boot
	doins *genkernel*

	rm "${PV}"-"${PN}"/{build,source} || die

	insinto /lib/modules
	doins -r "${PV}"-"${PN}"

	insinto /usr/share/doc/"${PF}"
	doins "${FILESDIR}"/bashrc
}
