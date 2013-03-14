# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit autotools git-2

DESCRIPTION="A lightweight program that monitors the file system activity"
HOMEPAGE="https://github.com/joebew42/cwatch"
EGIT_REPO_URI="https://github.com/joebew42/${PN}.git"
EGIT_BRANCH="1.0experimental"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND=""

src_prepare() {
	eautoreconf
}
