# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

PYTHON_COMPAT=( python{2_5,2_6,2_7} )
PYTHON_REQ_USE="tk"

inherit distutils-r1

DESCRIPTION="PyQt4 web browser"
HOMEPAGE="https://github.com/foxhead128/ryouko"
SRC_URI="mirror://github/foxhead128/${PN}/${P}.tar.gz"
SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/PyQt4-4.8.0"

PATCHES=( "${FILESDIR}"/setup.py.patch )

src_install() {
	distutils-r1_src_install
	doicon "${FILESDIR}"/${PN}.png
	domenu "${FILESDIR}"/${PN}.desktop
}
