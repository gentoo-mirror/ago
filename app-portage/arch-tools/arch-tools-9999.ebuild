# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit git-2

HOMEPAGE="http://git.overlays.gentoo.org/gitweb/?p=proj/arch-tools.git"
DESCRIPTION="Set of utilities to automate workflow of arch developers"
EGIT_REPO_URI="git://git.overlays.gentoo.org/proj/${PN}.git"
EGIT_BRANCH="master"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="${DEPEND}
	app-portage/gentoolkit-dev
	>=www-client/pybugz-0.10"

src_install () {
	for i in *.py;do newbin ${i} ${i/.py/};done
}
