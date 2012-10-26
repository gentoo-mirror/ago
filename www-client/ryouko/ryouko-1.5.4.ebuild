# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils-r1

DESCRIPTION="PyQt4 web browser"
HOMEPAGE="https://github.com/foxhead128/ryouko"
SRC_URI="mirror://github/foxhead128/${PN}/${P}.tar.gz"
SLOT="0"
LICENSE="MIT"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND=">=dev-python/PyQt4-4.8.0"

PATCHES=( "${FILESDIR}"/setup.py.patch )
