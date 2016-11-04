# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit toolchain-funcs

DESCRIPTION="A loop-avoiding distance-vector routing protocol"
HOMEPAGE="http://www.pps.univ-paris-diderot.fr/~jch/software/babel/"
SRC_URI="http://www.pps.univ-paris-diderot.fr/~jch/software/files/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE=""
LICENSE="GPL-2"
SLOT="0"

DEPEND=""
RDEPEND=""

src_compile() {
	emake \
		CC="$(tc-getCC)" \
		CFLAGS="${CFLAGS}"
}

src_install() {
	dosbin ${PN}
}
