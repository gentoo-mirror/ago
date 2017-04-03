# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python3_4 python3_5 python3_6 )

inherit git-2 python-r1

HOMEPAGE="https://gitweb.gentoo.org/proj/arch-tools.git"
DESCRIPTION="Set of utilities to automate workflow of arch developers"
EGIT_REPO_URI="git://anongit.gentoo.org/proj/${PN}.git"
EGIT_BRANCH="master"

LICENSE="GPL-2"
KEYWORDS=""
SLOT="0"
IUSE=""

DEPEND="${PYTHON_DEPS}"
RDEPEND="${DEPEND}
	>=app-portage/gentoolkit-0.4.0
	>=www-client/pybugz-0.10[${PYTHON_USEDEP}]"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install () {
	for file in batch-stabilize.py bugzilla-viewer.py file-stabilization-bugs.py maintainer-timeout.py reverse-dependencies.py stabilization-candidates.py ; do
		newbin ${file} ${file/.py/}
	done
	python_foreach_impl python_domodule common.py
}
