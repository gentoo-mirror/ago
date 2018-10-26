# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# See https://blogs.gentoo.org/ago/2017/08/21/sys-kernel-grsecurity-sources-available

EAPI="6"

ETYPE="sources"
K_GENPATCHES_VER="not-empty" # Set to not-empty to avoid the useless download of patch-*.xz

inherit kernel-2
detect_version
detect_arch

GRSECURITY_URI="https://dev.gentoo.org/~ago/distfiles/${PN}/${PN}-extras-${PV}.tar.xz"
SRC_URI="${KERNEL_URI} ${GRSECURITY_URI} ${ARCH_URI}"

UNIPATCH_LIST="${DISTDIR}/${PN}-extras-${PV}.tar.xz"

DESCRIPTION="Unofficial port of the last public grsecurity patch plus Gentoo patchset"
HOMEPAGE="https://github.com/minipli/linux-unofficial_grsec"
IUSE="deblob"
KEYWORDS="-* ~amd64"
RDEPEND=">=sys-devel/gcc-4.5"

src_unpack() {
	ewarn
	ewarn "THIS IS JUST A WAY TO INFORM YOU THAT YOU CAN LOOK AT THE dappersec-sources PACKAGE"
	ewarn "FROM: https://github.com/dapperlinux/dapper-secure-kernel-patchset-stable/releases:"
	ewarn
	ewarn "WARNING: Meltdown and Spectre fixes have been OMITTED from this patchset."
	ewarn "Reptoline is also OMITTED. This patchset works with all other fixes included at this patchlevel."
	ewarn "If you are not comfortable with being vulnerable to meltdown and spectre, then use an upstream kernel."
	ewarn "If you are still using the 4.9.74 patchset or later, and still wish to get the latest fixes, then use this patchset."
	ewarn "Meltdown and Spectre fixes are proving to be extremely difficult to get this patchset booting."
	ewarn "There might be a small chance that they will be included in the future, and I will let you know."
	ewarn "Until then, assume that it will be months / years / never."
	ewarn

	die
}

pkg_postinst() {
	kernel-2_pkg_postinst

	local GRADM_COMPAT="sys-apps/gradm-3.1*"

	ewarn
	ewarn "Users of grsecurity's RBAC system must ensure they are using"
	ewarn "${GRADM_COMPAT}, which is compatible with ${PF}."
	ewarn "It is strongly recommended that the following command is issued"
	ewarn "prior to booting a ${PF} kernel for the first time:"
	ewarn
	ewarn "emerge -na =${GRADM_COMPAT}"
	ewarn
}