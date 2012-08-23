# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit cmake-utils git-2

DESCRIPTION="A suite for man in the middle attacks and network mapping"
HOMEPAGE="http://ettercap.sourceforge.net/"
EGIT_REPO_URI="git://github.com/Ettercap/${PN}.git"
EGIT_BRANCH="${PN}_rc"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="gtk ipv6 ncurses plugins ssl"

RDEPEND="dev-libs/libpcre
	net-libs/libnet:1.1
	net-libs/libpcap
	sys-libs/zlib
	gtk? (
		dev-libs/atk
		dev-libs/glib:2
		media-libs/freetype
		x11-libs/cairo
		x11-libs/gdk-pixbuf:2
		x11-libs/gtk+:2
		x11-libs/pango
	)
	ncurses? ( sys-libs/ncurses )
	ssl? ( dev-libs/openssl )"
DEPEND="${RDEPEND}
	sys-devel/flex
	virtual/yacc"

src_prepare() {
	#ettercap defaults to using mozilla so let's try to use xdg-open and pray it works
	sed -i 's#mozilla -remote openurl(http://%host%url)#xdg-open 'http://%host%url'#' "${S}"/share/etter.conf || die
	cmake-utils_src_prepare
}

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_enable ncurses CURSES)
		$(cmake-utils_use_enable gtk)
		$(cmake-utils_use_enable ssl)
		$(cmake-utils_use_enable plugins)
		$(cmake-utils_use_enable ipv6)
	)
	cmake-utils_src_configure
}
