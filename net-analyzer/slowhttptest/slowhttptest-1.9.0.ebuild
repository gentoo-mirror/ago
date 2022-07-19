# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=8

DESCRIPTION="Application Layer DoS attack simulator"
HOMEPAGE="http://code.google.com/p/slowhttptest"
SRC_URI="https://github.com/shekyan/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-libs/openssl"
RDEPEND="${DEPEND}"
