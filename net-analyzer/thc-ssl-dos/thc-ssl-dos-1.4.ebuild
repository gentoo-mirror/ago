# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit autotools

DESCRIPTION="Tool to DoS"
HOMEPAGE="http://www.thc.org"
SRC_URI="http://www.thc.org/${PN}/${P}.tar.gz"

SLOT="0"
KEYWORDS="~amd64 ~x86"
LICENSE="as-is"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"

src_prepare() {
	sed -i \
		-e "s: /usr/local/lib::" \
		-e "/CFLAGS/d" \
		configure.in || die

	eautoreconf
}
