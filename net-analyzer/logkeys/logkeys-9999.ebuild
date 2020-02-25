# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools eutils git-r3

DESCRIPTION="a GNU/Linux keylogger that works!"
HOMEPAGE="https://code.google.com/p/logkeys/"
EGIT_REPO_URI="https://github.com/kernc/${PN}"

KEYWORDS=""
IUSE=""
LICENSE="GPL-3"
SLOT="0"

DEPEND=""
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}/cxxflags.patch"
	eautoreconf
}

src_install() {
	default

	newinitd "${FILESDIR}/${PN}-init.d" ${PN}
	newconfd "${FILESDIR}/${PN}-conf.d" ${PN}
}
