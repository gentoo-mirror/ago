# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

WANT_AUTOMAKE="1.10"

inherit autotools

DESCRIPTION="foo"
HOMEPAGE="https://code.google.com/p/bonesi/"
SRC_URI="https://${PN}.googlecode.com/files/${P}.tar.gz"
KEYWORDS="~amd64 ~x86"

LICENSE="Apache-2.0"
IUSE=""
SLOT="0"

DEPEND="net-libs/libnet
	net-libs/libpcap"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
