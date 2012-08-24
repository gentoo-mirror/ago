# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

WANT_AUTOMAKE="1.10"

inherit autotools

DESCRIPTION="foo"
HOMEPAGE="https://code.google.com/p/bonesi/"
SRC_URI="https://${PN}.googlecode.com/files/${P}.tar.gz"
KEYWORDS="amd64"

LICENSE="Apache-2.0"
IUSE=""
SLOT="0"

DEPEND="net-libs/libnet
	net-libs/libpcap"
RDEPEND="${DEPEND}"

src_prepare() {
	eautoreconf
}
