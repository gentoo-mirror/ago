# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

inherit autotools

DESCRIPTION="Tool to DoS"
HOMEPAGE="http://www.thc.org"
SRC_URI="https://gitlab.com/kalilinux/packages/${PN}/-/archive/upstream/${PV}/${PN}-upstream-${PV}.tar.gz"

SLOT="0"
KEYWORDS="~amd64"
LICENSE="GPL-2+"
IUSE=""
S="${WORKDIR}/${PN}-upstream-${PV}"

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s: /usr/local/lib::" \
		-e "/CFLAGS/d" \
		configure.in || die

	eautoreconf
	default
}
