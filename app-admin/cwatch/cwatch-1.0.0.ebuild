# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools

DESCRIPTION="A lightweight program that monitors the file system activity"
HOMEPAGE="https://github.com/joebew42/cwatch"
SRC_URI="https://github.com/joebew42/${PN}/archive/v${PV}-experimental.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

S="${WORKDIR}/${P}-experimental"

src_prepare() {
	eautoreconf
}
