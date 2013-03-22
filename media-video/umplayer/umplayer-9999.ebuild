# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit qt4-r2 subversion

DESCRIPTION="A qt-based ross-platform multimedia player"
HOMEPAGE="http://www.umplayer.com/"
ESVN_REPO_URI="https://${PN}.svn.sourceforge.net/svnroot/${PN}/${PN}/trunk"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="dev-qt/qtcore:4
	dev-qt/qtgui:4
	sys-libs/zlib"
DEPEND="${RDEPEND}
	dev-libs/glib:2
	dev-qt/qtxmlpatterns:4"

src_prepare() {
	eqmake4 src/${PN}.pro
}

src_install() {
	dobin ${PN}
}
